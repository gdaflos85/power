<script>
	// Define state tab index value
	var statesTab = 10;
	var stateNotRequired = true;
</script>
<script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
{include file="orderforms/$carttpl/common.tpl"}
<!--main content start-->
<section id="main-content" class="invoice cart">
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
			<h1 class="h1">{$LANG.cartreviewcheckout}</h1>
		</div>
	</div>
	<!-- Display sidebar layout if applicable -->
	{if $itCartSidebarDisplay eq "enabled"}
		<div class="row cart-main-column">
			<div id="internal-content" class="{if $itCartSidebarDisplayMode eq "showhide"}col-md-12{else}col-md-9{/if} pull-md-left">
				{/if}
				<div class="row">
					<div class="col-md-12">
						{if $cartitems == 0}
							<div class="alert alert-warning text-center" role="alert">
								<p>{$LANG.cartempty}</p>
							</div>
							<div class="text-center">
								<a href="cart.php" class="btn btn-primary btn-3d" id="continueShopping">
									{$LANG.orderForm.continueShopping}
									<i class="fas fa-arrow-right"></i>
								</a>
								<br />
								<br />
							</div>
						{else}
							{if $promoerrormessage}
								<div class="alert alert-warning text-center" role="alert">
									{$promoerrormessage}
								</div>
							{elseif $errormessage}
								<div class="alert alert-danger" role="alert">
									<p>{$LANG.orderForm.correctErrors}:</p>
									<ul>
										{$errormessage}
									</ul>
								</div>
							{elseif $promotioncode && $rawdiscount eq "0.00"}
								<div class="alert alert-info text-center" role="alert">
									{$LANG.promoappliedbutnodiscount}
								</div>
							{elseif $promoaddedsuccess}
								<div class="alert alert-success text-center" role="alert">
									{$LANG.orderForm.promotionAccepted}
								</div>
							{/if}
							{if $bundlewarnings}
								<div class="alert alert-warning" role="alert">
									<strong>{$LANG.bundlereqsnotmet}</strong><br />
									<ul>
										{foreach from=$bundlewarnings item=warning}
											<li>{$warning}</li>
										{/foreach}
									</ul>
								</div>
							{/if}
							<form method="post" action="{$smarty.server.PHP_SELF}?a=view">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">
											{$LANG.ordersummary}
										</h3>
									</div>
									<div class="panel-body-view-cart">
										<div class="view-cart-items-header">
											<div class="row">
												<div class="col-xs-7">
													{$LANG.orderForm.productOptions}
												</div>
												{if $showqtyoptions}
													<div class="col-md-2 hidden-sm hidden-xs text-right">
														{$LANG.orderForm.qty}
													</div>
												{/if}
												<div class="{if $showqtyoptions}col-md-3{else}col-md-5{/if} col-xs-5 text-right">
													{$LANG.orderForm.priceCycle}
												</div>
											</div>
										</div>
										<div class="view-cart-items-body">

											{foreach $products as $num => $product}
												<div class="item item-product{if $product.addons} has-addons{/if}">
													<div class="row">
														<div class="col-md-5 col-xs-12 item-details">
															<span class="item-title">
																<strong>{$product.productinfo.name}</strong>
															</span>
															<br />
															<span class="item-group">
																{$product.productinfo.groupname}
															</span>
															{if $product.domain}
																<br />
																<span class="item-domain">
																	{$product.domain}
																</span>
															{/if}
															{if $product.configoptions}
																<small>
																	<br />
																	{foreach key=confnum item=configoption from=$product.configoptions}
																		&nbsp;&raquo; {$configoption.name}: {if $configoption.type eq 1 || $configoption.type eq 2}{$configoption.option}{elseif $configoption.type eq 3}{if $configoption.qty}{$configoption.option}{else}{$LANG.no}{/if}{elseif $configoption.type eq 4}{$configoption.qty} x {$configoption.option}{/if}<br />
																	{/foreach}
																</small>
															{/if}
														</div>
														<div class="col-md-2 col-xs-12 product-actions">
															<a href="{$smarty.server.PHP_SELF}?a=confproduct&i={$num}" class="btn btn-link btn-xs">
																<i class="fas fa-fw fa-pencil-alt"></i>
																{$LANG.orderForm.edit}
															</a>
															<br />
															<button type="button" class="btn btn-link btn-xs" onclick="removeItem('p','{$num}')">
																<i class="fas fa-fw fa-times"></i>
																{$LANG.orderForm.remove}
															</button>
														</div>
														{if $showqtyoptions}
															<div class="col-md-2 col-xs-5 item-qty">
																{if $product.allowqty}
																	<input type="number" name="qty[{$num}]" value="{$product.qty}" class="form-control text-center" min="0" />
																	<button type="submit" class="btn btn-default btn-xs">
																		{$LANG.orderForm.update}
																	</button>
																{/if}
															</div>
														{/if}
														<div class="{if $showqtyoptions}col-md-3 col-xs-7{else}col-md-3 col-md-offset-2 col-xs-12{/if} item-price text-right">
															<span>{$product.pricing.totalTodayExcludingTaxSetup}</span><br />
															<span class="cycle">{$product.billingcyclefriendly}</span><br />
															{if $product.pricing.productonlysetup}
																<br />
																<span class="setup-price">&#43; {$product.pricing.productonlysetup->toPrefixed()}</span><br />
																<span class="cycle">{$LANG.ordersetupfee}</span><br />
															{/if}
															{if $product.proratadate}<br />({$LANG.orderprorata} {$product.proratadate})<br />{/if}
														</div>
													</div>
												</div>

												{foreach $product.addons as $addonnum => $addon name=prodadd}
													<div class="item item-product-addon{if $smarty.foreach.prodadd.last} last{/if}">
														<div class="row">
															<div class="col-md-7 col-xs-12 item-details">
																<span class="item-title">
																	<strong>{$addon.name}</strong>
																</span>
																<br />
																<span class="item-group">
																		{$LANG.orderaddon}
																</span>
															</div>
															{if $showAddonQtyOptions}
																<div class="col-md-2 col-xs-5 item-qty">
																	{if $addon.allowqty === 2}
																		<input type="number" name="paddonqty[{$num}][{$addonnum}]" value="{$addon.qty}" class="form-control text-center" min="0" />
																		<button type="submit" class="btn btn-xs">
																			{$LANG.orderForm.update}
																		</button>
																	{/if}
																</div>
															{/if}
															<div class="{if $showAddonQtyOptions}col-md-3 col-xs-7{else}col-md-3 col-md-offset-2 col-xs-12{/if} item-price text-right">
																<span>{$addon.totaltoday}</span><br />
																<span class="cycle">{$addon.billingcyclefriendly}</span><br />
																{if $addon.setup}
																   <br />
																   <span class="setup-price">&#43; {$addon.setup->toPrefixed()}</span><br />
																   <span class="cycle">{$LANG.ordersetupfee} {if $addon.isProrated} ({$LANG.orderprorata} {$addon.prorataDate}){/if}</span><br />
																{/if}
															</div>
														</div>
													</div>
												{/foreach}
											{/foreach}

											{foreach $addons as $num => $addon}
												<div class="item item-addon">
													<div class="row">
														<div class="col-md-5 col-xs-12 item-details">
															<span class="item-title">
																<strong>{$addon.name}</strong>
															</span>
															<br />
															<span class="item-group">
																{$addon.productname}
															</span>
															{if $addon.domainname}
																<br />
																<span class="item-domain">
																	{$addon.domainname}
																</span>
															{/if}
														</div>
														<div class="col-md-2 col-xs-12 product-actions">
															<button type="button" class="btn btn-link btn-xs" onclick="removeItem('a','{$num}')">
																<i class="fas fa-times"></i>
																{$LANG.orderForm.remove}
															</button>
														</div>
														{if $showAddonQtyOptions}
														   <div class="col-md-2 col-xs-5 item-qty">
																{if $addon.allowqty === 2}
																	<input type="number" name="addonqty[{$num}]" value="{$addon.qty}" class="form-control text-center" min="0" />
																	<button type="submit" class="btn btn-xs">
																		{$LANG.orderForm.update}
																	</button>
																{/if}
															</div>
														{/if}
													   <div class="{if $showAddonQtyOptions}col-md-3 col-xs-7{else}col-md-3 col-md-offset-2 col-xs-12{/if} item-price text-right">
														   {if $addon.setup}
															   <span>{$addon.pricingtext|substr:0:($addon.pricingtext|strpos:"+"-1)}</span><br />
														   {else}
															   <span>{$addon.pricingtext}</span><br />
														   {/if}
														   <span class="cycle">{$addon.billingcyclefriendly}</span><br />
														   {if $addon.setup}
															   <br />
															   <span class="setup-price">&#43; {$addon.setup}</span><br />
															   <span class="cycle">{$LANG.ordersetupfee}</span><br />
														   {/if}
														</div>
													</div>
												</div>
											{/foreach}

											{foreach $domains as $num => $domain}
												<div class="item item-domain">
													<div class="row">
														<div class="col-md-5 col-xs-12 item-details">
															<span class="item-title">
																<strong>{if $domain.type eq "register"}{$LANG.orderdomainregistration}{else}{$LANG.orderdomaintransfer}{/if}</strong>
															</span>
															{if $domain.domain}
																<br />
																<span class="item-domain">
																	{$domain.domain}
																</span>
															{/if}
															<span class="domain-details">
																{if $domain.dnsmanagement}<br /><i class="fas fa-check"></i> {$LANG.domaindnsmanagement}{/if}
																{if $domain.emailforwarding}<br /><i class="fas fa-check"></i> {$LANG.domainemailforwarding}{/if}
																{if $domain.idprotection}<br /><i class="fas fa-check"></i> {$LANG.domainidprotection}{/if}
															</span>
														</div>
														<div class="col-md-2 col-xs-12 product-actions">
															<a href="{$smarty.server.PHP_SELF}?a=confdomains" class="btn btn-link btn-xs">
																<i class="fas fa-pencil-alt"></i>
																{$LANG.orderForm.edit}
															</a>
															<br />
															<button type="button" class="btn btn-link btn-xs btn-remove-from-cart" onclick="removeItem('d','{$num}')">
																<i class="fas fa-times"></i>
																{$LANG.orderForm.remove}
															</button>
														</div>
														<div class="col-md-3 col-md-offset-2 col-xs-12 item-price text-right">
															{if count($domain.pricing) == 1 || $domain.type == 'transfer'}
																<span name="{$domain.domain}Price">{$domain.price}</span><br />
																<span class="cycle">{$domain.regperiod} {$domain.yearsLanguage}</span><br /><br />
																{*
																{if isset($domain.renewprice)}

																	<span class="renewal-price">{$domain.renewprice}</span><br />
																	<span class="renewal-cycle">{$domain.renewalPeriod} {$domain.renewalPeriodYearsLang}</span>
																{/if}
																*}
																<span class="renewal cycle">
																	{if isset($domain.renewprice)}
																		{lang key='domainrenewalprice'} <span class="renewal-price cycle">{$domain.renewprice->toPrefixed()}{$domain.shortRenewalYearsLanguage}</span>
																	{/if}
																</span>
																<br />

															{else}
																<span name="{$domain.domain}Price">{$domain.price}</span><br />
																<div class="dropdown">
																	<button class="btn btn-default btn-xs dropdown-toggle" type="button" id="{$domain.domain}Pricing" name="{$domain.domain}Pricing" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
																		{$domain.regperiod} {$domain.yearsLanguage}
																		<span class="caret"></span>
																	</button>
																	<ul class="dropdown-menu dropdown-menu-right" aria-labelledby="{$domain.domain}Pricing">
																		{foreach $domain.pricing as $years => $price}
																			<li>
																				<a class="text-right" href="#" onclick="selectDomainPeriodInCart('{$domain.domain}', '{$price.register}', {$years}, '{if $years == 1}{lang key='orderForm.year'}{else}{lang key='orderForm.years'}{/if}');return false;">
																					{$years} {if $years == 1}{lang key='orderForm.year'}{else}{lang key='orderForm.years'}{/if} @ {$price.register}
																				</a>
																			</li>
																		{/foreach}
																	</ul>
																</div>
																<br /><br />
																<span class="renewal cycle">
																	{if isset($domain.renewprice)}
																		{lang key='domainrenewalprice'} <span class="renewal-price cycle">{$domain.renewprice->toPrefixed()}{$domain.shortRenewalYearsLanguage}</span>
																	{/if}
																</span>
																<br />
															{/if}
														</div>
													</div>
												</div>
											{/foreach}

											{foreach $renewals as $num => $domain}
												<div class="item item-renewal">
													<div class="row">
														<div class="col-md-5 col-xs-12 item-details">
															<span class="item-title">
																<strong>{$LANG.domainrenewal}</strong>
															</span>
															<br />
															<span class="item-domain">
																{$domain.domain}
															</span>
															<span class="domain-details">
																{if $domain.dnsmanagement}<br /><i class="fas fa-check"></i> {$LANG.domaindnsmanagement}{/if}
																{if $domain.emailforwarding}<br /><i class="fas fa-check"></i> {$LANG.domainemailforwarding}{/if}
																{if $domain.idprotection}<br /><i class="fas fa-check"></i> {$LANG.domainidprotection}{/if}
															</span>
														</div>
														<div class="col-md-2 col-xs-12 product-actions">
															<button type="button" class="btn btn-link btn-xs btn-remove-from-cart" onclick="removeItem('r','{$num}')">
																<i class="fas fa-times"></i>
																{$LANG.orderForm.remove}
															</button>
														</div>
														<div class="col-md-3 col-md-offset-2 col-xs-12 item-price text-right">
															<span>{$domain.price}</span><br />
															<span class="cycle">{$domain.regperiod} {$LANG.orderyears}</span><br />
														</div>

													</div>
												</div>
											{/foreach}

											{foreach $upgrades as $num => $upgrade}
												<div class="item item-upgrade">
													<div class="row">
														<div class="col-md-5 col-xs-12 item-details">
															<span class="item-title">
																<strong>{$LANG.upgrade}</strong>
															</span>
															<br />
															<span class="item-group">
																{if $upgrade->type == 'service'}
																	{$upgrade->originalProduct->productGroup->name}<br>{$upgrade->originalProduct->name} => {$upgrade->newProduct->name}
																{elseif $upgrade->type == 'addon'}
																	{$upgrade->originalAddon->name} => {$upgrade->newAddon->name}
																{/if}
															</span>
															<br />
															<span class="item-domain">
																{if $upgrade->type == 'service'}
																	{$upgrade->service->domain}
																{/if}
															</span>
														</div>
														<div class="col-md-2 col-xs-12 product-actions">
															<button type="button" class="btn btn-link btn-xs btn-remove-from-cart" onclick="removeItem('u','{$num}')">
																<i class="fas fa-times"></i>
																{$LANG.orderForm.remove}
															</button>
														</div>
														{if $showUpgradeQtyOptions}
															 <div class="col-md-2 col-xs-5 item-qty">
																{if $upgrade->allowMultipleQuantities}
																	<input type="number" name="upgradeqty[{$num}]" value="{$upgrade->qty}" class="form-control text-center" min="{$upgrade->minimumQuantity}" />
																	<button type="submit" class="btn btn-xs">
																		{$LANG.orderForm.update}
																	</button>
																{/if}
															</div>
														{/if}
														<div class="{if $showUpgradeQtyOptions}col-md-3 col-xs-7{else}col-md-3 col-md-offset-2 col-xs-12{/if} item-price text-right">
															<span>{$upgrade->newRecurringAmount}</span><br />
															<span class="cycle">{$upgrade->localisedNewCycle}</span>
														</div>
													</div>
													{if $upgrade->totalDaysInCycle > 0}
														<div class="row row-upgrade-credit">
															<div class="col-md-7 col-xs-12 item-details">
																<span class="item-group">
																	{$LANG.upgradeCredit}
																</span>
																<br/>
																<div class="upgrade-calc-msg">
																	{lang key="upgradeCreditDescription" daysRemaining=$upgrade->daysRemaining totalDays=$upgrade->totalDaysInCycle}
																</div>
															</div>
															<div class="col-md-3 col-md-offset-2 col-xs-12 item-price text-right">
																<span>- {$upgrade->creditAmount}</span>
															</div>
														</div>
													{/if}
												</div>
											{/foreach}

										</div>
										<div class="view-cart-totals">

											{if $promotioncode || $taxrate || $taxrate2}
												<div class="sub-total">
													<div class="row">
														<div class="col-md-9">
															<span><strong>{$LANG.ordersubtotal}</strong></span>
														</div>
														<div class="col-md-3 text-right">
															<strong><span id="subtotal">{$subtotal}</span></strong>
														</div>
													</div>
												</div>

												<div class="tax-promo-wrapper">

													{if $promotioncode}
														<div class="promotion-code">
															<div class="row">
																<div class="col-md-5 col-xs-12">
																	<span><strong>{$LANG.orderpromotioncode}</strong></span>
																	<br />
																	<span>{$promotiondescription}</span>
																</div>
																<div class="col-md-2 col-xs-12 product-actions">
																	<button type="button" class="btn btn-xs btn-link" id="btnPromoCodeRemove">
																		<i class="fas fa-times"></i>
																		{$LANG.orderForm.remove}
																	</button>
																</div>
																<div class="col-md-3 col-md-offset-2 text-right">
																	<strong>- <span id="discount">{$discount}</span></strong>
																</div>
															</div>
														</div>
													{/if}

													{if $taxrate}
														<div class="tax-1">
															<div class="row">
																<div class="col-md-9">
																	<span><strong>{$taxname} @ {$taxrate}%</strong></span>
																</div>
																<div class="col-md-3 text-right">
																	<span id="taxTotal1">{$taxtotal}</span>
																</div>
															</div>
														</div>
													{/if}

													{if $taxrate2}
														<div class="tax-2">
															<div class="row">
																<div class="col-md-9">
																	<span><strong>{$taxname2} @ {$taxrate2}%</strong></span>
																</div>
																<div class="col-md-3 text-right">
																	<span id="taxTotal2">{$taxtotal2}</span>
																</div>
															</div>
														</div>
													{/if}

												</div>

											{/if}

											<div class="total">
												<div class="row">
													<div class="col-md-9">
														<span><strong>{$LANG.ordertotalduetoday}</strong></span>
													</div>
													<div class="col-md-3 text-right">
														<strong><span id="totalDueToday">{$total}</span></strong>
													</div>
												</div>
											</div>

											{if $totalrecurringmonthly || $totalrecurringquarterly || $totalrecurringsemiannually || $totalrecurringannually || $totalrecurringbiennially || $totalrecurringtriennially }

												<div class="recurring-wrapper">

													<div id="recurringMonthly" class="recurring" {if !$totalrecurringmonthly}style="display:none;"{/if}>
														<div class="row">
															<div class="col-md-9">
																<span>{$LANG.orderpaymenttermmonthly} {$LANG.cartrecurringcharges}</span>
															</div>
															<div class="col-md-3 text-right">
																<span class="cost">{$totalrecurringmonthly}</span>
															</div>
														</div>
													</div>

													<div id="recurringQuarterly" class="recurring" {if !$totalrecurringquarterly}style="display:none;"{/if}>
														<div class="row">
															<div class="col-md-9">
																<span>{$LANG.orderpaymenttermquarterly} {$LANG.cartrecurringcharges}</span>
															</div>
															<div class="col-md-3 text-right">
																<span class="cost">{$totalrecurringquarterly}</span>
															</div>
														</div>
													</div>

													<div id="recurringSemiAnnually" class="recurring" {if !$totalrecurringsemiannually}style="display:none;"{/if}>
														<div class="row">
															<div class="col-md-9">
																<span>{$LANG.orderpaymenttermsemiannually} {$LANG.cartrecurringcharges}</span>
															</div>
															<div class="col-md-3 text-right">
																<span class="cost">{$totalrecurringsemiannually}</span>
															</div>
														</div>
													</div>

													<div id="recurringAnnually" class="recurring" {if !$totalrecurringannually}style="display:none;"{/if}>
														<div class="row">
															<div class="col-md-9">
																<span>{$LANG.orderpaymenttermannually} {$LANG.cartrecurringcharges}</span>
															</div>
															<div class="col-md-3 text-right">
																<span class="cost">{$totalrecurringannually}</span>
															</div>
														</div>
													</div>

													<div id="recurringBiennially" class="recurring" {if !$totalrecurringbiennially}style="display:none;"{/if}>
														<div class="row">
															<div class="col-md-9">
																<span>{$LANG.orderpaymenttermbiennially} {$LANG.cartrecurringcharges}</span>
															</div>
															<div class="col-md-3 text-right">
																<span class="cost">{$totalrecurringbiennially}</span>
															</div>
														</div>
													</div>

													<div id="recurringTriennially" class="recurring" {if !$totalrecurringtriennially}style="display:none;"{/if}>
														<div class="row">
															<div class="col-md-9">
																<span>{$LANG.orderpaymenttermtriennially} {$LANG.cartrecurringcharges}</span>
															</div>
															<div class="col-md-3 text-right">
																<span class="cost">{$totalrecurringtriennially}</span>
															</div>
														</div>
													</div>

												</div>

											{/if}

										</div>
									</div>
								</div>
							</form>
                            {foreach $hookOutput as $output}
                                <div>
                                    {$output}
                                </div>
                            {/foreach}
							<br />
							{if $expressCheckoutButtons}
								<div class="row">
									<div class="col-sm-12">
										<div class="express-checkout-buttons-oc text-center">
											{foreach $expressCheckoutButtons as $checkoutButton}
												<div class="express-checkout-button-container-oc">
													{$checkoutButton}
												</div>
											{/foreach}
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<div class="express-checkout-button-separator-oc">
											- {$LANG.or|strtoupper} -
										</div>
									</div>
								</div>
							{/if}
							<div class="row">
								<div class="col-md-12 text-center">
									<br />
									<a href="cart.php?a=checkout&e=false" class="btn btn-3d btn-lg btn-primary" id="checkout">
										{$LANG.orderForm.checkout}
										<i class="fas fa-arrow-right"></i>
									</a>
									<br />
									<br />
									<br />
									<br />
								</div>
							</div>
							<div class="row">
								<div class="{if $taxenabled && !$loggedin}col-md-3{else}col-md-4{/if} text-center">
									<a href="cart.php" class="btn btn-link btn-continue-shopping" id="continueShopping">
										<i class="fas fa-cart-plus"></i>
										{$LANG.orderForm.continueShopping}
									</a>
								</div>
								<div class="{if $taxenabled && !$loggedin}col-md-3{else}col-md-4{/if} text-center">
									{if $promotioncode}
										<button type="button" class="btn btn-link" id="btnPromoCodeRemove">
											<i class="fas fa-ticket-alt"></i>
											{$LANG.orderForm.removePromotionCode}
										</button>
									{else}
										<button type="button" class="btn btn-link" id="btnPromoCodeApply">
											<i class="fas fa-ticket-alt"></i>
											{$LANG.orderForm.applyPromoCode}
										</button>
									{/if}
								</div>
								{if $taxenabled && !$loggedin}
									<div class="col-md-3 text-center">
										<button type="button" class="btn btn-link" id="btnEstimateTaxes">
											<i class="fas fa-percent"></i>
											{$LANG.orderForm.estimateTaxes}
										</button>
									</div>
								{/if}
								<div class="{if $taxenabled && !$loggedin}col-md-3{else}col-md-4{/if} text-center">
									<button type="button" class="btn btn-link" id="btnEmptyCart">
										<i class="fas fa-trash-alt"></i>
										{$LANG.emptycart}
									</button>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 text-center">
									{foreach $gatewaysoutput as $gatewayoutput}
										<div class="view-cart-gateway-checkout">
											{$gatewayoutput}
										</div>
									{/foreach}
								</div>
							</div>
							<br />
							<br />
							<!-- Modals --->
							<!-- Modal 1 - Remove Item -->
							<form method="post" action="cart.php">
									<input type="hidden" name="a" value="remove" />
									<input type="hidden" name="r" value="" id="inputRemoveItemType" />
									<input type="hidden" name="i" value="" id="inputRemoveItemRef" />
									<div class="modal fade" id="modalRemoveItem" tabindex="-1" role="dialog">
											<div class="modal-dialog" role="document">
													<div class="modal-content">
															<div class="modal-header">
																	<button type="button" class="close" data-dismiss="modal" aria-label="{$LANG.orderForm.close}">
																			<span aria-hidden="true">&times;</span>
																	</button>
																	<h4 class="modal-title">
																		<span>{$LANG.orderForm.removeItem}</span>
																	</h4>
															</div>
															<div class="modal-body">
																	{$LANG.cartremoveitemconfirm}
															</div>
															<div class="modal-footer">
																	<button type="submit" class="btn btn-primary btn-3d pull-left">{$LANG.orderForm.removeItem}</button>
																	<button type="button" class="btn btn-default pull-right" data-dismiss="modal">{$LANG.cancel}</button>
															</div>
													</div>
											</div>
									</div>
							</form>
							<!-- Modal 2 - Empty Cart -->
							<form method="post" action="cart.php">
									<input type="hidden" name="a" value="empty" />
									<div class="modal fade modal-remove-item" id="modalEmptyCart" tabindex="-1" role="dialog">
											<div class="modal-dialog" role="document">
													<div class="modal-content">
															<div class="modal-header">
																	<button type="button" class="close" data-dismiss="modal" aria-label="{$LANG.orderForm.close}">
																			<span aria-hidden="true">&times;</span>
																	</button>
																	<h4 class="modal-title">
																			<span>{$LANG.emptycart}</span>
																	</h4>
															</div>
															<div class="modal-body">
																	{$LANG.cartemptyconfirm}
															</div>
															<div class="modal-footer">
																<button type="submit" class="btn btn-3d btn-primary pull-left ">{$LANG.emptycart}</button>
																<button type="button" class="btn btn-default pull-right" data-dismiss="modal">{$LANG.cancel}</button>
															</div>
													</div>
											</div>
									</div>
							</form>
							<!-- Modal 3 - Calculate Tax -->
							<form method="post" action="cart.php?a=setstateandcountry">
								<div class="modal fade modal-remove-item" id="modalEstimateTaxes" tabindex="-1" role="dialog">
											<div class="modal-dialog" role="document">
													<div class="modal-content">
															<div class="modal-header">
																	<button type="button" class="close" data-dismiss="modal" aria-label="{$LANG.orderForm.close}">
																			<span aria-hidden="true">&times;</span>
																	</button>
																	<h4 class="modal-title">
																			<span>{$LANG.orderForm.estimateTaxes}</span>
																	</h4>
															</div>
															<div class="modal-body">
																<div class="form-group">
																	<label for="inputState" class="control-label">{$LANG.orderForm.state}</label>
																	<input type="text" name="state" id="inputState" value="{$clientsdetails.state}" class="form-control"{if $loggedin} disabled="disabled"{/if} />
																</div>
																<div class="form-group">
																	<label for="inputCountry" class="control-label">{$LANG.orderForm.country}</label>
																	<select name="country" id="inputCountry" class="form-control">
																			{foreach $countries as $countrycode => $countrylabel}
																					<option value="{$countrycode}"{if (!$country && $countrycode == $defaultcountry) || $countrycode eq $country} selected{/if}>
																							{$countrylabel}
																					</option>
																			{/foreach}
																	</select>
																</div>
															</div>
															<div class="modal-footer">
																<button type="submit" class="btn btn-3d btn-primary pull-left ">{$LANG.orderForm.updateTotals}</button>
																<button type="button" class="btn btn-default pull-right" data-dismiss="modal">{$LANG.cancel}</button>
															</div>
													</div>
											</div>
									</div>
							</form>
							<!-- Modal 4 - Promo Code --->
							{if $promotioncode}
								<div class="modal fade modal-remove-item" id="modalPromoCodeRemove" tabindex="-1" role="dialog">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="{$LANG.orderForm.close}">
													<span aria-hidden="true">&times;</span>
												</button>
												<h4 class="modal-title">
													<span>{$LANG.orderForm.removePromotionCode}</span>
												</h4>
											</div>
											<div class="modal-body">
												{$promotioncode} - {$promotiondescription}
											</div>
											<div class="modal-footer">
												<a href="{$smarty.server.PHP_SELF}?a=removepromo" class="btn btn-primary btn-3d pull-left">{$LANG.orderForm.removePromotionCode}</a>
												<button type="button" class="btn btn-default pull-right" data-dismiss="modal">{$LANG.cancel}</button>
											</div>
										</div>
									</div>
								</div>
							{else}
								<form method="post" action="cart.php?a=view">
									<div class="modal fade modal-remove-item" id="modalPromoCodeApply" tabindex="-1" role="dialog">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="{$LANG.orderForm.close}">
														<span aria-hidden="true">&times;</span>
													</button>
													<h4 class="modal-title">
														<span>{$LANG.orderForm.applyPromoCode}</span>
													</h4>
												</div>
												<div class="modal-body">
													 <div class="input-group">
														<div class="input-group-addon"><i class="fas fa-ticket-alt"></i></div>
														<input type="text" class="form-control" name="promocode" id="inputPromotionCode" placeholder="{$LANG.orderPromoCodePlaceholder}" required="required">
													</div>
												</div>
												<div class="modal-footer">
													<button type="submit" name="validatepromo" class="btn btn-primary btn-3d pull-left" value="{$LANG.orderpromovalidatebutton}">{$LANG.orderpromovalidatebutton}</button>
													<button type="button" class="btn btn-default pull-right" data-dismiss="modal">{$LANG.cancel}</button>
												</div>
											</div>
										</div>
									</div>
								</form>
							{/if}
							<!-- End of Modals --->
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
{include file="orderforms/$carttpl/icheck.tpl"}
