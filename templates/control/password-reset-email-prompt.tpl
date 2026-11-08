<form method="post" action="{routePath('password-reset-validate-email')}" class="form-horizontal" role="form">
	<input type="hidden" name="action" value="reset" />
	<div class="row">
		<div class="col-md-12">	
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.pwreset}</h3>
				</div>
				<div class="panel-body">
					<p>{$LANG.pwresetemailneeded}</p>
					<br/>
					<fieldset>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="inputEmail">{$LANG.loginemail}</label>
							<div class="col-sm-6">
								<input type="email" name="email" class="form-control" id="inputEmail" placeholder="{$LANG.enteremail}" autofocus />
							</div>
						</div>
					</fieldset>
					{if $captcha->isEnabled()}
						<div class="text-center margin-bottom">
							{include file="$template/includes/captcha.tpl"}
						</div>
					{/if}
				</div>
				<div class="panel-footer">
					<input type="submit" class="btn btn-3d res-100 btn-primary{$captcha->getButtonClass($captchaForm)}" value="{$LANG.pwresetsubmit}" />
				</div>
			</div>
		</div>
	</div>
</form>