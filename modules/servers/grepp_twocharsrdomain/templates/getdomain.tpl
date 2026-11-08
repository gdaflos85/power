<div class="alert alert-info text-center" role="alert">{$LANG.greppproducts.twochardomainregister}</div>

<form class="form-inline" action="clientarea.php" method="post">
	<input type="hidden" name="action" value="productdetails">
	<input type="hidden" name="id" value="{$vars.serviceId}">
	<input type="hidden" name="modop" value="custom">
	<input type="hidden" name="a" value="Register">
	<div class="form-row">
		<div class="form-row">
			<div class="form-group col-sm-6">
				<label for="Domain" class="col-sm-4 control-label">{$LANG.greppproducts.domainname}</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="Domain" name="Domain"">
				</div>
			</div>
			<div class="form-group col-sm-6">
				<button type="submit" class="btn btn-primary col-sm-10">{$LANG.confirm}</button>
			</div>
		</div>
	</div>
</form>
