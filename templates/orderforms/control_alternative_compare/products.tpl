{include file="orderforms/$carttpl/common.tpl"}
<!--main content start-->
<section id="main-content" class="cart compare control_alternative_compare products">
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
			<h1 class="h1">{if $productGroup.headline}{$productGroup.headline}{else}{$productGroup.name}{/if}</h1>
			{if $productGroup.tagline}
			<small class="res-left pull-right" style="margin: 12px 12px 20px 12px;">{$productGroup.tagline}</small>
			{/if}
		</div>
	</div>
	<!-- Display sidebar layout if applicable -->
	{if $itCartSidebarDisplay eq "enabled"}
		<div class="row cart-main-column row-centered">
			<div id="internal-content" class="{if $itCartSidebarDisplayMode eq "showhide"}col-md-12{else}col-md-9{/if} pull-md-left">
				{/if}
				<div class="row">
					<div class="col-md-12">
						{if $errormessage}
							<div class="alert alert-danger">
								{$errormessage}
							</div>
						{/if}
					</div>
				</div>
				<div class="cart-products">
					<div class="row row-eq-height row-centered">

                        {if $itCartNumberProductsPerRow eq "3"}
                            <div class="col-md-10 col-md-offset-1">
                                <div class="row">
                        {else if $itCartNumberProductsPerRow eq "2"}
                            <div class="col-md-8 col-md-offset-2">
                                <div class="row">
                        {else if $itCartNumberProductsPerRow eq "1"}
                            <div class="col-md-6 col-md-offset-3">
                                <div class="row">
                        {/if}

						{foreach $products as $key => $product}
							<div class="{if $itCartNumberProductsPerRow eq "6"}col-md-2 col-sm-4{elseif $itCartNumberProductsPerRow eq "5"}col-md-prod-fifth col-sm-4{elseif $itCartNumberProductsPerRow eq "4"}col-md-3 col-sm-6{elseif $itCartNumberProductsPerRow eq "3"}col-md-4 col-sm-6{elseif $itCartNumberProductsPerRow eq "2"}col-md-6 col-sm-6{elseif $itCartNumberProductsPerRow eq "1"}col-md-12 col-sm-12{else}col-md-3 col-sm-6{/if} col-centered">
								<div class="panel {if $product.isFeatured}panel-default panel-primary{else}panel-default{/if} panel-product" id="product{$product@iteration}">
									<div class="panel-heading">
										<h3 class="panel-title text-center" data-key="sameHeights" id="product{$product@iteration}-name">{$product.name}</h3>
										<br />
										<div class="text-center product-price" data-key="sameHeights2">
											{if $product.bid}
												{$LANG.bundledeal}&nbsp;&nbsp;
												{if $product.displayprice}
													<span class="price"><strong>{$product.displayprice}</strong></span>
												{/if}
											{else}
												{if $product.pricing.hasconfigoptions}
													<small><i>{$LANG.startingfrom}</i></small>&nbsp;&nbsp;
												{else}
													<small><i>&nbsp;</i></small>
													<br />
												{/if}
												<span class="price"><strong>{$product.pricing.minprice.price}</strong></span><br />
												<small>
													{if $product.pricing.minprice.cycle eq "monthly"}
														{$LANG.orderpaymenttermmonthly}
													{elseif $product.pricing.minprice.cycle eq "quarterly"}
														{$LANG.orderpaymenttermquarterly}
													{elseif $product.pricing.minprice.cycle eq "semiannually"}
														{$LANG.orderpaymenttermsemiannually}
													{elseif $product.pricing.minprice.cycle eq "annually"}
														{$LANG.orderpaymenttermannually}
													{elseif $product.pricing.minprice.cycle eq "biennially"}
														{$LANG.orderpaymenttermbiennially}
													{elseif $product.pricing.minprice.cycle eq "triennially"}
														{$LANG.orderpaymenttermtriennially}
													{/if}
												</small>
												{if $product.pricing.minprice.setupFee}
													<br /><br />
													<small>&#43;&nbsp;<strong>{$product.pricing.minprice.setupFee->toPrefixed()}</strong> {$LANG.ordersetupfee}</small>
	                                            {/if}
											{/if}
										</div>
										<div style="clear:both;"></div>
									</div>
									<div class="panel-body text-center" data-key="sameHeights3">
										{if $itCartFeatureHighlights eq "disabled"}
											{$product.description}

										{else}
											{if $product.featuresdesc}
												<p id="product{$product@iteration}-description" class="text-center" data-key="sameHeights5">
													{$product.featuresdesc}
												</p>
											{/if}
											<br />
											<div class="row">
												{foreach $product.features as $feature => $value}
													<p id="product{$product@iteration}-feature{$value@iteration}">
														<span class="feature-value"><strong>{$value}</strong></span>
														{$feature}
														<br />
													</p>
												{/foreach}
											</div>
										{/if}
									</div>
									<div class="panel-footer text-center" data-key="sameHeights4">
										<a href="{$WEB_ROOT}/cart.php?a=add&{if $product.bid}bid={$product.bid}{else}pid={$product.pid}{/if}" class="btn btn-primary btn-3d {if $products|@count gt 4}btn-sm{/if}" id="product{$product@iteration}-order-button">
											<i class="fas fa-shopping-cart"></i>
											{$LANG.ordernowbutton}
										</a>
										{if $product.stockControlEnabled}
											<br />
											<span class="qty">
												{$product.qty} {$LANG.orderavailable}
											</span>
										{/if}
									</div>
								</div>
							</div>
						{/foreach}

                        {if $itCartNumberProductsPerRow eq "3" or $itCartNumberProductsPerRow eq "2" or $itCartNumberProductsPerRow eq "1"}
                                </div>
                            </div>
                        {/if}
					</div>
					{if count($productGroup.features) > 0}
		                <div class="group-features text-left">
			                <div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h3 class="panel-title pg-feat-title">{$LANG.orderForm.includedWithPlans}</h3>
										</div>
										<div class="panel-body">
											<div class="row">
						                        {foreach $productGroup.features as $features}
						                        	<div id="product{$product@iteration}-feature{$value@iteration}" class="col-md-4">
														<i class="fas blue fa-check"></i>&nbsp;&nbsp;
														{$features.feature}
														<br />
													</div>
						                        {/foreach}
											</div>
										</div>
									</div>
								</div>
			                </div>
		                </div>
		            {/if}
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
