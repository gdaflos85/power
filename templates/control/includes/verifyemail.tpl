{if $showEmailVerificationBanner}
    <div class="alert alert-warning">
        <i class="fas fa-exclamation-triangle"></i>
        {$LANG.verifyEmailAddress}
        <div class="pull-right res-left-991">
            <button id="btnResendVerificationEmail" class="btn btn-warning btn-xs btn-resend-verify-email" data-email-sent="{$LANG.emailSent}" data-error-msg="{$LANG.error}" data-uri="{routePath('user-email-verification-resend')}">
                <span class="loader hidden"><i class="fa fa-spinner fa-spin"></i></span>
                {$LANG.resendEmail}
            </button>
        </div>
    </div>
{/if}
