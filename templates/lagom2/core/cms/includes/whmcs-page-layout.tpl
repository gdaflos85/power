{if file_exists("templates/$template/core/cms/includes/overwrites/whmcs-page-layout.tpl")}
    {include file="{$template}/core/cms/includes/overwrites/whmcs-page-layout.tpl"}
{else}
    <div class="site">
        <div class="site-banner banner banner-cms banner-primary banner-center banner-type-6 banner-no-graphic">
            <div class="container">
                <div class="banner-content">
                    <h2 class="banner-title">
                        {$displayTitle}
                    </h2>
                    {if $tagline}
                        <p class="banner-desc m-b-0">
                            {$tagline}
                        </p>
                    {/if}
                </div>
            </div>
        </div>
        <div class="site-section section-default">
            <div class="container">
                {if !$inShoppingCart}<div class="main-grid">{/if}
                {* Main grid with sidebar *}
                {if !$skipMainSidebar}
                    <div class="main-sidebar {if $sidebarOnRight} main-sidebar-right {/if}">
                        {if $RSThemes['addonSettings']['sticky_sidebars'] == "true"}<div class="sidebar-sticky">{/if}
                            <div class="sidebar sidebar-primary">
                                {include file="$template/includes/sidebar.tpl" sidebar=$primarySidebar}
                                {include file="$template/includes/sidebar/sidebar-custom.tpl"}
                            </div>
                            <div class="sidebar sidebar-secondary">
                                {include file="$template/includes/sidebar/sidebar-secondary-custom.tpl"}
                                {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
                                {include file="$template/includes/sidebar/sidebar-promo.tpl"}
                            </div>
                        {if $RSThemes['addonSettings']['sticky_sidebars'] == "true"}</div>{/if}
                    </div>
                    <div class="main-content {if $mainContentClasses}{$mainContentClasses}{/if}">
                {* Main grid without sidebar *}
                {elseif !$skipMainBodyContainer && !$inShoppingCart}
                    <div class="main-content {if $mainContentClasses}{$mainContentClasses}{/if}">
                {/if}
{/if}