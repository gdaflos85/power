{if $errormessage}
	{include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
{/if}
<form class="form-horizontal" method="post" action="{$smarty.server.PHP_SELF}?cert={$cert}&step=3">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.sslcertapproveremail}</h3>
				</div>
				<div class="panel-body">
					<p>{$LANG.sslcertapproveremaildetails}</p>
					<br />
					<fieldset>
						<div class="form-group">
							<label class="col-sm-3 control-label">{$LANG.sslcertapproveremail}</label>
							<div class="col-sm-6">
								{foreach from=$approveremails item=approveremail key=num}
									<p>
										<label class="radio-inline">
											<input type="radio" class="icheck" name="approveremail" value="{$approveremail}"{if $num eq 0} checked{/if} /> {$approveremail}
										</label>
									</p>
								{/foreach}
							</div>
						</div>
					</fieldset>
				</div>
				<div class="panel-footer">
					<input type="submit" value="{$LANG.ordercontinuebutton}" class="btn btn-3d res-100 btn-primary" id="btnOrderContinue" />
				</div>
			</div>
		</div>
	</div>
</form>
