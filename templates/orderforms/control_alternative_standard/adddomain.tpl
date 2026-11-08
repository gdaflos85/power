<div class="alert alert-warning">
	<strong>adddomain.tpl</strong>
</div>
{include file="orderforms/$carttpl/common.tpl"}
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
			<h1 class="h1">{if $domain eq "register"}{$LANG.registerdomain}{elseif $domain eq "transfer"}{$LANG.transferdomain}{/if}</h1>
			{if $domain == 'register'}
				<small class="res-left pull-right" style="margin: 12px 12px 20px 12px;">{$LANG.orderForm.findNewDomain}</small>
			{else}
				<small class="res-left pull-right" style="margin: 12px 12px 20px 12px;">{$LANG.orderForm.transferExistingDomain}</small>
			{/if}
		</div>
	</div>
	<!-- Display sidebar layout if applicable -->
	{if $itCartSidebarDisplay eq "enabled"}
		<div class="row cart-main-column">
			<div id="internal-content" class="{if $itCartSidebarDisplayMode eq "showhide"}col-md-12{else}col-md-9{/if} pull-md-left">
				{/if}
				<div class="row">
					<div class="col-md-12">
						<form method="post" action="cart.php" id="frmDomainSearch">
							<input type="hidden" name="a" value="domainoptions" />
							<input type="hidden" name="checktype" value="{$domain}" />
							<input type="hidden" name="ajax" value="1" />
							<div class="input-group input-group-lg input-group-box">
								<span class="input-group-addon" id="addwww">{lang key='orderForm.www'}</span>	
								<input type="text" name="sld" value="{$sld}" id="inputDomain" class="form-control" autocapitalize="none" />
								<div class="input-group-btn" id="tlddropdown">
									<button type="button" id="tldbutton" class="btn btn-default dropdown-toggle btn-square" data-toggle="dropdown"><span id="tldbtn">{$registertlds.0}</span> <span class="caret"></span></button>
									<ul class="dropdown-menu dropdown-menu-right">
										{foreach $registertlds as $listtld}
											<li class="text-right"><a href="#" onClick="document.getElementById('tld').value='{$listtld}'">{$listtld}</a></li>
                                        {/foreach}
									</ul>
									<button type="submit" id="btnCheckAvailability" class="btn btn-primary btn-cart-check-availability domain-check-availability">{$LANG.search}</button>
								</div>
							</div>	
							<select id="tld" name="tld" class="form-control" style="visibility: hidden;">
                                {if $domain == 'register'}
                                    {foreach $registertlds as $listtld}
                                        <option value="{$listtld}"{if $listtld eq $tld} selected="selected"{/if}>
                                            {$listtld}
                                        </option>
                                    {/foreach}
                                {else}
                                    {foreach $transfertlds as $listtld}
                                        <option value="{$listtld}"{if $listtld eq $tld} selected="selected"{/if}>
                                            {$listtld}
                                        </option>
                                    {/foreach}
                                {/if}
                            </select>
						</form>	
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
				        <form method="post" action="cart.php?a=add&domain={$domain}">
				            <div class="domain-search-results" id="domainSearchResults"></div>
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
{*
 * If we have availability results, then the form was submitted w/a domain.
 * Thus we want to do a search and show the results.
 *}
{if $availabilityresults}
    <script>
        jQuery(document).ready(function() {
            jQuery('#btnCheckAvailability').click();
        });
    </script>
{/if}