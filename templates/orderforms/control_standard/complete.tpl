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
			<h1 class="h1">{$LANG.orderconfirmation}</h1>
		</div>
	</div>
	<!-- Display sidebar layout if applicable -->
	{if $itCartSidebarDisplay eq "enabled"}
		<div class="row cart-main-column">
			<div id="internal-content" class="{if $itCartSidebarDisplayMode eq "showhide"}col-md-12{else}col-md-9{/if} pull-md-left">
				{/if}
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-success">
							<div class="panel-heading">
								<h3 class="panel-title">
									{$LANG.orderconfirmation}
								</h3>
							</div>
							<div class="panel-body">
								<p>{$LANG.orderreceived}</p>
			                    <p>{$LANG.ordernumberis} <span>{$ordernumber}</span></p>
					            <p>{$LANG.orderfinalinstructions}</p>
								{if $expressCheckoutInfo}
					                <div class="alert alert-info">
					                    {$expressCheckoutInfo}
					                </div>
					            {elseif $expressCheckoutError}
					                <div class="alert alert-danger">
					                    {$expressCheckoutError}
					                </div>
					            {elseif $invoiceid && !$ispaid}
					                <div class="alert alert-warning">
					                    {$LANG.ordercompletebutnotpaid}
					                    <br /><br />
					                    <a href="viewinvoice.php?id={$invoiceid}" target="_blank" class="alert-link">
					                        {$LANG.invoicenumber}{$invoiceid}
					                    </a>
					                </div>
					            {/if}
					            {foreach $addons_html as $addon_html}
					                <div class="order-confirmation-addon-output">
					                    {$addon_html}
					                </div>
					            {/foreach}
					            {if $ispaid}
					                <!-- Enter any HTML code which should be displayed when a user has completed checkout here -->
					                <!-- Common uses of this include conversion and affiliate tracking scripts -->
					            {/if}
					            <br />
					            <br />
					            <div class="text-center">
					                <a href="{$WEB_ROOT}/clientarea.php" class="btn btn-primary btn-3d">
					                    {$LANG.orderForm.continueToClientArea}
					                    &nbsp;<i class="fas fa-arrow-circle-right"></i>
					                </a>
					            </div>
							</div>
						</div>
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
