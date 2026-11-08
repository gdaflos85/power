{if in_array('state', $optionalFields)}
    <script>
        var statesTab = 10;
        var stateNotRequired = true;
    </script>
{/if}
<script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
<script type="text/javascript" src="{$BASE_PATH_JS}/PasswordStrength.js"></script>
<script>
    window.langPasswordStrength = "{$LANG.pwstrength}";
    window.langPasswordWeak = "{$LANG.pwstrengthweak}";
    window.langPasswordModerate = "{$LANG.pwstrengthmoderate}";
    window.langPasswordStrong = "{$LANG.pwstrengthstrong}";
    jQuery(document).ready(function()
    {
        jQuery("#inputNewPassword1").keyup(registerFormPasswordStrengthFeedback);
    });
</script>
{if $registrationDisabled}
	{include file="$template/includes/alert.tpl" type="error" msg=$LANG.registerCreateAccount|cat:' <strong><a href="cart.php" class="alert-link">'|cat:$LANG.registerCreateAccountOrder|cat:'</a></strong>'}
{/if}
{if $errormessage}
	{include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
{/if}
{if !$registrationDisabled}
    <div id="registration">
        <form class="form-horizontal using-password-strength" method="post" action="{$smarty.server.PHP_SELF}" name="orderfrm" id="frmCheckout">
            <input type="hidden" name="register" value="true" />
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">{$LANG.clientregistertitle}</h3>
                        </div>
                        <div class="panel-body">
                            <div id="containerNewUserSignup">
                                {include file="$template/includes/linkedaccounts.tpl" linkContext="registration"}
                                <h4 class="registration-form">{$LANG.billingdetails}</h4>
                                <fieldset>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="col-lg-4 col-sm-3 control-label" for="inputFirstName">{$LANG.orderForm.firstName}</label>
                                                <div class="col-sm-6">
                                                    <input type="text" name="firstname" id="inputFirstName" placeholder="{$LANG.orderForm.firstName}" class="field form-control" value="{$clientfirstname}" {if !in_array('firstname', $optionalFields)}required{/if} autofocus>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-4 col-sm-3 control-label" for="inputLastName">{$LANG.orderForm.lastName}</label>
                                                <div class="col-sm-6">
                                                    <input type="text" name="lastname" id="inputLastName" class="field form-control" placeholder="{$LANG.orderForm.lastName}" value="{$clientlastname}" {if !in_array('lastname', $optionalFields)}required{/if}>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-4 col-sm-3 control-label" for="inputCompanyName">{$LANG.orderForm.companyName} ({$LANG.orderForm.optional})</label>
                                                <div class="col-sm-6">
                                                    <input type="text" name="companyname" id="inputCompanyName" placeholder="{$LANG.orderForm.companyName} ({$LANG.orderForm.optional})" class="field form-control" value="{$clientcompanyname}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-4 col-sm-3 control-label" for="inputEmail">{$LANG.orderForm.emailAddress}</label>
                                                <div class="col-sm-6">
                                                    <input type="email" name="email" id="inputEmail" placeholder="{$LANG.orderForm.emailAddress}" class="field form-control" value="{$clientemail}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-4 col-sm-3 control-label" for="inputPhone">{$LANG.orderForm.phoneNumber}</label>
                                                <div class="col-sm-6">
                                                    <input type="tel" name="phonenumber" id="inputPhone" placeholder="{$LANG.orderForm.phoneNumber}" class="field form-control" value="{$clientphonenumber}">
                                                </div>
                                            </div>
                                            {if $showTaxIdField}
                                                <div class="form-group">
                                                    <label class="col-lg-4 col-sm-3 control-label" for="inputTaxId">{$taxLabel} ({$LANG.orderForm.optional})</label>
                                                    <div class="col-sm-6">
                                                        <input type="text" name="tax_id" id="inputTaxId" placeholder="{$taxLabel} ({$LANG.orderForm.optional})" class="field form-control" value="{$clientTaxId}">
                                                    </div>
                                                </div>
                                            {/if}
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="col-lg-4 col-sm-3 control-label" for="inputAddress1">{$LANG.orderForm.streetAddress}</label>
                                                <div class="col-sm-6">
                                                    <input type="text" name="address1" id="inputAddress1" placeholder="{$LANG.orderForm.streetAddress}" class="field form-control" value="{$clientaddress1}"  {if !in_array('address1', $optionalFields)}required{/if}>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-4 col-sm-3 control-label" for="inputAddress2">{$LANG.orderForm.streetAddress2}</label>
                                                <div class="col-sm-6">
                                                    <input type="text" name="address2" id="inputAddress2" placeholder="{$LANG.orderForm.streetAddress2}" class="field form-control" value="{$clientaddress2}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-4 col-sm-3 control-label" for="inputCity">{$LANG.orderForm.city}</label>
                                                <div class="col-sm-6">
                                                    <input type="text" name="city" id="inputCity" placeholder="{$LANG.orderForm.city}" class="field form-control" value="{$clientcity}"  {if !in_array('city', $optionalFields)}required{/if}>
                                                </div>
                                            </div>
                                             <div class="form-group">
                                                <label class="col-lg-4 col-sm-3 control-label" for="state">{$LANG.orderForm.state}</label>
                                                <div class="col-sm-6">
                                                    <input type="text" name="state" id="state" placeholder="{$LANG.orderForm.state}" class="field form-control" value="{$clientstate}"  {if !in_array('state', $optionalFields)}required{/if}>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-4 col-sm-3 control-label" for="inputPostcode">{$LANG.orderForm.postcode}</label>
                                                <div class="col-sm-6">
                                                    <input type="text" name="postcode" id="inputPostcode" placeholder="{$LANG.orderForm.postcode}" class="field form-control" value="{$clientpostcode}" {if !in_array('postcode', $optionalFields)}required{/if}>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-4 col-sm-3 control-label" for="inputCountry">{$LANG.orderForm.country}</label>
                                                <div class="col-sm-6">
                                                    <select name="country" id="inputCountry" class="field form-control">
                                                        {foreach $clientcountries as $countryCode => $countryName}
                                                            <option value="{$countryCode}"{if (!$clientcountry && $countryCode eq $defaultCountry) || ($countryCode eq $clientcountry)} selected="selected"{/if}>
                                                                {$countryName}
                                                            </option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    {if $showMarketingEmailOptIn}
                                        <div class="form-group">
                                            <label class="col-lg-2 col-sm-3 control-label" for="marketingoptin" style="text-transform: capitalize;">{lang key='emailMarketing.joinOurMailingList'}</label>
                                            <div class="col-lg-9 col-sm-6">
                                                <div class="radio">
                                                    <p style="padding-top: 3px;">{$marketingEmailOptInMessage}</p>
                                                    <input type="checkbox" name="marketingoptin" value="1"{if $marketingEmailOptIn} checked{/if} class="no-icheck toggle-switch-success" data-size="small" data-on-text="{lang key='yes'}" data-off-text="{lang key='no'}">
                                                </div>
                                            </div>
                                        </div>
                                    {/if}
                                </fieldset>

                                {if $customfields || $currencies}
                                    <hr class="registration-form" />
                                    <h4 class="registration-form">{$LANG.orderadditionalrequiredinfo}</h4>
                                    <i><small>{lang key='orderForm.requiredField'}</small></i>
                                    {if $customfields}
                                        <fieldset>
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    {foreach $customfields as $customfield}
                                                        <div class="form-group">
                                                            <label class="col-lg-2 col-sm-3 control-label" for="customfield{$customfield.id}">{$customfield.name} {$LANG.orderadditionalrequiredinfo}</label>
                                                            <div class="col-lg-9 col-sm-6 control">
                                                                {$customfield.input}
                                                                {if $customfield.description}<p class="help-block">{$customfield.description}</p>{/if}
                                                            </div>
                                                        </div>
                                                    {/foreach}
                                                </div>
                                            </div>
                                        </fieldset>
                                    {/if}
                                    {if $currencies}
                                        <fieldset>
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="form-group">
                                                        <label for="currency" class="col-lg-2 col-sm-3 control-label">{$LANG.choosecurrency}</label>
                                                        <div class="col-lg-9 col-sm-6">
                                                            <select id="inputCurrency" name="currency" class="field form-control">
                                                                {foreach from=$currencies item=curr}
                                                                    <option value="{$curr.id}"{if !$smarty.post.currency && $curr.default || $smarty.post.currency eq $curr.id } selected{/if}>{$curr.code}</option>
                                                                {/foreach}
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                    {/if}
                                {/if}
                            </div>
                            <div id="containerNewUserSecurity" {if $remote_auth_prelinked && !$securityquestions } class="hidden"{/if}>
                                <hr class="registration-form" />
                                <h4 class="registration-form">{$LANG.orderForm.accountSecurity}</h4>
                                <div id="containerPassword" class="row{if $remote_auth_prelinked && $securityquestions} hidden{/if}">
                                    <div class="col-lg-12">
                                        <div id="newPassword1" class="form-group">
                                            <label for="inputNewPassword1" class="col-lg-2 col-sm-3 control-label">{$LANG.clientareapassword}</label>
                                            <div class="col-lg-9 col-sm-6">
                                                <input type="password" name="password" id="inputNewPassword1" data-error-threshold="{$pwStrengthErrorThreshold}" data-warning-threshold="{$pwStrengthWarningThreshold}" class="field form-control" autocomplete="off"{if $remote_auth_prelinked} value="{$password}"{/if}>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-lg-9 col-lg-offset-2 col-sm-6 col-sm-offset-3">
                                                <button type="button" class="btn btn-default btn-sm generate-password" data-targetfields="inputNewPassword1,inputNewPassword2">
                                                    {$LANG.generatePassword.btnLabel}
                                                </button>
                                                <div class="password-strength-meter">
                                                    <div class="progress">
                                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" id="passwordStrengthMeterBar">
                                                        </div>
                                                    </div>
                                                    <span class="sr-only" id="passwordStrengthTextLabel">{$LANG.pwstrength}: {$LANG.pwstrengthenter}</span>
                                                </div>
                                                {include file="$template/includes/alert.tpl" type="info" msg="{$LANG.passwordtips}"}
                                            </div>
                                        </div>
                                        <div id="newPassword2" class="form-group">
                                            <label for="inputNewPassword2" class="col-lg-2 col-sm-3 control-label">{$LANG.clientareaconfirmpassword}</label>
                                            <div class="col-lg-9 col-sm-6">
                                                <input type="password" name="password2" id="inputNewPassword2" class="field form-control" autocomplete="off"{if $remote_auth_prelinked} value="{$password}"{/if}>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                {if $securityquestions}
                                    <fieldset>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <label class="col-lg-2 col-sm-3 control-label" for="securityqid">{$LANG.clientareasecurityquestion}</label>
                                                    <div class="col-lg-9 col-sm-6">
                                                        <select name="securityqid" id="inputSecurityQId" class="field form-control">
                                                            {foreach $securityquestions as $question}
                                                                <option value="{$question.id}"{if $question.id eq $securityqid} selected{/if}>{$question.question}</option>
                                                            {/foreach}
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-lg-2 col-sm-3 control-label" for="securityqans">{$LANG.clientareasecurityanswer}</label>
                                                    <div class="col-lg-9 col-sm-6">
                                                        <input type="password" name="securityqans" id="inputSecurityQAns" class="field form-control" autocomplete="off">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                {/if}
                            </div>
                            {include file="$template/includes/captcha.tpl"}
                            {if $accepttos}
                                <hr />
                                <br/>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" name="accepttos" class="accepttos" />
                                                {$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            {/if}
                        </div>
                        <div class="panel-footer">
                            <input class="btn res-100 btn-3d btn-primary {$captcha->getButtonClass($captchaForm)}" type="submit" value="{$LANG.clientregistertitle}" />
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
{/if}
