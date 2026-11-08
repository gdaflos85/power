<?php
/**
 * Power Hosting - Lead Generation Form Handler (AJAX)
 * Handles "Εκδήλωση Ενδιαφέροντος" submissions from all landing pages.
 */

header('Content-Type: application/json; charset=utf-8');

// Ensure request is POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['status' => 'error', 'message' => 'Μη επιτρεπτή μέθοδος αιτήματος.']);
    exit;
}

// 1. Anti-spam Honeypot check
if (!empty($_POST['website_hp'])) {
    // Spambot filled the hidden honeypot field - return fake success
    echo json_encode(['status' => 'success', 'message' => 'Το αίτημά σας καταχωρήθηκε επιτυχώς!']);
    exit;
}

// 2. Extract and sanitize inputs
$name           = isset($_POST['name']) ? trim(strip_tags($_POST['name'])) : '';
$email          = isset($_POST['email']) ? trim(filter_var($_POST['email'], FILTER_SANITIZE_EMAIL)) : '';
$phone          = isset($_POST['phone']) ? trim(strip_tags($_POST['phone'])) : '';
$service        = isset($_POST['service']) ? trim(strip_tags($_POST['service'])) : 'Κατασκευή Ιστοσελίδας';
$business_type  = isset($_POST['business_type']) ? trim(strip_tags($_POST['business_type'])) : '-';
$existing_domain= isset($_POST['existing_domain']) ? trim(strip_tags($_POST['existing_domain'])) : '-';
$reference_sites= isset($_POST['reference_sites']) ? trim(strip_tags($_POST['reference_sites'])) : '-';
$contact_method = isset($_POST['contact_method']) ? trim(strip_tags($_POST['contact_method'])) : 'Τηλεφωνικά';
$comments       = isset($_POST['comments']) ? trim(strip_tags($_POST['comments'])) : '-';
$source_url     = isset($_POST['source_url']) ? trim(strip_tags($_POST['source_url'])) : 'https://www.powerhosting.gr/';
$source_city    = isset($_POST['source_city']) ? trim(strip_tags($_POST['source_city'])) : 'Γενική Σελίδα';

// 3. Validation
$errors = [];
if (empty($name) || mb_strlen($name, 'UTF-8') < 2) {
    $errors[] = 'Παρακαλούμε εισάγετε το ονοματεπώνυμό σας.';
}
if (empty($email) || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $errors[] = 'Παρακαλούμε εισάγετε ένα έγκυρο email.';
}
if (empty($phone) || mb_strlen($phone, 'UTF-8') < 8) {
    $errors[] = 'Παρακαλούμε εισάγετε έναν έγκυρο αριθμό τηλεφώνου.';
}

if (!empty($errors)) {
    http_response_code(400);
    echo json_encode(['status' => 'error', 'message' => implode('<br>', $errors)]);
    exit;
}

// 4. Determine Admin Email
$adminEmail = 'info@powerhosting.gr';

// Try loading WHMCS configuration if available
if (file_exists(__DIR__ . '/init.php')) {
    try {
        require_once __DIR__ . '/init.php';
        if (class_exists('\WHMCS\Config\Setting')) {
            $configuredEmail = \WHMCS\Config\Setting::getValue('Email');
            if (!empty($configuredEmail) && filter_var($configuredEmail, FILTER_VALIDATE_EMAIL)) {
                $adminEmail = $configuredEmail;
            }
        }
    } catch (\Exception $e) {
        // Fallback to default
    }
}

// 5. Compose HTML Email to Admin
$subject = "⚡ Νέο Αίτημα Ενδιαφέροντος: {$name} [{$source_city} - {$service}]";
$timestamp = date('d/m/Y H:i:s');
$clientIp = $_SERVER['REMOTE_ADDR'] ?? 'Unknown';

$emailBody = <<<HTML
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Νέο Αίτημα Ενδιαφέροντος</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; background-color: #f4f7fa; margin: 0; padding: 30px 15px;">
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 650px; background-color: #ffffff; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 20px rgba(0,0,0,0.08);">
        <!-- Header -->
        <tr>
            <td style="background: linear-gradient(135deg, #10243e 0%, #0052cc 100%); padding: 30px; text-align: center;">
                <h1 style="color: #ffffff; margin: 0; font-size: 22px; font-weight: 700; letter-spacing: 0.5px;">Power Hosting - Νέα Εκδήλωση Ενδιαφέροντος</h1>
                <p style="color: #cbd5e1; margin: 8px 0 0 0; font-size: 14px;">Παραλήφθηκε νέο αίτημα από την ιστοσελίδα</p>
            </td>
        </tr>
        <!-- Badge Info -->
        <tr>
            <td style="padding: 20px 30px 10px 30px; background-color: #f8fafc; border-bottom: 1px solid #e2e8f0;">
                <table width="100%">
                    <tr>
                        <td style="font-size: 13px; color: #64748b;">
                            <strong>Προέλευση / Πόλη:</strong> <span style="background-color: #e0f2fe; color: #0369a1; padding: 3px 8px; border-radius: 4px; font-weight: 600;">{$source_city}</span>
                        </td>
                        <td align="right" style="font-size: 13px; color: #64748b;">
                            <strong>Ημερομηνία:</strong> {$timestamp}
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <!-- Content Table -->
        <tr>
            <td style="padding: 30px;">
                <table width="100%" cellpadding="8" cellspacing="0" style="font-size: 14px; border-collapse: collapse;">
                    <tr style="border-bottom: 1px solid #f1f5f9;">
                        <td width="35%" style="color: #64748b; font-weight: 600;">Ονοματεπώνυμο:</td>
                        <td style="color: #0f172a; font-weight: 700; font-size: 15px;">{$name}</td>
                    </tr>
                    <tr style="border-bottom: 1px solid #f1f5f9;">
                        <td style="color: #64748b; font-weight: 600;">Email:</td>
                        <td><a href="mailto:{$email}" style="color: #0052cc; text-decoration: none; font-weight: 600;">{$email}</a></td>
                    </tr>
                    <tr style="border-bottom: 1px solid #f1f5f9;">
                        <td style="color: #64748b; font-weight: 600;">Τηλέφωνο:</td>
                        <td><a href="tel:{$phone}" style="color: #0052cc; text-decoration: none; font-weight: 700; font-size: 15px;">{$phone}</a></td>
                    </tr>
                    <tr style="border-bottom: 1px solid #f1f5f9;">
                        <td style="color: #64748b; font-weight: 600;">Υπηρεσία Ενδιαφέροντος:</td>
                        <td style="color: #0f172a; font-weight: 600;">{$service}</td>
                    </tr>
                    <tr style="border-bottom: 1px solid #f1f5f9;">
                        <td style="color: #64748b; font-weight: 600;">Είδος Επιχείρησης / Προϊόντα:</td>
                        <td style="color: #334155;">{$business_type}</td>
                    </tr>
                    <tr style="border-bottom: 1px solid #f1f5f9;">
                        <td style="color: #64748b; font-weight: 600;">Υπάρχον Domain:</td>
                        <td style="color: #334155;">{$existing_domain}</td>
                    </tr>
                    <tr style="border-bottom: 1px solid #f1f5f9;">
                        <td style="color: #64748b; font-weight: 600;">Σελίδες Παραδείγματα:</td>
                        <td style="color: #334155;">{$reference_sites}</td>
                    </tr>
                    <tr style="border-bottom: 1px solid #f1f5f9;">
                        <td style="color: #64748b; font-weight: 600;">Τρόπος Επικοινωνίας:</td>
                        <td style="color: #0f172a; font-weight: 600;">{$contact_method}</td>
                    </tr>
                    <tr>
                        <td style="color: #64748b; font-weight: 600; vertical-align: top;">Σχόλια / Λεπτομέρειες:</td>
                        <td style="color: #334155; line-height: 1.5; background-color: #f8fafc; padding: 12px; border-radius: 6px;">{$comments}</td>
                    </tr>
                </table>

                <div style="margin-top: 25px; padding-top: 20px; border-top: 1px solid #e2e8f0; font-size: 12px; color: #94a3b8;">
                    <strong>Σελίδα Υποβολής:</strong> <a href="{$source_url}" target="_blank" style="color: #64748b;">{$source_url}</a><br>
                    <strong>IP Διεύθυνση:</strong> {$clientIp}
                </div>
            </td>
        </tr>
    </table>
</body>
</html>
HTML;

// 6. Email Headers
$headers = [
    'MIME-Version: 1.0',
    'Content-type: text/html; charset=UTF-8',
    'From: Power Hosting Leads <noreply@powerhosting.gr>',
    'Reply-To: ' . $name . ' <' . $email . '>',
    'X-Mailer: PHP/' . phpversion()
];

// Send email
$mailSent = @mail($adminEmail, '=?UTF-8?B?' . base64_encode($subject) . '?=', $emailBody, implode("\r\n", $headers));

// 7. Return Response
if ($mailSent) {
    echo json_encode([
        'status' => 'success',
        'message' => 'Ευχαριστούμε πολύ! Το αίτημά σας παραλήφθηκε με επιτυχία.<br>Ένας εξειδικευμένος σύμβουλος της Power Hosting θα επικοινωνήσει άμεσα μαζί σας!'
    ]);
} else {
    // Even if local mail fails, save to fallback lead log so no lead is ever lost
    $leadData = date('Y-m-d H:i:s') . " | {$name} | {$email} | {$phone} | {$service} | {$source_city}\n";
    @file_put_contents(__DIR__ . '/storage/logs/leads.log', $leadData, FILE_APPEND);
    
    echo json_encode([
        'status' => 'success',
        'message' => 'Ευχαριστούμε πολύ! Το αίτημά σας παραλήφθηκε επιτυχώς και θα επικοινωνήσουμε άμεσα μαζί σας!'
    ]);
}
exit;
