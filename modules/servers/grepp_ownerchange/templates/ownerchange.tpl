<div class="alert alert-info text-center" role="alert">{$LANG.greppproducts.changefor|sprintf:$vars.domain}</div>
<div class="alert alert-info text-center" role="alert">{$LANG.greppproducts.currentregistrant|sprintf:$vars.contactId}</div>

<form class="form-horizontal" action="clientarea.php" method="get">
	<input type="hidden" name="action" value="productdetails">
	<input type="hidden" name="id" value="{$vars.serviceId}">
	<input type="hidden" name="domain" value="{$vars.domain}">
	<input type="hidden" name="modop" value="custom">
	<input type="hidden" name="contactid" value="{$vars.contactId}">
	<input type="hidden" name="nameOld" value="{$vars.name}">
	<input type="hidden" name="orgOld" value="{$vars.org}">
	<input type="hidden" name="a" value="OwnerNameChange">
	<div class="form-group">
		<label for="name" class="col-sm-2 control-label">{$LANG.domaincontactdetails['Full Name']}</label>
		<div class="col-sm-10">
			<input type="text" class="form-control col-sm-10" id="name" name="name" value="{$vars.name}">
		</div>
	</div>
	<div class="form-group">
		<label for="org" class="col-sm-2 control-label">{$LANG.domaincontactdetails['Organisation Name']}</label>
		<div class="col-sm-10">
			<input type="text" class="form-control col-sm-10" id="org" name="org" value="{$vars.org}">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-10 col-sm-offset-2">
			<button type="submit" class="btn btn-primary col-sm-12">{$LANG.confirm}</button>
		</div>
	</div>
</form>