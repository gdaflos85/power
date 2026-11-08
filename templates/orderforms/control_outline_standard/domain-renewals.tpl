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
			<h1 class="h1">{if $totalResults > 1}{lang key='domainrenewals'}{else}{lang key='domainrenewal'}{/if}</h1>
		</div>
	</div>
	<!-- Display sidebar layout if applicable -->
	{if $itCartSidebarDisplay eq "enabled"}
		<div class="row cart-main-column">
			<div id="internal-content" class="{if $itCartSidebarDisplayMode eq "showhide"}col-md-12{else}col-md-9{/if} pull-md-left">
				{/if}
				{if $totalDomainCount == 0}
	                <div id="no-domains" class="alert alert-warning" role="alert">
	                    {$LANG.domainRenewal.noDomains}
	                </div>
	                <p class="text-center">
	                    <a href="{$WEB_ROOT}/clientarea.php" class="btn btn-default btn-3d">
	                        <i class="fas fa-arrow-circle-left"></i>
	                        {$LANG.orderForm.returnToClientArea}
	                    </a>
	                </p>
	            {else}
					<div class="row">
						<div class="{if $itCartDomRenewOrderSummaryDisplayMethod eq "side"}col-lg-8{else}col-md-12{/if}">
	                        {if $totalResults > 5}
	                            <div class="row">
	                                <div class="col-md-12">
	                                    <div class="input-group">
	                                        <div class="input-group-addon"><i class="fas fa-filter"></i></div>
	                                        <input id="domainRenewalFilter" type="search" class="domain-renewals-filter form-control input-group" placeholder="{lang key='searchenterdomain'}">
	                                    </div>
	                                </div>
	                            </div>
	                        {/if}
	                        <div class="panel panel-default">
	                            <div class="panel-heading">
	                                <h3 class="panel-title">
	                                    {$LANG.domainrenewals}
	                                </h3>
	                            </div>
	                            <div id="domainRenewals" class="list-group domain-renewals">
	                                {if $totalResults < $totalDomainCount}
	                                    <div class="list-group-item text-center">
	                                        {lang key='domainRenewal.showingDomains' showing=$totalResults totalCount=$totalDomainCount}
	                                        <a id="linkShowAll" href="{routePath('cart-domain-renewals')}">{lang key='domainRenewal.showAll'}</a>
	                                    </div>
	                                {/if}
	                                {foreach $renewalsData as $renewalData}
	                                    <div class="domain-renewal list-group-item" data-domain="{$renewalData.domain}">
	                                        <div class="pull-right">
	                                            {if !$renewalData.eligibleForRenewal}
	                                                <span class="label label-info">
														{if $renewalData.freeDomainRenewal}
		                                                    {lang key='domainRenewal.freeWithService'}
		                                                {else}
		                                                    {lang key='domainRenewal.unavailable'}
		                                                {/if}
	                                                </span>
	                                            {elseif ($renewalData.pastGracePeriod && $renewalData.pastRedemptionGracePeriod)}
	                                                <span class="label label-info">
	                                                    {lang key='domainrenewalspastgraceperiod'}
	                                                </span>
	                                            {elseif !$renewalData.beforeRenewLimit && $renewalData.daysUntilExpiry > 0}
	                                                <span class="label label-{if $renewalData.daysUntilExpiry > 30}success{else}warning{/if}">
	                                                    {lang key='domainRenewal.expiringIn' days=$renewalData.daysUntilExpiry}
	                                                </span>
	                                            {elseif $renewalData.daysUntilExpiry === 0}
	                                                <span class="label label-grey">
	                                                    {lang key='expiresToday'}
	                                                </span>
	                                            {elseif $renewalData.beforeRenewLimit}
	                                                <span class="label label-info">
	                                                    {lang key='domainRenewal.maximumAdvanceRenewal' days=$renewalData.beforeRenewLimitDays}
	                                                </span>
	                                            {else}
	                                                <span class="label label-danger">
	                                                    {lang key='domainRenewal.expiredDaysAgo' days=$renewalData.daysUntilExpiry*-1}
	                                                </span>
	                                            {/if}
	                                        </div>

	                                        <h3>{$renewalData.domain}</h3>

	                                        <p>{lang key='clientareadomainexpirydate'}: {$renewalData.expiryDate->format('j M Y')} ({$renewalData.expiryDate->diffForHumans()})</p>

											{if $renewalData.freeDomainRenewal}
		                                        <p class="domain-renewal-desc">{lang key='domainRenewal.freeWithServiceDesc'}</p>
		                                    {/if}

	                                        {if ($renewalData.pastGracePeriod && $renewalData.pastRedemptionGracePeriod) || !count($renewalData.renewalOptions)}
	                                        {else}
	                                        <br />
	                                        <form>
	                                            <div class="form-group row">
	                                                <label for="renewalPricing{$renewalData.id}" class="control-label col-md-12">
	                                                    {lang key='domainRenewal.availablePeriods'}
	                                                    {if $renewalData.inGracePeriod || $renewalData.inRedemptionGracePeriod}
	                                                        *
	                                                    {/if}
	                                                </label>
	                                                <div class="col-sm-8 col-xs-6">
	                                                    <select class="form-control select-renewal-pricing" id="renewalPricing{$renewalData.id}" data-domain-id="{$renewalData.id}">
	                                                        {foreach $renewalData.renewalOptions as $renewalOption}
	                                                            <option value="{$renewalOption.period}">
	                                                                {$renewalOption.period} {lang key='orderyears'} @ {$renewalOption.rawRenewalPrice}
	                                                                {if $renewalOption.gracePeriodFee && $renewalOption.gracePeriodFee->toNumeric() != 0.00}
	                                                                    + {$renewalOption.gracePeriodFee} {lang key='domainRenewal.graceFee'}
	                                                                {/if}
	                                                                {if $renewalOption.redemptionGracePeriodFee && $renewalOption.redemptionGracePeriodFee->toNumeric() != 0.00}
	                                                                    + {$renewalOption.redemptionGracePeriodFee} {lang key='domainRenewal.redemptionFee'}
	                                                                {/if}
	                                                            </option>
	                                                        {/foreach}
	                                                    </select>
	                                                </div>


	                                                {if !$renewalData.eligibleForRenewal || $renewalData.beforeRenewLimit || ($renewalData.pastGracePeriod && $renewalData.pastRedemptionGracePeriod)}
	                                                {else}
	                                                    <div class="col-sm-4 col-xs-6 text-right">
	                                                        <button type="button" id="renewDomain{$renewalData.id}" class="btn btn-primary btn-3d btn-sm btn-add-renewal-to-cart" data-domain-id="{$renewalData.id}">
	                                                            <span class="to-add">
	                                                                <i class="fas fa-fw fa-spinner fa-spin"></i>
	                                                                {lang key='addtocart'}
	                                                            </span>
	                                                            <span class="added">{lang key='domaincheckeradded'}</span>
	                                                        </button>
	                                                    </div>
	                                                {/if}



	                                            </div>
	                                        </form>
	                                        {/if}



	                                    </div>
	                                {/foreach}



	                            </div>
	                        </div>
	                        <div class="text-center">
	                            <small>
	                                {if $hasDomainsInGracePeriod}
	                                    * {lang key='domainRenewal.graceRenewalPeriodDescription'}
	                                {/if}
	                            </small>
	                        </div>
			            </div>
	                    <div class="{if $itCartDomRenewOrderSummaryDisplayMethod eq "side"}col-lg-4{else}col-md-12{/if}"{if $itCartDomRenewOrderSummaryDisplayMethod eq "side" && $itCartDomRenewOrderSummaryAutoScroll neq "disabled"} id="scrollingPanelContainer"{/if}>
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
	                                        <a id="btnGoToCart" class="btn btn-primary btn-lg btn-3d" href="{$WEB_ROOT}/cart.php?a=view">
	                                            {lang key='viewcart'}
						                        <i class="fas fa-arrow-circle-right"></i>
	                                        </a>
						                </div>
									</div>
								</div>
								<div class="alert alert-warning info-text-sm">
						            <i class="fas fa-question-circle"></i>
						            {$LANG.orderForm.haveQuestionsContact} <a href="{$WEB_ROOT}/contact.php" target="_blank" class="alert-link">{$LANG.orderForm.haveQuestionsClickHere}</a>
						        </div>
							</div>
					</div>
				{/if}
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
<!-- Modals --->
<!-- Modal 1 - Remove Item -->
<form id="removeRenewalForm" method="post" action="{$WEB_ROOT}/cart.php">
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
<script>recalculateRenewalTotals();</script>
{include file="./icheck.tpl"}
