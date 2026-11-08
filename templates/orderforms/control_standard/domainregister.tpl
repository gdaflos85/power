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
			<h1 class="h1">{$LANG.registerdomain}</h1>
			<small class="res-left pull-right" style="margin: 12px 12px 20px 12px;">{$LANG.orderForm.findNewDomain}</small>
		</div>
	</div>
	<!-- Display sidebar layout if applicable -->
	{if $itCartSidebarDisplay eq "enabled"}
		<div class="row cart-main-column">
			<div id="internal-content" class="{if $itCartSidebarDisplayMode eq "showhide"}col-md-12{else}col-md-9{/if} pull-md-left">
				{/if}
	            <div class="domain-checker-container">
					<div class="row">
						<div class="col-md-12">
			                <div class="domain-checker-bg clearfix">
			                    <form method="post" action="cart.php" id="frmDomainChecker">
			                        <input type="hidden" name="a" value="checkDomain">
			                        <div class="row">
			                            <div class="col-md-12">
			            	                <div class="input-group input-group-lg input-group-box">
			                                    <input type="text" name="domain" class="form-control" placeholder="{$LANG.findyourdomain}" value="{$lookupTerm}" id="inputDomain" data-toggle="tooltip" data-placement="bottom" data-trigger="manual" title="{lang key='orderForm.domainOrKeyword'}" />
			                                    <span class="input-group-btn">
			                                        <button type="submit" id="btnCheckAvailability" class="btn btn-primary domain-check-availability {$captcha->getButtonClass($captchaForm)}">{$LANG.search}</button>
			                                    </span>
			                                </div>
			                            </div>
			                        </div>
			                        {if $captcha->isEnabled() && $captcha->isEnabledForForm($captchaForm) && !$captcha->recaptcha->isInvisible()}
			                            <div class="captcha-container text-center" id="captchaContainer">
			                                {if $captcha == "recaptcha"}
			                                    <div class="form-group recaptcha-container"></div>
			                                    <br />
			                                    <br />
			                                {elseif $captcha != "recaptcha"}
			                                    <div class="default-captcha default-captcha-register-margin well text-center">
			                                        <p>{lang key="cartSimpleCaptcha"}</p>
			                                        <div>
				                                        <br />
			                                            <img id="inputCaptchaImage" src="{$systemurl}includes/verifyimage.php" align="middle" />
			                                            <br /><br />
			                                            <input id="inputCaptcha" type="text" name="code" maxlength="6" class="input-sm" data-toggle="tooltip" data-placement="right" data-trigger="manual" title="{lang key='orderForm.required'}" />
			                                        </div>
			                                    </div>
			                                {/if}
			                            </div>
			                        {/if}
			                    </form>
			                </div>
			            </div>
					</div>
				</div>
				<div id="DomainSearchResults" class="w-hidden">
					<div class="row">
						<div class="col-md-12">
			                <div id="searchDomainInfo" class="domain-checker-result-headline">
			                    <p id="primaryLookupSearching" class="domain-lookup-loader domain-lookup-primary-loader domain-searching">
				                    <i class="fas fa-spinner fa-spin"></i>
				                    <br />
				                    {lang key='orderForm.searching'}...
				                </p>
			                    <div id="primaryLookupResult" class="domain-lookup-result w-hidden">
			                        	<div class="domain-invalid domain-checker-invalid alert alert-warning">
										<i class="fas fa-2x fa-exclamation-triangle"></i> <span class="results-text">{lang key='orderForm.domainLetterOrNumber'}<span class="domain-length-restrictions">{lang key='orderForm.domainLengthRequirements'}</span></span>
										<div class="clearfix"></div>
			                        </div>
			                        <div class="domain-unavailable domain-checker-unavailable">
				                        <div class="alert alert-danger">
											<i class="fas fa-2x fa-times"></i> <span class="results-text">{lang key='orderForm.domainIsUnavailable'}</span>
											<div class="clearfix"></div>
										</div>
			                        </div>
			                        <div class="domain-available domain-checker-available">
			                        	<div class="alert alert-success domain-result domain-price">
								            <i class="fas fa-2x fa-check"></i> <span class="results-text"><strong></strong> {$LANG.domainavailable2}</span>
											<button class="btn btn-success btn-sm pull-right res-center btn-add-to-cart" data-whois="0" data-domain="">
												<span class="to-add"><i class="fas fa-cart-plus"></i> {$LANG.addtocart} (<span class="to-add price"></span>)</span>
												<span class="loading"><i class="fas fa-spinner fa-spin"></i> {lang key='loading'}</span>
												<span class="added"><i class="fas fa-shopping-cart"></i> {lang key='checkout'}</span>
												<span class="unavailable"><i class="fas fa-exclamation-triangle"></i> {$LANG.domaincheckertaken}</span>
											</button>
							            </div>
						            </div>
                                    <p class="domain-error domain-checker-unavailable"></p>
						            <a class="domain-contact-support btn btn-primary">{lang key='domainChecker.contactSupport'}</a>
									<div id="idnLanguageSelector" class="form-group w-hidden idn-language-selector well">
			                            <div class="row">
			                                <div class="col-sm-10 col-sm-offset-1 col-lg-8 col-lg-offset-2">
			                                    <div class="margin-10 text-center">
			                                        {lang key='cart.idnLanguageDescription'}
			                                    </div>
			                                </div>
			                            </div>
			                            <div class="row">
			                                <div class="col-sm-8 col-lg-6 col-sm-offset-2 col-lg-offset-3">
			                                    <select name="idnlanguage" class="form-control">
			                                        <option value="">{lang key='cart.idnLanguage'}</option>
			                                        {foreach $idnLanguages as $idnLanguageKey => $idnLanguage}
			                                            <option value="{$idnLanguageKey}">{lang key='idnLanguage.'|cat:$idnLanguageKey}</option>
			                                        {/foreach}
			                                    </select>
			                                    <div class="field-error-msg text-center">
			                                        {lang key='cart.selectIdnLanguageForRegister'}
			                                    </div>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div>
					</div>
	                {if $spotlightTlds}
		                <div class="row">
							<div class="col-md-12">
			                    <div id="spotlightTlds" class="spotlight-tlds clearfix">
			                        <div class="spotlight-tlds-container">
			                            {foreach $spotlightTlds as $key => $data}
			                                <div class="spotlight-tld-container spotlight-tld-container-{$spotlightTlds|count}">
			                                    <div id="spotlight{$data.tldNoDots}" class="spotlight-tld">
			                                        {if $data.group}
			                                            <div class="spotlight-tld-{$data.group}">{$data.groupDisplayName}</div>
			                                        {/if}
			                                        {$data.tld}
			                                        <span class="domain-lookup-loader domain-lookup-spotlight-loader">
			                                            <i class="fas fa-spinner fa-spin"></i>
			                                        </span>
			                                        <div class="domain-lookup-result">
			                                            <button type="button" class="btn btn-sm unavailable w-hidden" disabled="disabled">
			                                                {lang key='domainunavailable'}
			                                            </button>
			                                            <button type="button" class="btn btn-sm invalid w-hidden" disabled="disabled">
			                                                {lang key='domainunavailable'}
			                                            </button>
			                                            <span class="available price w-hidden">{$data.register}</span>
			                                            <button type="button" class="btn w-hidden btn-sm btn-success btn-add-to-cart" data-whois="0" data-domain="">
			                                                <span class="to-add"><i class="fas fa-cart-plus"></i> {lang key='orderForm.add'}</span>
															<span class="loading"><i class="fas fa-spinner fa-spin"></i> {lang key='loading'}</span>
			                                                <span class="added"><i class="fas fa-shopping-cart"></i> {lang key='checkout'}</span>
			                                                <span class="unavailable"><i class="fas fa-exclamation-triangle"></i> {$LANG.domaincheckertaken}</span>
			                                            </button>
			                                            <button type="button" class="btn btn-sm btn-primary domain-contact-support w-hidden">{lang key='domainChecker.contactSupport'}</button>
			                                        </div>
			                                    </div>
			                                </div>
			                            {/foreach}
			                        </div>
			                    </div>
							</div>
		                </div>
	                {/if}
	                <div class="row">
						<div class="col-md-12">
			                <div class="suggested-domains{if !$showSuggestionsContainer} w-hidden{/if}">
				                <div class="panel panel-default">
					                <div class="panel-heading">
										<h3 class="panel-title">{lang key='orderForm.suggestedDomains'}</h3>
									</div>
				                    <div id="suggestionsLoader" class="panel-body domain-lookup-loader domain-lookup-suggestions-loader">
				                        <i class="fas fa-spinner fa-spin"></i> {lang key='orderForm.generatingSuggestions'}
				                    </div>
				                    <table class="table table-curved table-hover domain-lookup-result w-hidden" id="domainSuggestions">
										<tbody>
											<tr class="domain-suggestion w-hidden">
												<td class="dname">
													<strong><span class="domain"></span><span class="extension"></span></strong>
													<span class="promo w-hidden">
						                                <span class="sales-group-hot w-hidden">{lang key='domainCheckerSalesGroup.hot'}</span>
						                                <span class="sales-group-new w-hidden">{lang key='domainCheckerSalesGroup.new'}</span>
						                                <span class="sales-group-sale w-hidden">{lang key='domainCheckerSalesGroup.sale'}</span>
						                            </span>
												</td>
												<td class="text-right">
						                            <button type="button" class="btn btn-sm btn-default btn-add-to-cart" data-whois="1" data-domain="">
						                                <span class="to-add"><i class="fas fa-cart-plus"></i> {$LANG.addtocart} (<span class="to-add price"></span>)</span>
														<span class="loading"><i class="fas fa-spinner fa-spin"></i> {lang key='loading'}</span>
														<span class="added"><i class="fas fa-shopping-cart"></i> {lang key='checkout'}</span>
														<span class="unavailable"><i class="fas fa-exclamation-triangle"></i> {$LANG.domaincheckertaken}</span>
						                            </button>
						                            <button type="button" class="btn btn-sm btn-primary domain-contact-support w-hidden">{$LANG.domainContactUs}</button>
												</td>
											</tr>
										</tbody>
				                    </table>
                                    <div class="panel-footer more-suggestions w-hidden text-center">
                                        <a id="moreSuggestions" href="#" onclick="loadMoreSuggestions();return false;">{lang key='domainsmoresuggestions'}</a>
                                        <span id="noMoreSuggestions" class="no-more small w-hidden">{lang key='domaincheckernomoresuggestions'}</span>
                                    </div>
		                  			<div class="panel-footer">
										<i class="fas fa-exclamation-circle"></i> &nbsp; <small>{lang key='domainssuggestionswarnings'}</small>
									</div>
				                </div>
			                </div>
			            </div>
	                </div>
	            </div>

<div class="domain-pricing">

                    {if $featuredTlds}
                        <div class="featured-tlds-container">
                            <div class="row">
                                {foreach $featuredTlds as $num => $tldinfo}
                                    {if $num % 3 == 0 && (count($featuredTlds) - $num < 3)}
                                        {if count($featuredTlds) - $num == 2}
                                            <div class="col-sm-2"></div>
                                        {else}
                                            <div class="col-sm-4"></div>
                                        {/if}
                                    {/if}
                                    <div class="col-sm-4 col-xs-6">
                                        <div class="featured-tld">
                                            <div class="img-container">
                                                <img src="{$BASE_PATH_IMG}/tld_logos/{$tldinfo.tldNoDots}.png">
                                            </div>
                                            <div class="price {$tldinfo.tldNoDots}">
                                                {if is_object($tldinfo.register)}
                                                	{$tldinfo.register->toPrefixed()}{if $tldinfo.period > 1}{lang key="orderForm.shortPerYears" years={$tldinfo.period}}{else}{lang key="orderForm.shortPerYear" years=''}{/if}
												{else}
													{lang key="domainregnotavailable"}
												{/if}
											</div>
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    {/if}

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">{lang key='pricing.browseExtByCategory'}</h3>
                        </div>
                        <div class="panel-body">
                            <div class="tld-filters">
                                {foreach $categoriesWithCounts as $category => $count}
                                    <a href="#" data-category="{$category}" class="badge badge-secondary">{lang key="domainTldCategory.$category" defaultValue=$category} ({$count})</a>
                                {/foreach}
                            </div>
                            <div class="row tld-pricing-header">
                                <div class="col-sm-4 no-bg hidden-xs">{lang key='orderdomain'}</div>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-xs-4 text-right">{lang key='pricing.register'}</div>
                                        <div class="col-xs-4 text-right">{lang key='pricing.transfer'}</div>
                                        <div class="col-xs-4 text-right">{lang key='pricing.renewal'}</div>
                                    </div>
                                </div>
                            </div>
                            {foreach $pricing['pricing'] as $tld => $price}
                                <div class="row tld-row" data-category="{foreach $price.categories as $category}|{$category}|{/foreach}">
                                    <div class="col-sm-4 two-row-center">
                                        <strong>.{$tld}</strong>
										{if $price.group}
		                                    <span class="tld-sale-group tld-sale-group-{$price.group}">
		                                        {lang key='domainCheckerSalesGroup.'|cat:$price.group}
		                                    </span>
		                                {/if}
                                    </div>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-xs-4 text-right">
												{if isset($price.register) && current($price.register) > 0}
		                                            {current($price.register)}<br>
		                                            <small>{key($price.register)} {if key($price.register) > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</small>
		                                        {elseif isset($price.register) && current($price.register) == 0}
		                                            <small>{lang key='orderfree'}</small>
		                                        {else}
		                                            <small>{lang key='na'}</small>
		                                        {/if}
                                            </div>
                                            <div class="col-xs-4 text-right">
												{if isset($price.transfer) && current($price.transfer) > 0}
		                                            {current($price.transfer)}<br>
		                                            <small>{key($price.transfer)} {if key($price.register) > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</small>
		                                        {elseif isset($price.transfer) && current($price.transfer) == 0}
		                                            <small>{lang key='orderfree'}</small>
		                                        {else}
		                                            <small>{lang key='na'}</small>
		                                        {/if}
                                            </div>
                                            <div class="col-xs-4 text-right">
												{if isset($price.renew) && current($price.renew) > 0}
		                                            {current($price.renew)}<br>
		                                            <small>{key($price.renew)} {if key($price.register) > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</small>
		                                        {elseif isset($price.renew) && current($price.renew) == 0}
		                                            <small>{lang key='orderfree'}</small>
		                                        {else}
		                                            <small>{lang key='na'}</small>
		                                        {/if}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            {/foreach}
                            <div class="row tld-row no-tlds">
                                <div class="col-xs-12 text-center">
                                    <br>
                                    {lang key='pricing.selectExtCategory'}
                                    <br><br>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <br />

				<div class="row">
	                <div class="{if $domainTransferEnabled}col-md-6{else}col-md-8 col-md-offset-2{/if}">
		                <div class="panel panel-default">
			                <div class="panel-heading">
				                <h3 class="panel-title"><i class="fas fa-server"></i> &nbsp;{lang key='orderForm.addHosting'}</h3>
			                </div>
			                <div class="panel-body" data-key="sameHeights">
				                <p><strong>{lang key='orderForm.chooseFromRange'}</strong></p>
		                        <p>{lang key='orderForm.packagesForBudget'}</p>
			                </div>
			                <div class="panel-footer">
				                <a href="cart.php" class="btn btn-warning">
		                            {lang key='orderForm.exploreNow'} &nbsp;<i class="fas fa-chevron-right"></i>
		                        </a>
			                </div>
	                    </div>
	                </div>
	                {if $domainTransferEnabled}
	                    <div class="col-md-6">
	                        <div class="panel panel-default">
				                <div class="panel-heading">
					                <h3 class="panel-title"><i class="fas fa-globe"></i> &nbsp;{lang key='orderForm.transferToUs'}</h3>
				                </div>
				                <div class="panel-body" data-key="sameHeights">
	                                <p><strong>{lang key='orderForm.transferExtend'}</strong> *</p>
				                </div>
								<div class="panel-footer">
					                <a href="cart.php?a=add&domain=transfer" class="btn btn-primary">
		                                {lang key='orderForm.transferDomain'} &nbsp;<i class="fas fa-chevron-right"></i>
			                        </a>
				                </div>
	                        </div>
	                    </div>
	                {/if}
	            </div>
	            {if $domainTransferEnabled}
	                <div class="row">
	                    <div class="col-md-12">
		                    <br />
		                    <p class="small text-center">* {lang key='orderForm.extendExclusions'}</p>
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
<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery('.tld-filters a:first-child').click();
		{if $lookupTerm && !$captchaError && !$invalid}
			jQuery('#btnCheckAvailability').click();
		{/if}
		{if $invalid}
			jQuery('#primaryLookupSearching').toggle();
			jQuery('#primaryLookupResult').children().toggle();
			jQuery('#primaryLookupResult').toggle();
			jQuery('#DomainSearchResults').toggle();
			jQuery('.domain-invalid').toggle();
		{/if}
    });
	if ('addEventListener' in window) {
	    window.addEventListener('resize', function(){
	        sameHeights();
	    });
	    window.addEventListener('load', function(){
	        sameHeights();
	    });
	}
</script>
