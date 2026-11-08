{if $itColorScheme eq "blue" or $itColorScheme eq "blue-solid" or $itColorScheme eq "blue-white"}
	<link type="text/css" rel="stylesheet" href="{$WEB_ROOT}/templates/orderforms/{$carttpl}/css/style-blue.css" property="stylesheet">
{else}
	<link type="text/css" rel="stylesheet" href="{$WEB_ROOT}/templates/orderforms/{$carttpl}/css/style.css" property="stylesheet">
{/if}
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
			<h1 class="h1">{$LANG.cartproductaddons}</h1>
			{if $productGroup.tagline}
				<small class="res-left pull-right" style="margin: 12px 12px 20px 12px;">{$productGroup.tagline}</small>
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
						{if $errormessage}
							<div class="alert alert-danger">
								{$errormessage}
							</div>
						{/if}
						{if count($addons) == 0}
							<br />
							<br />
							<div id="noAddons" class="alert alert-warning text-center" role="alert">
								{$LANG.cartproductaddonsnone}
							</div>
							<p class="text-center">
								<a href="{$WEB_ROOT}/clientarea.php" class="btn btn-default">
									<i class="fas fa-arrow-circle-left"></i>
									{$LANG.orderForm.returnToClientArea}
								</a>
							</p>
						{/if}
					</div>
				</div>
				<div class="cart-products">
                    <div class="row{if $itCartNumberAddonsPerRow neq "1"} row-eq-height{/if}">
					   {foreach $addons as $num => $addon}
							<div class="{if $itCartNumberAddonsPerRow eq "4"}col-md-3{elseif $itCartNumberAddonsPerRow eq "3"}col-md-4{elseif $itCartNumberAddonsPerRow eq "2"}col-md-6{else}col-md-12{/if}">
								<div class="panel panel-outline-default panel-product" id="product{$num}">
                                    {if $itCartNumberAddonsPerRow eq "1"}
                                        <div class="panel-heading">
                                            <h3 class="panel-title pull-left">{$addon.name}</h3>
                                            <div class="pull-right text-right blue product-price">
                                                {if $addon.free}
                                                    <span class="price pull-right text-right">
                                                        <strong>{$LANG.orderfree}</strong>
                                                    </span>
                                                {else}
                                                    {if $addon.setupfee}
                                                        <span class="pull-right text-right price-setup-fee">
                                                            <span class="price">&#43;&nbsp; &nbsp;<strong>{$addon.setupfee}</strong></span><br />
                                                            <small>{$LANG.ordersetupfee}</small>
                                                        </span>
                                                    {/if}
                                                    <span class="pull-right text-right">
                                                        <span class="price"><strong>{$addon.recurringamount}</strong></span><br />
                                                        <small>{$addon.billingcycle}</small>
                                                    </span>
                                                {/if}
                                            </div>
                                            <div style="clear:both;"></div>
                                        </div>
                                    {else}
                                        <div class="panel-heading">
                                            <h3 class="panel-title" data-key="sameHeights">{$addon.name}</h3>
                                            <br />
                                            <div class="text-left product-price" data-key="sameHeights2">
                                                {if $addon.free}
                                                    <span class="price"><strong>{$LANG.orderfree}</strong></span>
                                                {else}
                                                    <span class="price"><strong>{$addon.recurringamount}</strong></span><br />
                                                    <small>{$addon.billingcycle}</small>
                                                    {if $addon.setupfee}
                                                        <br /><br />
                                                        <small>&#43;&nbsp;<strong>{$addon.setupfee}</strong> {$LANG.ordersetupfee}</small>
                                                    {/if}
                                                {/if}
                                            </div>
                                        </div>
                                    {/if}
									<div class="panel-body"{if $itCartNumberAddonsPerRow neq "1"} data-key="sameHeights3"{/if}>
										<p{if $itCartNumberAddonsPerRow neq "1"} data-key="sameHeights5"{/if}>{$addon.description}</p>
									</div>
									<div class="panel-footer"{if $itCartNumberAddonsPerRow neq "1"} data-key="sameHeights4"{/if}>
										<!-- Button trigger modal -->
										<button type="button" class="btn btn-primary btn-3d" data-toggle="modal" data-target="#ProductModal{$num}">
											<i class="fas fa-shopping-cart"></i>
											{$LANG.ordernowbutton}
										</button>
									</div>
								</div>
							</div>
							<!-- Modal -->
							<form method="post" action="{$smarty.server.PHP_SELF}?a=add">
								<div class="modal fade" id="ProductModal{$num}" tabindex="-1" role="dialog" aria-labelledby="ModalLabel{$num}">
									<div class="modal-dialog" role="document">
								    	<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												<h4 class="modal-title" id="ModalLabel{$num}">{$addon.name} - {$LANG.orderchooseapackage}</h4>
											</div>
											<div class="modal-body">
												<input type="hidden" name="aid" value="{$addon.id}" />
				                                <div class="product-desc">
				                                    <div class="form-group">
					                                    <div class="row">
						                                    <div class="col-md-12">
						                                        <select name="productid" id="inputProductId{$num}" class="form-control">
						                                            {foreach $addon.productids as $product}
						                                                <option value="{$product.id}">
						                                                    {$product.product}{if $product.domain} - {$product.domain}{/if}
						                                                </option>
						                                            {/foreach}
						                                        </select>
						                                    </div>
					                                    </div>
				                                    </div>
				                                </div>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-primary btn-3d pull-left">
			                                        <i class="fas fa-shopping-cart"></i>
			                                        {$LANG.ordernowbutton}
			                                    </button>
												<button type="button" class="btn btn-default pull-right" data-dismiss="modal">{$LANG.cancel}</button>
											</div>
										</div>
									</div>
								</div>
	                        </form>
                            {if not $addon@last}
                                {if $itCartNumberAddonsPerRow eq "4"}
                                    {if $addon@iteration is div by 4}
                                        <!-- div by 4 -->
                                        </div>
                                        <div class="row row-eq-height">
                                    {/if}
                                {elseif $itCartNumberAddonsPerRow eq "3"}
                                    {if $addon@iteration is div by 3}
                                        <!-- div by 3 -->
                                        </div>
                                        <div class="row row-eq-height">
                                    {/if}
                                {elseif $itCartNumberAddonsPerRow eq "2"}
                                    {if $addon@iteration is div by 2}
                                        <!-- div by 2 -->
                                        </div>
                                        <div class="row row-eq-height">
                                    {/if}
                                {else}
                                    </div>
                                    <div class="row row-eq-height">
                                {/if}
                            {/if}
                        {/foreach}
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
<script type="text/javascript">
	if ('addEventListener' in window) {
	    window.addEventListener('resize', function(){
	        sameHeights('[data-key="sameHeights"]');
	        sameHeights('[data-key="sameHeights2"]');
	        sameHeights('[data-key="sameHeights3"]');
	        sameHeights('[data-key="sameHeights4"]');
	        sameHeights('[data-key="sameHeights5"]');
	    });
	    window.addEventListener('load', function(){
	        sameHeights('[data-key="sameHeights"]');
	        sameHeights('[data-key="sameHeights2"]');
	        sameHeights('[data-key="sameHeights3"]');
	        sameHeights('[data-key="sameHeights4"]');
	        sameHeights('[data-key="sameHeights5"]');
	    });
	}
</script>
