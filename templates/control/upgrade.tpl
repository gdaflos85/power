{if $overdueinvoice}
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.orderproduct}: <strong>{$groupname} - {$productname}</strong>{if $domain} ({$domain}){/if}</h3>
				</div>
				<div class="panel-body">
					<p>{$LANG.upgradeerroroverdueinvoice}</p>
				</div>
				<div class="panel-footer">
					<input type="button" value="{$LANG.clientareabacklink}" onclick="window.location='clientarea.php?action=productdetails&id={$id}'" class="btn res-100 btn-default" />
				</div>
			</div>
		</div>
	</div>
{elseif $existingupgradeinvoice}
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.orderproduct}: <strong>{$groupname} - {$productname}</strong>{if $domain} ({$domain}){/if}</h3>
				</div>
				<div class="panel-body">
					<p>{$LANG.upgradeexistingupgradeinvoice}</p>
				</div>
				<div class="panel-footer">
					<input type="button" value="{$LANG.clientareabacklink}" onclick="window.location='clientarea.php?action=productdetails&id={$id}'" class="btn res-100 btn-default" />&nbsp;
					<input type="button" value="{$LANG.submitticketdescription}" onclick="window.location='submitticket.php'" class="btn res-100 btn-default" />
				</div>
			</div>
		</div>
	</div>
{elseif $upgradenotavailable}
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.orderproduct}: <strong>{$groupname} - {$productname}</strong>{if $domain} ({$domain}){/if}</h3>
				</div>
				<div class="panel-body">
					<p>{$LANG.upgradeNotPossible}</p>
				</div>
				<div class="panel-footer">
					<input type="button" value="{$LANG.clientareabacklink}" onclick="window.location='clientarea.php?action=productdetails&id={$id}'" class="btn res-100 btn-default" />&nbsp;
					<input type="button" value="{$LANG.submitticketdescription}" onclick="window.location='submitticket.php'" class="btn res-100 btn-default" />
				</div>
			</div>
		</div>
	</div>
{else}
	{if $type eq "package"}
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$groupname} - {$productname}</strong>{if $domain}: <strong>{$domain}</strong>{/if}</h3>
					</div>
					<div class="panel-body">
						<p>{$LANG.upgradechoosepackage}</p>
						<p>{$LANG.upgradenewconfig}:</p>
						<table class="table table-striped table-framed">
							{foreach key=num item=upgradepackage from=$upgradepackages}
								<form method="post" action="{$smarty.server.PHP_SELF}">
									<input type="hidden" name="step" value="2">
									<input type="hidden" name="type" value="{$type}">
									<input type="hidden" name="id" value="{$id}">
									<input type="hidden" name="pid" value="{$upgradepackage.pid}">
									<tr>
										<td>
											<strong>{$upgradepackage.groupname} - {$upgradepackage.name}</strong>
										</td>
										<td>
											{if $upgradepackage.pricing.type eq "free"}
												{$LANG.orderfree}
												<input type="hidden" name="billingcycle" value="free">
											{elseif $upgradepackage.pricing.type eq "onetime"}
												{$upgradepackage.pricing.onetime} {$LANG.orderpaymenttermonetime}
												<input type="hidden" name="billingcycle" value="onetime">
											{elseif $upgradepackage.pricing.type eq "recurring"}
												<select class="input-sm" name="billingcycle">
													{if $upgradepackage.pricing.monthly}<option value="monthly">{$upgradepackage.pricing.monthly}</option>{/if}
													{if $upgradepackage.pricing.quarterly}<option value="quarterly">{$upgradepackage.pricing.quarterly}</option>{/if}
													{if $upgradepackage.pricing.semiannually}<option value="semiannually">{$upgradepackage.pricing.semiannually}</option>{/if}
													{if $upgradepackage.pricing.annually}<option value="annually">{$upgradepackage.pricing.annually}</option>{/if}
													{if $upgradepackage.pricing.biennially}<option value="biennially">{$upgradepackage.pricing.biennially}</option>{/if}
													{if $upgradepackage.pricing.triennially}<option value="triennially">{$upgradepackage.pricing.triennially}</option>{/if}
												</select>
											{/if}
											<br /><br />
											<input type="submit" value="{$LANG.upgradedowngradechooseproduct}" class="btn btn-primary btn-3d" id="btnUpgradeDowngradeChooseProduct" />
										</td>
									</tr>
								</form>
							{/foreach}
						</table>
					</div>
				</div>
			</div>
		</div>
	{elseif $type eq "configoptions"}
		<form method="post" action="{$smarty.server.PHP_SELF}">
			<input type="hidden" name="step" value="2" />
			<input type="hidden" name="type" value="{$type}" />
			<input type="hidden" name="id" value="{$id}" />
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">{$LANG.orderproduct}: <strong>{$groupname} - {$productname}</strong>{if $domain} ({$domain}){/if}</h3>
						</div>
						<div class="panel-body">
							<p>{$LANG.upgradechooseconfigoptions}</p>
							<table class="table table-striped table-framed">
								<thead>
									<tr>
										<th></th>
										<th class="textcenter">{$LANG.upgradecurrentconfig}</th>
										<th></th>
										<th class="textcenter">{$LANG.upgradenewconfig}</th>
									</tr>
								</thead>
								<tbody>
									{foreach key=num item=configoption from=$configoptions}
										<tr>
											<td>{$configoption.optionname}</td>
											<td>
												{if $configoption.optiontype eq 1 || $configoption.optiontype eq 2}
													{$configoption.selectedname}
												{elseif $configoption.optiontype eq 3}
													{if $configoption.selectedqty}{$LANG.yes}{else}{$LANG.no}{/if}
												{elseif $configoption.optiontype eq 4}
													{$configoption.selectedqty} x {$configoption.options.0.name}
												{/if}
											</td>
											<td>=></td>
											<td>
												{if $configoption.optiontype eq 1 || $configoption.optiontype eq 2}
													<select class="input-sm" name="configoption[{$configoption.id}]">
														{foreach key=num item=option from=$configoption.options}
															{if $option.selected}<option value="{$option.id}" selected>{$LANG.upgradenochange}</option>{else}<option value="{$option.id}">{$option.nameonly} {$option.price}{/if}</option>
														{/foreach}
													</select>
												{elseif $configoption.optiontype eq 3}
													<input type="checkbox" name="configoption[{$configoption.id}]" value="1"{if $configoption.selectedqty} checked{/if}> {$configoption.options.0.name}
												{elseif $configoption.optiontype eq 4}
													<input type="text" name="configoption[{$configoption.id}]" value="{$configoption.selectedqty}" size="5"> x {$configoption.options.0.name}
												{/if}
											</td>
										</tr>
									{/foreach}
								</tbody>
							</table>
						</div>
						<div class="panel-footer">
							<input type="submit" value="{$LANG.ordercontinuebutton}" class="btn btn-3d res-100 btn-primary" />
						</div>
					</div>
				</div>
			</div>
		</form>
	{/if}
{/if}
