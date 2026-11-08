<form method="post" action="{routePath('password-reset-security-verify')}" class="form-horizontal">
	<div class="row">
		<div class="col-md-12">	
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.pwreset}</h3>
				</div>
				<div class="panel-body">
					<p>{$LANG.pwresetsecurityquestionrequired}</p>
					<fieldset>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="inputAnswer">{$securityQuestion}</label>
							<div class="col-sm-6">
								<input type="text" name="answer" class="form-control" id="inputAnswer" autofocus />
							</div>
						</div>
					</fieldset>
				</div>
				<div class="panel-footer">
					<input type="submit" class="btn btn-3d res-100 btn-primary" value="{$LANG.pwresetsubmit}" />
				</div>
			</div>
		</div>
	</div>
</form>