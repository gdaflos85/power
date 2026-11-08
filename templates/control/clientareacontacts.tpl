{if $contactid}
	<script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
	{if $successful}
		<div class="alert alert-success">
			<p>{$LANG.changessavedsuccessfully}</p>
		</div>
	{/if}
	{if $errormessage}
		{include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
	{/if}
	<form method="post" class="form-horizontal" action="{$smarty.server.PHP_SELF}?action=contacts">
		<div class="alert alert-block alert-info">
			<div class="form-group">
				<label class="col-sm-3 control-label">{$LANG.clientareachoosecontact}</label>
				<div class="col-sm-6">
					<select name="contactid" onchange="submit()" class="form-control">
						{foreach item=contact from=$contacts}
							<option value="{$contact.id}"{if $contact.id eq $contactid} selected="selected"{/if}>{$contact.name} - {$contact.email}</option>
						{/foreach}
						<option value="new">{$LANG.clientareanavaddcontact}</option>
					</select>
				</div>
				<div class="col-sm-3">
				</div>
			</div>
		</div>
	</form>
	<form class="form-horizontal" method="post" action="{$smarty.server.PHP_SELF}?action=contacts&id={$contactid}">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$contactfirstname} {$contactlastname} {if $contactcompanyname}({$contactcompanyname}){/if}</h3>
					</div>
					<div class="panel-body">
						<fieldset>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="firstname">{$LANG.clientareafirstname}</label>
								<div class="col-sm-6">
									<input class="form-control" type="text" name="firstname" id="firstname" value="{$contactfirstname}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="lastname">{$LANG.clientarealastname}</label>
								<div class="col-sm-6">
									<input class="form-control" type="text" name="lastname" id="lastname" value="{$contactlastname}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="companyname">{$LANG.clientareacompanyname}</label>
								<div class="col-sm-6">
									<input class="form-control" type="text" name="companyname" id="companyname" value="{$contactcompanyname}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="email">{$LANG.clientareaemail}</label>
								<div class="col-sm-6">
									<input class="form-control" type="text" name="email" id="email" value="{$contactemail}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="address1">{$LANG.clientareaaddress1}</label>
								<div class="col-sm-6">
									<input class="form-control" type="text" name="address1" id="address1" value="{$contactaddress1}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="address2">{$LANG.clientareaaddress2}</label>
								<div class="col-sm-6">
									<input class="form-control" type="text" name="address2" id="address2" value="{$contactaddress2}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="city">{$LANG.clientareacity}</label>
								<div class="col-sm-6">
									<input class="form-control" type="text" name="city" id="city" value="{$contactcity}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="state">{$LANG.clientareastate}</label>
								<div class="col-sm-6 form-wrap">
									<input class="form-control" type="text" name="state" id="state" value="{$contactstate}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="postcode">{$LANG.clientareapostcode}</label>
								<div class="col-sm-6">
									<input class="form-control" type="text" name="postcode" id="postcode" value="{$contactpostcode}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="country">{$LANG.clientareacountry}</label>
								<div class="col-sm-6 form-wrap">
									{$countriesdropdown}
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="phonenumber">{$LANG.clientareaphonenumber}</label>
								<div class="col-sm-6">
									<input class="form-control" type="text" name="phonenumber" id="phonenumber" value="{$contactphonenumber}" />
								</div>
							</div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="inputTaxId">{lang key=$taxIdLabel}</label>
                                <div class="col-sm-6">
                                    <input class="form-control" type="text" name="tax_id" id="inputTaxId" value="{$contactTaxId}" />
                                </div>
                            </div>
							<hr />
							<div class="form-group">
								<label class="col-sm-3 control-label" for="billingcontact">{$LANG.subaccountactivate}</label>
								<div class="col-sm-9">
									<div class="radio">
										<label class="checkbox">
											<input class="icheck" type="checkbox" name="subaccount" id="inputSubaccountActivate"{if $subaccount} checked{/if} />
											<span>{$LANG.subaccountactivatedesc}</span>
										</label>
									</div>
								</div>
							</div>
						</fieldset>
						<div id="subacct-container" class="{if !$subaccount} hidden{/if}">
							<fieldset>
								<div id="newPassword1" class="form-group has-feedback">
									<label for="inputNewPassword1" class="col-sm-3 control-label">{$LANG.newpassword}</label>
									<div class="col-sm-6">
										<input type="password" class="form-control" id="inputNewPassword1" name="password" autocomplete="off" />
										<span class="form-control-feedback glyphicon"></span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-6 col-sm-offset-3">
										<button type="button" class="btn btn-xs btn-default generate-password" data-targetfields="inputNewPassword1,inputNewPassword2">
											{$LANG.generatePassword.btnLabel}
										</button>
										{include file="$template/includes/pwstrength.tpl" noDisable=true}
									</div>
								</div>
								<div id="newPassword2" class="form-group has-feedback">
									<label for="inputNewPassword2" class="col-sm-3 control-label">{$LANG.confirmnewpassword}</label>
									<div class="col-sm-6">
										<input type="password" class="form-control" id="inputNewPassword2" name="password2" autocomplete="off" />
										<span class="form-control-feedback glyphicon"></span>
										<div id="inputNewPassword2Msg">
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">{$LANG.subaccountpermissions}</label>
									<div class="col-sm-9" id="contactPermissions">
										{foreach $allPermissions as $permission}
											<div class="radio">
												<label class="checkbox">
													<input class="icheck" type="checkbox" name="permissions[]" value="{$permission}"{if in_array($permission, $permissions)} checked{/if} />
													<span>{assign var='langPermission' value='subaccountperms'|cat:$permission}{$LANG.$langPermission}</span>
												</label>
											</div>
										{/foreach}
                                        <br />
                                        <button type="button" class="btn btn-xs btn-default btn-check-all" data-checkbox-container="contactPermissions" data-btn-check-toggle="1" id="btnSelectAll-contactPermissions" data-label-text-select="{lang key='checkAll'}" data-label-text-deselect="{lang key='uncheckAll'}">
                                            {lang key='checkAll'}
                                        </button>
									</div>
								</div>
							</fieldset>
						</div>
						<hr />
                        {if $hasLinkedProvidersEnabled}
                            <fieldset>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">{lang key='remoteAuthn.titleLinkedAccounts'}</label>
                                    <div class="col-sm-9">
                                        {include file="$template/includes/linkedaccounts.tpl" linkContext="linktable" }
                                    </div>
                                </div>
                            </fieldset>
                            <hr />
                        {/if}
						<fieldset>
							<div class="form-group">
								<label class="col-sm-3 control-label">{$LANG.clientareacontactsemails}</label>
								<div class="col-sm-9">
									{foreach $emailPreferences as $emailType => $value}
										<div class="radio">
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
                        <a class="res-100 res-left btn btn-danger pull-right" data-toggle="confirmation" data-btn-ok-label="{lang key='yes'}" data-btn-ok-icon="fas fa-check" data-btn-ok-class="btn-success" data-btn-cancel-label="{lang key='no'}" data-btn-cancel-icon="fas fa-times" data-btn-cancel-class="btn-default" data-title="{lang key='clientareadeletecontact'}" data-content="{lang key='clientareadeletecontactareyousure'}" data-popout="true" href="clientarea.php?action=contacts&delete=true&id={$contactid}&token={$token}">{lang key='clientareadeletecontact'}</a>
					</div>
				</div>
			</div>
		</div>
	</form>
{else}
	{include file="$template/clientareaaddcontact.tpl"}
{/if}
<script>
    jQuery(document).ready( function ()
    {
        WHMCS.form.register();
        jQuery('.removeAccountLink').click(function (e) {
            e.preventDefault();
            var authUserID = jQuery(this).data('authid');
            swal(
                {
                    title: "Are you sure?",
                    text: "This permanently unlinks the authorized account.",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Yes, unlink it!",
                    closeOnConfirm: false
                },
                function(){
                    WHMCS.http.jqClient.post('{routePath('auth-manage-client-delete')}' + authUserID,
                        {
                            'token': '" . generate_token("plain") . "'
                        }).done(function(data) {
                        if (data.status == 'success') {
                            jQuery('#remoteAuth' + authUserID).remove();
                            swal("Unlinked!", data.message, "success");
                        } else {
                            swal("Error!", data.message, "error");
                        }
                    });
                });
        });
    });
</script>
