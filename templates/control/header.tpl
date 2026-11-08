<!DOCTYPE html>
<!-- Load theme options -->
{include file="$template/includes/theme-options.tpl"}
<!-- Load theme functions -->
{include file="$template/includes/theme-functions.tpl"}
{if $itTextDirectionRTL eq "enabled"}
	<html  lang="{$activeLocale.languageCode}" dir="rtl">
{else}
	<html lang="{$activeLocale.languageCode}">
{/if}
	<head>
		<meta charset="{$charset}" />
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>
		{include file="$template/includes/head.tpl"}
		<!-- WHMCS head Output -->
		{$headoutput}
	</head>
	<body class="off-canvas {if $templatefile eq "wbteampro"}template-wbteampro{else}{$templatefile}{/if} {$itColorScheme} {$LANG.locale}" data-phone-cc-input="{$phoneNumberInputStyle}">
		<!-- WHMCS header Output -->
		{$headeroutput}
        <!-- Pre-loader -->
        <div class="preloader-wrapper">
		    <div class="preloader">
		        <div class="dot-pulse"></div>
		    </div>
		</div>
		<!-- Display brand and main nav bar -->
		<div id="container"{if $itShowMainNav eq "no"} class="no-sidebar"{elseif $itMainNavState eq "mini"} class="sidebar-mini"{/if} data-load-sidebar-state="{$itMainNavLoadState}">
			<header id="header" {if $itBrandDisplay neq "enabled"}class="nobrand"{/if}>
				<!--logo start-->
				{if $itBrandDisplay eq "enabled"}
					<div class="brand">
						<!-- Display brand -->
						{include file="$template/includes/brand.tpl"}
					</div>
				{/if}
				<!--logo end-->
				{if $itShowMainNav eq "yes"}
					<div class="toggle-navigation toggle-left">
						<button type="button" class="btn btn-default" id="toggle-left">
							<span class="sr-only">{lang key='toggleNav'}</span>
							<i class="fas fa-bars"></i>
						</button>
					</div>
				{/if}
				<div class="user-nav">
					<ul>
						<!-- Display Desktop Shopping Cart Link, if enabled -->
						{if $itCartIconDisplayDesktop eq "enabled" or $itCartIconDisplayMobile eq "enabled"}
							<li id="carticondesk" class="dropdown messages {if $itCartIconDisplayDesktop neq "enabled" and $itCartIconDisplayMobile eq "enabled"}visible-xs-inline-block{elseif $itCartIconDisplayDesktop eq "enabled" and $itCartIconDisplayMobile neq "enabled"}hidden-xs{/if}">
								<span class="badge badge-primary animated bounceIn" id="cartItemCount">{$cartitemcount}</span>
								<button type="button" class="btn btn-default options" id="cart-link" onclick="window.location.assign('{$WEB_ROOT}/cart.php?a=view')">
									<i class="fas fa-shopping-cart"></i>
								</button>
							</li>
						{/if}
						<!-- Display Desktop Account Notifications, if enabled -->
						{if $loggedin}
							{if $itNotificationsIconDisplayDesktop eq "enabled" or $itNotificationsIconDisplayMobile eq "enabled"}
								<li class="dropdown messages {if $itNotificationsIconDisplayDesktop neq "enabled" and $itNotificationsIconDisplayMobile eq "enabled"}visible-xs-inline-block{elseif $itNotificationsIconDisplayDesktop eq "enabled" and $itNotificationsIconDisplayMobile neq "enabled"}hidden-xs{/if}">
									<span class="badge badge-danager animated bounceIn">{$clientAlerts|count}</span>
									<button type="button" class="btn btn-default options" data-toggle="dropdown" id="accountNotifications2" data-placement="bottom">
										<i class="fas fa-exclamation-triangle"></i>
									</button>
									<ul class="dropdown-menu alert animated fadeInDown">
										<li>
											<div class="header"><strong>{$clientAlerts|count}</strong> {$LANG.notifications}</div>
										</li>
										{foreach $clientAlerts as $alert}
											<li>
												<div class="message-content text-{$alert->getSeverity()}">{$alert->getMessage()}{if $alert->getLinkText()} <a href="{$alert->getLink()}" class="btn btn-xs btn-{$alert->getSeverity()}">{$alert->getLinkText()}</a>{/if}</div>
											</li>
										{foreachelse}
											<li>
												<div class="message-content text-success"><i class="fas fa-check-square"></i> {$LANG.notificationsnone}</div>
											</li>
										{/foreach}
									</ul>
								</li>
							{/if}
						{/if}
						<!-- Display Desktop Header Language Chooser, if enabled -->
                        {if $languagechangeenabled and count($locales) > 1}
                            {if $itLanguageIconDisplayDesktop eq "enabled" or $itLanguageIconDisplayMobile eq "enabled"}
                                <li class="dropdown languages {if $itLanguageIconDisplayDesktop neq "enabled" and $itLanguageIconDisplayMobile eq "enabled"}visible-xs-inline-block{elseif $itLanguageIconDisplayDesktop eq "enabled" and $itLanguageIconDisplayMobile neq "enabled"}hidden-xs{/if}">
                                    <button type="button" class="btn btn-default options" data-toggle="dropdown" id="languageChooserTop" data-placement="bottom">
                                        <i class="fas fa-globe-americas"></i>
                                    </button>
                                    <ul class="dropdown-menu chooser animated fadeInDown">
                                        <li>
                                            <div class="header">{$LANG.chooselanguage}</div>
                                        </li>
                                        <li>
                                            <ul class="langs">
                                                {foreach $locales as $locale}
                                                    <li><a href="{$currentpagelinkback}language={$locale.language}">{$locale.localisedName}</a></li>
                                                {/foreach}
                                            </ul>
                                        <li>
                                    </ul>
                                </li>
                            {/if}
                        {/if}
						{include file="$template/includes/navbar-user.tpl" navbar=$secondaryNavbar}
					</ul>
				</div>
			</header>
            <div class="flex-wrap">
                {if $itShowMainNav eq "yes"}
                    <!--sidebar left start-->
                    <nav class="sidebar sidebar-left">
                        <ul class="nav nav-pills nav-stacked">
                            {include file="$template/includes/navbar-main.tpl" navbar=$primaryNavbar}
                        </ul>
                    </nav>
                    <!--sidebar left end-->
                {/if}
                <!--main content start-->
                <section class="main-content-wrapper">
                    <!-- If page isn't shopping cart, display page header, feat content, and setup main content and sidebar layout -->
                    {if !$inShoppingCart}
                        <section id="main-content">
                            <!-- Display page title -->
                            {include file="$template/includes/pageheader.tpl"}
							{include file="$template/includes/validateuser.tpl"}
                            {include file="$template/includes/verifyemail.tpl"}
                            {if $adminMasqueradingAsClient}
                                <!-- Return to admin link -->
                                <div class="alert alert-danger alert-dismissible admin-masquerade-notice">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    {$LANG.adminmasqueradingasclient}<br />
                                    <a href="{$WEB_ROOT}/logout.php?returntoadmin=1" class="alert-link">{$LANG.logoutandreturntoadminarea}</a>
                                </div>
                            {elseif $adminLoggedIn}
                                <!-- Return to admin link -->
                                <div class="alert alert-danger alert-dismissible admin-masquerade-notice">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    {$LANG.adminloggedin}<br />
                                    <a href="{$WEB_ROOT}/logout.php?returntoadmin=1" class="alert-link">{$LANG.returntoadminarea}</a>
                                </div>
                            {/if}
                            <!-- Display featured content section (if applicable) -->
                            {if $itFeaturedContent eq "yes"}
                                {include file="$template/includes/featured-content.tpl"}
                            {/if}
                            <!-- Display sidebar layout if applicable -->
                            {if $itShowSidebarLayout eq "yes"}
                                <div class="row">
                                    {if $itShowSidebarPrimary eq "yes"}
                                        <div class="col-md-3 pull-md-right whmcs-sidebar sidebar-primary">
                                            {include file="$template/includes/sidebar-primary.tpl" sidebar=$primarySidebar}
                                        </div>
                                    {/if}
                                    <div id="internal-content" class="col-md-9 pull-md-left">
                            {/if}
                            <!-- Display custom module wrapper if applicable -->
                            {if $itShowContentWrapper eq "yes"}
                                <div class="panel panel-default custom-module-wrapper">
                                    <div class="panel-body">
                            {/if}
                    {/if}
