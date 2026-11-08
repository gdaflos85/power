<?php
/**
 * PowerHosting Licensing Manager - WHMCS Hooks
 *
 * @package    PowerHosting Licensing
 * @author     PowerHosting Development Team
 * @copyright  2026 PowerHosting.gr
 */

if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}

use WHMCS\Database\Capsule;

// Hook to sync license status when a WHMCS service status changes
add_hook('ServiceStatusChange', 1, function($vars) {
    $serviceId = (int)$vars['relid'];
    $status = $vars['status'];

    $phStatus = 'Active';
    if (in_array($status, ['Suspended'])) {
        $phStatus = 'Suspended';
    } elseif (in_array($status, ['Terminated', 'Cancelled', 'Fraud'])) {
        $phStatus = 'Terminated';
    } elseif (in_array($status, ['Active'])) {
        $phStatus = 'Active';
    }

    try {
        Capsule::table('mod_ph_licenses')
            ->where('service_id', $serviceId)
            ->update([
                'status'     => $phStatus,
                'updated_at' => date('Y-m-d H:i:s')
            ]);
    } catch (\Exception $e) {
        // Log silently
    }
});

// Hook to delete license if client is permanently deleted
add_hook('ClientDelete', 1, function($vars) {
    $clientId = (int)$vars['userid'];
    try {
        Capsule::table('mod_ph_licenses')->where('client_id', $clientId)->delete();
    } catch (\Exception $e) {
        // Log silently
    }
});

