<?php
/**
 * PowerHosting Licensing Manager - WHMCS Addon Module
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

function powerhosting_licensing_config() {
    return [
        'name'        => 'PowerHosting Licensing Manager',
        'description' => 'Πλήρες σύστημα διαχείρισης, έκδοσης και ελέγχου αδειών χρήσης (Licenses) για τα PowerHosting OpenCart Extensions.',
        'version'     => '1.0.0',
        'author'      => 'PowerHosting',
        'language'    => 'greek',
        'fields'      => [
            'secret_hash' => [
                'FriendlyName' => 'Secret Hash Key',
                'Type'         => 'text',
                'Size'         => '40',
                'Default'      => 'PH_SECRET_' . bin2hex(random_bytes(8)),
                'Description'  => 'Μυστικό κλειδί κρυπτογράφησης για την επικύρωση του API.',
            ],
            'auto_bind' => [
                'FriendlyName' => 'Αυτόματο Κλείδωμα IP/Domain',
                'Type'         => 'yesno',
                'Default'      => 'yes',
                'Description'  => 'Αν είναι επιλεγμένο, το IP και το Domain κατοχυρώνονται αυτόματα στον πρώτο έλεγχο από το κατάστημα.',
            ],
            'grace_days' => [
                'FriendlyName' => 'Περίοδος Χάριτος (Ημέρες)',
                'Type'         => 'text',
                'Size'         => '5',
                'Default'      => '7',
                'Description'  => 'Ημέρες χάριτος μετά τη λήξη της άδειας πριν το πλήρες κλείδωμα των επεκτάσεων.',
            ],
        ]
    ];
}

function powerhosting_licensing_activate() {
    try {
        if (!Capsule::schema()->hasTable('mod_ph_licenses')) {
            Capsule::schema()->create('mod_ph_licenses', function ($table) {
                $table->bigIncrements('id');
                $table->unsignedInteger('client_id')->index();
                $table->unsignedInteger('service_id')->nullable()->index();
                $table->string('license_key', 64)->unique()->index();
                $table->string('package_name', 255)->default('PowerHosting Extensions Suite');
                $table->text('allowed_extensions')->nullable(); // '*' or comma-separated
                $table->string('val_domain', 255)->nullable()->index();
                $table->string('val_ip', 100)->nullable()->index();
                $table->string('val_directory', 255)->nullable();
                $table->string('status', 32)->default('Active'); // Active, Suspended, Expired, Terminated
                $table->tinyInteger('reissue_status')->default(1); // 1 = can reissue/bind, 0 = locked
                $table->integer('max_domains')->default(1);
                $table->dateTime('expires_at')->nullable();
                $table->dateTime('last_access_at')->nullable();
                $table->text('notes')->nullable();
                $table->timestamps();
            });
        }

        if (!Capsule::schema()->hasTable('mod_ph_license_logs')) {
            Capsule::schema()->create('mod_ph_license_logs', function ($table) {
                $table->bigIncrements('id');
                $table->unsignedBigInteger('license_id')->nullable()->index();
                $table->string('license_key', 64)->index();
                $table->string('ip_address', 64)->nullable();
                $table->string('domain', 255)->nullable();
                $table->string('directory', 255)->nullable();
                $table->string('action', 50)->default('check');
                $table->integer('response_code')->default(200);
                $table->text('message')->nullable();
                $table->dateTime('created_at')->index();
            });
        }

        return ['status' => 'success', 'description' => 'Το PowerHosting Licensing Manager εγκαταστάθηκε επιτυχώς!'];
    } catch (\Exception $e) {
        return ['status' => 'error', 'description' => 'Σφάλμα εγκατάστασης: ' . $e->getMessage()];
    }
}

function powerhosting_licensing_deactivate() {
    return ['status' => 'success', 'description' => 'Το PowerHosting Licensing Manager απενεργοποιήθηκε. Τα δεδομένα των αδειών διατηρήθηκαν ασφαλή.'];
}

function powerhosting_licensing_generate_key() {
    $p1 = strtoupper(substr(md5(uniqid(mt_rand(), true)), 0, 4));
    $p2 = strtoupper(substr(md5(uniqid(mt_rand(), true)), 4, 4));
    $p3 = strtoupper(substr(md5(uniqid(mt_rand(), true)), 8, 4));
    return "POWER-{$p1}-{$p2}-{$p3}";
}

function powerhosting_licensing_extensions_list() {
    return [
        '*' => '🌟 Όλες οι Επεκτάσεις (Full PowerHosting Suite)',
        'pp_bundle' => 'PowerHosting Bundles / Πακέτα & Σετ',
        'powerhosting_freeshiping_teaser' => 'PowerHosting Free Shipping Teaser',
        'powerhosting_exit_intent' => 'PowerHosting Exit Intent Popup',
        'powerhosting_skroutz_xml' => 'PowerHosting Skroutz & BestPrice XML',
        'powerhosting_gdpr' => 'PowerHosting GDPR & Consent Mode v2',
        'powerhosting_import_export' => 'PowerHosting Import / Export Pro',
        'powerhosting_viva_wallet' => 'PowerHosting Viva Wallet Smart Checkout',
        'powerhosting_alpha_bank' => 'PowerHosting Alpha Bank 3D Secure',
        'powerhosting_tbi_bank' => 'PowerHosting TBI Bank (Buy Now Pay Later)',
        'powerhosting_box_now' => 'PowerHosting BOX NOW Lockers & Vouchers',
        'powerhosting_skroutz_analytics' => 'PowerHosting Skroutz & BestPrice Analytics',
        'powerhosting_tracking' => 'PowerHosting Tracking (GA4, Ads, Meta Pixel)',
        'powerhosting_marketing_feeds' => 'PowerHosting Marketing Feeds (Google, Meta, OpenAI)',
        'powerhosting_ai_content' => 'PowerHosting AI Content & Banner Studio',
        'powerhosting_checkout' => 'PowerHosting 1-Step Checkout',
        'powerhosting_blog' => 'PowerHosting SEO Blog & Articles',
        'powerhosting_popup' => 'PowerHosting Promo & Newsletter Popups',
        'powerhosting_speed' => 'PowerHosting WebP & Cache Accelerator',
        'powerhosting_notifications' => 'PowerHosting SMS & Viber Gateway',
    ];
}

function powerhosting_licensing_output($vars) {
    $action = isset($_REQUEST['subaction']) ? trim($_REQUEST['subaction']) : 'list';
    $message = '';
    $error = '';
    $modulelink = $vars['modulelink'];

    // Action Handlers
    if ($action === 'create' && $_SERVER['REQUEST_METHOD'] === 'POST') {
        check_token('WHMCS.admin.default');
        $clientId = (int)($_POST['client_id'] ?? 0);
        $key = trim($_POST['license_key'] ?? '');
        $packageName = trim($_POST['package_name'] ?? 'PowerHosting Suite');
        $domain = trim($_POST['val_domain'] ?? '');
        $ip = trim($_POST['val_ip'] ?? '');
        $status = in_array($_POST['status'] ?? '', ['Active', 'Suspended', 'Expired']) ? $_POST['status'] : 'Active';
        $expires = !empty($_POST['expires_at']) ? date('Y-m-d 23:59:59', strtotime($_POST['expires_at'])) : null;
        $reissue = isset($_POST['reissue_status']) ? 1 : 0;
        $extensions = isset($_POST['extensions']) && is_array($_POST['extensions']) ? implode(',', $_POST['extensions']) : '*';

        if (empty($key)) {
            $key = powerhosting_licensing_generate_key();
        }

        if ($clientId <= 0) {
            $error = 'Παρακαλώ επιλέξτε έγκυρο πελάτη WHMCS.';
        } else {
            try {
                Capsule::table('mod_ph_licenses')->insert([
                    'client_id'          => $clientId,
                    'license_key'        => $key,
                    'package_name'       => $packageName,
                    'allowed_extensions' => $extensions,
                    'val_domain'         => $domain ?: null,
                    'val_ip'             => $ip ?: null,
                    'status'             => $status,
                    'reissue_status'     => $reissue,
                    'expires_at'         => $expires,
                    'created_at'         => date('Y-m-d H:i:s'),
                    'updated_at'         => date('Y-m-d H:i:s'),
                ]);
                $message = "Η άδεια <strong>{$key}</strong> δημιουργήθηκε επιτυχώς!";
                $action = 'list';
            } catch (\Exception $e) {
                $error = 'Σφάλμα δημιουργίας άδειας: ' . $e->getMessage();
            }
        }
    } elseif ($action === 'delete') {
        check_token('WHMCS.admin.default');
        $id = (int)($_GET['id'] ?? 0);
        if ($id > 0) {
            Capsule::table('mod_ph_licenses')->where('id', $id)->delete();
            $message = 'Η άδεια διαγράφηκε επιτυχώς.';
        }
        $action = 'list';
    } elseif ($action === 'toggle_status') {
        check_token('WHMCS.admin.default');
        $id = (int)($_GET['id'] ?? 0);
        $curr = Capsule::table('mod_ph_licenses')->where('id', $id)->first();
        if ($curr) {
            $newStatus = ($curr->status === 'Active') ? 'Suspended' : 'Active';
            Capsule::table('mod_ph_licenses')->where('id', $id)->update([
                'status' => $newStatus,
                'updated_at' => date('Y-m-d H:i:s')
            ]);
            $message = "Η κατάσταση της άδειας άλλαξε σε: <strong>{$newStatus}</strong>";
        }
        $action = 'list';
    } elseif ($action === 'reissue') {
        check_token('WHMCS.admin.default');
        $id = (int)($_GET['id'] ?? 0);
        $curr = Capsule::table('mod_ph_licenses')->where('id', $id)->first();
        if ($curr) {
            Capsule::table('mod_ph_licenses')->where('id', $id)->update([
                'reissue_status' => 1,
                'val_ip' => null,
                'val_domain' => null,
                'updated_at' => date('Y-m-d H:i:s')
            ]);
            $message = "Η άδεια <strong>{$curr->license_key}</strong> είναι πλέον σε κατάσταση Επανέκδοσης (Reissue). Στον επόμενο έλεγχο θα κλειδώσει αυτόματα στο νέο IP/Domain!";
        }
        $action = 'list';
    } elseif ($action === 'clear_logs') {
        check_token('WHMCS.admin.default');
        Capsule::table('mod_ph_license_logs')->truncate();
        $message = 'Το ιστορικό καταγραφών (Logs) καθαρίστηκε επιτυχώς.';
        $action = 'logs';
    }

    // Statistics
    $totalLicenses = Capsule::table('mod_ph_licenses')->count();
    $activeLicenses = Capsule::table('mod_ph_licenses')->where('status', 'Active')->count();
    $suspendedLicenses = Capsule::table('mod_ph_licenses')->where('status', 'Suspended')->count();
    $todayPings = Capsule::table('mod_ph_license_logs')->where('created_at', '>=', date('Y-m-d 00:00:00'))->count();

    // UI Header
    echo '<style>
        .ph-badge { display:inline-block; padding:3px 9px; font-size:11px; font-weight:700; border-radius:12px; }
        .ph-badge-active { background:#e8f5e9; color:#2e7d32; border:1px solid #c8e6c9; }
        .ph-badge-suspended { background:#ffebee; color:#c62828; border:1px solid #ffcdd2; }
        .ph-badge-expired { background:#fff3e0; color:#ef6c00; border:1px solid #ffe0b2; }
        .ph-key-box { font-family:monospace; font-size:13px; font-weight:bold; background:#f4f6f9; padding:4px 8px; border-radius:4px; border:1px dashed #ced4da; letter-spacing:1px; }
        .ph-stat-card { background:#fff; border-radius:8px; padding:15px 20px; box-shadow:0 1px 3px rgba(0,0,0,0.08); border-left:4px solid #0052cc; margin-bottom:20px; }
        .ph-stat-card h3 { margin:0 0 5px 0; font-size:24px; font-weight:700; color:#172b4d; }
        .ph-stat-card p { margin:0; font-size:12px; color:#6b778c; text-transform:uppercase; font-weight:600; }
        .ph-nav-btn { font-size:13px; padding:8px 16px; border-radius:4px; font-weight:600; text-decoration:none; display:inline-block; margin-right:8px; }
        .ph-nav-btn-primary { background:#0052cc; color:#fff; }
        .ph-nav-btn-primary:hover { background:#0747a6; color:#fff; }
        .ph-nav-btn-light { background:#f4f5f7; color:#172b4d; border:1px solid #dfe1e6; }
        .ph-nav-btn-light:hover { background:#ebecf0; color:#172b4d; }
    </style>';

    echo '<div style="margin-bottom:20px;">
        <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:15px;">
            <div>
                <h1 style="margin:0 0 5px 0; font-size:22px; font-weight:700; color:#0052cc;">
                    <i class="fas fa-key"></i> PowerHosting Licensing Manager
                </h1>
                <p style="margin:0; color:#6b778c; font-size:13px;">Διαχείριση και έλεγχος αδειών χρήσης για τα PowerHosting OpenCart Extensions.</p>
            </div>
            <div>
                <a href="' . $modulelink . '&subaction=list" class="ph-nav-btn ' . ($action === 'list' ? 'ph-nav-btn-primary' : 'ph-nav-btn-light') . '"><i class="fas fa-list"></i> Όλες οι Άδειες</a>
                <a href="' . $modulelink . '&subaction=new" class="ph-nav-btn ' . ($action === 'new' ? 'ph-nav-btn-primary' : 'ph-nav-btn-light') . '"><i class="fas fa-plus-circle"></i> Νέα Άδεια</a>
                <a href="' . $modulelink . '&subaction=logs" class="ph-nav-btn ' . ($action === 'logs' ? 'ph-nav-btn-primary' : 'ph-nav-btn-light') . '"><i class="fas fa-history"></i> Ιστορικό Ελέγχων (Logs)</a>
            </div>
        </div>';

    if (!empty($message)) {
        echo '<div class="alert alert-success"><i class="fas fa-check-circle"></i> ' . $message . '</div>';
    }
    if (!empty($error)) {
        echo '<div class="alert alert-danger"><i class="fas fa-exclamation-triangle"></i> ' . $error . '</div>';
    }

    // Stats Grid
    echo '<div class="row">
        <div class="col-md-3">
            <div class="ph-stat-card" style="border-left-color:#0052cc;">
                <h3>' . $totalLicenses . '</h3>
                <p>Συνολικες Αδειες</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="ph-stat-card" style="border-left-color:#36b37e;">
                <h3 style="color:#36b37e;">' . $activeLicenses . '</h3>
                <p>Ενεργες Αδειες</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="ph-stat-card" style="border-left-color:#de350b;">
                <h3 style="color:#de350b;">' . $suspendedLicenses . '</h3>
                <p>Σε Αναστολη / Κλειδωμενες</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="ph-stat-card" style="border-left-color:#ffab00;">
                <h3 style="color:#ffab00;">' . $todayPings . '</h3>
                <p>Σημερινοι Ελεγχοι (Pings)</p>
            </div>
        </div>
    </div>';

    // Subaction Views
    if ($action === 'new') {
        // Create License Form
        $newKey = powerhosting_licensing_generate_key();
        $clients = Capsule::table('tblclients')->select('id', 'firstname', 'lastname', 'companyname', 'email')->orderBy('lastname')->get();
        $exts = powerhosting_licensing_extensions_list();

        echo '<div class="panel panel-default">
            <div class="panel-heading"><h3 class="panel-title" style="font-weight:700;"><i class="fas fa-plus"></i> Έκδοση Νέας Άδειας PowerHosting</h3></div>
            <div class="panel-body">
                <form method="POST" action="' . $modulelink . '&subaction=create">
                    ' . generate_token('form') . '
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Πελάτης WHMCS <span class="text-danger">*</span></label>
                                <select name="client_id" class="form-control selectize" required>
                                    <option value="">-- Επιλέξτε Πελάτη --</option>';
        foreach ($clients as $c) {
            $name = trim($c->firstname . ' ' . $c->lastname);
            if ($c->companyname) $name .= " ({$c->companyname})";
            echo "<option value='{$c->id}'>#{$c->id} - {$name} - {$c->email}</option>";
        }
        echo '                  </select>
                            </div>
                            <div class="form-group">
                                <label>Κλειδί Άδειας (License Key)</label>
                                <div class="input-group">
                                    <input type="text" name="license_key" id="ph_license_key" class="form-control" value="' . $newKey . '" required style="font-family:monospace; font-weight:bold; letter-spacing:1px;">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button" onclick="document.getElementById(\'ph_license_key\').value = \'POWER-\' + Math.random().toString(36).substring(2,6).toUpperCase() + \'-\' + Math.random().toString(36).substring(2,6).toUpperCase() + \'-\' + Math.random().toString(36).substring(2,6).toUpperCase();"><i class="fas fa-sync"></i> Παραγωγή</button>
                                    </span>
                                </div>
                                <span class="help-block">Μορφή: POWER-XXXX-XXXX-XXXX</span>
                            </div>
                            <div class="form-group">
                                <label>Πακέτο / Τίτλος Προϊόντος</label>
                                <input type="text" name="package_name" class="form-control" value="PowerHosting Extensions Suite" required>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Έγκυρο Domain / Subdomain</label>
                                        <input type="text" name="val_domain" class="form-control" placeholder="π.χ. eshop.gr ή b2b.eshop.gr (κενό για auto-learn)">
                                        <span class="help-block" style="font-size:11px;">Κάθε subdomain απαιτεί ξεχωριστή άδεια. Αν μείνει κενό, θα κατοχυρωθεί αυτόματα στον 1ο έλεγχο.</span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Έγκυρη IP (Προαιρετικό)</label>
                                        <input type="text" name="val_ip" class="form-control" placeholder="π.χ. 135.181.171.50">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Κατάσταση Άδειας</label>
                                        <select name="status" class="form-control">
                                            <option value="Active" selected>Active (Ενεργή)</option>
                                            <option value="Suspended">Suspended (Σε Αναστολή)</option>
                                            <option value="Expired">Expired (Έληξε)</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Ημερομηνία Λήξης</label>
                                        <input type="date" name="expires_at" class="form-control">
                                        <span class="help-block" style="font-size:11px;">Αφήστε κενό για ισόβια (Lifetime / One-time).</span>
                                    </div>
                                </div>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="reissue_status" value="1" checked> <strong>Επανέκδοση (Reissue) Ενεργή</strong> (Επιτρέπει αυτόματο κλείδωμα σε νέο IP/Domain κατά τον 1ο έλεγχο).
                                </label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label style="font-weight:700; margin-bottom:8px;">Δικαιώματα Επεκτάσεων (Ποιες λειτουργούν με αυτή την άδεια):</label>
                                <div style="max-height:360px; overflow-y:auto; border:1px solid #ced4da; padding:10px 15px; border-radius:4px; background:#fafafa;">';
        foreach ($exts as $code => $title) {
            $checked = ($code === '*') ? 'checked' : '';
            echo '<div class="checkbox" style="margin-top:4px; margin-bottom:6px;">
                    <label style="' . ($code === '*' ? 'font-weight:bold; color:#0052cc;' : '') . '">
                        <input type="checkbox" name="extensions[]" value="' . $code . '" ' . $checked . '> ' . $title . '
                    </label>
                  </div>';
        }
        echo '                  </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <button type="submit" class="btn btn-primary btn-lg"><i class="fas fa-check"></i> Δημιουργία & Έκδοση Άδειας</button>
                    <a href="' . $modulelink . '&subaction=list" class="btn btn-default btn-lg">Ακύρωση</a>
                </form>
            </div>
        </div>';

    } elseif ($action === 'logs') {
        // Logs View
        $logs = Capsule::table('mod_ph_license_logs')->orderBy('id', 'desc')->limit(150)->get();

        echo '<div class="panel panel-default">
            <div class="panel-heading" style="display:flex; justify-content:space-between; align-items:center;">
                <h3 class="panel-title" style="font-weight:700;"><i class="fas fa-history"></i> Ιστορικό Ελέγχων & Pings Καταστημάτων (Τελευταία 150)</h3>
                <a href="' . $modulelink . '&subaction=clear_logs&token=' . generate_token('plain') . '" class="btn btn-danger btn-xs" onclick="return confirm(\'Είστε σίγουροι ότι θέλετε να καθαρίσετε το ιστορικό;\');"><i class="fas fa-trash"></i> Καθαρισμός Ιστορικού</a>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-hover table-condensed" style="margin-bottom:0; font-size:12px;">
                    <thead>
                        <tr>
                            <th>Ημ/νία & Ώρα</th>
                            <th>Κλειδί Άδειας</th>
                            <th>Domain Καταστήματος</th>
                            <th>IP Server</th>
                            <th>Ενέργεια / Αποτέλεσμα</th>
                            <th>Κωδικός</th>
                            <th>Μήνυμα</th>
                        </tr>
                    </thead>
                    <tbody>';
        if ($logs->isEmpty()) {
            echo '<tr><td colspan="7" class="text-center" style="padding:25px; color:#888;">Δεν υπάρχουν ακόμη καταγραφές ελέγχων.</td></tr>';
        } else {
            foreach ($logs as $log) {
                $statusColor = ($log->response_code == 200) ? 'color:#2e7d32; font-weight:bold;' : 'color:#c62828; font-weight:bold;';
                echo "<tr>
                    <td>{$log->created_at}</td>
                    <td><span class='ph-key-box'>{$log->license_key}</span></td>
                    <td><strong>{$log->domain}</strong></td>
                    <td>{$log->ip_address}</td>
                    <td>{$log->action}</td>
                    <td style='{$statusColor}'>{$log->response_code}</td>
                    <td>{$log->message}</td>
                </tr>";
            }
        }
        echo '      </tbody>
                </table>
            </div>
        </div>';

    } else {
        // List Licenses View
        $search = trim($_GET['search'] ?? '');
        $query = Capsule::table('mod_ph_licenses')
            ->leftJoin('tblclients', 'mod_ph_licenses.client_id', '=', 'tblclients.id')
            ->select('mod_ph_licenses.*', 'tblclients.firstname', 'tblclients.lastname', 'tblclients.companyname', 'tblclients.email');

        if (!empty($search)) {
            $query->where(function($q) use ($search) {
                $q->where('mod_ph_licenses.license_key', 'LIKE', "%{$search}%")
                  ->orWhere('mod_ph_licenses.val_domain', 'LIKE', "%{$search}%")
                  ->orWhere('mod_ph_licenses.val_ip', 'LIKE', "%{$search}%")
                  ->orWhere('tblclients.firstname', 'LIKE', "%{$search}%")
                  ->orWhere('tblclients.lastname', 'LIKE', "%{$search}%")
                  ->orWhere('tblclients.email', 'LIKE', "%{$search}%");
            });
        }

        $licenses = $query->orderBy('mod_ph_licenses.id', 'desc')->get();

        echo '<div class="panel panel-default">
            <div class="panel-heading" style="display:flex; justify-content:space-between; align-items:center;">
                <h3 class="panel-title" style="font-weight:700;"><i class="fas fa-list"></i> Λίστα Εκδοθέντων Αδειών</h3>
                <form method="GET" action="' . $modulelink . '" class="form-inline" style="margin:0;">
                    <input type="hidden" name="module" value="powerhosting_licensing">
                    <div class="input-group">
                        <input type="text" name="search" class="form-control input-sm" placeholder="Αναζήτηση κλειδιού, domain, πελάτη..." value="' . htmlspecialchars($search) . '">
                        <span class="input-group-btn">
                            <button class="btn btn-default btn-sm" type="submit"><i class="fas fa-search"></i></button>
                        </span>
                    </div>
                </form>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-hover" style="margin-bottom:0; font-size:13px; vertical-align:middle;">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Κλειδί Άδειας</th>
                            <th>Πελάτης</th>
                            <th>Πακέτο</th>
                            <th>Έγκυρο Domain</th>
                            <th>Έγκυρη IP</th>
                            <th>Κατάσταση</th>
                            <th>Reissue</th>
                            <th>Λήξη</th>
                            <th>Τελευταίος Έλεγχος</th>
                            <th class="text-right">Ενέργειες</th>
                        </tr>
                    </thead>
                    <tbody>';

        if ($licenses->isEmpty()) {
            echo '<tr><td colspan="11" class="text-center" style="padding:30px; color:#888;">
                <i class="fas fa-key" style="font-size:32px; color:#ccc; margin-bottom:10px; display:block;"></i>
                Δεν βρέθηκαν άδειες. Πατήστε <strong>«Νέα Άδεια»</strong> παραπάνω για να εκδώσετε την πρώτη σας άδεια!
            </td></tr>';
        } else {
            foreach ($licenses as $lic) {
                $statusBadge = ($lic->status === 'Active') 
                    ? '<span class="ph-badge ph-badge-active"><i class="fas fa-check"></i> Active</span>'
                    : '<span class="ph-badge ph-badge-suspended"><i class="fas fa-pause"></i> ' . $lic->status . '</span>';
                
                $reissueBadge = ($lic->reissue_status == 1)
                    ? '<span class="badge" style="background:#ffab00; color:#fff;" title="Επιτρέπεται η επανέκδοση στον επόμενο έλεγχο"><i class="fas fa-sync-alt fa-spin"></i> Reissue Ready</span>'
                    : '<span class="badge" style="background:#dfe1e6; color:#42526e;"><i class="fas fa-lock"></i> Locked</span>';

                $clientName = trim($lic->firstname . ' ' . $lic->lastname);
                if ($lic->companyname) $clientName .= " ({$lic->companyname})";
                $clientLink = "clientssummary.php?userid={$lic->client_id}";

                $domainDisplay = $lic->val_domain ? "<strong>{$lic->val_domain}</strong>" : "<span class='text-muted' style='font-style:italic;'>Auto-learning...</span>";
                $ipDisplay = $lic->val_ip ? "<code>{$lic->val_ip}</code>" : "<span class='text-muted'>-</span>";
                $expiryDisplay = $lic->expires_at ? date('d/m/Y', strtotime($lic->expires_at)) : '<span class="text-success"><i class="fas fa-infinity"></i> Lifetime</span>';
                $lastAccess = $lic->last_access_at ? date('d/m/Y H:i', strtotime($lic->last_access_at)) : '<span class="text-muted">Ποτέ</span>';

                $token = generate_token('plain');

                echo "<tr>
                    <td>#{$lic->id}</td>
                    <td>
                        <span class='ph-key-box'>{$lic->license_key}</span>
                        <a href='javascript:void(0);' onclick='navigator.clipboard.writeText(\"{$lic->license_key}\"); alert(\"Το κλειδί αντιγράφηκε: {$lic->license_key}\");' title='Αντιγραφή Κλειδιού' style='margin-left:4px; color:#6b778c;'><i class='fas fa-copy'></i></a>
                    </td>
                    <td><a href='{$clientLink}' target='_blank'><strong>{$clientName}</strong></a><br><small style='color:#6b778c;'>{$lic->email}</small></td>
                    <td><small style='font-weight:600;'>{$lic->package_name}</small></td>
                    <td>{$domainDisplay}</td>
                    <td>{$ipDisplay}</td>
                    <td>{$statusBadge}</td>
                    <td>{$reissueBadge}</td>
                    <td>{$expiryDisplay}</td>
                    <td><small>{$lastAccess}</small></td>
                    <td class=\"text-right\">
                        <a href=\"{$modulelink}&subaction=reissue&id={$lic->id}&token={$token}\" class=\"btn btn-success btn-xs\" title=\"Επανέκδοση Άδειας (Reissue)\"><i class=\"fas fa-sync-alt\"></i></a>
                        <a href=\"{$modulelink}&subaction=toggle_status&id={$lic->id}&token={$token}\" class=\"btn btn-warning btn-xs\" title=\"Αλλαγή Κατάστασης (Active/Suspended)\"><i class=\"fas fa-power-off\"></i></a>
                        <a href=\"{$modulelink}&subaction=delete&id={$lic->id}&token={$token}\" class=\"btn btn-danger btn-xs\" title=\"Διαγραφή Άδειας\" onclick=\"return confirm('Σίγουρα θέλετε να διαγράψετε την άδεια {$lic->license_key};');\"><i class=\"fas fa-trash\"></i></a>
                    </td>
                </tr>";
            }
        }
        echo '      </tbody>
                </table>
            </div>
        </div>';
    }

    echo '</div>'; // End container
}

