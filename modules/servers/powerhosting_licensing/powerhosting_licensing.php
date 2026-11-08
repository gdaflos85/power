<?php
/**
 * PowerHosting Licensing - WHMCS Server / Provisioning Module
 *
 * @package    PowerHosting Licensing
 * @author     PowerHosting Development Team
 * @copyright  2026 PowerHosting.gr
 * @version    1.0.0
 */

if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}

use WHMCS\Database\Capsule;

function powerhosting_licensing_MetaData() {
    return [
        'DisplayName' => 'PowerHosting Licensing Provisioning',
        'APIVersion' => '1.1',
        'RequiresServer' => false,
        'DefaultNonSSLPort' => '80',
        'DefaultSSLPort' => '443',
    ];
}

function powerhosting_licensing_ConfigOptions() {
    return [
        'package_name' => [
            'FriendlyName' => 'Πακέτο / Τίτλος',
            'Type' => 'text',
            'Size' => '50',
            'Default' => 'PowerHosting Full Extensions Suite',
            'Description' => 'Όνομα πακέτου που εμφανίζεται στον πελάτη.',
        ],
        'allowed_extensions' => [
            'FriendlyName' => 'Επιτρεπόμενα Extensions',
            'Type' => 'text',
            'Size' => '50',
            'Default' => '*',
            'Description' => 'Βάλτε * για όλα, ή κωδικούς χωρισμένους με κόμμα (π.χ. powerhosting_skroutz_xml,powerhosting_exit_intent).',
        ],
        'max_domains' => [
            'FriendlyName' => 'Όριο Domains',
            'Type' => 'text',
            'Size' => '5',
            'Default' => '1',
            'Description' => 'Μέγιστος αριθμός καταστημάτων ανά άδεια (1 domain ή 1 subdomain ανά άδεια).',
        ],
    ];
}

function powerhosting_licensing_generate_key() {
    $p1 = strtoupper(substr(md5(uniqid(mt_rand(), true)), 0, 4));
    $p2 = strtoupper(substr(md5(uniqid(mt_rand(), true)), 4, 4));
    $p3 = strtoupper(substr(md5(uniqid(mt_rand(), true)), 8, 4));
    return "POWER-{$p1}-{$p2}-{$p3}";
}

function powerhosting_licensing_CreateAccount($params) {
    try {
        $serviceId = (int)$params['serviceid'];
        $clientId = (int)$params['userid'];
        $package = !empty($params['configoption1']) ? $params['configoption1'] : 'PowerHosting Suite';
        $extensions = !empty($params['configoption2']) ? $params['configoption2'] : '*';
        $maxDomains = !empty($params['configoption3']) ? (int)$params['configoption3'] : 1;

        // Check if table exists, if not create it
        if (!Capsule::schema()->hasTable('mod_ph_licenses')) {
            Capsule::schema()->create('mod_ph_licenses', function ($table) {
                $table->bigIncrements('id');
                $table->unsignedInteger('client_id')->index();
                $table->unsignedInteger('service_id')->nullable()->index();
                $table->string('license_key', 64)->unique()->index();
                $table->string('package_name', 255)->default('PowerHosting Extensions Suite');
                $table->text('allowed_extensions')->nullable();
                $table->string('val_domain', 255)->nullable()->index();
                $table->string('val_ip', 100)->nullable()->index();
                $table->string('val_directory', 255)->nullable();
                $table->string('status', 32)->default('Active');
                $table->tinyInteger('reissue_status')->default(1);
                $table->integer('max_domains')->default(1);
                $table->dateTime('expires_at')->nullable();
                $table->dateTime('last_access_at')->nullable();
                $table->text('notes')->nullable();
                $table->timestamps();
            });
        }

        // Check if already created for this service
        $existing = Capsule::table('mod_ph_licenses')->where('service_id', $serviceId)->first();
        if ($existing) {
            Capsule::table('mod_ph_licenses')->where('id', $existing->id)->update([
                'status' => 'Active',
                'updated_at' => date('Y-m-d H:i:s')
            ]);
            return 'success';
        }

        // Generate license key
        $key = powerhosting_licensing_generate_key();

        // Calculate expiry date if service has nextduedate
        $expires = null;
        if (!empty($params['nextduedate']) && $params['billingcycle'] !== 'Free Account' && $params['billingcycle'] !== 'One Time') {
            $expires = date('Y-m-d 23:59:59', strtotime($params['nextduedate']));
        }

        Capsule::table('mod_ph_licenses')->insert([
            'client_id'          => $clientId,
            'service_id'         => $serviceId,
            'license_key'        => $key,
            'package_name'       => $package,
            'allowed_extensions' => $extensions,
            'val_domain'         => !empty($params['domain']) ? $params['domain'] : null,
            'status'             => 'Active',
            'reissue_status'     => 1,
            'max_domains'        => $maxDomains,
            'expires_at'         => $expires,
            'created_at'         => date('Y-m-d H:i:s'),
            'updated_at'         => date('Y-m-d H:i:s')
        ]);

        // Update tblhosting domain field to display license key in list
        Capsule::table('tblhosting')->where('id', $serviceId)->update([
            'domain' => $key
        ]);

        return 'success';
    } catch (\Exception $e) {
        return 'Σφάλμα δημιουργίας άδειας: ' . $e->getMessage();
    }
}

function powerhosting_licensing_SuspendAccount($params) {
    try {
        $serviceId = (int)$params['serviceid'];
        Capsule::table('mod_ph_licenses')->where('service_id', $serviceId)->update([
            'status' => 'Suspended',
            'updated_at' => date('Y-m-d H:i:s')
        ]);
        return 'success';
    } catch (\Exception $e) {
        return $e->getMessage();
    }
}

function powerhosting_licensing_UnsuspendAccount($params) {
    try {
        $serviceId = (int)$params['serviceid'];
        Capsule::table('mod_ph_licenses')->where('service_id', $serviceId)->update([
            'status' => 'Active',
            'updated_at' => date('Y-m-d H:i:s')
        ]);
        return 'success';
    } catch (\Exception $e) {
        return $e->getMessage();
    }
}

function powerhosting_licensing_TerminateAccount($params) {
    try {
        $serviceId = (int)$params['serviceid'];
        Capsule::table('mod_ph_licenses')->where('service_id', $serviceId)->update([
            'status' => 'Terminated',
            'updated_at' => date('Y-m-d H:i:s')
        ]);
        return 'success';
    } catch (\Exception $e) {
        return $e->getMessage();
    }
}

function powerhosting_licensing_ClientAreaCustomButtonArray() {
    return [
        'Επανέκδοση Άδειας (Reissue)' => 'ReissueLicense',
    ];
}

function powerhosting_licensing_AdminCustomButtonArray() {
    return [
        'Επανέκδοση Άδειας (Reissue)' => 'AdminReissueLicense',
    ];
}

function powerhosting_licensing_ReissueLicense($params) {
    try {
        $serviceId = (int)$params['serviceid'];
        Capsule::table('mod_ph_licenses')->where('service_id', $serviceId)->update([
            'reissue_status' => 1,
            'val_ip' => null,
            'val_domain' => null,
            'updated_at' => date('Y-m-d H:i:s')
        ]);
        return 'success';
    } catch (\Exception $e) {
        return $e->getMessage();
    }
}

function powerhosting_licensing_AdminReissueLicense($params) {
    return powerhosting_licensing_ReissueLicense($params);
}

function powerhosting_licensing_ClientArea($params) {
    $serviceId = (int)$params['serviceid'];
    $clientId = (int)$params['userid'];

    // Handle instant reissue POST from Client Area
    $reissuedNotice = false;
    if (isset($_POST['ph_action']) && $_POST['ph_action'] === 'reissue') {
        check_token('WHMCS.default');
        Capsule::table('mod_ph_licenses')->where('service_id', $serviceId)->update([
            'reissue_status' => 1,
            'val_ip' => null,
            'val_domain' => null,
            'updated_at' => date('Y-m-d H:i:s')
        ]);
        $reissuedNotice = true;
    }

    $license = Capsule::table('mod_ph_licenses')->where('service_id', $serviceId)->first();

    if (!$license) {
        // Auto-provision if missing
        $key = powerhosting_licensing_generate_key();
        $package = !empty($params['configoption1']) ? $params['configoption1'] : 'PowerHosting Extensions Suite';
        Capsule::table('mod_ph_licenses')->insert([
            'client_id'          => $clientId,
            'service_id'         => $serviceId,
            'license_key'        => $key,
            'package_name'       => $package,
            'allowed_extensions' => '*',
            'status'             => 'Active',
            'reissue_status'     => 1,
            'created_at'         => date('Y-m-d H:i:s'),
            'updated_at'         => date('Y-m-d H:i:s')
        ]);
        $license = Capsule::table('mod_ph_licenses')->where('service_id', $serviceId)->first();
    }

    $service = Capsule::table('tblhosting')->where('id', $serviceId)->first();
    $paymentMethod = $service ? $service->paymentmethod : 'PiraeusBank';
    $firstPayment = $service ? $service->firstpaymentamount : '0.00';
    $billingCycle = $service ? $service->billingcycle : 'One Time';
    $regDate = $service && $service->regdate ? date('l, F jS, Y', strtotime($service->regdate)) : date('l, F jS, Y');
    $nextDueDate = $service && $service->nextduedate && $service->nextduedate !== '0000-00-00' ? date('d/m/Y', strtotime($service->nextduedate)) : '-';

    return [
        'tabOverviewReplacementTemplate' => 'clientarea.tpl',
        'templateVariables' => [
            'license'        => $license,
            'license_key'    => $license ? $license->license_key : '',
            'val_ip'         => $license && $license->val_ip ? $license->val_ip : 'Δεν έχει καταγραφεί ακόμα (Auto-learn)',
            'val_domain'     => $license && $license->val_domain ? $license->val_domain : 'Δεν έχει καταγραφεί ακόμα (Auto-learn)',
            'status'         => $license ? $license->status : 'Active',
            'reissue_status' => $license ? $license->reissue_status : 1,
            'package_name'   => $license ? $license->package_name : 'PowerHosting Module',
            'regdate'        => $regDate,
            'nextduedate'    => $nextDueDate,
            'billingcycle'   => ($billingCycle === 'One Time') ? 'Εφάπαξ' : $billingCycle,
            'firstpayment'   => '€' . number_format((float)$firstPayment, 2),
            'paymentmethod'  => $paymentMethod,
            'reissued_notice'=> $reissuedNotice,
            'serviceid'      => $serviceId,
        ],
    ];
}

