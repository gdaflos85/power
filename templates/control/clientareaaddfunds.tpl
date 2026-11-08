{if $addfundsdisabled}
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<div class="panel panel-danger">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.addfunds}</h3>
				</div>
				<div class="panel-body">
					<p>{$LANG.clientareaaddfundsdisabled}</p>
				</div>
			</div>
		</div>
	</div>
{elseif $notallowed}
	{include file="$template/includes/alert.tpl" type="error" msg=$LANG.clientareaaddfundsnotallowed textcenter=true}
{elseif $errormessage}
	{include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage textcenter=true}
{/if}
{if !$addfundsdisabled}
	<form class="form-horizontal" method="post" action="{$smarty.server.PHP_SELF}?action=addfunds">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$LANG.addfunds}</h3>
					</div>
					<div class="panel-body">
						<p>{$LANG.addfundsdescription}</p>
						<hr />
						<div class="pull-left"><strong>{$LANG.addfundsminimum}</strong></div>
						<div class="pull-right">{$minimumamount}</div>
						<div style="clear: both;"></div>
						<div class="pull-left"><strong>{$LANG.addfundsmaximum}</strong></div>
						<div class="pull-right">{$maximumamount}</div>
						<div style="clear: both;"></div>
						<div class="pull-left"><strong>{$LANG.addfundsmaximumbalance}</strong></div>
						<div class="pull-right">{$maximumbalance}</div>
						<div style="clear: both;"></div>
						<hr />
						<fieldset>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="amount">{$LANG.addfundsamount}</label>
								<div class="col-sm-6">
									<input type="text" name="amount" id="amount" value="{$amount}" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="paymentmethod">{$LANG.orderpaymentmethod}</label>
								<div class="col-sm-6">
									<select name="paymentmethod" id="paymentmethod" class="input-sm form-control">
										{foreach from=$gateways item=gateway}
											<option value="{$gateway.sysname}">{$gateway.name}</option>
										{/foreach}
									</select>
								</div>
							</div>
						</fieldset>
					</div>
					<div class="panel-footer">
						<input type="submit" value="{$LANG.addfunds}" class="res-100 btn btn-3d btn-primary" />
					</div>
				</div>
			</div>
		</div>
	</form>
	<br />
	<p align="center">{$LANG.addfundsnonrefundable}</p>
	<br /><br />
{/if}
