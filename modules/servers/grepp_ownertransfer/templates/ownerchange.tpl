<div class="alert alert-info text-center" role="alert">{$LANG.greppproducts.transferfor|sprintf:$vars.domain}</div>
<div class="alert alert-info text-center" role="alert">{$LANG.greppproducts.currentregistrant|sprintf:$vars.data.id}</div>

<form class="form-horizontal" action="clientarea.php" method="post">
	<input type="hidden" name="action" value="productdetails">
	<input type="hidden" name="id" value="{$vars.serviceId}">
	<input type="hidden" name="domain" value="{$vars.domain}">
	<input type="hidden" name="modop" value="custom">
	<input type="hidden" name="contactid" value="{$vars.contactId}">
	<input type="hidden" name="nameOld" value="{$vars.data.locName}">
	<input type="hidden" name="orgOld" value="{$vars.data.locOrg}">
	<input type="hidden" name="a" value="OwnerTransfer">
	<div class="form-row">
		<div class="form-group col-sm-6">
			<label for="name" class="col-sm-4 control-label">{$LANG.domaincontactdetails['Full Name']}</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="name" name="Full Name" value="{$vars.data.locName}">
			</div>
		</div>
		<div class="form-group col-sm-6">
			<label for="org" class="col-sm-4 control-label">{$LANG.domaincontactdetails['Organisation Name']}</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="org" name="Company Name" value="{$vars.data.locOrg}">
			</div>
		</div>
	</div>
	<div class="form-row">
		<div class="form-group col-sm-6">
			<label for="mail" class="col-sm-4 control-label">{$LANG.domaincontactdetails['Email']}</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="mail" name="Email" value="{$vars.data.mail}">
			</div>
		</div>
		<div class="form-group col-sm-6">
			<label for="voice" class="col-sm-4 control-label">{$LANG.domaincontactdetails['Phone']}</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="voice" name="Phone" value="{$vars.data.voice}">
			</div>
		</div>
	</div>
	<div class="form-row">
		<div class="form-group col-sm-4">
			<label for="street1" class="col-sm-4 control-label">{$LANG.domaincontactdetails['Address 1']}</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="street1" name="Address 1" value="{$vars.data.locStreet[0]}">
			</div>
		</div>
		<div class="form-group col-sm-4">
			<label for="street2" class="col-sm-4 control-label">{$LANG.domaincontactdetails['Address 2']}</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="street2" name="Address 2" value="{$vars.data.locStreet[1]}">
			</div>
		</div>
		<div class="form-group col-sm-4">
            <label for="street3" class="col-sm-4 control-label">{$LANG.domaincontactdetails['Address 3']}</label>
            <div class="col-sm-8">
                <input type="text" class="col-sm-8 form-control" id="street3" name="Address 3" value="{$vars.data.locStreet[2]}">
            </div>
		</div>
    </div>
    <div class="form-row">
        <div class="form-row">
            <div class="form-group col-sm-6">
                <label for="state" class="col-sm-4 control-label">{$LANG.domaincontactdetails['Region']}</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="state" name="State" value="{$vars.data.locArea}">
                </div>
            </div>
        </div>
		<div class="form-group col-sm-6">
			<label for="city" class="col-sm-4 control-label">{$LANG.domaincontactdetails['City']}</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="city" name="City" value="{$vars.data.locCity}">
			</div>
		</div>
	</div>
	<div class="form-row">
		<div class="form-group col-sm-6">
			<label for="zip" class="col-sm-4 control-label">{$LANG.domaincontactdetails['ZIP']}</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="zip" name="ZIP" value="{$vars.data.locZip}">
			</div>
		</div>
		<div class="form-group col-sm-6">
			<label for="country" class="col-sm-4 control-label">{$LANG.domaincontactdetails['Country']}</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="country" name="Country" value="{$vars.data.locCountry}">
			</div>
		</div>
	</div>
	<div class="form-row">
		<div class="form-group col-sm-12">
			<button type="submit" class="btn btn-primary col-sm-offset-2 col-sm-10">{$LANG.confirm}</button>
		</div>
	</div>
</form>
<div class="clearfix"></div>