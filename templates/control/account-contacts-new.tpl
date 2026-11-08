{if $errorMessageHtml}
    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errorMessageHtml}
{/if}

<script>
var stateNotRequired = true;
jQuery(document).ready(function() {
    WHMCS.form.register();
});
</script>
<script src="{$BASE_PATH_JS}/StatesDropdown.js"></script>

<form method="post" class="form-horizontal" action="{routePath('account-contacts')}">
    <div class="alert alert-block alert-info">
        <div class="form-group">
            <label  for="inputContactId" class="col-sm-3 control-label">{$LANG.clientareachoosecontact}</label>
            <div class="col-sm-6">
                <select name="contactid" id="inputContactId" onchange="submit()" class="form-control">
                    {foreach $contacts as $contact}
                        <option value="{$contact.id}">{$contact.name} - {$contact.email}</option>
                    {/foreach}
                    <option value="new" selected="selected">{$LANG.clientareanavaddcontact}</option>
                </select>
            </div>
            <div class="col-sm-3">
            </div>
        </div>
    </div>
</form>
<form class="form-horizontal" method="post" action="{routePath('account-contacts-new')}">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">{$LANG.clientareanavaddcontact}</h3>
                </div>
                <div class="panel-body">
                    <fieldset>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="inputFirstName">{$LANG.clientareafirstname}</label>
                            <div class="col-sm-6">
                                <input type="text" name="firstname" id="inputFirstName" value="{$formdata.firstname}" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="inputLastName">{$LANG.clientarealastname}</label>
                            <div class="col-sm-6">
                                <input type="text" name="lastname" id="inputLastName" value="{$formdata.lastname}" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="inputCompanyName">{$LANG.clientareacompanyname}</label>
                            <div class="col-sm-6">
                                <input type="text" name="companyname" id="inputCompanyName" value="{$formdata.companyname}" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="inputEmail">{$LANG.clientareaemail}</label>
                            <div class="col-sm-6">
                                <input type="email" name="email" id="inputEmail" value="{$formdata.email}" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="inputAddress1">{$LANG.clientareaaddress1}</label>
                            <div class="col-sm-6">
                                <input type="text" name="address1" id="inputAddress1" value="{$formdata.address1}" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="inputAddress2">{$LANG.clientareaaddress2}</label>
                            <div class="col-sm-6">
                                <input type="text" name="address2" id="inputAddress2" value="{$formdata.address2}" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="inputCity">{$LANG.clientareacity}</label>
                            <div class="col-sm-6">
                                <input type="text" name="city" id="inputCity" value="{$formdata.city}" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="inputState">{$LANG.clientareastate}</label>
                            <div class="col-sm-6 form-wrap">
                                <input type="text" name="state" id="inputState" value="{$formdata.state}" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="inputPostcode">{$LANG.clientareapostcode}</label>
                            <div class="col-sm-6">
                                <input type="text" name="postcode" id="inputPostcode" value="{$formdata.postcode}" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="country">{$LANG.clientareacountry}</label>
                            <div class="col-sm-6 form-wrap">
                                {$countriesdropdown}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="inputPhone">{$LANG.clientareaphonenumber}</label>
                            <div class="col-sm-6">
                                <input type="tel" name="phonenumber" id="inputPhone" value="{$formdata.phonenumber}" class="form-control" />
                            </div>
                        </div>
                        {if $showTaxIdField}
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="inputTaxId">{lang key=$taxIdLabel}</label>
                                <div class="col-sm-6">
                                    <input type="text" name="tax_id" id="inputTaxId" class="form-control" value="{$formdata.tax_id}" />
                                </div>
                            </div>
                        {/if}
                        <hr />
                    </fieldset>
                    <fieldset>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">{$LANG.clientareacontactsemails}</label>
                            <div class="col-sm-9">
                                {foreach $formdata.emailPreferences as $emailType => $value}
                                    <div class="icheck">
                                        <label class="checkbox">
                                            <input type="hidden" name="email_preferences[{$emailType}]" value="0">
                                            <input class="icheck" type="checkbox" name="email_preferences[{$emailType}]" id="{$emailType}emails" value="1"{if $value} checked="checked"{/if} />
                                            <span>{lang key="clientareacontactsemails"|cat:$emailType}</span>
                                        </label>
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="panel-footer">
                    <input class="res-100 btn btn-3d btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}" />
                    <input class="res-100 res-left pull-right btn btn-default left-5" type="reset" value="{$LANG.cancel}" />
                </div>
            </div>
        </div>
    </div>
</form>

{include file="$template/includes/icheck.tpl"}
