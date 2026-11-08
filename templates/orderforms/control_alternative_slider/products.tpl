<link type="text/css" rel="stylesheet" href="{$BASE_PATH_CSS}/normalize.css" property="stylesheet">
<link type="text/css" rel="stylesheet" href="{assetPath file="ion.rangeSlider.css"}" property="stylesheet">
<link type="text/css" rel="stylesheet" href="{assetPath file="ion.rangeSlider.skinHTML5.css"}" property="stylesheet">
{if $itColorScheme eq "blue" or $itColorScheme eq "blue-solid" or $itColorScheme eq "blue-white"}
	<link type="text/css" rel="stylesheet" href="{assetPath file="style-blue.css"}" property="stylesheet">
{else}
	<link type="text/css" rel="stylesheet" href="{assetPath file="style.css"}" property="stylesheet">
{/if}
{include file="orderforms/$carttpl/common.tpl"}
<!--main content start-->
<section id="main-content" class="cart slider control_alternative_slider products">
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
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-body">
			                <div class="product-selector" style="direction: ltr;">
			                    <input type="text" id="product-selector" name="product-selector" value=""  title="product-selector"/>
			                </div>
							</div>
						</div>
		                {foreach $products as $key => $product}
		                    {$productId = ($product.pid) ? $product.pid : 'b'|cat:$product.bid}
		                    <div id="product{$productId}-container" class="product-container">
			                    <div class="row row-eq-height">
									<div class="col-md-12">
										<div class="panel panel-product panel-default panel-primary" id="product{$product@iteration}">
											<div class="panel-heading">
												<h3 class="panel-title pull-left" id="product{$product@iteration}-name">{$product.name}</h3>
												<div class="pull-right text-right blue product-price">
													{if $product.bid}
														{$LANG.bundledeal}&nbsp;&nbsp;
														{if $product.displayprice}
															<span class="price"><strong>{$product.displayprice}</strong></span>
														{/if}
													{else}
														{if $product.pricing.minprice.setupFee}
															<span class="pull-right text-right price-setup-fee">
																<span class="price">&#43;&nbsp; &nbsp;<strong>{$product.pricing.minprice.setupFee->toPrefixed()}</strong></span><br />
																<small>{$LANG.ordersetupfee}</small>
															</span>
			                                            {/if}
														<span class="pull-right text-right">
															{if $product.pricing.hasconfigoptions}
																<small><i>{$LANG.startingfrom}</i></small>&nbsp;&nbsp;
															{else}
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
														</span>
													{/if}
												</div>
												<div style="clear:both;"></div>
											</div>
											<div class="panel-body text-left">
												{if $itCartFeatureHighlights neq "disabled"}
													<br />
							                        <div id="product{$productId}-feature-container" class="feature-container">
														<div class="row">
															{foreach $product.features as $feature => $value}
																{$currentPercentages = $featurePercentages.$feature}
																<div id="product{$product@iteration}-feature{$value@iteration}" class="col-md-4">
																	<span class="pull-left">{$feature}</span>
																	<span class="feature-value pull-right"><strong>{$value}</strong></span>
																	<br />
																	<div class="progress small-progress">
					                                                    <div class="progress-bar" role="progressbar" aria-valuenow="{$currentPercentages.$key}" aria-valuemin="0" aria-valuemax="100" style="width: {$currentPercentages.$key}%;">
					                                                        <span class="sr-only">{$currentPercentages.$key}% Complete</span>
					                                                    </div>
					                                                </div>
																	<br />
																</div>
															{/foreach}
														</div>
							                        </div>
												{/if}
												<br />
												<div class="row">
													<div class="col-md-9">
														{if $itCartFeatureHighlights eq "disabled"}
															{$product.description}
														{else}
															{if count($product.features) > 0}
						                                        {if $product.featuresdesc}
						                                            <p id="product{$product@iteration}-description">
																		{$product.featuresdesc}
																	</p>
						                                        {/if}
						                                    {else}
						                                        <p id="product{$product@iteration}-description">
							                                        {$product.description}
						                                        </p>
						                                    {/if}
														{/if}
													</div>
													<div class="col-md-3 text-right">
														{if $product.qty eq "0"}
				                                            <span id="product{$productId}-unavailable" class="order-button unavailable">
				                                                {$LANG.outofstock}
				                                            </span>
				                                        {else}
				                                            <a href="{$WEB_ROOT}/cart.php?a=add&amp;{if $product.bid}bid={$product.bid}{else}pid={$product.pid}{/if}" class="btn btn-primary btn-lg btn-3d" id="product{$productId}-order-button">
				                                                {$LANG.ordernowbutton}
				                                            </a>
				                                        {/if}
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
		                    </div>
		                {/foreach}
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
<script type="text/javascript" src="{assetPath file="ion.rangeSlider.js"}"></script>
<script type="text/javascript">
    jQuery(document).ready(function(){
        var products = [],
            productList = [],
            startFrom = 0,
            startValue = null;
        {foreach $products as $product}
            products['{$product.name}'] = '{if $product.pid}{$product.pid}{else}b{$product.bid}{/if}';
            productList.push('{$product.name}');
            {if $pid}
                {if ($pid == $product.pid)}
                    startValue = '{$product.name}';
                    startFrom = productList.indexOf('{$product.name}');
                {/if}
            {else}
                {if $product.isFeatured && !isset($featuredProduct)}
                    {$featuredProduct = true}
                    startValue = '{$product.name}';
                    startFrom = productList.indexOf('{$product.name}');
                {/if}
            {/if}
        {/foreach}
        jQuery("#product-selector").ionRangeSlider({
            type: "single",
            min: 1,
            max: {count($products)},
            step: 1,
            grid: true,
            grid_snap: true,
            keyboard: true,
            force_edges: true,
            from: startFrom,
            {if count($products) == 1}
                disable: true,
            {else}
                onStart: function(data)
                {
                    if (startValue !== null) {
                        changeProduct(startValue);
                    } else {
                        changeProduct(data.from_value);
                    }

                },
                onChange: function (data)
                {
                    changeProduct(data.from_value);
                },
            {/if}
            values: productList
        });

        function changeProduct(productName) {
            var pid = products[productName];
            jQuery(".product-container").hide();
            jQuery("#product" + pid + "-container").show();
        }

        {if count($products) eq 1}
            jQuery(".irs-single").text(productList[0]);
            jQuery(".irs-grid-text").text('');
        {/if}
    });
</script>
