{include file="orderforms/$carttpl/common.tpl"}
<script>
	var _localLang = {
		'addToCart': '{$LANG.orderForm.addToCart|escape}',
		'addedToCartRemove': '{$LANG.orderForm.addedToCartRemove|escape}'
	}
</script>
<!--main content start-->
<section id="main-content" class="cart">
	<!-- Display mobile sidebar alternative if applicable -->
	{if $itCartSidebarMobileDisplay eq "enabled"}
		<div class="row cat-col-row visible-xs visible-sm">
			<div class="col-md-12">
				{include file="orderforms/$carttpl/sidebar-categories-collapsed.tpl"}
			</div>
		</div>
	{/if}
	<!-- Display page title -->
	<div class="row">
		<div class="col-md-12">
			<!--breadcrumbs start -->
			{if $itCartSidebarDisplay eq "enabled"}
				{if $itCartSidebarDisplayMode eq "showhide"}
					{if $itTextDirectionRTL eq "enabled"}
						<div {if $itBreadcrumbDisplay eq "enabled"}style="position: absolute; left: 15px; margin-top: 5px;"{else}style="position: absolute; left: 15px; margin: -6px 0 20px 0;"{/if}>
						    <button type="button" class="btn btn-default btn-sm hidden-xs hidden-sm" {if $itCartSidebarDisplayMethod eq "squash"}id="btnSquashSidebar"{else}id="btnSlideSidebarRTL"{/if}>
						        <i class="fas fa-arrow-circle-left"></i>
						        {$LANG.showMenu}
						    </button>
						</div>
					{else}
						<div {if $itBreadcrumbDisplay eq "enabled"}style="position: absolute; right: 15px; margin-top: 5px;"{else}style="position: absolute; right: 15px; margin: -6px 0 20px 0;"{/if}>
						    <button type="button" class="btn btn-default btn-sm hidden-xs hidden-sm" {if $itCartSidebarDisplayMethod eq "squash"}id="btnSquashSidebar"{else}id="btnSlideSidebar"{/if}>
						        <i class="fas fa-arrow-circle-left"></i>
						        {$LANG.showMenu}
						    </button>
						</div>
					{/if}
				{/if}
			{/if}			
			{include file="$template/includes/breadcrumb.tpl"}
			<!--breadcrumbs end -->
			<h1 class="h1">{$LANG.cartdomainsconfig}</h1>
			<small class="res-left pull-right" style="margin: 12px 12px 20px 12px;">{$LANG.orderForm.reviewDomainAndAddons}</small>
		</div>
	</div>
	<!-- Display sidebar layout if applicable -->
	{if $itCartSidebarDisplay eq "enabled"}
		<div class="row cart-main-column">
			<div id="internal-content" class="{if $itCartSidebarDisplayMode eq "showhide"}col-md-12{else}col-md-9{/if} pull-md-left">
				{/if}
				<div class="row">
					<div class="col-md-12">
						<form method="post" action="{$smarty.server.PHP_SELF}?a=confdomains" id="frmConfigureDomains" class="form-horizontal">
			                <input type="hidden" name="update" value="true" />			
			                {if $errormessage}
			                    <div class="alert alert-danger" role="alert">
			                        <p>{$LANG.orderForm.correctErrors}:</p>
			                        <ul>
			                            {$errormessage}
			                        </ul>
			                    </div>
			                {/if}
			                {foreach $domains as $num => $domain}
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">	
											{$domain.domain}
										</h3>
									</div>
									<div class="panel-body">
										<div class="form-group">
				                            <label class="control-label col-md-3 label-pre-icheck">{$LANG.orderregperiod}</label>
					                        <div class="col-md-8 padding-top-cart">        
					                            {$domain.regperiod} {$LANG.orderyears}
					                        </div>
					                    </div>
					                    <br />
					                    <div class="form-group">
				                            <label class="control-label col-md-3 label-pre-icheck">{$LANG.hosting}</label>
					                        <div class="col-md-8 padding-top-cart">        
					                            {if $domain.hosting}<span class="label label-success">{$LANG.cartdomainshashosting}</span>{else}<a href="cart.php" class="label label-danger label-no-hosting">{$LANG.cartdomainsnohosting}</a>{/if}
					                        </div>
					                    </div>
										<br />            
					                    {if $domain.eppenabled}
						                    <div class="form-group">
					                            <label for="inputEppcode{$num}" class="control-label col-md-3">{$LANG.domaineppcode}</label>
												<div class="col-md-8 padding-top-cart">        
													<input type="text" name="epp[{$num}]" id="inputEppcode{$num}" value="{$domain.eppvalue}" class="form-control" placeholder="{$LANG.domaineppcode}" />
													<small>
					                                    {$LANG.domaineppcodedesc}
				                                    </small>
						                        </div>
						                    </div>
											<br />
					                    {/if}
					                    {if $domain.dnsmanagement || $domain.emailforwarding || $domain.idprotection}
					                        <div class="form-group addon-products">
					                            <label class="control-label col-md-3 label-pre-icheck">{$LANG.cartaddons}</label>
												<div class="col-md-8 padding-top-cart">
							                        {if $domain.dnsmanagement}
							                        	<div class="row">
								                        	<div class="col-xs-1">
									                        	<input type="checkbox" id="dnsmanagement[{$num}]" name="dnsmanagement[{$num}]"{if $domain.dnsmanagementselected} checked{/if} class="icheck domain-addon" />
								                        	</div>
								                        	<div class="col-xs-11">
									                        	<label for="dnsmanagement[{$num}]">
																	{$LANG.domaindnsmanagement} <span class="price">{$domain.dnsmanagementprice}<br />{$domain.regperiod} {$LANG.orderyears}</span>
																</label>
					                                            <small>{$LANG.domainaddonsdnsmanagementinfo}</small>
								                        	</div>
							                        	</div>
			                                            <br />
													{/if}
													{if $domain.idprotection}
														<div class="row">
								                        	<div class="col-xs-1">
			                                                	<input type="checkbox" id="idprotection[{$num}]" name="idprotection[{$num}]"{if $domain.idprotectionselected} checked{/if} class="icheck domain-addon" />
									                        </div>
								                        	<div class="col-xs-11">
									                        	<label for="idprotection[{$num}]">
									                        		{$LANG.domainidprotection} <span class="price">{$domain.idprotectionprice}<br />{$domain.regperiod} {$LANG.orderyears}</span>
									                        	</label>
									                        	<small>{$LANG.domainaddonsidprotectioninfo}</small>
									                        </div>
							                        	</div>
			                                            <br />
						                            {/if}
						                            {if $domain.emailforwarding}
						                            	<div class="row">
								                        	<div class="col-xs-1">
									                        	<input type="checkbox" id="emailforwarding[{$num}]" name="emailforwarding[{$num}]"{if $domain.emailforwardingselected} checked{/if} class="icheck domain-addon" />
									                        </div>
								                        	<div class="col-xs-11">
									                        	<label for="emailforwarding[{$num}]">
									                        		{$LANG.domainemailforwarding} <span class="price">{$domain.emailforwardingprice}<br />{$domain.regperiod} {$LANG.orderyears}</span>
									                        	</label>
									                        	<small>{$LANG.domainaddonsemailforwardinginfo}</small>
									                        </div>
							                        	</div>
			                                            <br />
						                            {/if}
						                        </div>
					                        </div>
					                    {/if}
					                    {foreach from=$domain.fields key=domainfieldname item=domainfield}
					                        <div class="form-group">
					                            <label class="control-label col-md-3">{$domainfieldname}</label>
												<div class="col-md-8">
						                            {$domainfield}
						                        </div>
					                        </div>
					                        <br />
					                    {/foreach}
									</div>
								</div>
			                {/foreach}
			                {if $atleastonenohosting}
			                	<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">	
											{$LANG.domainnameservers}
										</h3>
									</div>
									<div class="panel-body">
					                    <p>{$LANG.cartnameserversdesc}</p>
					                    <br />
			                            <div class="form-group">
			                                <label for="inputNs1" class="control-label col-md-3">{$LANG.domainnameserver1}</label>
					                        <div class="col-md-8">
				                                <input type="text" class="form-control" id="inputNs1" name="domainns1" value="{$domainns1}" />
					                        </div>
			                            </div>
			                            <br />
			                            <div class="form-group">
			                                <label for="inputNs2" class="control-label col-md-3">{$LANG.domainnameserver2}</label>
					                        <div class="col-md-8">
				                                <input type="text" class="form-control" id="inputNs2" name="domainns2" value="{$domainns2}" />
											</div>
			                            </div>
			                            <br />
			                            <div class="form-group">
			                                <label for="inputNs3" class="control-label col-md-3">{$LANG.domainnameserver3}</label>
					                        <div class="col-md-8">
				                                <input type="text" class="form-control" id="inputNs3" name="domainns3" value="{$domainns3}" />
											</div>
			                            </div>
			                            <br />
			                            <div class="form-group">
			                                <label for="inputNs1" class="control-label col-md-3">{$LANG.domainnameserver4}</label>
					                        <div class="col-md-8">
				                                <input type="text" class="form-control" id="inputNs4" name="domainns4" value="{$domainns4}" />
											</div>
			                            </div>
			                            <br />
			                            <div class="form-group">
			                                <label for="inputNs5" class="control-label col-md-3">{$LANG.domainnameserver5}</label>
					                        <div class="col-md-8">
			    	                            <input type="text" class="form-control" id="inputNs5" name="domainns5" value="{$domainns5}" />
											</div>
			                            </div>
									</div>
			                	</div>
			                {/if}
			                <div class="text-center">
				                <br />
			                    <button type="submit" class="btn btn-primary btn-3d btn-lg">
			                        {$LANG.continue}
			                        &nbsp;<i class="fas fa-arrow-circle-right"></i>
			                    </button>
			                </div>
			                <br />
			            </form>
					</div>
				</div>
				{if $itCartSidebarDisplay eq "enabled"}
			</div>
			<div class="col-md-3 pull-md-right whmcs-sidebar hidden-xs hidden-sm sidebar-secondary {if $itCartSidebarDisplayMode eq "showhide"}{if $itCartSidebarDisplayMethod eq "squash"}cart-sidebar-squash{else}cart-sidebar{/if}{/if}">
				{include file="orderforms/$carttpl/sidebar-categories.tpl"}
			</div>
			<div class="clearfix"></div>
		</div>
	{/if}
	<div class="clearfix"></div>
</section>
{include file="orderforms/$carttpl/icheck.tpl"}