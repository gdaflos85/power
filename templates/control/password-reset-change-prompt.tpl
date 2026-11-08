<form class="form-horizontal using-password-strength" method="post" action="{routePath('password-reset-change-perform')}">
	<input type="hidden" name="answer" id="answer" value="{$securityAnswer}" />
	<div class="row">
		<div class="col-md-12">	
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.pwreset}</h3>
				</div>
				<div class="panel-body">
					<p>{$LANG.pwresetenternewpw}</p>
					
                    <div id="newPassword1" class="form-group has-feedback">
                        <label for="inputNewPassword1" class="col-sm-3 control-label">{$LANG.newpassword}</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" name="newpw" id="inputNewPassword1" autocomplete="off" />
                            <span class="form-control-feedback glyphicon glyphicon-password"></span>
                        </div>
                    </div>
					<div class="form-group">
						<div class="col-sm-6 col-sm-offset-3">
							<button type="button" class="btn btn-xs btn-default generate-password" data-targetfields="inputNewPassword1,inputNewPassword2">
								{$LANG.generatePassword.btnLabel}
							</button>
							{include file="$template/includes/pwstrength.tpl"}
						</div>
					</div>
                    <div id="newPassword2" class="form-group has-feedback">
                        <label for="inputNewPassword2" class="col-sm-3 control-label">{$LANG.confirmnewpassword}</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" name="confirmpw" id="inputNewPassword2" autocomplete="off" />
                            <span class="form-control-feedback glyphicon glyphicon-password"></span>
                            <div id="inputNewPassword2Msg"></div>
                        </div>
                    </div>
					
				</div>
				<div class="panel-footer">
					<input class="res-100 btn-3d btn btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}" />
					<input class="res-left res-100 btn btn-default pull-right" type="reset" value="{$LANG.cancel}" />
				</div>
			</div>
		</div>
	</div>
</form>