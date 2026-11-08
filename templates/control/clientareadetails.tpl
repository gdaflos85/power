{if $successful}
	{include file="$template/includes/alert.tpl" type="success" msg=$LANG.changessavedsuccessfully textcenter=true}
{/if}
{if $errormessage}
	{include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
{/if}
<script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
<form class="form-horizontal" method="post" action="{$smarty.server.PHP_SELF}?action=details">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.clientareanavdetails}</h3>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<label class="col-sm-3 control-label" for="firstname">{$LANG.clientareafirstname}</label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="firstname" id="firstname" value="{$clientfirstname}"{if in_array('firstname',$uneditablefields)} disabled=""{/if} />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="lastname">{$LANG.clientarealastname}</label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="lastname" id="lastname" value="{$clientlastname}"{if in_array('lastname',$uneditablefields)} disabled=""{/if} />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="companyname">{$LANG.clientareacompanyname}</label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="companyname" id="companyname" value="{$clientcompanyname}"{if in_array('companyname',$uneditablefields)} disabled=""{/if} />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="email">{$LANG.clientareaemail}</label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="email" id="email" value="{$clientemail}"{if in_array('email',$uneditablefields)} disabled=""{/if} />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="address1">{$LANG.clientareaaddress1}</label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="address1" id="address1" value="{$clientaddress1}"{if in_array('address1',$uneditablefields)} disabled=""{/if} />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="address2">{$LANG.clientareaaddress2}</label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="address2" id="address2" value="{$clientaddress2}"{if in_array('address2',$uneditablefields)} disabled=""{/if} />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="city">{$LANG.clientareacity}</label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="city" id="city" value="{$clientcity}"{if in_array('city',$uneditablefields)} disabled=""{/if} />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="state">{$LANG.clientareastate}</label>
						<div class="col-sm-6 form-wrap">
							<input class="form-control" type="text" name="state" id="state" value="{$clientstate}"{if in_array('state',$uneditablefields)} disabled=""{/if} />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="postcode">{$LANG.clientareapostcode}</label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="postcode" id="postcode" value="{$clientpostcode}"{if in_array('postcode',$uneditablefields)} disabled=""{/if} />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="country">{$LANG.clientareacountry}</label>
						<div class="col-sm-6 form-wrap">
							{$clientcountriesdropdown}
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="phonenumber">{$LANG.clientareaphonenumber}</label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="phonenumber" id="phonenumber" value="{$clientphonenumber}"{if in_array('phonenumber',$uneditablefields)} disabled=""{/if} />
						</div>
					</div>
                    {if $showMarketingEmailOptIn}
                        <hr />
                        <div class="form-group">
							<label class="col-sm-3 control-label" for="marketingoptin" style="text-transform: capitalize;">{lang key='emailMarketing.joinOurMailingList'}</label>
							<div class="col-sm-6">
                                <div class="radio">
									<p style="padding-top: 3px;">{$marketingEmailOptInMessage}</p>
                                    <input type="checkbox" name="marketingoptin" value="1"{if $marketingEmailOptIn} checked{/if} class="no-icheck toggle-switch-success" data-size="small" data-on-text="{lang key='yes'}" data-off-text="{lang key='no'}">
                                </div>
                            </div>
                        </div>
                    {/if}
					<hr />
					<div class="form-group">
						<label class="col-sm-3 control-label" for="paymentmethod">{$LANG.paymentmethod}</label>
						<div class="col-sm-6">
							<select name="paymentmethod" class="form-control" id="paymentmethod">
								<option value="none">{$LANG.paymentmethoddefault}</option>
								{foreach from=$paymentmethods item=method}
									<option value="{$method.sysname}"{if $method.sysname eq $defaultpaymentmethod} selected="selected"{/if}>{$method.name}</option>
								{/foreach}
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="billingcontact">{$LANG.defaultbillingcontact}</label>
						<div class="col-sm-6">
							<select class="form-control" name="billingcid" id="billingcontact">
								<option value="0">{$LANG.usedefaultcontact}</option>
								{foreach from=$contacts item=contact}
									<option value="{$contact.id}"{if $contact.id eq $billingcid} selected="selected"{/if}>{$contact.name}</option>
								{/foreach}
							</select>
						</div>
					</div>
					<div class="form-group">
		                <label class="col-sm-3 control-label" for="inputLanguage">{$LANG.clientarealanguage}</label>
						<div class="col-sm-6">
			                <select name="accountLanguage" id="inputAccountLanguage" class="form-control"
			                    {if in_array('language', $uneditablefields)} disabled="disabled"{/if}>
			                    <option value="">{lang key='default'}</option>
			                    {foreach $languages as $language}
			                        <option value="{$language}"{if $language eq $clientLanguage} selected="selected"{/if}
			                        >{$language|ucfirst}</option>
			                    {/foreach}
			                </select>
						</div>
		            </div>
                    {if $showTaxIdField}
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="inputTaxId">{lang key=$taxIdLabel}</label>
                            <div class="col-sm-6">
                                <input class="form-control" type="text" name="tax_id" id="inputTaxId" value="{$clientTaxId}"{if in_array('tax_id', $uneditablefields)} disabled="disabled"{/if} />
                            </div>
                        </div>
                    {/if}
					{if $customfields}
						<hr />
						{foreach from=$customfields key=num item=customfield}
							<div class="form-group">
								<label class="col-sm-3 control-label" for="customfield{$customfield.id}">{$customfield.name}</label>
								<div class="col-sm-6 form-wrap">
									{$customfield.input} {$customfield.description}
								</div>
							</div>
						{/foreach}
					{/if}
					{if $emailPreferencesEnabled}
						<div class="form-group">
							<label class="col-sm-3 control-label">{$LANG.clientareacontactsemails}</label>
							<div class="col-sm-9">
								{foreach $emailPreferences as $emailType => $value}
									<div class="radio">
										<label class="checkbox">
											<input type="hidden" name="email_preferences[{$emailType}]" value="0">
											<input class="icheck" type="checkbox" name="email_preferences[{$emailType}]" id="{$emailType}emails" value="1"{if $value} checked="checked"{/if} />
											<span>{lang key="emailPreferences."|cat:$emailType}</span>
										</label>
									</div>
								{/foreach}
							</div>
						</div>
					{/if}
				</div>
				<div class="panel-footer">
					<input class="btn btn-3d btn-primary res-100" type="submit" name="save" value="{$LANG.clientareasavechanges}" />
					<input class="btn btn-default pull-right res-100 res-left" type="reset" value="{$LANG.cancel}" />
				</div>
			</div>
		</div>
	</div>
</form>
