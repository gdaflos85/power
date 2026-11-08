<div class="row">
    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">{$LANG.emailVerification.title}</h3>
            </div>
            <div class="panel-body">
                {if $success}
                    <div class="alert alert-success">
                        <i class="fas fa-check fa-2x "></i><br>
                        {lang key="emailVerification.success"}
                    </div>
                {elseif $expired}
                    <div class="alert alert-warning">
                        <i class="far fa-clock fa-2x "></i><br>
                        {lang key="emailVerification.expired"}
                    </div>

                    {if $loggedin}
                        <button class="btn btn-default btn-resend-verify-email" data-email-sent="{$LANG.emailSent}" data-error-msg="{$LANG.error}" data-uri="{routePath('user-email-verification-resend')}">
                            {$LANG.resendEmail}
                        </button>
                    {else}
                        <p>{lang key="emailVerification.loginToRequest"}</p>
                    {/if}
                {else}
                    <div class="alert alert-danger">
                        <i class="fas fa-times fa-2x "></i><br>
                        {lang key="emailVerification.notFound"}
                    </div>

                    {if !$loggedin}
                        <p>{lang key="emailVerification.loginToRequest"}</p>
                    {/if}
                {/if}


            </div>
            <div class="panel-footer">
                <a href="{routePath('login-index')}" class="btn btn-primary btn-3d">
                    {lang key="orderForm.continueToClientArea"}
                    &nbsp;
                    <i class="fa fa-arrow-right"></i>
                </a>
            </div>
        </div>
    </div>
</div>
