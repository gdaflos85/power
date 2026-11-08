{include file="orderforms/$carttpl/common.tpl"}
<!--main content start-->
<section id="main-content" class="cart control_standard products">
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
		<div class="row cart-main-column">
			<div id="internal-content" class="{if $itCartSidebarDisplayMode eq "showhide"}col-md-12{else}col-md-9{/if} pull-md-left">
				{/if}
				<div class="row">
					<div class="col-md-12">
						{if $errormessage}
							<div class="alert alert-danger">
								{$errormessage}
							</div>
						{elseif !$productGroup}
	                        <div class="alert alert-info">
	                            {lang key='orderForm.selectCategory'}
	                        </div>
	                    {/if}
					</div>
				</div>
				<div class="cart-products">
					<div class="row row-eq-height">
				        {foreach $products as $key => $product}
							<div class="{if $itCartNumberProductsPerRow eq "4"}col-md-3{elseif $itCartNumberProductsPerRow eq "3"}col-md-4{elseif $itCartNumberProductsPerRow eq "2"}col-md-6{else}col-md-12{/if}">
								<div class="panel {if $product.isFeatured}panel-solid-primary{else}panel-solid-default{/if} panel-product" id="product{$product@iteration}">
                                    {if $itCartNumberProductsPerRow eq "1"}
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
                                    {else}
                                        <div class="panel-heading">
                                            <h3 class="panel-title" id="product{$product@iteration}-name" data-key="sameHeights">{$product.name}</h3>
                                            <br />
                                            <div class="text-left product-price" data-key="sameHeights2">
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
                                        </div>
                                    {/if}
									<div class="panel-body" data-key="sameHeights3">
										{if $itCartFeatureHighlights eq "disabled"}
											{$product.description}
										{else}
											{if $product.featuresdesc}
												<p id="product{$product@iteration}-description" data-key="sameHeights5">
													{$product.featuresdesc}
												</p>
											{/if}
											<br />
											<div class="row">
	                                            {if $itCartNumberProductsPerRow eq "1"}
	                                                {foreach $product.features as $feature => $value}
	                                                    <div id="product{$product@iteration}-feature{$value@iteration}" class="col-md-4">
	                                                        <i class="fas blue fa-check"></i>&nbsp;&nbsp;
	                                                        <span class="feature-value"><strong>{$value}</strong></span>
	                                                        {$feature}
	                                                        <br />
	                                                        <br />
	                                                    </div>
	                                                {/foreach}
	                                            {else}
	                                                {foreach $product.features as $feature => $value}
	                                                    <div id="product{$product@iteration}-feature{$value@iteration}" class="col-md-12">
	                                                        <i class="fas blue fa-check"></i>&nbsp;&nbsp;
	                                                        <span class="feature-value"><strong>{$value}</strong></span>
	                                                        {$feature}
	                                                        <br />
	                                                        <br />
	                                                    </div>
	                                                {/foreach}
	                                            {/if}
											</div>
										{/if}
									</div>
									<div class="panel-footer" data-key="sameHeights4">
										<a href="{$WEB_ROOT}/cart.php?a=add&{if $product.bid}bid={$product.bid}{else}pid={$product.pid}{/if}" class="btn {if $product.isFeatured}btn-default{else}btn-primary{/if} btn-3d" id="product{$product@iteration}-order-button">
											<i class="fas fa-shopping-cart"></i>
											{$LANG.ordernowbutton}
										</a>
										{if $product.stockControlEnabled}
											<span class="qty pull-right text-right">
												{$product.qty}<br />{$LANG.orderavailable}
											</span>
										{/if}
									</div>
								</div>
							</div>
							{if not $product@last}
								{if $itCartNumberProductsPerRow eq "4"}
									{if $product@iteration is div by 4}
										<!-- div by 4 -->
										</div>
										<div class="row row-eq-height">
									{/if}
								{elseif $itCartNumberProductsPerRow eq "3"}
									{if $product@iteration is div by 3}
										<!-- div by 3 -->
										</div>
										<div class="row row-eq-height">
									{/if}
								{elseif $itCartNumberProductsPerRow eq "2"}
									{if $product@iteration is div by 2}
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
