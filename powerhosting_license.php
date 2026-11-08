<?php
/**
 * PowerHosting Licensing API - Direct Public Root Endpoint
 * Place this in public_html of www.powerhosting.gr
 *
 * @package    PowerHosting Licensing
 * @author     PowerHosting Development Team
 * @copyright  2026 PowerHosting.gr
 * @version    1.0.1
 */

header('Content-Type: application/json; charset=utf-8');

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
    ], JSON_UNESCAPED_UNICODE);
    exit;
}

try {
    $pdo = null;

    // Method 1: Try WHMCS init.php
    $initPaths = [
        __DIR__ . '/init.php',
        __DIR__ . '/../init.php',
        __DIR__ . '/whmcs/init.php',
        __DIR__ . '/billing/init.php',
    ];

    foreach ($initPaths as $p) {
        if (file_exists($p)) {
            @require_once $p;
            break;
        }
    }

    // Method 2: Try configuration.php for direct PDO fallback
    if (!class_exists('WHMCS\Database\Capsule')) {
        $configPaths = [
            __DIR__ . '/configuration.php',
            __DIR__ . '/../configuration.php',
            __DIR__ . '/whmcs/configuration.php',
            __DIR__ . '/billing/configuration.php',
        ];

        foreach ($configPaths as $cp) {
            if (file_exists($cp)) {
                $db_host = $db_username = $db_password = $db_name = $db_port = '';
                @include $cp;
                if (!empty($db_name) && !empty($db_username)) {
                    $dsn = "mysql:host=" . ($db_host ?: 'localhost') . ";dbname=" . $db_name . ";charset=utf8mb4";
                    if (!empty($db_port)) $dsn .= ";port=" . $db_port;
                    $pdo = new PDO($dsn, $db_username, $db_password, [
                        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
                    ]);
                    break;
                }
            }
        }
    }

    $license = null;

    if (class_exists('WHMCS\Database\Capsule')) {
        if (!\WHMCS\Database\Capsule::schema()->hasTable('mod_ph_licenses')) {
            echo json_encode([
                'status'  => 'error',
                'valid'   => false,
                'message' => 'Το module PowerHosting Licensing δεν έχει ενεργοποιηθεί ακόμα στο WHMCS (System Settings -> Addon Modules).'
            ], JSON_UNESCAPED_UNICODE);
            exit;
        }

        $row = \WHMCS\Database\Capsule::table('mod_ph_licenses')
            ->leftJoin('tblclients', 'mod_ph_licenses.client_id', '=', 'tblclients.id')
            ->select('mod_ph_licenses.*', 'tblclients.firstname', 'tblclients.lastname', 'tblclients.companyname')
            ->where('mod_ph_licenses.license_key', $key)
            ->first();

        if ($row) {
            $license = (array)$row;
        }
    } elseif ($pdo) {
        // Direct PDO check
        $stmt = $pdo->prepare("SELECT l.*, c.firstname, c.lastname, c.companyname 
                               FROM mod_ph_licenses l 
                               LEFT JOIN tblclients c ON l.client_id = c.id 
                               WHERE l.license_key = :k LIMIT 1");
        $stmt->execute([':k' => $key]);
        $license = $stmt->fetch();
    } else {
        echo json_encode([
            'status'  => 'error',
            'valid'   => false,
            'message' => 'Αδυναμία σύνδεσης με τη βάση δεδομένων του WHMCS (δεν βρέθηκε init.php ή configuration.php).'
        ], JSON_UNESCAPED_UNICODE);
        exit;
    }

    if (!$license) {
        echo json_encode([
            'status'  => 'invalid',
            'valid'   => false,
            'message' => "Το κλειδί άδειας '{$key}' δεν υπάρχει στο σύστημα PowerHosting."
        ], JSON_UNESCAPED_UNICODE);
        exit;
    }

    if ($license['status'] !== 'Active') {
        echo json_encode([
            'status'         => strtolower($license['status']),
            'valid'          => false,
            'license_status' => $license['status'],
            'message'        => 'Η άδεια δεν είναι ενεργή (Κατάσταση: ' . $license['status'] . ').'
        ], JSON_UNESCAPED_UNICODE);
        exit;
    }

    $dbDomainClean = ph_clean_domain($license['val_domain'] ?? '');

    // Reissue / Auto-bind
    if ($license['reissue_status'] == 1 || empty($dbDomainClean)) {
        if (class_exists('WHMCS\Database\Capsule')) {
            \WHMCS\Database\Capsule::table('mod_ph_licenses')->where('id', $license['id'])->update([
                'val_domain'     => $domain,
                'val_ip'         => $serverIp,
                'val_directory'  => $dir,
                'reissue_status' => 0,
                'last_access_at' => date('Y-m-d H:i:s'),
                'updated_at'     => date('Y-m-d H:i:s')
            ]);
        } elseif ($pdo) {
            $up = $pdo->prepare("UPDATE mod_ph_licenses SET val_domain = :d, val_ip = :ip, val_directory = :dir, reissue_status = 0, last_access_at = NOW(), updated_at = NOW() WHERE id = :id");
            $up->execute([':d' => $domain, ':ip' => $serverIp, ':dir' => $dir, ':id' => $license['id']]);
        }
    } else {
        // Strict domain match: subdomains require separate licenses!
        if (!empty($domain) && !empty($dbDomainClean) && $domain !== $dbDomainClean) {
            echo json_encode([
                'status'            => 'invalid_domain',
                'valid'             => false,
                'registered_domain' => $license['val_domain'],
                'current_domain'    => $domain,
                'message'           => "Το domain/subdomain '{$domain}' δεν αντιστοιχεί στην άδεια (κατοχυρωμένο: '{$license['val_domain']}'). Κάθε subdomain απαιτεί ξεχωριστή άδεια χρήσης. Πατήστε «Επανέκδοση» στο WHMCS εάν μεταφέρατε το κατάστημά σας."
            ], JSON_UNESCAPED_UNICODE);
            exit;
        }

        if (class_exists('WHMCS\Database\Capsule')) {
            \WHMCS\Database\Capsule::table('mod_ph_licenses')->where('id', $license['id'])->update(['last_access_at' => date('Y-m-d H:i:s')]);
        } elseif ($pdo) {
            $up = $pdo->prepare("UPDATE mod_ph_licenses SET last_access_at = NOW() WHERE id = :id");
            $up->execute([':id' => $license['id']]);
        }
    }

    // Check extension entitlement
    $allowedList = array_map('trim', explode(',', (string)$license['allowed_extensions']));
    $isAll = in_array('*', $allowedList);
    if (!empty($extension) && !$isAll && !in_array($extension, $allowedList)) {
        echo json_encode([
            'status'    => 'extension_not_included',
            'valid'     => false,
            'extension' => $extension,
            'message'   => "Η επέκταση '{$extension}' δεν περιλαμβάνεται σε αυτό το πακέτο άδειας."
        ], JSON_UNESCAPED_UNICODE);
        exit;
    }

    $clientName = trim(($license['firstname'] ?? '') . ' ' . ($license['lastname'] ?? ''));
    if (!empty($license['companyname'])) $clientName .= " ({$license['companyname']})";

    echo json_encode([
        'status'             => 'active',
        'valid'              => true,
        'license_status'     => 'Active',
        'license_key'        => $license['license_key'],
        'registered_to'      => $clientName,
        'client_name'        => $clientName,
        'package_name'       => $license['package_name'],
        'package'            => $license['package_name'],
        'allowed_extensions' => $isAll ? ['*'] : $allowedList,
        'val_domain'         => $domain ?: $license['val_domain'],
        'val_ip'             => $serverIp,
        'expires_at'         => $license['expires_at'],
        'message'            => 'Η άδεια είναι έγκυρη και ενεργή στο PowerHosting.'
    ], JSON_UNESCAPED_UNICODE);
    exit;

} catch (\Throwable $e) {
    echo json_encode([
        'status'  => 'error',
        'valid'   => false,
        'message' => 'Σφάλμα διακομιστή αδειών: ' . $e->getMessage()
    ], JSON_UNESCAPED_UNICODE);
    exit;
}
