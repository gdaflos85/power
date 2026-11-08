{if $modulecustombuttonresult}
	{if $modulecustombuttonresult == "success"}
		{include file="$template/includes/alert.tpl" type="success" msg=$LANG.moduleactionsuccess textcenter=true idname="alertModuleCustomButtonSuccess"}
	{else}
		{include file="$template/includes/alert.tpl" type="error" msg=$LANG.moduleactionfailed|cat:' ':$modulecustombuttonresult textcenter=true idname="alertModuleCustomButtonFailed"}
	{/if}
{/if}
{if $pendingcancellation}
	{include file="$template/includes/alert.tpl" type="error" msg=$LANG.cancellationrequestedexplanation textcenter=true idname="alertPendingCancellation"}
{/if}
{if $unpaidInvoice}
    <div class="alert alert-{if $unpaidInvoiceOverdue}danger{else}warning{/if}" id="alert{if $unpaidInvoiceOverdue}Overdue{else}Unpaid{/if}Invoice">
        <div class="pull-right">
            <a href="viewinvoice.php?id={$unpaidInvoice}" class="btn btn-xs {if $unpaidInvoiceOverdue}btn-danger{else}btn-warning{/if}">
                {lang key='payInvoice'}
            </a>
        </div>
        {$unpaidInvoiceMessage}
    </div>
{/if}
<div class="tab-content margin-bottom">
	<div class="tab-pane fade in active" id="tabOverview">
		{if $tplOverviewTabOutput}
			{if $modulename eq "licensing"}
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">{$LANG.licensingaddon.manageLicense}</h3>
							</div>
							<div class="panel-body licensing">
								{$tplOverviewTabOutput}
							</div>
						</div>
					</div>
				</div>
			{else}
				{$tplOverviewTabOutput}
			{/if}
		{else}
			<div class="product-details clearfix">
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">{if $domain}{$LANG.cPanel.packageDomain}{else}{$LANG.clientareaproductdetails}{/if}<span class="pull-right label status status-{$rawstatus|strtolower}">{$status}</span></h3>
							</div>
							<div class="panel-body text-center">
								<div class="package-details">
									<em>{$groupname}</em>
									<h4 style="margin:0;">{$product}</h4>
								</div>
								{if $domain}
									{if $type eq "server"}
										<hr/>
										<p>
											<strong>{$LANG.serverhostname}</strong>
											<br/>
											{$domain}
										</p>
										{if $dedicatedip}
											<hr/>
											<p>
												<strong>{$LANG.primaryIP}</strong>
												<br/>
												{$dedicatedip}
											</p>
										{/if}
										{if $assignedips}
											<hr/>
											<p>
												<strong>{$LANG.assignedIPs}</strong>
												<br/>
												{$assignedips|nl2br}
											</p>
										{/if}
										{if $ns1 || $ns2}
											<hr/>
											<p>
												<strong>{$LANG.domainnameservers}</strong>
												<br/>
												{if $ns1}
													{$ns1}
													<br />
												{/if}
												{if $ns2}
													{$ns2}
													<br/>
												{/if}
											</p>
										{/if}
									{else}
										{if $domain}
											<hr/>
											<p>
												<strong>{$LANG.orderdomain}</strong>
												<br/>
												{$domain}
											</p>
											<p>
                                                <a href="http://{$domain}" class="btn btn-default btn-sm" target="_blank">{$LANG.visitwebsite}</a>
                                                {if $domainId}
                                                    <a href="clientarea.php?action=domaindetails&id={$domainId}" class="btn btn-success btn-sm" target="_blank">{$LANG.managedomain}</a>
                                                {/if}
                                            </p>
										{/if}
										{if $username}
											<hr/>
											<p>
												<strong>{$LANG.serverusername}</strong>
												<br/>
												{$username}
											</p>
										{/if}
                                        {if $serverdata}
                                            <hr/>
                                            <p>
                                                <strong>{$LANG.servername}</strong>
                                                <br/>
                                                {$serverdata.hostname}
                                            </p>
                                            <hr/>
                                            <p>
                                                <strong>{$LANG.domainregisternsip}</strong>
                                                <br/>
                                                {$serverdata.ipaddress}
                                            </p>
                                            {if $serverdata.nameserver1 || $serverdata.nameserver2 || $serverdata.nameserver3 || $serverdata.nameserver4 || $serverdata.nameserver5}
                                            <hr/>
                                            <p>
                                                <strong>{$LANG.domainnameservers}</strong>
                                                {if $serverdata.nameserver1}
                                                    <br/>
                                                    {$serverdata.nameserver1} ({$serverdata.nameserver1ip})
                                                {/if}
                                                {if $serverdata.nameserver2}
                                                    <br/>
                                                    {$serverdata.nameserver2} ({$serverdata.nameserver2ip})
                                                {/if}
                                                {if $serverdata.nameserver3}
                                                    <br/>
                                                    {$serverdata.nameserver3} ({$serverdata.nameserver3ip})
                                                {/if}
                                                {if $serverdata.nameserver4}
                                                    <br/>
                                                    {$serverdata.nameserver4} ({$serverdata.nameserver4ip})
                                                {/if}
                                                {if $serverdata.nameserver5}
                                                    <br/>
                                                    {$serverdata.nameserver5} ({$serverdata.nameserver5ip})
                                                {/if}
                                            </p>
                                            {/if}
                                        {/if}
									{/if}
									{if $moduleclientarea}
										<hr/>
										{$moduleclientarea}
									{/if}
								{elseif $moduleclientarea}
									<hr/>
									{$moduleclientarea}
								{/if}
								<div id="domain"></div>
							</div>
						</div>
					</div>
				</div>
                {if $domain && $sslStatus}
					{if $itSSLStatusClientareaproductdetails neq "disabled"}
	                    <div class="row">
	                        <div class="col-md-12">
	                            <div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">{$LANG.sslcertinfo}</h3>
									</div>
	                                <div class="panel-body">
										{*
		                                    {if $sslStatus->isActive()}
		                                        <div class="alert alert-success" role="alert">
		                                            {lang key='sslState.sslActive' expiry=$sslStatus->expiryDate->toClientDateFormat()}
		                                        </div>
		                                    {else}
		                                        <div class="alert alert-warning ssl-required" role="alert">
		                                            {lang key='sslState.sslInactive'}
		                                        </div>
		                                    {/if}
										*}
										<div class="row">
		                                    <div class="col-sm-6 text-right">
		                                        <strong>{$LANG.sslState.sslStatus}</strong>
		                                    </div>
		                                    <div class="col-sm-6 text-left{if $sslStatus->isInactive()} ssl-inactive{/if}">
		                                        <img src="{$sslStatus->getImagePath()}" width="12" data-type="service" data-domain="{$domain}" data-showlabel="1" class="{$sslStatus->getClass()}"/>
												<span id="statusDisplayLabel">
	                                                {if !$sslStatus->needsResync()}
	                                                    {$sslStatus->getStatusDisplayLabel()}
	                                                {else}
	                                                    {$LANG.loading}
	                                                {/if}
	                                            </span>
		                                    </div>
										</div>
	                                    {if $sslStatus->isActive() || $sslStatus->needsResync()}
											<div class="row">
		                                        <div class="col-sm-6 text-right">
		                                            <strong>{$LANG.sslState.startDate}</strong>
		                                        </div>
		                                        <div class="col-sm-6 text-left" id="ssl-startdate">
													{if !$sslStatus->needsResync() || $sslStatus->startDate}
	                                                    {$sslStatus->startDate->toClientDateFormat()}
	                                                {else}
	                                                    {$LANG.loading}
	                                                {/if}
		                                        </div>
											</div>
											<div class="row">
		                                        <div class="col-sm-6 text-right">
		                                            <strong>{$LANG.sslState.expiryDate}</strong>
		                                        </div>
		                                        <div class="col-sm-6 text-left" id="ssl-expirydate">
													{if !$sslStatus->needsResync() || $sslStatus->expiryDate}
	                                                    {$sslStatus->expiryDate->toClientDateFormat()}
	                                                {else}
	                                                    {$LANG.loading}
	                                                {/if}
		                                        </div>
											</div>
											<div class="row">
		                                        <div class="col-sm-6 text-right">
		                                            <strong>{$LANG.sslState.issuerName}</strong>
		                                        </div>
		                                        <div class="col-sm-6 text-left" id="ssl-issuer">
													{if !$sslStatus->needsResync() || $sslStatus->issuerName}
	                                                    {$sslStatus->issuerName}
	                                                {else}
	                                                    {$LANG.loading}
	                                                {/if}
		                                        </div>
											</div>
	                                    {/if}
	                                </div>
	                            </div>
	                        </div>
	                    </div>
					{/if}
                {/if}
				{if $lastupdate}
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">{$LANG.resourceUsage}</h3>
								</div>
								<div class="panel-body text-center">
									<div class="col-sm-10 col-sm-offset-1">
										<div class="col-sm-6">
											<h4>{$LANG.diskSpace}</h4>
											<input type="text" value="{$diskpercent|substr:0:-1}" class="dial-usage" data-width="100" data-height="100" data-min="0" data-readOnly="true" />
											<p>{$diskusage}MB / {$disklimit}MB</p>
										</div>
										<div class="col-sm-6">
											<h4>{$LANG.bandwidth}</h4>
											<input type="text" value="{$bwpercent|substr:0:-1}" class="dial-usage" data-width="100" data-height="100" data-min="0" data-readOnly="true" />
											<p>{$bwusage}MB / {$bwlimit}MB</p>
										</div>
									</div>
									<div class="clearfix">
									</div>
									<p class="text-muted">{$LANG.clientarealastupdated}: {$lastupdate}</p>
									<script src="{$BASE_PATH_JS}/jquery.knob.js"></script>
									<script type="text/javascript">
									jQuery(function() {ldelim}
										jQuery(".dial-usage").knob({ldelim}'format':function (v) {ldelim} alert(v); {rdelim}{rdelim});
									{rdelim});
									</script>
								</div>
							</div>
						</div>
					</div>
				{/if}
				{if $configurableoptions}
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">{$LANG.orderconfigpackage}</h3>
								</div>
								<div class="panel-body">
									{foreach from=$configurableoptions item=configoption}
										<div class="row">
											<div class="col-sm-6 text-right">
												<strong>{$configoption.optionname}</strong>
											</div>
											<div class="col-sm-6 text-left">
												{if $configoption.optiontype eq 3}
													{if $configoption.selectedqty}
														{$LANG.yes}
													{else}
														{$LANG.no}
													{/if}
												{elseif $configoption.optiontype eq 4}
													{$configoption.selectedqty} x {$configoption.selectedoption}
												{else}
													{$configoption.selectedoption}
												{/if}
											</div>
										</div>
									{/foreach}
								</div>
							</div>
						</div>
					</div>
				{/if}
				{if $metricStats}
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">{$LANG.metrics.title}</h3>
								</div>
								<div class="panel-body" id="metrics">
                            		{include file="$template/clientareaproductusagebilling.tpl"}
                        		</div>
							</div>
						</div>
					</div>
                {/if}
				{if $customfields}
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">{$LANG.additionalInfo}</h3>
								</div>
								<div class="panel-body">
									{foreach from=$customfields item=field}
										<div class="row">
											<div class="col-sm-6 text-right">
												<strong>{$field.name}</strong>
											</div>
											<div class="col-sm-6 text-left">
												{$field.value}
											</div>
										</div>
									{/foreach}
								</div>
							</div>
						</div>
					</div>
				{/if}
				<div class="row">
					<div class="col-md-12">
						{foreach $hookOutput as $output}
							<div>
								{$output}
							</div>
						{/foreach}
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">{$LANG.cPanel.billingOverview}</h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										{if $firstpaymentamount neq $recurringamount}
											<div class="row">
												<div class="col-xs-6 text-right">
													<strong>{$LANG.firstpaymentamount}</strong>
												</div>
												<div class="col-xs-6">
													{$firstpaymentamount}
												</div>
											</div>
										{/if}
										{if $billingcycle != $LANG.orderpaymenttermonetime && $billingcycle != $LANG.orderfree}
											<div class="row">
												<div class="col-xs-6 text-right">
													<strong>{$LANG.recurringamount}</strong>
												</div>
												<div class="col-xs-6">
													{$recurringamount}
												</div>
											</div>
										{/if}
										{if $quantitySupported && $quantity > 1}
		                                    <div class="row" id="quantity">
		                                        <div class="col-xs-6">
		                                            <p><strong>{lang key='quantity'}</strong></p>
		                                        </div>
		                                        <div class="col-xs-6">
		                                            <p>{$quantity}</p>
		                                        </div>
		                                    </div>
		                                {/if}
										<div class="row" id="billingCycle">
											<div class="col-xs-6 text-right">
												<strong>{$LANG.orderbillingcycle}</strong>
											</div>
											<div class="col-xs-6">
												{$billingcycle}
											</div>
										</div>
										<div class="row" id="paymentMethod">
											<div class="col-xs-6 text-right">
												<strong>{$LANG.orderpaymentmethod}</strong>
											</div>
											<div class="col-xs-6">
												{$paymentmethod}
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="row" id="registrationDate">
											<div class="col-xs-6 col-md-5 text-right">
												<strong>{$LANG.clientareahostingregdate}</strong>
											</div>
											<div class="col-xs-6 col-md-7">
												{$regdate}
											</div>
										</div>
										<div class="row" id="nextDueDate">
											<div class="col-xs-6 col-md-5 text-right">
												<strong>{$LANG.clientareahostingnextduedate}</strong>
											</div>
											<div class="col-xs-6 col-md-7">
												{$nextduedate}
											</div>
										</div>
										{if $suspendreason}
											<div class="row">
												<div class="col-xs-6 col-md-5 text-right">
													<strong>{$LANG.suspendreason}</strong>
												</div>
												<div class="col-xs-6 col-md-7">
													{$suspendreason}
												</div>
											</div>
										{/if}
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		{/if}
	</div>
	<div class="tab-pane fade in" id="tabDownloads">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title"><i class="fas fa-download"></i>&nbsp;{$LANG.downloadsfiles}</h3>
					</div>
					<div class="list-group">
						{if $downloads}
							{foreach from=$downloads item=download}
								<div class="list-group-item">
									<a href="{$download.link}">
										<i class="fas fa-file-download"></i>
										<strong>
											{$download.title}
										</strong>
									</a><br />
									{$download.description}
								</div>
							{/foreach}
						{else}
							<div class="list-group-item"><p class="text-center">{$LANG.downloadsnone}</p></div>
						{/if}
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="tab-pane fade in" id="tabAddons">
		{if $addonsavailable}
			{include file="$template/includes/alert.tpl" type="info" msg="{lang key="clientAreaProductAddonsAvailable"}" textcenter=true}
		{/if}
		<div class="row">
			{foreach from=$addons item=addon}
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title"><i class="fas fa-puzzle-piece"></i>&nbsp;{$addon.name}<span class="label pull-right status-{$addon.rawstatus|strtolower}">{$addon.status}</span></h3>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-5 col-xs-6 text-right">
									<strong>{$LANG.recurringamount}</strong>
								</div>
								<div class="col-md-7 col-xs-6 text-left">
									{$addon.pricing}
								</div>
							</div>
							<div class="row">
								<div class="col-md-5 col-xs-6 text-right">
									<strong>{$LANG.registered}</strong>
								</div>
								<div class="col-md-7 col-xs-6 text-left">
									{$addon.regdate}
								</div>
							</div>
							<div class="row">
								<div class="col-md-5 col-xs-6 text-right">
									<strong>{$LANG.clientareahostingnextduedate}</strong>
								</div>
								<div class="col-md-7 col-xs-6 text-left">
									{$addon.nextduedate}
								</div>
							</div>
						</div>
                        {if $addon.managementActions}
                            <div class="panel-footer">
                                {$addon.managementActions}
                            </div>
                        {/if}
					</div>
				</div>
			{/foreach}
		</div>
	</div>
	<div class="tab-pane fade in" id="tabChangepw">
		{if $modulechangepwresult}
			{if $modulechangepwresult == "success"}
				{include file="$template/includes/alert.tpl" type="success" msg=$modulechangepasswordmessage textcenter=true}
			{elseif $modulechangepwresult == "error"}
				{include file="$template/includes/alert.tpl" type="error" msg=$modulechangepasswordmessage|strip_tags textcenter=true}
			{/if}
		{/if}
		<form class="using-password-strength" method="post" action="{$smarty.server.PHP_SELF}?action=productdetails#tabChangepw" role="form">
			<input type="hidden" name="id" value="{$id}" />
			<input type="hidden" name="modulechangepassword" value="true" />
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">{$LANG.serverchangepassword}</h3>
						</div>
						<div class="panel-body">
							<div id="newPassword1" class="form-group has-feedback">
								<label for="inputNewPassword1" class="control-label">{$LANG.newpassword}</label>
								<input type="password" class="form-control" id="inputNewPassword1" name="newpw" autocomplete="off" />
								<span class="form-control-feedback glyphicon"></span>
							</div>
							<div class="form-group">
								<button type="button" class="btn btn-sm btn-default generate-password" data-targetfields="inputNewPassword1,inputNewPassword2">
									{$LANG.generatePassword.btnLabel}
								</button>
								{include file="$template/includes/pwstrength.tpl" noDisable=true}
							</div>
							<div id="newPassword2" class="form-group has-feedback">
								<label for="inputNewPassword2" class="control-label">{$LANG.confirmnewpassword}</label>
								<input type="password" class="form-control" id="inputNewPassword2" name="confirmpw" autocomplete="off" />
								<span class="form-control-feedback glyphicon"></span>
								<div id="inputNewPassword2Msg">
								</div>
							</div>
						</div>
						<div class="panel-footer">
							<input class="btn btn-primary btn-3d res-100" type="submit" value="{$LANG.clientareasavechanges}" />
							<input class="btn btn-default pull-right res-left res-100" type="reset" value="{$LANG.cancel}" />
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
{if $itSSLCustomPurchaseUrl}
	<script>
		jQuery(document).ready(function() {
			jQuery(document).on('click', '.ssl-state.ssl-inactive', function(e) {
				e.preventDefault();
				window.location.href = "{$itSSLCustomPurchaseUrl}";
			});
		});
	</script>
{/if}
