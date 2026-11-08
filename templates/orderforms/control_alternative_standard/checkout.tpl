<script>
    // Define state tab index value
    var statesTab = 10;
    // Do not enforce state input client side
    var stateNotRequired = true;
</script>
<script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
<script type="text/javascript" src="{$BASE_PATH_JS}/PasswordStrength.js"></script>
<script>
    window.langPasswordStrength = "{$LANG.pwstrength}";
    window.langPasswordWeak = "{$LANG.pwstrengthweak}";
    window.langPasswordModerate = "{$LANG.pwstrengthmoderate}";
    window.langPasswordStrong = "{$LANG.pwstrengthstrong}";
</script>
{include file="orderforms/$carttpl/common.tpl"}
<!--main content start-->
<section id="main-content" class="cart">
    <!-- Display mobile sidebar alternative if applicable -->
    {if $itCartSidebarMobileDisplay eq "enabled"}
        <div class="row cat-col-row visible-xs visible-sm">
            <div class="col-md-12">
                {include file="orderforms/$carttpl/sidebar-categories-collapsed.tpl"}
            </div>
        </div>
    {/if}
    <!-- Display page title -->
    <div class="row">
        <div class="col-md-12">
            <!--breadcrumbs start -->
            {if $itCartSidebarDisplay eq "enabled"}
                {if $itCartSidebarDisplayMode eq "showhide"}
                    {if $itTextDirectionRTL eq "enabled"}
                        <div {if $itBreadcrumbDisplay eq "enabled"}style="position: absolute; left: 15px; margin-top: 5px;"{else}style="position: absolute; left: 15px; margin: -6px 0 20px 0;"{/if}>
                            <button type="button" class="btn btn-default btn-sm hidden-xs hidden-sm" {if $itCartSidebarDisplayMethod eq "squash"}id="btnSquashSidebar"{else}id="btnSlideSidebarRTL"{/if}>
                                <i class="fas fa-arrow-circle-left"></i>
                                {$LANG.showMenu}
                            </button>
                        </div>
                    {else}
                        <div {if $itBreadcrumbDisplay eq "enabled"}style="position: absolute; right: 15px; margin-top: 5px;"{else}style="position: absolute; right: 15px; margin: -6px 0 20px 0;"{/if}>
                            <button type="button" class="btn btn-default btn-sm hidden-xs hidden-sm" {if $itCartSidebarDisplayMethod eq "squash"}id="btnSquashSidebar"{else}id="btnSlideSidebar"{/if}>
                                <i class="fas fa-arrow-circle-left"></i>
                                {$LANG.showMenu}
                            </button>
                        </div>
                    {/if}
                {/if}
            {/if}
            {include file="$template/includes/breadcrumb.tpl"}
            <!--breadcrumbs end -->
            <h1 class="h1">{$LANG.ordercheckout}</h1>
        </div>
    </div>
    <!-- Display sidebar layout if applicable -->
    {if $itCartSidebarDisplay eq "enabled"}
        <div class="row cart-main-column">
            <div id="internal-content" class="{if $itCartSidebarDisplayMode eq "showhide"}col-md-12{else}col-md-9{/if} pull-md-left">
                {/if}
                <form method="post" action="{$smarty.server.PHP_SELF}?a=checkout" class="form-horizontal" name="orderfrm" id="frmCheckout">
                    <input type="hidden" name="submit" value="true" />
                    <input type="hidden" name="custtype" id="inputCustType" value="{$custtype}" />
                    <div class="row">
                        <div class="col-md-12">
                            {if $errormessage}
                                <div class="alert alert-danger checkout-error-feedback" role="alert">
                                    <p>{$LANG.orderForm.correctErrors}:</p>
                                    <ul>
                                        {$errormessage}
                                    </ul>
                                </div>
                                <div class="clearfix"></div>
                            {/if}

                            {if $custtype neq "new" && $loggedin}
                                <div class="panel panel-default panel-account-select">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            {lang key='switchAccount.title'}
                                        </h3>
                                    </div>
                                    <div class="panel-body">
                                        <div id="containerExistingAccountSelect" class="row account-select-container">
                                            {foreach $accounts as $account}
                                                <div class="col-sm-12">
                                                    <div class="account{if $selectedAccountId == $account->id} active{/if}">
                                                        <label class="radio-icheck" for="account{$account->id}">
                                                            <input id="account{$account->id}" class="icheck account-select{if $account->isClosed || $account->noPermission || $inExpressCheckout} disabled{/if}" type="radio" name="account_id" value="{$account->id}"{if $account->isClosed || $account->noPermission || $inExpressCheckout} disabled="disabled"{/if}{if $selectedAccountId == $account->id} checked="checked"{/if}>
                                                            <span class="address">
                                                                <strong>
                                                                    {if $account->company}{$account->company}{else}{$account->fullName}{/if}
                                                                </strong>
                                                                {if $account->isClosed || $account->noPermission}
                                                                    <span class="label label-default">
                                                                        {if $account->isClosed}
                                                                            {lang key='closed'}
                                                                        {else}
                                                                            {lang key='noPermission'}
                                                                        {/if}
                                                                    </span>
                                                                {elseif $account->currencyCode}
                                                                    <span class="label label-info">
                                                                        {$account->currencyCode}
                                                                    </span>
                                                                {/if}
                                                                <br>
                                                                <span class="small">
                                                                    {$account->address1}{if $account->address2}, {$account->address2}{/if}<br>
                                                                    {if $account->city}{$account->city},{/if}
                                                                    {if $account->state} {$account->state},{/if}
                                                                    {if $account->postcode} {$account->postcode},{/if}
                                                                    {$account->countryName}
                                                                </span>
                                                            </span>
                                                        </label>
                                                    </div>
                                                </div>
                                            {/foreach}
                                            <div class="col-sm-12">
                                                <div class="account no-border-bottom{if !$selectedAccountId || !is_numeric($selectedAccountId)} active{/if}">
                                                    <label class="radio-icheck">
                                                        <input class="icheck account-select" type="radio" name="account_id" value="new"{if !$selectedAccountId || !is_numeric($selectedAccountId)} checked="checked"{/if}{if $inExpressCheckout} disabled="disabled" class="disabled"{/if}>
                                                        <span><strong>{lang key='orderForm.createAccount'}</strong></span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            {/if}

                            <div id="containerExistingUserSignin"{if $loggedin || $custtype neq "existing"} class="w-hidden"{/if}>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title pull-left" id="title-existing">
                                            {$LANG.orderForm.existingCustomerLogin}
                                        </h3>
                                        <div class="pull-right">
                                            <button type="button" class="btn btn-default btn-xs{if $loggedin || $custtype neq "existing"} w-hidden{/if}" id="btnNewUserSignup">
                                                <i class="fas fa-edit"></i> {$LANG.orderForm.createAccount}
                                            </button>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="panel-body">
                                        <div class="alert alert-danger w-hidden" id="existingLoginMessage"></div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group-noconflict">
                                                    <label class="col-lg-4 col-sm-3 control-label" for="inputLoginEmail">{$LANG.orderForm.emailAddress}</label>
                                                    <div class="col-sm-6">
                                                        <input type="text" name="loginemail" id="inputLoginEmail" class="field form-control" placeholder="{$LANG.orderForm.emailAddress}" value="{$loginemail}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group-noconflict">
                                                    <label class="col-lg-4 col-sm-3 control-label" for="inputLoginPassword">{$LANG.clientareapassword}</label>
                                                    <div class="col-sm-6">
                                                        <input type="password" name="loginpassword" id="inputLoginPassword" class="field form-control" placeholder="{$LANG.clientareapassword}">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="text-center">
                                            <button type="button" id="btnExistingLogin" class="btn btn-primary btn-3d">
                                                <span id="existingLoginButton">{lang key='login'}</span>
                                                <span id="existingLoginPleaseWait" class="w-hidden">{lang key='pleasewait'}</span>
                                            </button>
                                            <br/><br/>
                                        </div>

                                        {include file="orderforms/$carttpl/linkedaccounts.tpl" linkContext="checkout-existing"}
                                    </div>
                                </div>
                            </div>


                            <div id="containerNewUserSignup"{if $custtype === 'existing' || (is_numeric($selectedAccountId) && $selectedAccountId > 0) || ($loggedin && $accounts->count() > 0 && $selectedAccountId !== 'new')} class="w-hidden"{/if}>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        {if !$loggedin}
                                            <h3 class="panel-title pull-left" id="title-new">
                                                {$LANG.clientregistertitle}
                                            </h3>
                                            <div class="pull-right">
                                                <button type="button" class="btn btn-default btn-xs{if $loggedin || !$loggedin && $custtype eq "existing"} w-hidden{/if}" id="btnAlreadyRegistered">
                                                    <i class="fas fa-sign-in-alt"></i> {$LANG.orderForm.alreadyRegistered}
                                                </button>
                                            </div>
                                        {else}
                                            <h3 class="panel-title pull-left">
                                                {$LANG.billingdetails}
                                            </h3>
                                        {/if}
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="panel-body">
                                        <div{if $loggedin} class="w-hidden"{/if}>
                                            {include file="$template/includes/linkedaccounts.tpl" linkContext="checkout-new"}
                                            <h4 class="registration-form">{$LANG.billingdetails}</h4>
                                        </div>
                                        <fieldset>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="form-group-noconflict">
                                                        <label class="col-lg-4 col-sm-3 control-label" for="inputFirstName">{$LANG.orderForm.firstName}</label>
                                                        <div class="col-sm-6">
                                                            <input class="field form-control" type="text" name="firstname" id="inputFirstName" placeholder="{$LANG.orderForm.firstName}" value="{$clientsdetails.firstname}" autofocus>
                                                        </div>
                                                    </div>
                                                    <div class="form-group-noconflict">
                                                        <label class="col-lg-4 col-sm-3 control-label" for="inputLastName">{$LANG.orderForm.lastName}</label>
                                                        <div class="col-sm-6">
                                                            <input class="field form-control" type="text" name="lastname" id="inputLastName" placeholder="{$LANG.orderForm.lastName}" value="{$clientsdetails.lastname}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group-noconflict">
                                                        <label for="inputCompanyName" class="col-lg-4 col-sm-3 control-label">{$LANG.clientareacompanyname}</label>
                                                        <div class="col-sm-6">
                                                            <input class="form-control" type="text" name="companyname" id="inputCompanyName" placeholder="{$LANG.orderForm.companyName} ({$LANG.orderForm.optional})" value="{$clientsdetails.companyname}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group-noconflict">
                                                        <label class="col-lg-4 col-sm-3 control-label" for="inputEmail">{$LANG.orderForm.emailAddress}</label>
                                                        <div class="col-sm-6">
                                                            <input class="field form-control" type="email" name="email" id="inputEmail" placeholder="{$LANG.orderForm.emailAddress}" value="{$clientsdetails.email}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group-noconflict">
                                                        <label class="col-lg-4 col-sm-3 control-label" for="inputPhone">{$LANG.orderForm.phoneNumber}</label>
                                                        <div class="col-sm-6">
                                                            <input class="field form-control" type="tel" name="phonenumber" id="inputPhone" placeholder="{$LANG.orderForm.phoneNumber}" value="{$clientsdetails.phonenumber}">
                                                        </div>
                                                    </div>
                                                    {if $showTaxIdField}
                                                        <div class="form-group-noconflict">
                                                            <label class="col-lg-4 col-sm-3 control-label" for="inputTaxId">{$taxLabel} ({$LANG.orderForm.optional})</label>
                                                            <div class="col-sm-6">
                                                                <input type="text" name="tax_id" id="inputTaxId" placeholder="{$taxLabel} ({$LANG.orderForm.optional})" class="field form-control" value="{$clientsdetails.tax_id}">
                                                            </div>
                                                        </div>
                                                    {/if}
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="form-group-noconflict">
                                                        <label for="inputAddress1" class="col-lg-4 col-sm-3 control-label">{$LANG.clientareaaddress1}</label>
                                                        <div class="col-sm-6">
                                                            <input class="form-control" type="text" name="address1" id="inputAddress1" placeholder="{$LANG.orderForm.streetAddress}" value="{$clientsdetails.address1}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group-noconflict">
                                                        <label for="inputAddress2" class="col-lg-4 col-sm-3 control-label">{$LANG.clientareaaddress2}</label>
                                                        <div class="col-sm-6">
                                                            <input class="form-control" type="text" name="address2" id="inputAddress2" placeholder="{$LANG.orderForm.streetAddress2}" value="{$clientsdetails.address2}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group-noconflict">
                                                        <label for="inputCity" class="col-lg-4 col-sm-3 control-label">{$LANG.clientareacity}</label>
                                                        <div class="col-sm-6">
                                                            <input class="form-control" type="text" name="city" id="inputCity" placeholder="{$LANG.orderForm.city}" value="{$clientsdetails.city}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group-noconflict">
                                                        <label for="inputState" class="col-lg-4 col-sm-3 control-label">{$LANG.clientareastate}</label>
                                                        <div class="col-sm-6">
                                                            <input class="form-control" type="text" name="state" id="inputState" placeholder="{$LANG.orderForm.state}" value="{$clientsdetails.state}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group-noconflict">
                                                        <label for="inputPostcode" class="col-lg-4 col-sm-3 control-label">{$LANG.clientareapostcode}</label>
                                                        <div class="col-sm-6">
                                                            <input class="form-control" type="text" name="postcode" id="inputPostcode" placeholder="{$LANG.orderForm.postcode}" value="{$clientsdetails.postcode}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group-noconflict">
                                                        <label class="col-lg-4 col-sm-3 control-label" for="country">{$LANG.clientareacountry}</label>
                                                        <div class="col-sm-6">
                                                            <select class="form-control" name="country" id="inputCountry">
                                                                {foreach $countries as $countrycode => $countrylabel}
                                                                    <option value="{$countrycode}"{if (!$country && $countrycode == $defaultcountry) || $countrycode eq $country} selected{/if}>
                                                                        {$countrylabel}
                                                                    </option>
                                                                {/foreach}
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            {if $showMarketingEmailOptIn}
                                                <div class="form-group-noconflict">
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
                                    </div>
                                </div>
                                {if $customfields}
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">
                                                {$LANG.orderadditionalrequiredinfo}
                                            </h3>
                                            <i><small>{lang key='orderForm.requiredField'}</small></i>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    {foreach $customfields as $customfield}
                                                        <br/>
                                                        <div class="form-group-noconflict">
                                                            <label class="col-lg-2 col-sm-3 control-label" for="customfield{$customfield.id}">{$customfield.name} {$customfield.required}</label>
                                                            <div class="col-lg-9 col-sm-6 control">
                                                                {$customfield.input} {$customfield.description}
                                                            </div>
                                                        </div>
                                                    {/foreach}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                {/if}
                            </div>
                            {if $domainsinorder}
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            {$LANG.domainregistrantinfo}
                                        </h3>
                                    </div>
                                    <div class="panel-body">
                                        <p>{$LANG.orderForm.domainAlternativeContact}</p>
                                        <br />
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="form-group-noconflict">
                                                    <label class="col-lg-2 col-sm-3 control-label" for="inputDomainContact">{$LANG.clientareachoosecontact}</label>
                                                    <div class="col-lg-9 col-sm-6">
                                                        <select name="contact" id="inputDomainContact" class="form-control">
                                                            <option value="">{$LANG.usedefaultcontact}</option>
                                                            {foreach $domaincontacts as $domcontact}
                                                                <option value="{$domcontact.id}"{if $contact == $domcontact.id} selected{/if}>
                                                                    {$domcontact.name}
                                                                </option>
                                                            {/foreach}
                                                            <option value="addingnew"{if $contact == "addingnew"} selected{/if}>
                                                                {$LANG.clientareanavaddcontact}...
                                                            </option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row{if $contact neq "addingnew"} w-hidden{/if}" id="domainRegistrantInputFields">
                                            <br />
                                            <div class="col-lg-6">
                                                <div class="form-group-noconflict">
                                                    <label for="inputDCFirstName" class="col-lg-4 col-sm-3 control-label">{$LANG.clientareafirstname}</label>
                                                    <div class="col-sm-6">
                                                        <input type="text" name="domaincontactfirstname" id="inputDCFirstName" class="form-control" placeholder="{$LANG.orderForm.firstName}" value="{$domaincontact.firstname}">
                                                    </div>
                                                </div>
                                                <div class="form-group-noconflict">
                                                    <label for="inputDCLastName" class="col-lg-4 col-sm-3 control-label">{$LANG.clientarealastname}</label>
                                                    <div class="col-sm-6">
                                                        <input type="text" name="domaincontactlastname" id="inputDCLastName" class="form-control" placeholder="{$LANG.orderForm.lastName}" value="{$domaincontact.lastname}">
                                                    </div>
                                                </div>
                                                <div class="form-group-noconflict">
                                                    <label for="inputDCCompanyName" class="col-lg-4 col-sm-3 control-label">{$LANG.clientareacompanyname}</label>
                                                    <div class="col-sm-6">
                                                        <input type="text" name="domaincontactcompanyname" id="inputDCCompanyName" class="form-control" placeholder="{$LANG.orderForm.companyName} ({$LANG.orderForm.optional})" value="{$domaincontact.companyname}">
                                                    </div>
                                                </div>
                                                <div class="form-group-noconflict">
                                                    <label for="inputDCEmail" class="col-lg-4 col-sm-3 control-label">{$LANG.clientareaemail}</label>
                                                    <div class="col-sm-6">
                                                        <input type="email" name="domaincontactemail" id="inputDCEmail" class="form-control" placeholder="{$LANG.orderForm.emailAddress}" value="{$domaincontact.email}">
                                                    </div>
                                                </div>
                                                <div class="form-group-noconflict">
                                                    <label for="inputDCPhone" class="col-lg-4 col-sm-3 control-label">{$LANG.clientareaphonenumber}</label>
                                                    <div class="col-sm-6">
                                                        <input type="tel" name="domaincontactphonenumber" id="inputDCPhone" class="form-control" placeholder="{$LANG.orderForm.phoneNumber}" value="{$domaincontact.phonenumber}">
                                                    </div>
                                                </div>
                                                <div class="form-group-noconflict">
                                                    <label for="nputDCTaxId" class="col-lg-4 col-sm-3 control-label">{$taxLabel} ({$LANG.orderForm.optional})</label>
                                                    <div class="col-sm-6">
                                                        <input type="text" name="domaincontacttax_id" id="inputDCTaxId" class="form-control" placeholder="{$taxLabel} ({$LANG.orderForm.optional})" value="{$domaincontact.tax_id}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group-noconflict">
                                                    <label for="inputDCAddress1" class="col-lg-4 col-sm-3 control-label">{$LANG.clientareaaddress1}</label>
                                                    <div class="col-sm-6">
                                                        <input type="text" name="domaincontactaddress1" id="inputDCAddress1" class="form-control" placeholder="{$LANG.orderForm.streetAddress}" value="{$domaincontact.address1}">
                                                    </div>
                                                </div>
                                                <div class="form-group-noconflict">
                                                    <label for="inputDCAddress2" class="col-lg-4 col-sm-3 control-label">{$LANG.clientareaaddress2}</label>
                                                    <div class="col-sm-6">
                                                        <input type="text" name="domaincontactaddress2" id="inputDCAddress2" class="form-control" placeholder="{$LANG.orderForm.streetAddress2}" value="{$domaincontact.address2}">
                                                    </div>
                                                </div>
                                                <div class="form-group-noconflict">
                                                    <label for="inputDCCity" class="col-lg-4 col-sm-3 control-label">{$LANG.clientareacity}</label>
                                                    <div class="col-sm-6">
                                                        <input type="text" name="domaincontactcity" id="inputDCCity" class="form-control" placeholder="{$LANG.orderForm.city}" value="{$domaincontact.city}">
                                                    </div>
                                                </div>
                                                <div class="form-group-noconflict">
                                                    <label for="inputDCState" class="col-lg-4 col-sm-3 control-label">{$LANG.clientareastate}</label>
                                                    <div class="col-sm-6">
                                                        <input type="text" name="domaincontactstate" id="inputDCState" class="form-control" placeholder="{$LANG.orderForm.state}" value="{$domaincontact.state}">
                                                    </div>
                                                </div>
                                                <div class="form-group-noconflict">
                                                    <label for="inputDCPostcode" class="col-lg-4 col-sm-3 control-label">{$LANG.clientareapostcode}</label>
                                                    <div class="col-sm-6">
                                                        <input type="text" name="domaincontactpostcode" id="inputDCPostcode" class="form-control" placeholder="{$LANG.orderForm.postcode}" value="{$domaincontact.postcode}">
                                                    </div>
                                                </div>
                                                <div class="form-group-noconflict">
                                                    <label class="col-lg-4 col-sm-3 control-label" for="inputDCcountry">{$LANG.clientareacountry}</label>
                                                    <div class="col-sm-6">
                                                        <select name="domaincontactcountry" id="inputDCCountry" class="form-control">
                                                            {foreach $countries as $countrycode => $countrylabel}
                                                                <option value="{$countrycode}"{if (!$domaincontact.country && $countrycode == $defaultcountry) || $countrycode eq $domaincontact.country} selected{/if}>
                                                                    {$countrylabel}
                                                                </option>
                                                            {/foreach}
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            {/if}
                            {if !$loggedin}
                                <div id="containerNewUserSecurity"{if (!$loggedin && $custtype eq "existing") || ($remote_auth_prelinked && !$securityquestions) } class="w-hidden"{/if}>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">
                                                {$LANG.orderForm.accountSecurity}
                                            </h3>
                                        </div>
                                        <div class="panel-body">
                                            <div id="containerPassword" class="row {if $remote_auth_prelinked && $securityquestions} w-hidden{/if}">
                                                <div id="passwdFeedback" style="display: none;" class="alert alert-info text-center col-sm-12"></div>
                                                <div class="col-lg-12">
                                                    <div id="newPassword1" class="form-group-noconflict">
                                                        <label for="inputNewPassword1" class="col-lg-2 col-sm-3 control-label">{$LANG.clientareapassword}</label>
                                                        <div class="col-lg-9 col-sm-6">
                                                            <input type="password" name="password" id="inputNewPassword1" placeholder="{$LANG.clientareapassword}" data-error-threshold="{$pwStrengthErrorThreshold}" data-warning-threshold="{$pwStrengthWarningThreshold}" class="field form-control" autocomplete="off"{if $remote_auth_prelinked} value="{$password}"{/if}>
                                                        </div>
                                                    </div>
                                                    <div class="form-group-noconflict">
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
                                                    <div id="newPassword2" class="form-group-noconflict">
                                                        <label for="inputNewPassword2" class="col-lg-2 col-sm-3 control-label">{$LANG.clientareaconfirmpassword}</label>
                                                        <div class="col-lg-9 col-sm-6">
                                                            <input type="password" name="password2" id="inputNewPassword2" placeholder="{$LANG.clientareaconfirmpassword}" class="field form-control" autocomplete="off"{if $remote_auth_prelinked} value="{$password}"{/if}>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            {if $securityquestions}
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="form-group-noconflict">
                                                            <label for="inputSecurityQId" class="col-lg-2 col-sm-3 control-label">{$LANG.clientareasecurityquestion}</label>
                                                            <div class="col-lg-9 col-sm-6">
                                                                <select name="securityqid" id="inputSecurityQId" class="form-control">
                                                                    <option value="">{$LANG.clientareasecurityquestion}</option>
                                                                    {foreach $securityquestions as $question}
                                                                        <option value="{$question.id}"{if $question.id eq $securityqid} selected{/if}>
                                                                            {$question.question}
                                                                        </option>
                                                                    {/foreach}
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group-noconflict">
                                                            <label for="inputSecurityQAns" class="col-lg-2 col-sm-3 control-label">{$LANG.clientareasecurityanswer}</label>
                                                            <div class="col-lg-9 col-sm-6">
                                                                <input type="password" name="securityqans" id="inputSecurityQAns" class="form-control" placeholder="{$LANG.clientareasecurityanswer}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            {/if}
                                        </div>
                                    </div>
                                </div>
                            {/if}
                            {foreach $hookOutput as $output}
                                <div>
                                    {$output}
                                </div>
                            {/foreach}
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        {$LANG.paymentmethod}
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <p>{$LANG.orderForm.preferredPaymentMethod}</p>
                                    <div class="alert alert-success text-center large-text" role="alert" id="totalDueToday">
                                        {$LANG.ordertotalduetoday}: &nbsp; <strong id="totalCartPrice">{$total}</strong>
                                    </div>
                                    <div id="applyCreditContainer" class="apply-credit-container well{if !$canUseCreditOnCheckout} w-hidden{/if}" data-apply-credit="{$applyCredit}">
                                        <p>{lang key='cart.availableCreditBalance' amount=$creditBalance}</p>
                                        <label class="radio-icheck">
                                            <input id="useCreditOnCheckout" type="radio" class="icheck" name="applycredit" value="1"{if $applyCredit} checked{/if}>
                                            <span id="spanFullCredit"{if !($creditBalance->toNumeric() >= $total->toNumeric())} class="w-hidden"{/if}>
                                                {lang key='cart.applyCreditAmountNoFurtherPayment' amount=$total}
                                            </span>
                                            <span id="spanUseCredit"{if $creditBalance->toNumeric() >= $total->toNumeric()} class="w-hidden"{/if}>
                                                {lang key='cart.applyCreditAmount' amount=$creditBalance}
                                            </span>
                                        </label>
                                        <label class="radio-icheck">
                                            <input id="skipCreditOnCheckout" type="radio" class="icheck" name="applycredit" value="0"{if !$applyCredit} checked{/if}>
                                            <span>{lang key='cart.applyCreditSkip' amount=$creditBalance}</span>
                                        </label>
                                    </div>
                                    {if !$inExpressCheckout}
                                        <div id="paymentGatewaysContainer" class="row">
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <label class="col-lg-2 col-sm-3 control-label">{$LANG.paymentmethod}</label>
                                                    <div class="col-lg-9 col-sm-6">
                                                        {foreach $gateways as $gateway}
                                                            <label class="radio-icheck">
                                                                <input type="radio"
                                                                   name="paymentmethod"
                                                                   value="{$gateway.sysname}"
                                                                   data-payment-type="{$gateway.payment_type}"
                                                                   data-show-local="{$gateway.show_local_cards}"
                                                                   data-remote-inputs="{$gateway.uses_remote_inputs}"
                                                                   class="icheck payment-methods{if $gateway.type eq "CC"} is-credit-card{/if}"
                                                                   {if $selectedgateway eq $gateway.sysname} checked{/if}
                                                                />
                                                                <span>{$gateway.name}</span>
                                                            </label>
                                                        {/foreach}
                                                    </div>
                                                </div>
                                                <div class="alert alert-danger text-center gateway-errors w-hidden"></div>
                                            </div>
                                        </div>
                                    {else}
                                        {if $expressCheckoutOutput}
                                            {$expressCheckoutOutput}
                                        {else}
                                            <p>
                                                {lang key='paymentPreApproved' gateway=$expressCheckoutGateway}
                                            </p>
                                        {/if}
                                    {/if}
                                </div>
                            </div>
                            {if !$inExpressCheckout}
                                <div id="creditCardInputFields" class="cc-input-container{if $selectedgatewaytype neq "CC"} w-hidden{/if}">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">
                                                {$LANG.creditcard}
                                            </h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="form-group">
                                                        <label class="col-lg-2 col-sm-3 control-label">{$LANG.paymentMethodsManage.creditCard}</label>
                                                        <div class="col-lg-9 col-sm-6">
                                                            {if $client}
                                                                <div id="existingCardsContainer" class="existing-cc-grid">
                                                                    {include file="orderforms/standard_cart/includes/existing-paymethods.tpl"}
                                                                </div>
                                                            {/if}
                                                            <label class="radio-inline">
                                                                <input type="radio" class="icheck" name="ccinfo" value="new" id="new" {if !$client || $client->payMethods->count() === 0} checked="checked"{/if} />
                                                                &nbsp;
                                                                {lang key='creditcardenternewcard'}
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row cvv-input" id="existingCardInfo">
                                                <div class="col-lg-12">
                                                    <div class="form-group">
                                                        <label for="inputCardCVV2" class="control-label col-lg-2 col-sm-3">{$LANG.creditcardcvvnumbershort}</label>
                                                        <div class="col-lg-4 col-sm-6">
                                                            <div class="input-group">
                                                                <input type="tel" name="cccvv" id="inputCardCVV2" class="form-control field" placeholder="{$LANG.creditcardcvvnumbershort}" autocomplete="cc-cvc">
                                                                <span class="input-group-btn">
                                                                    <button type="button" class="btn btn-default" data-toggle="popover" data-placement="bottom" data-content="<img src='{$BASE_PATH_IMG}/ccv.gif' width='210' />">
                                                                        ?
                                                                    </button>
                                                                </span>
                                                            </div>
                                                            <span class="field-error-msg">{lang key="paymentMethodsManage.cvcNumberNotValid"}</span>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>



                                            <div class="row" id="newCardInfo">

                                                <div id="cardNumberContainer" class="col-lg-12 new-card-container">
                                                    <div class="form-group">
                                                        <label for="inputCardNumber" class="control-label col-lg-2 col-sm-3">{$LANG.orderForm.cardNumber}</label>
                                                        <div class="col-lg-9 col-sm-6">
                                                            <input type="tel" name="ccnumber" id="inputCardNumber" class="field form-control cc-number-field" placeholder="{$LANG.orderForm.cardNumber}" autocomplete="cc-number" data-message-unsupported="{lang key='paymentMethodsManage.unsupportedCardType'}" data-message-invalid="{lang key='paymentMethodsManage.cardNumberNotValid'}" data-supported-cards="{$supportedCardTypes}" />
                                                            <span class="field-error-msg"></span>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-6 new-card-container">
                                                    <div class="form-group">
                                                        <label for="inputCardExpiry" class="col-lg-4 col-sm-3 control-label">{$LANG.creditcardcardexpires}</label>
                                                        <div class="col-sm-6">
                                                            <input type="tel" name="ccexpirydate" id="inputCardExpiry" class="field form-control" placeholder="MM / YY{if $showccissuestart} ({$LANG.creditcardcardexpires}){/if}" autocomplete="cc-exp">
                                                            <span class="field-error-msg">{lang key="paymentMethodsManage.expiryDateNotValid"}</span>
                                                        </div>
                                                    </div>
                                                </div>


                                                {if $showccissuestart}
                                                    <div class="col-lg-6 new-card-container">
                                                        <div class="form-group">
                                                            <label for="inputCardStart" class="col-lg-4 col-sm-3 control-label">{$LANG.creditcardcardstart}</label>
                                                            <div class="col-sm-6">
                                                                <input type="tel" name="ccstartdate" id="inputCardStart" class="field form-control" placeholder="MM / YY ({$LANG.creditcardcardstart})" autocomplete="cc-exp">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 new-card-container">
                                                        <div class="form-group">
                                                            <label for="inputCardIssue" class="col-lg-4 col-sm-3 control-label">{$LANG.creditcardcardissuenum}</label>
                                                            <div class="col-sm-6">
                                                                <input type="tel" name="ccissuenum" id="inputCardIssue" class="field form-control" placeholder="{$LANG.creditcardcardissuenum}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                {/if}

                                                <div class="col-lg-6" id="cvv-field-container">
                                                    <div class="form-group">
                                                        <label for="inputCardCVV" class="control-label col-lg-4 col-sm-3">{$LANG.creditcardcvvnumbershort}</label>
                                                        <div class="col-sm-6">
                                                            <div class="input-group">
                                                                <input type="tel" name="cccvv" id="inputCardCVV" class="field form-control" placeholder="{$LANG.creditcardcvvnumbershort}" autocomplete="cc-cvc">
                                                                <span class="input-group-btn">
                                                                    <button type="button" class="btn btn-default" data-toggle="popover" data-placement="bottom" data-content="<img src='{$BASE_PATH_IMG}/ccv.gif' width='210' />">
                                                                        ?
                                                                    </button>
                                                                </span>
                                                            </div>
                                                            <span class="field-error-msg">{lang key="paymentMethodsManage.cvcNumberNotValid"}</span>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row" id="newCardSaveSettings">

                                                <div id="inputDescriptionContainer" class="col-lg-12 new-card-container">
                                                    <div class="form-group">
                                                         <label for="inputDescription" class="control-label col-lg-2 col-sm-3">{$LANG.paymentMethods.descriptionInput}</label>
                                                        <div class="col-lg-9 col-sm-6">
                                                            <input type="text" class="field form-control" id="inputDescription" name="ccdescription" autocomplete="off" value="" placeholder="{$LANG.paymentMethods.descriptionInput} {$LANG.paymentMethodsManage.optional}" />
                                                        </div>
                                                    </div>
                                                    {if $allowClientsToRemoveCards}
                                                        <div id="inputNoStoreContainer" class="col-lg-10 col-lg-offset-2 col-sm-9 col-sm-offset-3" style="line-height: 32px;">
                                                            <div class="form-group">
                                                                <input type="hidden" name="nostore" value="1">
                                                                <input type="checkbox" class="toggle-switch-success no-icheck" data-size="mini" checked="checked" name="nostore" id="inputNoStore" value="0" data-on-text="{lang key='yes'}" data-off-text="{lang key='no'}">
                                                                <label for="inputNoStore" class="checkbox-inline no-padding" style="display: inline-block;">
                                                                    &nbsp;&nbsp;
                                                                    {$LANG.creditCardStore}
                                                                </label>
                                                            </div>
                                                        </div>
                                                    {/if}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            {/if}
                            {if $shownotesfield}
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            {$LANG.orderForm.additionalNotes}
                                        </h3>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="form-group-noconflict">
                                                    <label class="col-lg-2 col-sm-3 control-label">{$LANG.invoicesnotes}</label>
                                                    <div class="col-lg-9 col-sm-6">
                                                        <textarea name="notes" class="form-control" rows="6" placeholder="{$LANG.ordernotesdescription}">{$orderNotes}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            {/if}
                            {if $accepttos}
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            {$LANG.ordertos}
                                        </h3>
                                    </div>
                                    <div class="panel-body">
                                        <p>
                                            <label class="checkbox">
                                                <input type="checkbox" name="accepttos" id="accepttos" class="icheck" />
                                                &nbsp;
                                                {$LANG.ordertosagreement}
                                                <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a>
                                            </label>
                                        </p>
                                    </div>
                                </div>
                            {/if}
                            <div class="text-center">
                                {if $captcha}
                                    <div class="text-center margin-bottom">
                                        {include file="$template/includes/captcha.tpl"}
                                    </div>
                                {/if}

                                <br />
                                <br />
                                <button type="submit" id="btnCompleteOrder" class="btn btn-primary btn-3d btn-lg disable-on-click spinner-on-click {if $captcha}{$captcha->getButtonClass($captchaForm)}{/if}"{if $cartitems==0} disabled="disabled"{/if}>
                                    {if $inExpressCheckout}{$LANG.confirmAndPay}{else}{$LANG.completeorder}{/if}
                                    &nbsp;<i id="btnCompleteOrderIcon" class="fas fa-arrow-circle-right"></i>
                                </button>
                                <br /><br /><br />
                            </div>
                            {if $servedOverSsl}
                                <div class="alert alert-warning checkout-security-msg">
                                    <i class="fas fa-lock"></i>
                                    {$LANG.ordersecure} (<strong>{$ipaddress}</strong>) {$LANG.ordersecure2}
                                </div>
                            {/if}
                        </div>
                    </div>
                </form>
                {if $itCartSidebarDisplay eq "enabled"}
            </div>
            <div class="col-md-3 pull-md-right whmcs-sidebar hidden-xs hidden-sm sidebar-secondary {if $itCartSidebarDisplayMode eq "showhide"}{if $itCartSidebarDisplayMethod eq "squash"}cart-sidebar-squash{else}cart-sidebar{/if}{/if}">
                {include file="orderforms/$carttpl/sidebar-categories.tpl"}
            </div>
            <div class="clearfix"></div>
        </div>
    {/if}
    <div class="clearfix"></div>
</section>
<script type="text/javascript" src="{$BASE_PATH_JS}/jquery.payment.js"></script>
{include file="orderforms/$carttpl/icheck.tpl"}
<script>
    var hideCvcOnCheckoutForExistingCard = '{if $canUseCreditOnCheckout && $applyCredit && ($creditBalance->toNumeric() >= $total->toNumeric())}1{else}0{/if}';
</script>
