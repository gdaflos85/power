<?php
require_once __DIR__ . '/init.php';

use WHMCS\Database\Capsule;

require_once __DIR__ . '/modules/servers/webuzo/webuzo.php';

header('Content-Type: text/html; charset=utf-8');
echo "<div style='font-family: monospace; font-size: 14px; max-width: 800px; margin: 30px auto; padding: 20px; border: 1px solid #ccc; border-radius: 8px;'>";
echo "<h2>Webuzo SSO Diagnostic Tool</h2><hr>";

$currentUser = new WHMCS\Authentication\CurrentUser();
$user = $currentUser->user();
$client = $currentUser->client();

echo "<b>Current WHMCS User:</b> " . ($user ? htmlspecialchars($user->email) : "<span style='color:red;'>Not logged in as User</span>") . "<br>";
echo "<b>Current WHMCS Client:</b> " . ($client ? htmlspecialchars($client->fullName . " (ID: " . $client->id . ")") : "<span style='color:red;'>Not logged in as Client</span>") . "<br><br>";

$serviceId = 130;
$service = Capsule::table('tblhosting')->where('id', $serviceId)->first();
if(!$service){
    echo "<p style='color:red;'>Service 130 not found in tblhosting!</p></div>";
    exit;
}

echo "<b>Service 130 in Database:</b><br>";
echo "- Client Owner ID: " . $service->userid . "<br>";
echo "- Domain: " . $service->domain . "<br>";
echo "- Username: " . $service->username . "<br>";
echo "- Server ID: " . $service->server . "<br><br>";

$params = [
    'serviceid' => 130,
    'username' => $service->username,
    'domain' => $service->domain,
    'serverid' => $service->server,
];

webuzo_populate_server_params($params);

echo "<b>Server Connection Details:</b><br>";
echo "- Server Hostname: " . ($params['serverhostname'] ?? 'EMPTY') . "<br>";
echo "- Server IP: " . ($params['serverip'] ?? 'EMPTY') . "<br>";
echo "- Server Username: " . ($params['serverusername'] ?? 'EMPTY') . "<br>";
echo "- Server Password: " . (!empty($params['serverpassword']) ? '<span style="color:green;">SET</span>' : '<span style="color:red;">EMPTY</span>') . "<br>";
echo "- Server Access Hash: " . (!empty($params['serveraccesshash']) ? '<span style="color:green;">SET</span>' : '<span style="color:red;">EMPTY</span>') . "<br><br>";

echo "<b>Webuzo Admin API Response (act=sso&user=" . htmlspecialchars($params['username']) . "):</b><br>";
$ret_admin = webuzo_admin_call($params, '?act=sso&noip=1&user='.$params['username']);
echo "<pre style='background:#f4f4f4; padding:10px; border-radius:4px;'>";
print_r($ret_admin);
echo "</pre>";

$sso_url = webuzo_generate_sso_url($params);
echo "<h3>Generated SSO URL:</h3>";
echo "<p><a href='" . htmlspecialchars($sso_url) . "' target='_blank' style='display:inline-block; background:#007bff; color:#fff; padding:12px 24px; text-decoration:none; border-radius:5px; font-weight:bold;'>Click Here to Login to Webuzo &raquo;</a></p>";
echo "<p style='word-break: break-all; color:#666;'>Direct URL: " . htmlspecialchars($sso_url) . "</p>";
echo "</div>";
