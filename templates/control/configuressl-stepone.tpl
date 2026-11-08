{if !$status}
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.sslconfsslcertificate}</h3>
				</div>
				<div class="panel-body">
					<p>{$LANG.sslinvalidlink}</p>
				</div>
				<div class="panel-footer">
					<input type="button" value="{$LANG.clientareabacklink}" class="btn res-100 btn-default" onclick="history.go(-1)" />
				</div>
			</div>
		</div>
	</div>
{else}
	{if $errormessage}
		{include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
	{/if}
	{if $status eq "Awaiting Configuration"}
		<form method="post" action="{$smarty.server.PHP_SELF}?cert={$cert}&step=2" class="form-horizontal">
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">{$LANG.sslserverinfo}</h3>
						</div>
						<div class="panel-body">
							<p>{$LANG.sslserverinfodetails}</p>
							<fieldset>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="servertype">{$LANG.sslservertype}</label>
									<div class="col-sm-6">
										<select name="servertype" id="servertype" class="form-control">
											<option value="" selected>{$LANG.pleasechooseone}</option>
											{foreach from=$webservertypes key=webservertypeid item=webservertype}
												<option value="{$webservertypeid}"{if $servertype eq $webservertypeid} selected{/if}>{$webservertype}</option>
											{/foreach}
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="csr">{$LANG.sslcsr}</label>
									<div class="col-sm-6">
										<textarea name="csr" id="csr" rows="7" class="form-control">{if $csr}{$csr}{else}-----BEGIN CERTIFICATE REQUEST-----
-----END CERTIFICATE REQUEST-----{/if}</textarea>
									</div>
								</div>
							</fieldset>
						</div>
					</div>
				</div>
			</div>
			{foreach from=$additionalfields key=heading item=fields}
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">{$heading}</h3>
							</div>
							<div class="panel-body">
								{foreach from=$fields item=vals}
									<div class="form-group">
										<label class="col-sm-3 control-label">{$vals.name}</label>
										<div class="col-sm-6 form-wrap">
											{$vals.input}
											<br /><br />
											{$vals.description}
										</div>
									</div>
								{/foreach}
							</div>
						</div>
					</div>
				</div>
			{/foreach}
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">{$LANG.ssladmininfo}</h3>
						</div>
						<div class="panel-body">
							<p>{$LANG.ssladmininfodetails}</p>
							<fieldset class="onecol">
								<div class="form-group">
									<label class="col-sm-3 control-label" for="firstname">{$LANG.clientareafirstname}</label>
									<div class="col-sm-6">
										<input class="form-control" type="text" name="firstname" id="firstname" value="{$firstname}" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="lastname">{$LANG.clientarealastname}</label>
									<div class="col-sm-6">
										<input class="form-control" type="text" name="lastname" id="lastname" value="{$lastname}" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="orgname">{$LANG.organizationname}</label>
									<div class="col-sm-6">
										<input class="form-control" type="text" name="orgname" id="orgname" value="{$orgname}" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="jobtitle">{$LANG.jobtitle}</label>
									<div class="col-sm-6">
										<input class="form-control" type="text" name="jobtitle" id="jobtitle" value="{$jobtitle}" />
										<br /><br />
										{$LANG.jobtitlereqforcompany}
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="email">{$LANG.clientareaemail}</label>
									<div class="col-sm-6">
										<input class="form-control" type="text" name="email" id="email" value="{$email}" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="address1">{$LANG.clientareaaddress1}</label>
									<div class="col-sm-6">
										<input class="form-control" type="text" name="address1" id="address1" value="{$address1}" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="address2">{$LANG.clientareaaddress2}</label>
									<div class="col-sm-6">
										<input class="form-control" type="text" name="address2" id="address2" value="{$address2}" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="city">{$LANG.clientareacity}</label>
									<div class="col-sm-6">
										<input class="form-control" type="text" name="city" id="city" value="{$city}" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="state">{$LANG.clientareastate}</label>
									<div class="col-sm-6 form-wrap">
										<input class="form-control" type="text" name="state" id="state" value="{$state}" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="postcode">{$LANG.clientareapostcode}</label>
									<div class="col-sm-6">
										<input class="form-control" type="text" name="postcode" id="postcode" value="{$postcode}" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="country">{$LANG.clientareacountry}</label>
									<div class="col-sm-6">
										<select name="country" id="inputCountry" class="form-control">
											{foreach from=$clientcountries item=thisCountryName key=thisCountryCode}
												<option value="{$thisCountryCode}" {if $thisCountryCode eq $country}selected="selected"{/if}>{$thisCountryName}</option>
											{/foreach}
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="phonenumber">{$LANG.clientareaphonenumber}</label>
									<div class="col-sm-6">
										<input class="form-control" type="text" name="phonenumber" id="phonenumber" value="{$phonenumber}" />
									</div>
								</div>
							</fieldset>
						</div>
					</div>
				</div>
			</div>
			<p align="center"><input type="submit" value="{$LANG.ordercontinuebutton}" class="btn res-100 btn-primary btn-3d" id="btnOrderContinue" /></p>
		</form>
	{else}
		{include file="$template/includes/alert.tpl" type="info" msg=$LANG.sslnoconfigurationpossible textcenter=true}
		<form method="post" action="clientarea.php?action=productdetails">
			<input type="hidden" name="id" value="{$serviceid}" />
			<p><input type="submit" value="{$LANG.invoicesbacktoclientarea}" class="btn res-100 btn-default" /></p>
		 </form>
	{/if}
{/if}
