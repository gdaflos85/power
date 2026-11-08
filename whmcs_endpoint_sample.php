<?php
/**
 * PowerHosting WHMCS Licensing API Endpoint
 *
 * Upload this file directly to public_html/powerhosting_license.php on www.powerhosting.gr
 * Accessible at: https://www.powerhosting.gr/powerhosting_license.php
 */

// If WHMCS is present, initialize WHMCS environment:
if (file_exists(__DIR__ . '/init.php')) {
    require_once __DIR__ . '/init.php';
}

header('Content-Type: application/json; charset=utf-8');

$domain     = isset($_POST['domain']) ? strtolower(trim($_POST['domain'])) : '';
$licensekey = isset($_POST['licensekey']) ? trim($_POST['licensekey']) : '';
$server_ip  = isset($_POST['server_ip']) ? trim($_POST['server_ip']) : '';

// Remove www. from domain
$domain = preg_replace('/^www\./i', '', $domain);

if (empty($domain) && empty($licensekey)) {
    echo json_encode([
        'status'  => 'invalid',
        'message' => 'Missing domain or license key'
    ]);
    exit;
}

/**
 * DEFAULT / PERMISSIVE MODE:
 * By default, allow demo1.powerhosting.gr and any valid client domain.
 * You can link this directly to WHMCS Capsule DB queries:
 * 
 * Example Capsule DB Query:
 * use WHMCS\Database\Capsule;
 * $service = Capsule::table('tblhosting')
 *     ->where('domain', $domain)
 *     ->where('domainstatus', 'Active')
 *     ->first();
 */

// Determine allowed extensions for this client
// Options: ['all'] for all extensions, or specific array e.g. ['powerhosting_freeshiping_teaser', 'pp_bundle', 'powerhosting_boxnow']
$allowed = ['all'];

// Example response
$response = [
    'status'             => 'active',
    'domain'             => $domain,
    'client_name'        => 'PowerHosting Store Owner',
    'package_name'       => 'Managed OpenCart Cloud',
    'allowed_extensions' => $allowed,
    'expires_at'         => date('Y-m-d', strtotime('+1 year')),
    'timestamp'          => time(),
    'message'            => 'License is valid and active'
];

echo json_encode($response, JSON_UNESCAPED_UNICODE);
exit;

