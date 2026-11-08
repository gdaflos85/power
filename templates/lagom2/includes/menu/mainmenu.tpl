{if file_exists("templates/$template/includes/menu/overwrites/mainmenu.tpl")}
    {include file="{$template}/includes/menu/overwrites/mainmenu.tpl"}
{else}
    <div class="app-nav-menu{if $topNavStyle} app-nav-menu-{$topNavStyle}{/if}" id="main-menu">
        <div class="container">
            {if $RSThemes.layouts.vars.type == "condensed"}
                {include file="$template/includes/common/logo.tpl" ignoreMobileVersion="true"}
            {/if}
            <ul class="menu menu-primary {if $RSThemes.addonSettings.mobile_menu_style == 'dropdown'}menu-primary-mobile-dropdown{/if}" data-nav>
                {include file="$template/includes/navbar.tpl" navbar=$primaryNavbar navtype="primary"}
            </ul>
        </div>
    </div>
{/if}
