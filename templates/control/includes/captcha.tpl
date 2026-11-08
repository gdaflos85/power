{if $captcha->isEnabled() && $captcha->isEnabledForForm($captchaForm)  && $captcha neq 'invisible'}
	{if $templatefile == 'homepage'}
		{if $captcha == "recaptcha"}
			<div id="captcha-panel" class="text-center" style="display: none;">
				<div id="google-recaptcha-domainchecker" class="form-group recaptcha-container center-block"></div>
				<br /><br />
	        </div>
		{elseif !in_array($captcha, ['invisible', 'recaptcha'])}
			<div id="captcha-panel" class="well text-center" style="display: none;">
		        <p>{lang key="captchaverify"}</p>
				<div class="text-center">
					<br />
					<img id="inputCaptchaImage" data-src="{$systemurl}includes/verifyimage.php" src="{$systemurl}includes/verifyimage.php" align="middle" />
					<br /><br />
					<input id="inputCaptcha" type="text" name="code" maxlength="6" class="input-sm" data-toggle="tooltip" data-placement="right" data-trigger="manual" title="{lang key='orderForm.required'}" />
				</div>
	        </div>
		{/if}
	{else if $templatefile == 'clientregister'}
		<hr/>
		<fieldset>
            <div class="row">
                <div class="col-lg-12">
                    <div class="form-group">
                        <label class="col-lg-2 col-sm-3 control-label" for="code">{lang key="captchatitle"}</label>
                        <div class="col-lg-9 col-sm-6 captchaimage">
                            {if $captcha eq "recaptcha"}
                                <div id="google-recaptcha-domainchecker" class="form-group recaptcha-container center-block"></div>
                            {elseif !in_array($captcha, ['invisible', 'recaptcha'])}
                                <p style="padding-top: 7px;">{lang key="captchaverify"}</p>
                                <img id="inputCaptchaImage" data-src="{$systemurl}includes/verifyimage.php" src="{$systemurl}includes/verifyimage.php" align="middle" />
                                <br /><br />
                                <input id="inputCaptcha" type="text" name="code" maxlength="6" class="form-control" data-toggle="tooltip" data-placement="right" data-trigger="manual" title="{lang key='orderForm.required'}" />
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
		</fieldset>
    {else if $templatefile == 'login'}
		<hr/>
		<fieldset>
            <div class="{if $captcha neq 'invisible'}form-group{/if}">
                {if !in_array($captcha, ['invisible', 'recaptcha'])}
                    <label class="control-label" for="code">{lang key="captchatitle"}</label>
                {/if}
                <div class="captchaimage">
                    {if $captcha eq "recaptcha"}
                        <div id="google-recaptcha-domainchecker" class="form-group recaptcha-container center-block"></div>
                    {elseif !in_array($captcha, ['invisible', 'recaptcha'])}
                        <p style="padding-top: 7px;">{lang key="captchaverify"}</p>
                        <img id="inputCaptchaImage" data-src="{$systemurl}includes/verifyimage.php" src="{$systemurl}includes/verifyimage.php" align="middle" />
                        <br /><br />
                        <input id="inputCaptcha" type="text" name="code" maxlength="6" class="form-control" data-toggle="tooltip" data-placement="right" data-trigger="manual" title="{lang key='orderForm.required'}" />
                    {/if}
                </div>
            </div>
		</fieldset>
    {else if $templatefile == 'viewcart'}
        <div class="captchaimage">
            {if $captcha eq "recaptcha"}
                <div id="google-recaptcha-domainchecker" class="form-group recaptcha-container center-block"></div>
            {elseif !in_array($captcha, ['invisible', 'recaptcha'])}
                <div class="panel panel-warning text-left">
                    <div class="panel-heading">
                        <h3 class="panel-title">{lang key="captchatitle"}</h3>
                    </div>
                    <div class="panel-body">
                        <p>{lang key="captchaverify"}</p>
                        <img id="inputCaptchaImage" data-src="{$systemurl}includes/verifyimage.php" src="{$systemurl}includes/verifyimage.php" align="middle" />
                        <br /><br />
                        <div class="row">
                            <div class="col-md-6">
                                <input id="inputCaptcha" type="text" name="code" maxlength="6" class="form-control" data-toggle="tooltip" data-placement="right" data-trigger="manual" title="{lang key='orderForm.required'}" />
                            </div>
                        </div>
                    </div>
                </div>
            {/if}
        </div>
    {else}
        <hr/>
        <fieldset>
            <div class="form-group">
                <label class="col-sm-3 control-label" for="code">{lang key="captchatitle"}</label>
                <div class="col-sm-6 captchaimage">
                    {if $captcha eq "recaptcha"}
                        <div id="google-recaptcha-domainchecker" class="recaptcha-container center-block"></div>
                    {elseif !in_array($captcha, ['invisible', 'recaptcha'])}
                        <p style="padding-top: 7px;">{lang key="captchaverify"}</p>
                        <img id="inputCaptchaImage" data-src="{$systemurl}includes/verifyimage.php" src="{$systemurl}includes/verifyimage.php" align="middle" />
                        <br /><br />
                        <input id="inputCaptcha" type="text" name="code" maxlength="6" class="form-control" />
                    {/if}
                </div>
            </div>
        </fieldset>
    {/if}
{/if}
