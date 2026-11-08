<form method="post" action="{routePath('login-validate')}" role="form" id="loginform">
    <div class="row">
        <div class="{if $linkableProviders}col-md-8 col-md-offset-2{else}col-md-6 col-md-offset-3{/if}">
            <div class="panel panel-default panel-login">
                <div class="panel-heading">
                    <h3 class="panel-title">{$LANG.login}</h3>
                </div>
                <div class="panel-body">
                    <div id="errormessages">
                        {include file="$template/includes/flashmessage.tpl"}
                    </div>
                    <div class="providerLinkingFeedback"></div>
                    {if $linkableProviders}
                        <div class="row">
                            <div class="col-md-7">
                    {/if}
                                <div class="form-group">
                                    <label for="username">{$LANG.loginemail}</label>
                                    <input type="email" name="username" id="username" class="form-control" placeholder="{$LANG.loginemail}" />
                                </div>
                                <div class="form-group">
                                    <label for="password">{$LANG.loginpassword}</label>
                                    <input name="password" id="password" type="password" class="form-control" placeholder="{$LANG.loginpassword}" autocomplete="off" />
                                </div>
                                {if $captcha->isEnabled()}
                                    {include file="$template/includes/captcha.tpl"}
                                {/if}
                                <div class="form-group">
                                    <label class="checkbox-inline no-padding rememberme">
                                        <input type="checkbox" class="icheck" name="rememberme"{if $rememberme} checked="checked"{/if} />
                                        {$LANG.loginrememberme}
                                    </label>
                                </div>
                                <input id="loginhidden" type="submit" style="position: absolute; left: -9999px;" value="{$LANG.loginbutton}" class="{$captcha->getButtonClass($captchaForm)}" />
                    {if $linkableProviders}
                            </div>
                            <div class="col-md-5 social-login">
                                {include file="$template/includes/linkedaccounts.tpl" linkContext="login" customFeedback=true}
                            </div>
                        </div>
                    {/if}
                </div>
                <div class="panel-footer">
                    <input id="login" type="submit" class="btn res-100 btn-3d btn-primary {$captcha->getButtonClass($captchaForm)}" value="{$LANG.loginbutton}" /> <p class="pull-right res-left" style="margin-top:10px;"><a href="{routePath('password-reset-begin')}">{$LANG.forgotpw}</a></p>
                </div>
            </div>
        </div>
    </div>
</form>
{include file="$template/includes/icheck.tpl"}
