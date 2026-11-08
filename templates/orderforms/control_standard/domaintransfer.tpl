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
			<h1 class="h1">{$LANG.transferdomain}</h1>
			<small class="res-left pull-right" style="margin: 12px 12px 20px 12px;">{lang key='orderForm.transferExtend'} *</small>
		</div>
	</div>
	<!-- Display sidebar layout if applicable -->
	{if $itCartSidebarDisplay eq "enabled"}
		<div class="row cart-main-column">
			<div id="internal-content" class="{if $itCartSidebarDisplayMode eq "showhide"}col-md-12{else}col-md-9{/if} pull-md-left">
				{/if}
				<div class="row">
					<div class="col-md-12">
			            <form method="post" action="cart.php" id="frmDomainTransfer">
			                <input type="hidden" name="a" value="addDomainTransfer">
			                <div class="row">
			                    <div class="col-md-12">
			                        <div class="panel panel-default">
			                            <div class="panel-heading">
			                                <h3 class="panel-title">{lang key='orderForm.singleTransfer'}</h3>
			                            </div>
			                            <div class="panel-body">
			                                <div class="form-group">
			                                    <label for="inputTransferDomain">{lang key='domainname'}</label>
			                                    <input type="text" class="form-control" name="domain" id="inputTransferDomain" value="{$lookupTerm}" placeholder="{lang key='yourdomainplaceholder'}.{lang key='yourtldplaceholder'}" data-toggle="tooltip" data-placement="bottom" data-trigger="manual" title="{lang key='orderForm.enterDomain'}" />
			                                </div>
			                                <div class="form-group">
			                                    <label for="inputAuthCode" style="width:100%;">
			                                        {lang key='orderForm.authCode'}
			                                        <a href="" data-toggle="tooltip" data-placement="{if $itTextDirectionRTL eq "enabled"}right{else}left{/if}" title="{lang key='orderForm.authCodeTooltip'}" class="pull-right"><i class="fas fa-question-circle"></i> {lang key='orderForm.help'}</a>
			                                    </label>
			                                    <input type="text" class="form-control" name="epp" id="inputAuthCode" placeholder="{lang key='orderForm.authCodePlaceholder'}" data-toggle="tooltip" data-placement="bottom" data-trigger="manual" title="{lang key='orderForm.required'}" />
			                                </div>
			                                <div id="transferUnavailable" class="alert alert-warning slim-alert text-center w-hidden"></div>
			                                {if $captcha->isEnabled() && !$captcha->recaptcha->isEnabled()}
			                                    <div class="captcha-container" id="captchaContainer">
                                                    <br />
                                                    <div class="default-captcha well">
                                                        <strong><p>{lang key="cartSimpleCaptcha"}</p></strong>
                                                        <div>
                                                            <img id="inputCaptchaImage" src="{$systemurl}includes/verifyimage.php" />
                                                            <input id="inputCaptcha" type="text" name="code" maxlength="6" class="input-sm" data-toggle="tooltip" data-placement="bottom" data-trigger="manual" title="{lang key='orderForm.required'}" />
                                                        </div>
                                                    </div>
			                                    </div>
                                            {elseif $captcha->isEnabled() && $captcha->recaptcha->isEnabled() && !$captcha->recaptcha->isInvisible()}
                                                <div class="form-group recaptcha-container" id="captchaContainer"></div>
			                                {/if}
			                            </div>
			                            <div class="panel-footer">
			                                <button type="submit" id="btnTransferDomain" class="btn btn-primary btn-3d btn-transfer {$captcha->getButtonClass($captchaForm)}">
			                                    <span class="loader w-hidden" id="addTransferLoader">
			                                        <i class="fas fa-fw fa-spinner fa-spin"></i>
			                                    </span>
			                                    <span id="addToCart">{lang key="orderForm.addToCart"}</span>
			                                </button>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </form>
			            <p class="text-center small">* {lang key='orderForm.extendExclusions'}</p>
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
