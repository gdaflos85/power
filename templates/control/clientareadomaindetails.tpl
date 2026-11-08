{if $registrarcustombuttonresult=="success"}
	{include file="$template/includes/alert.tpl" type="success" msg=$LANG.moduleactionsuccess textcenter=true}
{elseif $registrarcustombuttonresult}
	{include file="$template/includes/alert.tpl" type="error" msg=$LANG.moduleactionfailed textcenter=true}
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
        {if $alerts}
            {foreach $alerts as $alert}
                {include file="$template/includes/alert.tpl" type=$alert.type msg="<strong>{$alert.title}</strong><br>{$alert.description}" textcenter=true}
            {/foreach}
        {/if}
		{if $systemStatus != 'Active'}
			<div class="alert alert-warning text-center" role="alert">
				{$LANG.domainCannotBeManagedUnlessActive}
			</div>
		{/if}
		{if $lockstatus eq "unlocked"}
			{capture name="domainUnlockedMsg"}<strong>{$LANG.domaincurrentlyunlocked}</strong><br />{$LANG.domaincurrentlyunlockedexp}{/capture}
			{include file="$template/includes/alert.tpl" type="error" msg=$smarty.capture.domainUnlockedMsg}
		{/if}
		<!-- domain information -->
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$LANG.overview}</h3>
					</div>
					<div class="panel-body">
						<div class="pull-left"><strong>{$LANG.clientareahostingdomain}</strong></div>
						<div class="pull-right res-left"><span class="label status-{$rawstatus}">{$status}</span> {$domain}</div>
						<div style="clear: both;"></div>
						<hr />
						<div class="pull-left"><strong>{$LANG.firstpaymentamount}</strong></div>
						<div class="pull-right res-left">{$firstpaymentamount}</div>
						<div style="clear: both;"></div>
						<hr />
						<div class="pull-left"><strong>{$LANG.clientareahostingregdate}</strong></div>
						<div class="pull-right res-left">{$registrationdate}</div>
						<div style="clear: both;"></div>
						<hr />
						<div class="pull-left"><strong>{$LANG.recurringamount}</strong></div>
						<div class="pull-right res-left">{$recurringamount} {$LANG.every} {$registrationperiod} {$LANG.orderyears}</div>
						<div style="clear: both;"></div>
						<hr />
						<div class="pull-left"><strong>{$LANG.clientareahostingnextduedate}</strong></div>
						<div class="pull-right res-left">{$nextduedate}{if $canDomainBeManaged && $systemStatus == 'Active' && $renew}<br /><br /><a href="{routePath('domain-renewal', $domain)}" class="pull-right btn btn-sm btn-primary">{$LANG.domainsrenewnow}</a>{/if}</div>
						<div style="clear: both;"></div>
						<hr />
						<div class="pull-left"><strong>{$LANG.orderpaymentmethod}</strong></div>
						<div class="pull-right res-left">{$paymentmethod}</div>
						<div style="clear: both;"></div>
						{if $itSSLStatusClientareadomaindetails neq "disabled"}
	                        {if $sslStatus}
	                            <hr />
	                            <div class="pull-left {if $sslStatus->isInactive()} ssl-inactive{/if}"><strong>{$LANG.sslState.sslStatus}</strong></div>
	                            <div class="pull-right res-left">
									<img src="{$sslStatus->getImagePath()}" width="16" data-type="domain" data-domain="{$domain}" data-showlabel="1" class="{$sslStatus->getClass()}"/>
									<span id="statusDisplayLabel">
				                        {if !$sslStatus->needsResync()}
				                            {$sslStatus->getStatusDisplayLabel()}
				                        {else}
				                            {$LANG.loading}
				                        {/if}
				                    </span>
								</div>
	                            <div style="clear: both;"></div>
	                            {if $sslStatus->isActive() || $sslStatus->needsResync()}
	                                <div class="pull-left"><strong>{$LANG.sslState.startDate}</strong></div>
	                                <div class="pull-right res-left">
										<span id="ssl-startdate">
				                            {if !$sslStatus->needsResync() || $sslStatus->startDate}
				                                {$sslStatus->startDate->toClientDateFormat()}
				                            {else}
				                                {$LANG.loading}
				                            {/if}
				                        </span>
									</div>
	                                <div style="clear: both;"></div>
	                                <div class="pull-left "><strong>{$LANG.sslState.issuerName}</strong></div>
	                                <div class="pull-right res-left">
										<span id="ssl-issuer">
				                            {if !$sslStatus->needsResync() || $sslStatus->issuerName}
				                                {$sslStatus->issuerName}
				                            {else}
				                                {$LANG.loading}
				                            {/if}
				                        </span>
									</div>
	                                <div style="clear: both;"></div>
	                                <div class="pull-left "><strong>{$LANG.sslState.expiryDate}</strong></div>
	                                <div class="pull-right res-left">
										<span id="ssl-expirydate">
				                            {if !$sslStatus->needsResync() || $sslStatus->expiryDate}
				                                {$sslStatus->expiryDate->toClientDateFormat()}
				                            {else}
				                                {$LANG.loading}
				                            {/if}
				                        </span>
									</div>
	                                <div style="clear: both;"></div>
	                            {/if}
	                        {/if}
						{/if}
						{if $registrarclientarea}
							<hr />
							<div class="moduleoutput">
								{$registrarclientarea|replace:'modulebutton':'btn'}
							</div>
						{/if}
					</div>
				</div>
			</div>
		</div>
		{foreach $hookOutput as $output}
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							{$output}
						</div>
					</div>
				</div>
			</div>
		{/foreach}
		<!-- domain information end -->
	</div>
	<div class="tab-pane fade" id="tabAutorenew">
		<!-- domain auto renew -->
		{if $changeAutoRenewStatusSuccessful}
			{include file="$template/includes/alert.tpl" type="success" msg=$LANG.changessavedsuccessfully textcenter=true}
		{/if}
		<div class="row">
			<div class="col-md-12" id="autorenew">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$LANG.domainsautorenew}</h3>
					</div>
					<div class="panel-body">
						<p>{$LANG.domainrenewexp}</p>
						<div class="pull-left"><strong>{$LANG.domainautorenewstatus}</strong></div>
						<div class="pull-right res-left">{if $autorenew}<span class="label label-success">{$LANG.domainsautorenewenabled}</span>{else}<span class="label label-danger">{$LANG.domainsautorenewdisabled}</span>{/if}</div>
						<div style="clear: both;"></div>
					</div>
					<div class="panel-footer">
						<form method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails#tabAutorenew" class="form-horizontal">
							<input type="hidden" name="id" value="{$domainid}">
							<input type="hidden" name="sub" value="autorenew" />
							{if $autorenew}
								<input type="hidden" name="autorenew" value="disable">
								<input type="submit" class="btn btn-danger res-100" value="{$LANG.domainsautorenewdisable}" />
							{else}
								<input type="hidden" name="autorenew" value="enable">
								<input type="submit" class="btn btn-success res-100" value="{$LANG.domainsautorenewenable}" />
							{/if}
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- domain auto renew end -->
	</div>
	<div class="tab-pane fade" id="tabNameservers">
		<!-- domain name servers -->
		{if $nameservererror}
			{include file="$template/includes/alert.tpl" type="error" msg=$nameservererror textcenter=true}
		{/if}
		{if $subaction eq "savens"}
			{if $updatesuccess}
				{include file="$template/includes/alert.tpl" type="success" msg=$LANG.changessavedsuccessfully textcenter=true}
			{elseif $error}
				{include file="$template/includes/alert.tpl" type="error" msg=$error textcenter=true}
			{/if}
		{/if}
		<form method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails#tabNameservers" class="form-horizontal">
			<input type="hidden" name="id" value="{$domainid}" />
			<input type="hidden" name="sub" value="savens" />
			<div class="row" id="managedns">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">{$LANG.domainnameservers}</h3>
						</div>
						<div class="panel-body">
							<p>{$LANG.domainnsexp}</p>
							<p>
								<label class="radio-inline">
									<input type="radio" class="icheck" name="nschoice" value="default" onclick="disableFields('domnsinputs',true)" {if $defaultns} checked{/if} /> {$LANG.nschoicedefault}
								</label>
							</p>
							<p>
								<label class="radio-inline">
									<input type="radio" class="icheck" name="nschoice" value="custom" onclick="disableFields('domnsinputs',false)" {if !$defaultns} checked{/if} /> {$LANG.nschoicecustom}
								</label>
							</p>
							<br />
							<hr />
							<br />
							{for $num=1 to 5}
								<div class="form-group">
									<label for="inputNs{$num}" class="col-sm-2 control-label">{$LANG.clientareanameserver} {$num}</label>
									<div class="col-sm-8">
										<input type="text" name="ns{$num}" class="form-control domnsinputs" id="inputNs{$num}" value="{$nameservers[$num].value}" />
									</div>
								</div>
							{/for}
						</div>
						<div class="panel-footer">
							<input type="submit" class="btn btn-3d res-100 btn-primary" value="{$LANG.changenameservers}" />
						</div>
					</div>
				</div>
			</div>
		</form>
		<!-- domain name servers end -->
	</div>
	<div class="tab-pane fade" id="tabReglock">
		<!-- domain registrar lock -->
		{if $subaction eq "savereglock"}
			{if $updatesuccess}
				{include file="$template/includes/alert.tpl" type="success" msg=$LANG.changessavedsuccessfully textcenter=true}
			{elseif $error}
				{include file="$template/includes/alert.tpl" type="error" msg=$error textcenter=true}
			{/if}
		{/if}
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$LANG.domainregistrarlock}</h3>
					</div>
					<div class="panel-body">
						<p>{$LANG.domainlockingexp}</p>
						<div class="pull-left"><strong>{$LANG.domainreglockstatus}</strong></div>
						<div class="pull-right res-left">{if $lockstatus=="locked"}<span class="label label-success">{$LANG.domainsautorenewenabled}</span>{else}<span class="label label-danger">{$LANG.domainsautorenewdisabled}</span>{/if}</div>
						<div style="clear: both;"></div>
					</div>
					<div class="panel-footer">
						<form method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails#tabReglock">
							<input type="hidden" name="id" value="{$domainid}" />
							<input type="hidden" name="sub" value="savereglock" />
							{if $lockstatus=="locked"}
								<input type="submit" class="btn res-100 btn-3d btn-danger" value="{$LANG.domainreglockdisable}" />
							{else}
								<input type="submit" class="btn res-100 btn-3d btn-success" name="reglock" value="{$LANG.domainreglockenable}" />
							{/if}
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- domain registrar lock end -->
	</div>
	<div class="tab-pane fade" id="tabRelease">
		<!-- domain release -->
		<form method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails#tabRelease">
			<input type="hidden" name="sub" value="releasedomain">
			<input type="hidden" name="id" value="{$domainid}">
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">{$LANG.domainrelease}</h3>
						</div>
						<div class="panel-body">
							{if $releaseDomainSuccessful}
					            {include file="$template/includes/alert.tpl" type="success" msg="{lang key='changessavedsuccessfully'}" textcenter="true"}
					        {elseif !empty($error)}
					            {include file="$template/includes/alert.tpl" type="error" msg="$error" textcenter="true"}
					        {/if}
							<p>{$LANG.domainreleasedescription}</p>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="transtag">{$LANG.domainreleasetag}</label>
								<div class="col-sm-8">
									<input class="form-control" name="transtag" type="text" />
								</div>
							</div>
						</div>
						<div class="panel-footer">
							<input type="submit" value="{$LANG.domainrelease}" class="btn btn-3d res-100 btn-danger" />
						</div>
					</div>
				</div>
			</div>
		</form>
		<!-- domain release end -->
	</div>
	<div class="tab-pane fade" id="tabAddons">
		<!-- domain addons -->
		<div class="row" id="addons">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$LANG.domainaddons}</h3>
					</div>
					<div class="panel-body">
						<p>{$LANG.domainaddonsinfo}</p>
						{if $addons.idprotection}
							<hr />
							<div class="pull-left"><strong>{$LANG.domainidprotection}</strong></div>
							<div class="pull-right res-left">{if $addonstatus.idprotection}<span class="label label-success">{$LANG.domainsautorenewenabled}</span>{else}<span class="label label-danger">{$LANG.domainsautorenewdisabled}</span>{/if}</div>
							<div style="clear: both;"></div>
							<p>{$LANG.domainaddonsidprotectioninfo}</p>
							<form action="clientarea.php?action=domainaddons" method="post">
		                        <input type="hidden" name="id" value="{$domainid}"/>
		                        {if $addonstatus.idprotection}
		                            <input type="hidden" name="disable" value="idprotect"/>
		                            <input type="submit" value="{$LANG.disable}" class="btn btn-sm res-100 btn-danger"/>
		                        {else}
		                            <input type="hidden" name="buy" value="idprotect"/>
		                            <input type="submit" value="{$LANG.domainaddonsbuynow} {$addonspricing.idprotection}" class="btn btn-sm res-100 btn-success"/>
		                        {/if}
		                    </form>
						{/if}
						{if $addons.dnsmanagement}
							<hr />
							<div class="pull-left"><strong>{$LANG.domainaddonsdnsmanagement}</strong></div>
							<div class="pull-right res-left">{if $addonstatus.dnsmanagement}<span class="label label-success">{$LANG.domainsautorenewenabled}</span>{else}<span class="label label-danger">{$LANG.domainsautorenewdisabled}</span>{/if}</div>
							<div style="clear: both;"></div>
							<p>{$LANG.domainaddonsdnsmanagementinfo}</p>
		                    <form action="clientarea.php?action=domainaddons" method="post">
		                        <input type="hidden" name="id" value="{$domainid}"/>
		                        {if $addonstatus.dnsmanagement}
		                            <input type="hidden" name="disable" value="dnsmanagement"/>
		                            <a class="btn btn-primary btn-sm res-100" href="clientarea.php?action=domaindns&domainid={$domainid}">{$LANG.manage}</a>&nbsp;&nbsp;&nbsp;<input type="submit" value="{$LANG.disable}" class="btn btn-danger btn-sm res-100"/>
		                        {else}
		                            <input type="hidden" name="buy" value="dnsmanagement"/>
		                            <input type="submit" value="{$LANG.domainaddonsbuynow} {$addonspricing.dnsmanagement}" class="btn btn-success btn-sm res-100"/>
		                        {/if}
		                    </form>
						{/if}
						{if $addons.emailforwarding}
							<hr />
							<div class="pull-left"><strong>{$LANG.domainemailforwarding}</strong></div>
							<div class="pull-right res-left">{if $addonstatus.emailforwarding}<span class="label label-success">{$LANG.domainsautorenewenabled}</span>{else}<span class="label label-danger">{$LANG.domainsautorenewdisabled}</span>{/if}</div>
							<div style="clear: both;"></div>
							<p>{$LANG.domainaddonsemailforwardinginfo}</p>
		                    <form action="clientarea.php?action=domainaddons" method="post">
		                        <input type="hidden" name="id" value="{$domainid}"/>
		                        {if $addonstatus.emailforwarding}
		                            <input type="hidden" name="disable" value="emailfwd"/>
		                            <a class="btn btn-primary btn-sm res-100" href="clientarea.php?action=domainemailforwarding&domainid={$domainid}">{$LANG.manage}</a>&nbsp;&nbsp;&nbsp;<input type="submit" value="{$LANG.disable}" class="btn btn-danger btn-sm res-100"/>
		                        {else}
		                            <input type="hidden" name="buy" value="emailfwd"/>
		                            <input type="submit" value="{$LANG.domainaddonsbuynow} {$addonspricing.emailforwarding}" class="btn btn-success btn-sm res-100"/>
		                        {/if}
		                    </form>
						{/if}
					</div>
				</div>
			</div>
		</div>
		<!-- domain addons end -->
	</div>
</div>
{if $itSSLCustomPurchaseUrl}
	<script>
		jQuery(document).ready(function() {ldelim}
			jQuery(document).on('click', '.ssl-state.ssl-inactive', function(e) {ldelim}
				e.preventDefault();
				window.location.href = "{$itSSLCustomPurchaseUrl}";
			{rdelim});
		{rdelim});
	</script>
{/if}
