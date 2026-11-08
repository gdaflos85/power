<?php
/**
 * PowerHosting Licensing API - Verification Endpoint
 *
 * @package    PowerHosting Licensing
 * @author     PowerHosting Development Team
 * @copyright  2026 PowerHosting.gr
 * @version    1.0.0
 */

header('Content-Type: application/json; charset=utf-8');

// Locate and bootstrap WHMCS
$initPaths = [
    __DIR__ . '/init.php',
    __DIR__ . '/../../../init.php',
    __DIR__ . '/../../../../init.php',
    dirname(dirname(dirname(__DIR__))) . '/init.php',
];

$loaded = false;
foreach ($initPaths as $path) {
    if (file_exists($path)) {
        require_once $path;
        $loaded = true;
        break;
    }
}

if (!$loaded) {
    echo json_encode([
        'status'  => 'error',
        'valid'   => false,
        'message' => 'WHMCS init.php could not be located.'
    ]);
    exit;
}

use WHMCS\Database\Capsule;

function ph_clean_domain($d) {
    $d = preg_replace('#^https?://#i', '', trim($d));
    $d = preg_replace('#^www\.#i', '', $d);
    $d = explode('/', $d)[0];
    $d = explode(':', $d)[0];
    return strtolower(trim($d));
}

function ph_get_client_ip() {
    if (!empty($_SERVER['HTTP_CF_CONNECTING_IP'])) return $_SERVER['HTTP_CF_CONNECTING_IP'];
    if (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        $parts = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
        return trim($parts[0]);
    }
    return $_SERVER['REMOTE_ADDR'] ?? '127.0.0.1';
}

// Read inputs (POST or GET)
$key = trim($_REQUEST['license_key'] ?? $_REQUEST['licensekey'] ?? '');
$domain = ph_clean_domain($_REQUEST['domain'] ?? '');
$serverIp = trim($_REQUEST['server_ip'] ?? $_REQUEST['ip'] ?? ph_get_client_ip());
$dir = trim($_REQUEST['dir'] ?? '');
$extension = trim($_REQUEST['extension'] ?? '');

if (empty($key)) {
    echo json_encode([
        'status'  => 'invalid',
        'valid'   => false,
        'message' => 'Δεν παρέχεται κλειδί άδειας (license_key).'
    ]);
    exit;
}

try {
    if (!Capsule::schema()->hasTable('mod_ph_licenses')) {
        echo json_encode([
            'status'  => 'error',
            'valid'   => false,
            'message' => 'Το module PowerHosting Licensing δεν έχει ενεργοποιηθεί ακόμα στο WHMCS (System Settings -> Addon Modules).'
        ], JSON_UNESCAPED_UNICODE);
        exit;
    }

    // Find license
    $license = Capsule::table('mod_ph_licenses')
        ->leftJoin('tblclients', 'mod_ph_licenses.client_id', '=', 'tblclients.id')
        ->select('mod_ph_licenses.*', 'tblclients.firstname', 'tblclients.lastname', 'tblclients.companyname')
        ->where('mod_ph_licenses.license_key', $key)
        ->first();

    if (!$license) {
        // Log invalid key
        Capsule::table('mod_ph_license_logs')->insert([
            'license_key'   => $key,
            'ip_address'    => $serverIp,
            'domain'        => $domain,
            'directory'     => $dir,
            'action'        => 'invalid_key',
            'response_code' => 404,
            'message'       => 'Το κλειδί δεν υπάρχει στη βάση δεδομένων.',
            'created_at'    => date('Y-m-d H:i:s')
        ]);

        echo json_encode([
            'status'  => 'invalid',
            'valid'   => false,
            'message' => 'Το κλειδί άδειας δεν είναι έγκυρο ή δεν υπάρχει στο PowerHosting.'
        ]);
        exit;
    }

    // Check status
    if ($license->status === 'Suspended') {
        Capsule::table('mod_ph_license_logs')->insert([
            'license_id'    => $license->id,
            'license_key'   => $key,
            'ip_address'    => $serverIp,
            'domain'        => $domain,
            'action'        => 'suspended',
            'response_code' => 403,
            'message'       => 'Η άδεια έχει τεθεί σε αναστολή.',
            'created_at'    => date('Y-m-d H:i:s')
        ]);

        echo json_encode([
            'status'         => 'suspended',
            'valid'          => false,
            'license_status' => 'Suspended',
            'message'        => 'Η άδεια έχει τεθεί σε προσωρινή αναστολή από το PowerHosting.'
        ]);
        exit;
    }

    if (in_array($license->status, ['Terminated', 'Cancelled'])) {
        echo json_encode([
            'status'         => 'cancelled',
            'valid'          => false,
            'license_status' => $license->status,
            'message'        => 'Η άδεια έχει ακυρωθεί.'
        ]);
        exit;
    }

    // Check expiration
    if (!empty($license->expires_at)) {
        $expiryTime = strtotime($license->expires_at);
        $graceDays = 7;
        if (time() > ($expiryTime + ($graceDays * 86400))) {
            echo json_encode([
                'status'         => 'expired',
                'valid'          => false,
                'license_status' => 'Expired',
                'expires_at'     => $license->expires_at,
                'message'        => 'Η άδεια έχει λήξει. Παρακαλούμε ανανεώστε τη συνδρομή σας.'
            ]);
            exit;
        }
    }

    // Handle Reissue or Auto-bind
    $reissued = false;
    $dbDomainClean = ph_clean_domain($license->val_domain ?? '');

    if ($license->reissue_status == 1 || empty($dbDomainClean)) {
        // Bind to current domain and IP
        Capsule::table('mod_ph_licenses')->where('id', $license->id)->update([
            'val_domain'     => $domain,
            'val_ip'         => $serverIp,
            'val_directory'  => $dir,
            'reissue_status' => 0,
            'last_access_at' => date('Y-m-d H:i:s'),
            'updated_at'     => date('Y-m-d H:i:s')
        ]);
        $reissued = true;
        $dbDomainClean = $domain;
    } else {
        // Domain mismatch check - STRICT: Subdomains require their own distinct license!
        if (!empty($domain) && !empty($dbDomainClean)) {
            if ($domain !== $dbDomainClean) {
                Capsule::table('mod_ph_license_logs')->insert([
                    'license_id'    => $license->id,
                    'license_key'   => $key,
                    'ip_address'    => $serverIp,
                    'domain'        => $domain,
                    'action'        => 'invalid_domain',
                    'response_code' => 403,
                    'message'       => "Domain mismatch. Αναμενόμενο: {$dbDomainClean}, Λήφθηκε: {$domain}. Κάθε subdomain απαιτεί ξεχωριστή άδεια.",
                    'created_at'    => date('Y-m-d H:i:s')
                ]);

                echo json_encode([
                    'status'            => 'invalid_domain',
                    'valid'             => false,
                    'registered_domain' => $license->val_domain,
                    'current_domain'    => $domain,
                    'message'           => "Το domain/subdomain '{$domain}' δεν αντιστοιχεί στην άδεια (κατοχυρωμένο: '{$license->val_domain}'). Κάθε subdomain απαιτεί ξεχωριστή άδεια χρήσης. Πατήστε «Επανέκδοση» στο WHMCS εάν επιθυμείτε να μεταφέρετε την άδειά σας."
                ]);
                exit;
            }
        }

        // Update last access
        Capsule::table('mod_ph_licenses')->where('id', $license->id)->update([
            'last_access_at' => date('Y-m-d H:i:s')
        ]);
    }

    // Check specific extension entitlement
    $allowedList = explode(',', (string)$license->allowed_extensions);
    $allowedList = array_map('trim', $allowedList);
    $isAll = in_array('*', $allowedList);

    if (!empty($extension) && !$isAll && !in_array($extension, $allowedList)) {
        echo json_encode([
            'status'             => 'extension_not_included',
            'valid'              => false,
            'extension'          => $extension,
            'package'            => $license->package_name,
            'allowed_extensions' => $allowedList,
            'message'            => "Η επέκταση '{$extension}' δεν περιλαμβάνεται σε αυτό το πακέτο άδειας."
        ]);
        exit;
    }

    // Success response
    $clientName = trim($license->firstname . ' ' . $license->lastname);
    if (!empty($license->companyname)) $clientName .= " ({$license->companyname})";

    Capsule::table('mod_ph_license_logs')->insert([
        'license_id'    => $license->id,
        'license_key'   => $key,
        'ip_address'    => $serverIp,
        'domain'        => $domain,
        'directory'     => $dir,
        'action'        => $reissued ? 'reissue_success' : 'check_success',
        'response_code' => 200,
        'message'       => 'Έγκυρη επαλήθευση άδειας.',
        'created_at'    => date('Y-m-d H:i:s')
    ]);

    echo json_encode([
        'status'             => 'active',
        'valid'              => true,
        'license_status'     => 'Active',
        'license_key'        => $license->license_key,
        'registered_to'      => $clientName,
        'client_name'        => $clientName,
        'package_name'       => $license->package_name,
        'package'            => $license->package_name,
        'allowed_extensions' => $isAll ? ['*'] : $allowedList,
        'val_domain'         => $domain ?: $license->val_domain,
        'val_ip'             => $serverIp,
        'expires_at'         => $license->expires_at,
        'reissued'           => $reissued,
        'message'            => 'Η άδεια είναι έγκυρη και ενεργή στο PowerHosting.'
    ]);
    exit;

} catch (\Throwable $e) {
    echo json_encode([
        'status'  => 'error',
        'valid'   => false,
        'message' => 'Database error: ' . $e->getMessage()
    ]);
    exit;
}

