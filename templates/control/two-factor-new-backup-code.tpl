{include file="$template/includes/alert.tpl" type="success" msg=$LANG.twofabackupcodereset}
<div class="row">
    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-default panel-login">
            <div class="panel-heading">
                <h3 class="panel-title">{$LANG.twofactorauth}</h3>
            </div>
            <div class="panel-body">
                <p>{$LANG.twofanewbackupcodeis}</p>
                <p><strong>{$newBackupCode}</strong></p>
                <p><em>{$LANG.twofabackupcodeexpl}</em></p>
            </div>
            <div class="panel-footer">
                <a href="{routePath('clientarea-home')}" class="btn btn-primary btn-3d">
                    {$LANG.continue}
                </a>
            </div>
        </div>
    </div>
</div>
