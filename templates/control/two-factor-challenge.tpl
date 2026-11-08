{include file="$template/includes/flashmessage.tpl" align="center"}

{if $newbackupcode}
    {include file="$template/includes/alert.tpl" type="success" msg=$LANG.twofabackupcodereset textcenter=true}
{elseif $incorrect}
    {include file="$template/includes/alert.tpl" type="error" msg=$LANG.twofa2ndfactorincorrect textcenter=true}
{elseif $error}
    {include file="$template/includes/alert.tpl" type="error" msg=$error textcenter=true}
{else}
    {include file="$template/includes/alert.tpl" type="warning" msg=$LANG.twofa2ndfactorreq textcenter=true}
{/if}

<form method="post" action="{routePath('login-two-factor-challenge-verify')}" id="frmTwoFactorChallenge"{if $usingBackup} class="hidden"{/if}>
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-default panel-login">
                <div class="panel-heading">
                    <h3 class="panel-title">{$LANG.twofactorauth}</h3>
                </div>
                <div class="panel-body">
                    {$challenge}
                    <p class="text-center">
                        {$LANG.twofacantaccess2ndfactor}
                        <a href="#" id="loginWithBackupCode">
                            {$LANG.twofaloginusingbackupcode}
                        </a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</form>

<form method="post" action="{routePath('login-two-factor-challenge-backup-verify')}" id="frmTwoFactorBackup"{if !$usingBackup} class="hidden"{/if}>
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-default panel-login">
                <div class="panel-heading">
                    <h3 class="panel-title">{$LANG.twofactorauth}</h3>
                </div>
                <div class="panel-body">
                    <input type="text" name="twofabackupcode" class="form-control input-lg" placeholder="{$LANG.twofabackupcodelogin}">
                </div>
                <div class="panel-footer">
                    <button type="submit" class="btn btn-primary btn-3d res-100" id="btnLogin">
                        {$LANG.loginbutton}
                    </button>
                    <a href="#" class="btn btn-default pull-right res-100 res-left" id="backupCodeCancel">
                        {lang key='cancel'}
                    </a>
                </div>
            </div>
        </div>
    </div>
</form>

<script>
    jQuery(document).ready(function() {
        jQuery('#loginWithBackupCode').click(function(e) {
            e.preventDefault();
            jQuery('#frmTwoFactorChallenge').hide();
            jQuery('#frmTwoFactorBackup').removeClass('hidden').show();
        });
        jQuery('#backupCodeCancel').click(function(e) {
            e.preventDefault();
            jQuery('#frmTwoFactorChallenge').removeClass('hidden').show();
            jQuery('#frmTwoFactorBackup').hide();
        });
    });
</script>
