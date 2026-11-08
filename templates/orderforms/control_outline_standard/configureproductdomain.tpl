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
			<h1 class="h1">{$LANG.cartdomainsconfig}</h1>
			<small class="res-left pull-right" style="margin: 12px 12px 20px 12px;">{$LANG.orderForm.reviewDomainAndAddons}</small>
		</div>
	</div>
	<!-- Display sidebar layout if applicable -->
	{if $itCartSidebarDisplay eq "enabled"}
		<div class="row cart-main-column">
			<div id="internal-content" class="{if $itCartSidebarDisplayMode eq "showhide"}col-md-12{else}col-md-9{/if} pull-md-left">
				{/if}
				<div class="row">
					<div class="col-md-12">
			            <form id="frmProductDomain">
							<input type="hidden" id="frmProductDomainPid" value="{$pid}" />
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										{$LANG.domaincheckerchoosedomain}
									</h3>
								</div>
								<div class="panel-body">
									<div class="row">
										<div class="col-md-12">
							                <div class="domain-selection-options">
							                    {if $incartdomains}
							                        <div class="option">
							                            <label class="radio-icheck">
							                                <input type="radio" name="domainoption" value="incart" id="selincart" class="icheck cpdoption" /> <span>{$LANG.cartproductdomainuseincart}</span>
							                            </label>
							                            <div class="domain-input-group clearfix" id="domainincart">
															<div class="col-md-6">
						                                        <div class="domains-row">
						                                            <select id="incartsld" name="incartdomain" class="form-control">
						                                                {foreach key=num item=incartdomain from=$incartdomains}
						                                                    <option value="{$incartdomain}">{$incartdomain}</option>
						                                                {/foreach}
						                                            </select>
						                                        </div>
																<br />
						                                        <button type="submit" class="btn btn-primary btn-3d">
						                                            {$LANG.orderForm.use}
						                                        </button>
															</div>
							                            </div>
							                        </div>
							                    {/if}
							                    {if $registerdomainenabled}
							                        <div class="option">
							                            <label class="radio-icheck">
							                                <input type="radio" name="domainoption" value="register" id="selregister" class="icheck cpdoption"{if $domainoption eq "register"} checked{/if} /> <span>{$LANG.cartregisterdomainchoice|sprintf2:$companyname}</span>
							                            </label>
							                            <div class="domain-input-group clearfix" id="domainregister">
						                                    <div class="col-md-10">
						                                        <div class="domains-row">
					                                                <div class="input-group">
					                                                    <span class="input-group-addon">{$LANG.orderForm.www}</span>
					                                                    <input type="text" id="registersld" value="{$sld}" class="form-control" autocapitalize="none" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.enterDomain'}" />
					                                                    <span class="input-group-btn" id="tlddropdown2">
																			<button type="button" id="tldbutton2" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown"><span id="tldbtn2">{$registertlds.0}</span> <span class="caret"></span></button>
																			<ul class="dropdown-menu dropdown-menu-right">
																				{foreach $registertlds as $listtld}
																					<li class="text-right"><a href="#" onClick="document.getElementById('registertld').value='{$listtld}'">{$listtld}</a></li>
										                                        {/foreach}
																			</ul>
																		</span>
					                                                </div>
					                                                <input type="hidden" id="registertld" value="{$registertlds.0}" />
						                                        </div>
																<br />
						                                        <button type="submit" class="btn btn-primary btn-3d">
						                                            {$LANG.orderForm.check}
						                                        </button>
							                                </div>
							                            </div>
							                        </div>
							                    {/if}
							                    {if $transferdomainenabled}
							                        <div class="option">
							                            <label class="radio-icheck">
							                                <input type="radio" name="domainoption" value="transfer" id="seltransfer" class="icheck cpdoption"{if $domainoption eq "transfer"} checked{/if} /> <span>{$LANG.carttransferdomainchoice|sprintf2:$companyname}</span>
							                            </label>
							                            <div class="domain-input-group clearfix" id="domaintransfer">
							                            	<div class="col-md-10">
						                                        <div class="domains-row">
					                                                <div class="input-group">
					                                                    <span class="input-group-addon">{lang key='orderForm.www'}</span>
					                                                    <input type="text" id="transfersld" value="{$sld}" class="form-control" autocapitalize="none" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.enterDomain'}" />
																		<span class="input-group-btn" id="tlddropdown3">
																			<button type="button" id="tldbutton3" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown"><span id="tldbtn3">{$transfertlds.0}</span> <span class="caret"></span></button>
																			<ul class="dropdown-menu dropdown-menu-right">
																				{foreach $transfertlds as $listtld}
																					<li class="text-right"><a href="#" onClick="document.getElementById('transfertld').value='{$listtld}'">{$listtld}</a></li>
										                                        {/foreach}
																			</ul>
																		</span>
					                                                </div>
																	<input type="hidden" id="transfertld" value="{$transfertlds.0}" />
						                                        </div>
																<br />
						                                        <button type="submit" class="btn btn-primary btn-3d">
						                                            {$LANG.orderForm.transfer}
						                                        </button>
					                                        </div>
														</div>
						                            </div>
							                    {/if}
							                    {if $owndomainenabled}
							                        <div class="option">
							                            <label class="radio-icheck">
							                                <input type="radio" name="domainoption" value="owndomain" id="selowndomain" class="icheck cpdoption"{if $domainoption eq "owndomain"} checked{/if} /> <span>{$LANG.cartexistingdomainchoice|sprintf2:$companyname}</span>
							                            </label>
							                            <div class="domain-input-group clearfix" id="domainowndomain">
								                            <div class="col-md-10">
						                                        <div class="domains-row">
					                                                <div class="input-group">
					                                                    <span class="input-group-addon">{lang key='orderForm.www'}</span>
																		<input type="text" id="owndomainsld" value="{$sld}" placeholder="{$LANG.yourdomainplaceholder}" class="form-control" autocapitalize="none" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.enterDomain'}" />
																		<span class="input-group-addon dot">.</span>
							                                            <input type="text" id="owndomaintld" size="4" value="{$tld|substr:1}" placeholder="{$LANG.yourtldplaceholder}" class="form-control" autocapitalize="none" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.required'}" />
							                                        </div>
							                                    </div>
							                                    <br />
						                                        <button type="submit" class="btn btn-primary btn-3d" id="useOwnDomain">
						                                            {$LANG.orderForm.use}
						                                        </button>
							                                </div>
							                            </div>
							                        </div>
							                    {/if}
												{if $subdomains}
							                        <div class="option">
							                            <label class="radio-icheck">
							                                <input type="radio" name="domainoption" value="subdomain" id="selsubdomain" class="icheck cpdoption"{if $domainoption eq "subdomain"} checked{/if} /> <span>{$LANG.cartsubdomainchoice|sprintf2:$companyname}</span>
							                            </label>
							                            <div class="domain-input-group clearfix" id="domainsubdomain">
								                            <div class="col-md-10">
						                                        <div class="domains-row">
					                                                <div class="input-group">
					                                                    <span class="input-group-addon">http://</span>
							                                            <input type="text" id="subdomainsld" value="{$sld}" placeholder="yourname" class="form-control" autocapitalize="none" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.enterDomain'}" />
							                                            <span class="input-group-btn" id="tlddropdown4">
																			<button type="button" id="tldbutton4" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown"><span id="tldbtn4">{$subdomains.0}</span> <span class="caret"></span></button>
																			<ul class="dropdown-menu dropdown-menu-right">
																				{foreach $subdomains as $subid => $subdomain}
																					<li class="text-right"><a href="#" onClick="document.getElementById('subdomaintld').value='{$subid}'">{$subdomain}</a></li>
										                                        {/foreach}
																			</ul>
																		</span>
																	</div>
						                                        </div>
																<br />
						                                        <button type="submit" class="btn btn-primary btn-3d">
						                                            {$LANG.orderForm.check}
						                                        </button>
																<select id="subdomaintld" class="form-control" style="visibility:hidden;">
				                                                    {foreach $subdomains as $subid => $subdomain}
				                                                        <option value="{$subid}">{$subdomain}</option>
				                                                    {/foreach}
				                                                </select>
							                                </div>
							                            </div>
							                        </div>
												{/if}
							                </div>
											{if $freedomaintlds}
							                    <br /><p>* <em>{$LANG.orderfreedomainregistration} {$LANG.orderfreedomainappliesto}: {$freedomaintlds}</em></p><br />
											{/if}
										</div>
									</div>
								</div>
							</div>
						</form>
						<div class="clearfix"></div>
						<form method="post" action="cart.php?a=add&pid={$pid}&domainselect=1" id="frmProductDomainSelections">
			                <div id="DomainSearchResults" class="w-hidden">
								<div class="row">
									<div class="col-md-12">
						                <div id="searchDomainInfo" class="domain-checker-result-headline">
						                    <p id="primaryLookupSearching" class="domain-lookup-loader domain-lookup-primary-loader domain-searching domain-checker-result-headline">
							                    <i class="fas fa-spinner fa-spin"></i>
							                    <br />
							                    <span class="domain-lookup-register-loader">{lang key='orderForm.checkingAvailability'}...</span>
												<span class="domain-lookup-transfer-loader">{lang key='orderForm.verifyingTransferEligibility'}...</span>
												<span class="domain-lookup-other-loader">{lang key='orderForm.verifyingDomain'}...</span>
							                </p>
						                    <div id="primaryLookupResult" class="domain-lookup-result domain-lookup-primary-results w-hidden">
						                        <div class="domain-unavailable domain-checker-unavailable">
							                        <div class="alert alert-danger unavailable-detail">
														<i class="fas fa-2x fa-times"></i>
														<span class="results-text">
															{lang key='orderForm.domainIsUnavailable'}
														</span>
														<div class="clearfix"></div>
													</div>
						                        </div>
						                        <div class="domain-available domain-checker-available">
						                        	<div class="alert alert-success domain-result domain-price">
											            <i class="fas fa-2x fa-check"></i>
											            <span class="results-text">
											            	<strong></strong>
											            	{$LANG.domainavailable2}
															<span class="register-price-label">{lang key='orderForm.domainPriceRegisterLabel'}</span>
															<span class="price"></span>
											            </span>
										            </div>
									            </div>
									            <div class="btn btn-primary domain-contact-support headline">{$LANG.domainContactUs}</div>
						                        <div class="transfer-eligible"></p>
						                        	<div class="alert alert-success domain-result domain-price">
											            <i class="fas fa-2x fa-check"></i>
											            <span class="results-text">
											            	<strong></strong>
											            	{lang key='orderForm.transferEligible'}!
											            	<span class="transfer-price-label w-hidden">{lang key='orderForm.domainPriceRegisterLabel'}</span>
															<span class="price"></span>
											            </span>
										            </div>
										            <div class="transfer-eligible-detail panel panel-default">
											            <div class="transfer-eligible-detail panel-heading">
											            	<h3 class="panel-title">{$LANG.domaintransfer}</h3>
											            </div>
											        	<div class="transfer-eligible-detail panel-body">
												            <p>{lang key='orderForm.transferUnlockBeforeContinuing'}</p>
											        	</div>
										            </div>
									            </div>
							                    <div class="transfer-not-eligible">
								                    <div class="alert alert-danger transfer-not-eligible-detail domain-price">
														<i class="fas fa-2x fa-times"></i>
														<span class="results-text">
															{lang key='orderForm.transferNotEligible'}
														</span>
														<div class="clearfix"></div>
													</div>
													<div class="panel panel-default transfer-not-eligible-detail">
											            <div class="transfer-not-eligible-detail panel-heading">
											            	<h3 class="panel-title">{$LANG.domaintransfer}</h3>
											            </div>
														<div class="panel-body transfer-not-eligible-detail">
															<p>{lang key='orderForm.transferNotRegistered'}</p>
															<p>{lang key='orderForm.trasnferRecentlyRegistered'}</p>
															<p>{lang key='orderForm.transferAlternativelyRegister'}</p>
														</div>
													</div>
												</div>
												<div class="domain-invalid alert alert-warning">
						                            <div class="domain-invalid-detail">
														<i class="fas fa-2x fa-exclamation-triangle"></i>
														<span class="results-text">
															{lang key='orderForm.domainInvalid'}
														</span>
														<div class="clearfix"></div>
													</div>
													<div class="domain-invalid-detail">
														<div class="domain-invalid-detail">
															<br>
															<p>
																{lang key='orderForm.domainLetterOrNumber'}<span class="domain-length-restrictions">{lang key='orderForm.domainLengthRequirements'}</span><br />
																{lang key='orderForm.domainInvalidCheckEntry'}
															</p>
														</div>
													</div>
					                            </div>
					                            <div class="alert alert-warning domain-error">
													{lang key='erroroccured'}
					                            </div>
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
					                            <input type="hidden" id="resultDomainOption" name="domainoption" />
					                            <input type="hidden" id="resultDomain" name="domains[]" />
					                            <input type="hidden" id="resultDomainPricingTerm" />
											</div>
						                </div>
						            </div>
					            </div>
			                    {if $registerdomainenabled}
									{if $spotlightTlds}
						                <div class="row">
											<div class="col-md-12">
							                    <div id="spotlightTlds" class="spotlight-tlds clearfix w-hidden">
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
							                                            <button type="button" class="btn w-hidden btn-sm btn-success btn-add-to-cart product-domain" data-whois="0" data-domain="">
							                                                <span class="to-add"><i class="fas fa-cart-plus"></i> {lang key='orderForm.add'}</span>
																			<span class="loading"><i class="fas fa-spinner fa-spin"></i> {lang key='loading'}</span>
							                                                <span class="added"><i class="fas fa-check"></i> {lang key='domaincheckeradded'}</span>
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
							                <div class="suggested-domains w-hidden">
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
																	<span class="promo w-hidden"></span>
																</td>
																<td class="text-right">
										                            <button type="button" class="btn btn-sm btn-default btn-add-to-cart product-domain" data-whois="1" data-domain="">
										                                <span class="to-add"><i class="fas fa-cart-plus"></i> {$LANG.addtocart} (<span class="to-add price"></span>)</span>
																		<span class="loading"><i class="fas fa-spinner fa-spin"></i> {lang key='loading'}</span>
																		<span class="added"><i class="fas fa-check"></i> {lang key='domaincheckeradded'}</span>
																		<span class="unavailable"><i class="fas fa-exclamation-triangle"></i> {$LANG.domaincheckertaken}</span>
										                            </button>
										                            <button type="button" class="btn btn-sm btn-primary domain-contact-support w-hidden">{lang key='domainChecker.contactSupport'}</button>

																</td>
															</tr>
									                        <tr class="panel-footer more-suggestions w-hidden text-center">
										                        <td colspan="2" class="text-muted text-center">
											                        <a id="moreSuggestions" href="#" onclick="loadMoreSuggestions();return false;">{lang key='domainsmoresuggestions'}</a>
											                        <span id="noMoreSuggestions" class="no-more small w-hidden">{lang key='domaincheckernomoresuggestions'}</span>
										                        </td>
										                    </tr>
														</tbody>
								                    </table>
						                  			<div class="panel-footer">
														<i class="fas fa-exclamation-circle"></i> &nbsp; <small>{lang key='domainssuggestionswarnings'}</small>
													</div>
								                </div>
							                </div>
							            </div>
					                </div>
			                    {/if}
				                <div>
									<button id="btnDomainContinue" type="submit" class="btn btn-primary btn-3d btn-lg" disabled="disabled">
						                {$LANG.continue}
						                &nbsp;<i class="fas fa-arrow-circle-right"></i>
						            </button>
						            <button type="button" class="btn btn-default pull-right res-left res-100" onclick="cancelcheck();return false">{$LANG.cancel}</button>
								</div>
			                </div>
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
{include file="orderforms/$carttpl/icheck.tpl"}
