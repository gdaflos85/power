
	{if $invalidlink}
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$LANG.pwreset}</h3>
					</div>
					<div class="panel-body">
						<div class="alert alert-danger">
							<p>{$invalidlink}</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	{elseif $success}
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$LANG.pwreset}</h3>
					</div>
					<div class="panel-body">
						<div class="alert alert-success">
							<p>{$LANG.pwresetvalidationsuccess}</p>
						</div>
						<p>{$LANG.pwresetsuccessdesc|sprintf2:'<a href="{$WEB_ROOT}/clientarea.php">':'</a>'}</p>
					</div>
				</div>
			</div>
		</div>
	{else}
		{if $errormessage}
			{include file="$template/includes/alert.tpl" type="danger" msg=$errormessage textcenter=true}
		{/if}
		<form class="form-horizontal using-password-strength" method="post" action="{$smarty.server.PHP_SELF}?action=pwreset">
			<input type="hidden" name="key" id="key" value="{$key}" />
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">{$LANG.pwresetenternewpw}</h3>
						</div>
						<div class="panel-body">
							<fieldset>
								<div id="newPassword1" class="form-group has-feedback">
									<label for="inputNewPassword1" class="col-sm-3 control-label">{$LANG.clientareapassword}</label>
									<div class="col-sm-6">
										<input type="password" class="form-control" id="inputNewPassword1" name="newpw" autocomplete="off" />
										<span class="form-control-feedback glyphicon glyphicon-password"></span>
										{include file="$template/includes/pwstrength.tpl"}
									</div>
								</div>
								<div id="newPassword2" class="form-group has-feedback">
									<label for="inputNewPassword2" class="col-sm-3 control-label">{$LANG.clientareaconfirmpassword}</label>
									<div class="col-sm-6">
										<input type="password" class="form-control" id="inputNewPassword2" name="confirmpw" autocomplete="off" />
										<span class="form-control-feedback glyphicon glyphicon-password"></span>
										<div id="inputNewPassword2Msg">
										</div>
									</div>
								</div>
							</fieldset>
						</div>
						<div class="panel-footer">
							<input class="btn res-100 btn-3d btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}" />
							<input class="pull-right res-left res-100 btn btn-default" type="reset" value="{$LANG.cancel}" />
						</div>
					</div>
				</div>
			</div>
		</form>
	{/if}
