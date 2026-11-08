{if $invalid}
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<div class="panel panel-danger">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.clientareacancelrequest}</h3>
				</div>
				<div class="panel-body">
					<p>{$LANG.clientareacancelinvalid}</p>
				</div>
				<div class="panel-footer">
					<a href="clientarea.php?action=productdetails&amp;id={$id}" class="btn res-100 btn-3d btn-primary">{$LANG.clientareabacklink}</a>
				</div>
			</div>
		</div>
	</div>
{elseif $requested}
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.clientareacancelrequest}</h3>
				</div>
				<div class="panel-body">
					<p>{$LANG.clientareacancelconfirmation}</p>
				</div>
				<div class="panel-footer">
					<a href="clientarea.php?action=productdetails&amp;id={$id}" class="btn btn-3d btn-primary res-100">{$LANG.clientareabacklink}</a>
				</div>
			</div>
		</div>
	</div>
{else}
	{if $error}
		{include file="$template/includes/alert.tpl" type="error" errorshtml="<li>{$LANG.clientareacancelreasonrequired}</li>"}
	{/if}
	<form method="post" action="{$smarty.server.PHP_SELF}?action=cancel&amp;id={$id}" class="form-horizontal">
		<input type="hidden" name="sub" value="submit" />
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$LANG.clientareacancelproduct}: <strong>{$groupname} - {$productname}</strong>{if $domain} ({$domain}){/if}</h3>
					</div>
					<div class="panel-body">
						<fieldset>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="cancellationreason">{$LANG.clientareacancelreason}</label>
								<div class="col-sm-6">
									<textarea name="cancellationreason" id="cancellationreason" rows="6" class="form-control"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="type">{$LANG.clientareacancellationtype}</label>
								<div class="col-sm-6">
									<select class="form-control" name="type" id="type">
										<option value="Immediate">{$LANG.clientareacancellationimmediate}</option>
										<option value="End of Billing Period">{$LANG.clientareacancellationendofbillingperiod}</option>
									</select>
								</div>
							</div>
							{if $domainid}
								<br />
								<div class="alert alert-danger">
									<p><strong>{$LANG.cancelrequestdomain}</strong></p>
									<p>{$LANG.cancelrequestdomaindesc|sprintf2:$domainnextduedate:$domainprice:$domainregperiod}</p>
									<p><label class="checkbox-inline"><input type="checkbox" name="canceldomain" id="canceldomain" /> {$LANG.cancelrequestdomainconfirm}</label></p>
								</div>
							{/if}
						</fieldset>
					</div>
					<div class="panel-footer">
						<input type="submit" value="{$LANG.clientareacancelrequestbutton}" class="res-100 btn btn-3d btn-danger" />
						<a href="clientarea.php?action=productdetails&id={$id}" class="pull-right res-100 res-left btn btn-default">{$LANG.cancel}</a>
					</div>
				</div>
			</div>
		</div>
	</form>
{/if}