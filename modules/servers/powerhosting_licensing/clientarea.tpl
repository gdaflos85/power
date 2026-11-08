{if $reissued_notice}
    <div class="alert alert-success alert-dismissible" role="alert" style="margin-top:15px; border-radius:6px;">
        <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span></button>
        <i class="fas fa-check-circle"></i> <strong>Η άδεια επανεκδόθηκε επιτυχώς!</strong> Στην επόμενη σύνδεση από το OpenCart κατάστημά σας, η πλατφόρμα θα κλειδώσει αυτόματα τη νέα IP και το Domain σας.
    </div>
{/if}

<div class="ph-clientarea-box" style="margin-top:15px; font-family:-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;">
    <h2 style="font-size:24px; font-weight:700; color:#172b4d; margin-bottom:15px;">
        {$package_name}
    </h2>

    <!-- Banner Τελευταίες Λήψεις -->
    <div style="background:#fcf8e3; border:1px solid #faebcc; border-radius:6px; padding:18px 20px; text-align:center; margin-bottom:25px;">
        <h4 style="margin:0 0 8px 0; color:#8a6d3b; font-weight:700; font-size:16px;">
            Τελευταίες Λήψεις
        </h4>
        <p style="margin:0 0 12px 0; color:#8a6d3b; font-size:13px;">
            [1.0.0] PowerHosting OpenCart Suite - Τελευταία έκδοση συμβατότητας (Συμβατό με OpenCart 3.x & PHP 7.4 / 8.x)
        </p>
        <a href="https://demo1.powerhosting.gr/powerhosting_suite.zip" class="btn btn-default" style="background:#fff; border:1px solid #faebcc; color:#8a6d3b; font-weight:600; padding:6px 16px; border-radius:4px;">
            <i class="fas fa-download"></i> Λήψη Τώρα
        </a>
    </div>

    <!-- Main Grid -->
    <div class="row">
        <!-- Αριστερή Στήλη: Στοιχεία Άδειας -->
        <div class="col-md-8 col-sm-12">
            <!-- Κλειδί Άδειας -->
            <div class="form-group" style="margin-bottom:18px;">
                <label style="font-weight:700; color:#333; font-size:14px; margin-bottom:6px; display:block;">
                    Κλειδί Άδειας
                </label>
                <div class="input-group">
                    <input type="text" id="ph_license_key_field" class="form-control input-lg" value="{$license_key}" readonly style="background:#f7f9fa; font-family:monospace; font-weight:bold; letter-spacing:1px; color:#0052cc; font-size:16px;">
                    <span class="input-group-btn">
                        <button class="btn btn-default btn-lg" type="button" onclick="navigator.clipboard.writeText('{$license_key}'); alert('Το κλειδί άδειας αντιγράφηκε στο πρόχειρο!');" title="Αντιγραφή κλειδιού" style="background:#f7f9fa; border-left:none;">
                            <i class="fas fa-copy"></i>
                        </button>
                    </span>
                </div>
            </div>

            <!-- Έγκυρα IPs -->
            <div class="form-group" style="margin-bottom:18px;">
                <label style="font-weight:700; color:#333; font-size:14px; margin-bottom:6px; display:block;">
                    Έγκυρα IPs
                </label>
                <input type="text" class="form-control" value="{$val_ip}" readonly style="background:#f7f9fa; color:#444;">
            </div>

            <!-- Έγκυρα Domains -->
            <div class="form-group" style="margin-bottom:20px;">
                <label style="font-weight:700; color:#333; font-size:14px; margin-bottom:6px; display:block;">
                    Έγκυρο Domain / Subdomain
                </label>
                <input type="text" class="form-control" value="{$val_domain}" readonly style="background:#f7f9fa; color:#444;">
                <small style="display:block; color:#6b778c; margin-top:5px; font-size:11px;">
                    <i class="fas fa-info-circle" style="color:#0052cc;"></i> <strong>Σημαντικό:</strong> Η άδεια κλειδώνει αυστηρά στο συγκεκριμένο domain ή subdomain. Κάθε ξεχωριστό subdomain (π.χ. <code>store.domain.gr</code> ή <code>demo1.domain.gr</code>) απαιτεί δική του ανεξάρτητη άδεια.
                </small>
            </div>

            <!-- Κατάσταση Άδειας -->
            <div style="margin-bottom:25px;">
                <label style="font-weight:700; color:#333; font-size:14px; margin-bottom:6px; display:block;">
                    Κατάσταση Άδειας
                </label>
                <div>
                    {if $status eq 'Active'}
                        <span style="color:#2e7d32; font-weight:700; font-size:15px;">
                            <i class="fas fa-check-circle" style="color:#36b37e;"></i> Active
                        </span>
                    {else}
                        <span style="color:#de350b; font-weight:700; font-size:15px;">
                            <i class="fas fa-times-circle"></i> {$status}
                        </span>
                    {/if}
                    {if $reissue_status eq 1}
                        <span class="label label-warning" style="margin-left:10px; font-size:11px; padding:3px 8px;">Reissue Ready</span>
                    {/if}
                </div>
            </div>

            <hr style="border-top:1px solid #eaeaea; margin:20px 0;">

            <!-- Ημερομηνίες & Τιμολόγηση / Χαρακτηριστικά -->
            <div class="row" style="font-size:13px; color:#555;">
                <div class="col-xs-6 col-sm-4" style="margin-bottom:12px;">
                    <div style="font-weight:700; color:#333; margin-bottom:4px;">Ημερομηνία Κατοχύρωσης</div>
                    <div>{$regdate}</div>
                </div>
                <div class="col-xs-6 col-sm-4" style="margin-bottom:12px;">
                    <div style="font-weight:700; color:#333; margin-bottom:4px;">Ημερομηνία Λήξης</div>
                    <div>{$nextduedate}</div>
                </div>
                <div class="col-xs-6 col-sm-4" style="margin-bottom:12px;">
                    <div style="font-weight:700; color:#333; margin-bottom:4px;">Κύκλος Τιμολόγησης</div>
                    <div>{$billingcycle}</div>
                </div>
            </div>

            <div class="row" style="font-size:13px; color:#555; margin-top:5px;">
                <div class="col-xs-6 col-sm-4" style="margin-bottom:12px;">
                    <div style="font-weight:700; color:#333; margin-bottom:4px;">Ποσό Πρώτης Πληρωμής</div>
                    <div>{$firstpayment}</div>
                </div>
                <div class="col-xs-6 col-sm-8" style="margin-bottom:12px;">
                    <div style="font-weight:700; color:#333; margin-bottom:4px;">Τρόπος Πληρωμής</div>
                    <div>{$paymentmethod}</div>
                </div>
            </div>
        </div>

        <!-- Δεξιά Στήλη: Κουμπιά Ενεργειών (Όπως στο screenshot) -->
        <div class="col-md-4 col-sm-12" style="padding-top:15px;">
            <!-- Κουμπί Επανέκδοσης (Πράσινο Μεγάλο) -->
            <form method="POST" action="clientarea.php?action=productdetails&id={$serviceid}" style="margin-bottom:15px;">
                {generate_token('form')}
                <input type="hidden" name="ph_action" value="reissue">
                <button type="submit" class="btn btn-block" style="background:#5cb85c; color:#fff; font-size:18px; font-weight:700; padding:18px 20px; border-radius:6px; border:none; box-shadow:0 2px 4px rgba(0,0,0,0.1); cursor:pointer; transition:background 0.2s; display:flex; align-items:center; justify-content:center; gap:10px; width:100%;" onmouseover="this.style.background='#4cae4c';" onmouseout="this.style.background='#5cb85c';">
                    <i class="fas fa-sync-alt"></i> Επανέκδοση
                </button>
            </form>

            <!-- Κουμπί Ακύρωσης (Κόκκινο Μεγάλο) -->
            <a href="clientarea.php?action=cancel&id={$serviceid}" class="btn btn-block" style="background:#d9534f; color:#fff; font-size:18px; font-weight:700; padding:18px 20px; border-radius:6px; border:none; box-shadow:0 2px 4px rgba(0,0,0,0.1); text-align:center; text-decoration:none; display:flex; align-items:center; justify-content:center; gap:10px; width:100%; transition:background 0.2s;" onmouseover="this.style.background='#c9302c';" onmouseout="this.style.background='#d9534f';">
                <i class="fas fa-times"></i> Ακύρωση
            </a>
            
            <div style="margin-top:20px; background:#f4f5f7; border-radius:6px; padding:14px; font-size:12px; color:#6b778c;">
                <strong><i class="fas fa-info-circle"></i> Τι κάνει η Επανέκδοση;</strong>
                <p style="margin:6px 0 0 0; line-height:1.5;">
                    Εάν μεταφέρετε το OpenCart κατάστημά σας σε νέο server ή αλλάξει η IP σας, πατήστε <strong>Επανέκδοση</strong> και στη συνέχεια κάντε <strong>Αποθήκευση Ρυθμίσεων</strong> μέσα από το OpenCart για να συνδεθεί ο νέος server!
                </p>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div style="margin-top:35px; text-align:center; font-size:12px; color:#999; border-top:1px solid #f0f0f0; padding-top:15px;">
        Powered by <strong style="color:#0052cc;">PowerHosting</strong> Licensing System
    </div>
</div>
