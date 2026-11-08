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
			<h1 class="h1">{$LANG.cartproductconfig}</h1>
			<small class="res-left pull-right" style="margin: 12px 12px 20px 12px;">{$LANG.orderForm.configureDesiredOptions}</small>
		</div>
	</div>
	<!-- Display sidebar layout if applicable -->
	{if $itCartSidebarDisplay eq "enabled"}
		<div class="row cart-main-column">
			<div id="internal-content" class="{if $itCartSidebarDisplayMode eq "showhide"}col-md-12{else}col-md-9{/if} pull-md-left">
				{/if}
				<form id="frmConfigureProduct" class="form-horizontal">
					<input type="hidden" name="configure" value="true" />
	                <input type="hidden" name="i" value="{$i}" />
					<div class="row">
						<div class="{if $itCartConfProdOrderSummaryDisplayMethod eq "side"}col-lg-8{else}col-md-12{/if}">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										{$LANG.clientareaproductdetails}
									</h3>
								</div>
								<div class="panel-body">
									<div class="form-group">
		                                <label class="col-md-3 control-label">{$LANG.orderproduct}</label>
	                                    <div class="col-md-8 padding-top-cart">
	                                        <span>{$productinfo.name}{if $productinfo.group_name}<br />({$productinfo.group_name}){/if}</span>
	                                    </div>
	                                </div>
                                    {if $productinfo.description}
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">{$LANG.clientareaproductdetails}</label>
                                            <div class="col-md-8 padding-top-cart">
                                                <span>{$productinfo.description}</span>
                                            </div>
                                        </div>
                                    {/if}
                                    {if $domain}
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">{$LANG.orderdomain}</label>
                                            <div class="col-md-8 padding-top-cart">
                                                <span>{$domain}</span>
                                            </div>
                                        </div>
                                    {/if}
								</div>
							</div>
							<div class="alert alert-danger w-hidden" role="alert" id="containerProductValidationErrors">
	                            <p>{$LANG.orderForm.correctErrors}:</p>
	                            <ul id="containerProductValidationErrorsList"></ul>
	                        </div>
	                        {if $pricing.type eq "recurring"}
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">
											{$LANG.orderbillingcycle}
										</h3>
									</div>
									<div class="panel-body">
		                                <div class="form-group">
											<label for="inputBillingcycle" class="col-md-3 control-label">{$LANG.cartchoosecycle}</label>
					                        <div class="col-md-8">
			                                    <select name="billingcycle" id="inputBillingcycle" class="form-control select-inline" onchange="{if $configurableoptions}updateConfigurableOptions({$i}, this.value);{else}recalctotals();{/if}">
			                                        {if $pricing.monthly}
			                                            <option value="monthly"{if $billingcycle eq "monthly"} selected{/if}>
			                                                {$pricing.monthly}
			                                            </option>
			                                        {/if}
			                                        {if $pricing.quarterly}
			                                            <option value="quarterly"{if $billingcycle eq "quarterly"} selected{/if}>
			                                                {$pricing.quarterly}
			                                            </option>
			                                        {/if}
			                                        {if $pricing.semiannually}
			                                            <option value="semiannually"{if $billingcycle eq "semiannually"} selected{/if}>
			                                                {$pricing.semiannually}
			                                            </option>
			                                        {/if}
			                                        {if $pricing.annually}
			                                            <option value="annually"{if $billingcycle eq "annually"} selected{/if}>
			                                                {$pricing.annually}
			                                            </option>
			                                        {/if}
			                                        {if $pricing.biennially}
			                                            <option value="biennially"{if $billingcycle eq "biennially"} selected{/if}>
			                                                {$pricing.biennially}
			                                            </option>
			                                        {/if}
			                                        {if $pricing.triennially}
			                                            <option value="triennially"{if $billingcycle eq "triennially"} selected{/if}>
			                                                {$pricing.triennially}
			                                            </option>
			                                        {/if}
			                                    </select>
					                        </div>
		                                </div>
									</div>
								</div>
	                        {/if}
                            {if count($metrics) > 0}
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            {$LANG.metrics.title}
                                        </h3>
                                    </div>
                                    <div class="panel-body">
                                        <p>{$LANG.metrics.explanation}</p>
                                        <ul>
                                            {foreach $metrics as $metric}
                                                <li>
                                                    {$metric.displayName}
                                                    -
                                                    {if count($metric.pricing) > 1}
                                                        {$LANG.metrics.startingFrom} {$metric.lowestPrice} / {if $metric.unitName}{$metric.unitName}{else}{$LANG.metrics.unit}{/if}
                                                        <button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#modalMetricPricing-{$metric.systemName}">
                                                            {$LANG.metrics.viewPricing}
                                                        </button>
                                                    {elseif count($metric.pricing) == 1}
                                                        {$metric.lowestPrice} / {if $metric.unitName}{$metric.unitName}{else}{$LANG.metrics.unit}{/if}
                                                        {if $metric.includedQuantity > 0} ({$metric.includedQuantity} {$LANG.metrics.includedNotCounted}){/if}
                                                    {/if}
                                                    {include file="$template/usagebillingpricing.tpl"}
                                                </li>
                                            {/foreach}
                                        </ul>
                                    </div>
                                </div>
                            {/if}
	                        {if $productinfo.type eq "server"}
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">
											{$LANG.cartconfigserver}
										</h3>
									</div>
									<div class="panel-body">
		                                <div class="form-group">
			                                <label for="inputHostname" class="col-md-3 control-label">{$LANG.serverhostname}</label>
		                                    <div class="col-md-8">
		                                        <input type="text" name="hostname" class="form-control" id="inputHostname" value="{$server.hostname}" placeholder="servername.yourdomain.com">
		                                    </div>
		                                </div>
		                                <div class="form-group">
		                                    <label for="inputRootpw" class="col-md-3 control-label">{$LANG.serverrootpw}</label>
		                                    <div class="col-md-8">
		                                        <input type="password" name="rootpw" class="form-control" id="inputRootpw" value="{$server.rootpw}">
		                                    </div>
		                                </div>
		                                <div class="form-group">
		                                    <label for="inputNs1prefix" class="col-md-3 control-label">{$LANG.serverns1prefix}</label>
		                                    <div class="col-md-8">
		                                        <input type="text" name="ns1prefix" class="form-control" id="inputNs1prefix" value="{$server.ns1prefix}" placeholder="ns1">
		                                    </div>
		                                </div>
		                                <div class="form-group">
		                                    <label for="inputNs2prefix" class="col-md-3 control-label">{$LANG.serverns2prefix}</label>
		                                    <div class="col-md-8">
		                                        <input type="text" name="ns2prefix" class="form-control" id="inputNs2prefix" value="{$server.ns2prefix}" placeholder="ns2">
												<br />
												<br />
		                                    </div>
		                                </div>
									</div>
								</div>
	                        {/if}
	                        {if $configurableoptions}
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">
											{$LANG.orderconfigpackage}
										</h3>
									</div>
									<div class="panel-body">
                                        <div class="product-configurable-options" id="productConfigurableOptions">
			                                {foreach $configurableoptions as $num => $configoption name=option}
			                                	{if !$smarty.foreach.option.first}<br />{/if}
			                                    {if $configoption.optiontype eq 1}
			                                        <div class="form-group">
		                                            	<label for="inputConfigOption{$configoption.id}" class="col-md-3 control-label">{$configoption.optionname}</label>
														<div class="col-md-8">
		                                                    <select name="configoption[{$configoption.id}]" id="inputConfigOption{$configoption.id}" class="form-control">
		                                                        {foreach key=num2 item=options from=$configoption.options}
		                                                            <option value="{$options.id}"{if $configoption.selectedvalue eq $options.id} selected="selected"{/if}>
		                                                                {$options.name}
		                                                            </option>
		                                                        {/foreach}
		                                                    </select>
														</div>
			                                        </div>
			                                    {elseif $configoption.optiontype eq 2}
			                                        <div class="form-group">
		                                                <label for="inputConfigOption{$configoption.id}" class="col-md-3 control-label label-pre-icheck">{$configoption.optionname}</label>
														<div class="col-md-8 padding-top-cart">
		                                                    {foreach key=num2 item=options from=$configoption.options}
																<div class="row">
																	<div class="col-xs-1">
																		<input type="radio" id="configoption[{$configoption.id}-{$options.id}]" name="configoption[{$configoption.id}]" class="icheck" value="{$options.id}"{if $configoption.selectedvalue eq $options.id} checked="checked"{/if} />
																	</div>
																	<div class="col-xs-11">
				                                                        <label for="configoption[{$configoption.id}-{$options.id}]">
				                                                            {if $options.name}			                                                                																				{$options.nameonly}<br />
				                                                            	<span class="price"><small>{$options.name|replace:$options.nameonly:''}</small></span>
				                                                            {else}
				                                                                {$LANG.enable}
				                                                            {/if}
				                                                        </label>
																	</div>
																</div>
		                                                    {/foreach}
														</div>
			                                        </div>
			                                    {elseif $configoption.optiontype eq 3}
			                                        <div class="form-group">
		                                                <label class="col-md-3 control-label label-pre-icheck">{$configoption.optionname}</label>
														<div class="col-md-8 padding-top-cart">
															<div class="row">
																<div class="col-xs-1">
			                                                        <input type="checkbox" name="configoption[{$configoption.id}]" class="icheck" id="inputConfigOption{$configoption.id}" value="1"{if $configoption.selectedqty} checked{/if} />
																</div>
																<div class="col-xs-11">
																	<label for="inputConfigOption{$configoption.id}">	                                                        																		{if $configoption.options.0.name}
				                                                            {$configoption.options.0.name}
				                                                        {else}
				                                                            {$LANG.enable}
				                                                        {/if}
																	</label>
																</div>
															</div>
		                                                </div>
			                                        </div>
			                                    {elseif $configoption.optiontype eq 4}
			                                    	<div class="form-group">
		                                                <label class="col-md-3 control-label {if $configoption.qtymaximum}label-slider{/if}" for="inputConfigOption{$configoption.id}">{$configoption.optionname}</label>
														<div class="col-md-8">
		                                                    {if $configoption.qtymaximum}
		                                                        {if !$rangesliderincluded}
		                                                            <script type="text/javascript" src="{$BASE_PATH_JS}/ion.rangeSlider.min.js"></script>
		                                                            <link href="{$BASE_PATH_CSS}/ion.rangeSlider.css" rel="stylesheet">
																	<link href="{$WEB_ROOT}/templates/orderforms/{$carttpl}/ion-range-slider/ion.rangeSlider.skinFlat.green.css" rel="stylesheet">
		                                                            {assign var='rangesliderincluded' value=true}
		                                                        {/if}
		                                                        <input type="text" name="configoption[{$configoption.id}]" value="{if $configoption.selectedqty}{$configoption.selectedqty}{else}{$configoption.qtyminimum}{/if}" id="inputConfigOption{$configoption.id}" class="form-control" />
		                                                        <script>
		                                                            var sliderTimeoutId = null;
		                                                            var sliderRangeDifference = {$configoption.qtymaximum} - {$configoption.qtyminimum};
		                                                            // The largest size that looks nice on most screens.
		                                                            var sliderStepThreshold = 25;
		                                                            // Check if there are too many to display individually.
		                                                            var setLargerMarkers = sliderRangeDifference > sliderStepThreshold;
		                                                            jQuery("#inputConfigOption{$configoption.id}").ionRangeSlider({
		                                                                min: {$configoption.qtyminimum},
		                                                                max: {$configoption.qtymaximum},
		                                                                grid: true,
		                                                                grid_snap: setLargerMarkers ? false : true,
		                                                                onChange: function() {
		                                                                    if (sliderTimeoutId) {
		                                                                        clearTimeout(sliderTimeoutId);
		                                                                    }
		                                                                    sliderTimeoutId = setTimeout(function() {
		                                                                        sliderTimeoutId = null;
		                                                                        recalctotals();
		                                                                    }, 250);
		                                                                }
		                                                            });
		                                                        </script>
		                                                    {else}
		                                                        <div>
		                                                            <input type="number" name="configoption[{$configoption.id}]" value="{if $configoption.selectedqty}{$configoption.selectedqty}{else}{$configoption.qtyminimum}{/if}" id="inputConfigOption{$configoption.id}" min="{$configoption.qtyminimum}" onchange="recalctotals()" onkeyup="recalctotals()" class="form-control form-control-qty" />
																	<span class="field-help-text">
		                                                                x {$configoption.options.0.name}
		                                                            </span>
		                                                        </div>
		                                                    {/if}
														</div>
			                                        </div>
			                                    {/if}
			                                {/foreach}
                                        </div>
		                            </div>
								</div>
	                        {/if}
	                        {if $customfields}
	                        	<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">
											{$LANG.orderadditionalrequiredinfo}
										</h3>
                                        <i><small>{lang key='orderForm.requiredField'}</small></i>
									</div>
									<div class="panel-body">
		                                {foreach $customfields as $customfield name=customf}
		                                	{if !$smarty.foreach.customf.first}<br />{/if}
		                                	<div class="form-group">
		                                        <label for="customfield{$customfield.id}" class="col-md-3 control-label {if $customfield.textid eq "tickbox"}label-pre-icheck{/if}">{$customfield.name} {$customfield.required}</label>
												<div class="col-md-8 {if $customfield.textid eq "tickbox"}padding-top-cart{/if}">
													{if $customfield.textid eq "textarea"}
														<textarea name="customfield[{$customfield.id}]" id="customfield{$customfield.id}" rows="5" class="form-control">{$customfield.rawvalue}</textarea>
														{if $customfield.description}
				                                            <span class="field-help-text">
				                                                {$customfield.description}
				                                            </span>
														{/if}
													{elseif $customfield.textid eq "tickbox"}
														<div class="row">
															<div class="col-xs-1">
																<input type="checkbox" class="icheck" name="customfield[{$customfield.id}]" id="customfield{$customfield.id}" {if $customfield.rawvalue eq "on"} checked{/if} />
															</div>
															<div class="col-xs-11">
																<label for="customfield{$customfield.id}">{$customfield.description}</label>
															</div>
														</div>
													{else}
				                                        {$customfield.input}
				                                        {if $customfield.description}
				                                            <span class="field-help-text">
				                                                {$customfield.description}
				                                            </span>
														{/if}
				                                    {/if}
												</div>
		                                    </div>
		                                {/foreach}
									</div>
	                        	</div>
	                        {/if}
	                        {if $addons}
	                        	<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">
											{$LANG.cartavailableaddons}
										</h3>
									</div>
                                    {if $addons}
                                        <div class="panel-body">
                                            <div id="ProductAddons" class="form-group addon-products">
                                                <label class="col-md-3 control-label label-pre-icheck">{$LANG.orderchooseaddons}</label>
                                                <div class="col-md-8 padding-top-cart">
                                                    {foreach $addons as $addon}
                                                        <div class="row">
                                                            <div class="col-xs-1">
                                                                <input type="checkbox" class="icheck" id="addons[{$addon.id}]" name="addons[{$addon.id}]"{if $addon.status} checked{/if} />
                                                            </div>
                                                            <div class="col-xs-11">
                                                                <label for="addons[{$addon.id}]">
                                                                    {$addon.name} <span class="price">{$addon.pricing}</span>
                                                                </label>
                                                                <small>{$addon.description}</small>
                                                            </div>
                                                        </div>
                                                        <br />
                                                    {/foreach}
                                                </div>
                                            </div>
                                        </div>
                                    {/if}
	                        	</div>
	                        {/if}
                            {if count($addonsPromoOutput) > 0}
                                {foreach $addonsPromoOutput as $output}
                                    {if $output}
                                        <div class="panel panel-default">
                                            <div class="panel-body">
                                                {$output}
                                            </div>
                                        </div>
                                    {/if}
                                {/foreach}
                            {/if}
						</div>
						<div class="{if $itCartConfProdOrderSummaryDisplayMethod eq "side"}col-lg-4{else}col-md-12{/if}"{if $itCartConfProdOrderSummaryDisplayMethod eq "side" && $itCartConfProdOrderSummaryAutoScroll neq "disabled"} id="scrollingPanelContainer"{/if}>
			                <div id="orderSummary">
								<div class="panel panel-success">
									<div class="panel-heading">
										<h3 class="panel-title">
											<i class="fas fa-shopping-cart fa-fw"></i>
											 {$LANG.ordersummary}
										</h3>
									</div>
									<div class="panel-body">
						                <div class="order-summary">
							                <div class="summary-container" id="producttotal">
							                    <div class="loader" id="orderSummaryLoader" class="text-center">
							                        <i class="fas fa-fw fa-sync fa-spin"></i>
							                    </div>
							                </div>
										</div>
					                </div>
					                <div class="panel-footer">
						                 <button type="submit" id="btnCompleteProductConfig" class="btn btn-primary btn-lg btn-3d">
					                        {$LANG.continue}
					                        <i class="fas fa-arrow-circle-right"></i>
					                    </button>
					                </div>
								</div>
							</div>
							<div class="alert alert-warning info-text-sm">
					            <i class="fas fa-question-circle"></i>
					            {$LANG.orderForm.haveQuestionsContact} <a href="contact.php" target="_blank" class="alert-link">{$LANG.orderForm.haveQuestionsClickHere}</a>
					        </div>
						</div>
					</div>
				</form>
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
<script>
	recalctotals();
</script>
