<div class="modal fade" id="modal-mismatch-system-url" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-close-modal>
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" style="margin: 0">System URL misconfiguration</h4>
            </div>
            <div class="modal-body">
                <p>Your current url - <b>{$warningUrl}</b> does not math to url you have set in WHMCS General Settings - <b>{$warningSystemUrl}</b>.</p>
                <p>It's important to access your website with THE SAME URL as you have in your WHMCS System settings.</p>
                <p>System URL misconfiguration can cause several issues with HTTP-header resource loading or Ajax requests responses and may lead to irregularities in the appearance or operation of the RSThemes addon</p>
                <p>Please set correct system url in <a href="{$warningUrl}/{$adminPath}/configgeneral.php" target="_blank">WHMCS General Settings</a></p>
            </div>
            <div class="modal-footer panel-footer">
                <button type="button" class="btn btn-default" data-close-modal> Close </button>
            </div>
        </div>
    </div>
</div>