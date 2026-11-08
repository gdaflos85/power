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
			<h1 class="h1">{$LANG.orderconfirmation}</h1>
		</div>
	</div>
	<!-- Display sidebar layout if applicable -->
	{if $itCartSidebarDisplay eq "enabled"}
		<div class="row cart-main-column">
			<div id="internal-content" class="{if $itCartSidebarDisplayMode eq "showhide"}col-md-12{else}col-md-9{/if} pull-md-left">
				{/if}
				<form method="post" action="{$systemurl}dologin.php" role="form">
                    <div class="row">	
                        <div class="{if $linkableProviders}col-md-8 col-md-offset-2{else}col-md-6 col-md-offset-3{/if}">
                            <div class="panel panel-default panel-login">
                                <div class="panel-heading">
                                    <h3 class="panel-title">{$LANG.login}</h3>
                                </div>
                                <div class="panel-body">
                                    {if $incorrect}
                                        <div class="alert alert-danger alert-dismissable">
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                            <strong>{$LANG.loginincorrect}</strong>
                                        </div>
                                    {elseif $verificationId && empty($transientDataName)}
                                        {include file="$template/includes/alert.tpl" type="error" msg=$LANG.verificationKeyExpired textcenter=true}
                                    {elseif $ssoredirect}
                                        {include file="$template/includes/alert.tpl" type="info" msg=$LANG.sso.redirectafterlogin textcenter=true}
                                    {/if}
                                    <div class="providerLinkingFeedback"></div>
                                    {if $linkableProviders}
                                        <div class="row">
                                            <div class="col-md-7">
                                    {/if}
                                                <div class="form-group">
                                                    <label for="username">{$LANG.loginemail}</label>
                                                    <input type="email" name="username" id="username" class="form-control" placeholder="{$LANG.loginemail}" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="password">{$LANG.loginpassword}</label>
                                                    <input name="password" id="password" type="password" class="form-control" placeholder="{$LANG.loginpassword}" autocomplete="off" />
                                                </div>
                                                <div class="form-group">
                                                    <div class="radio">
                                                        <input type="checkbox" name="rememberme"{if $rememberme} checked="checked"{/if} /> 
                                                        <label>{$LANG.loginrememberme}</label>
                                                    </div>
                                                </div>
                                                <input id="loginhidden" type="submit" style="position: absolute; left: -9999px;" value="{$LANG.loginbutton}" />
                                    {if $linkableProviders}
                                            </div>
                                            <div class="col-md-5 social-login">
                                                {include file="$template/includes/linkedaccounts.tpl" linkContext="login" customFeedback=true}
                                            </div>
                                        </div>
                                    {/if}
                                </div>
                                <div class="panel-footer">
                                    <input id="login" type="submit" class="btn res-100 btn-3d btn-primary" value="{$LANG.loginbutton}" /> <p class="pull-right res-left" style="margin-top:10px;"><a href="pwreset.php">{$LANG.forgotpw}</a></p>
                                </div>
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