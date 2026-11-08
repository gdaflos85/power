<form class="form-inline" action="clientarea.php" method="get">
	<input type="hidden" name="action" value="domaindetails">
	<input type="hidden" name="id" value="{$vars.domainId}">
	<input type="hidden" name="modop" value="custom">
	<input type="hidden" name="a" value="eppcodechange">
    <div class="form-row">
        <div class="form-row">
            <div class="form-group col-sm-6">
                <label for="newEPPCode" class="col-sm-4 control-label">{$LANG.grepp.eppcodechange.label}</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="newEPPCode" name="newEPPCode"">
                </div>
            </div>
            <div class="form-group col-sm-6">
                <button type="submit" class="btn btn-primary col-sm-10">{$LANG.confirm}</button>
            </div>
        </div>
    </div>
    <div class="form-row">
        <div class="form-group col-sm-12">
            <div class="alert alert-warning" role="alert">
                {$LANG.grepp.eppcodechange.validationrules}
            </div>
        </div>
    </div>
</form>
