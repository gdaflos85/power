{if file_exists("templates/$template/includes/common/overwrites/currency-dropdown.tpl")}
     {include file="{$template}/includes/common/overwrites/currency-dropdown.tpl"}  
{else}
    {if $templatefile|strstr:"modules/addons/LagomOrderForm"}
        {if $currentpagelinkback|strstr:"?"}
            {$currentpagelinkback = rtrim($currentpagelinkback, '&amp;')}
            {$divChar = "&amp;"}
        {else}
            {$currentpagelinkback = rtrim($currentpagelinkback, '?')}
            {$divChar = "?"}
        {/if}
    {elseif $currentUrl|strstr:"?"}
        {$currentpagelinkback = rtrim($currentpagelinkback, '&amp;')}
        {$divChar = "&amp;"}
    {else}
        {$currentpagelinkback = rtrim($currentpagelinkback, '?')}
        {$divChar = "?"}
    {/if}
    {if $pageType == "website" && $currentpagelinkback|strstr:"cmsid"}
        {$divChar = ""}
        {$url = "?"|explode:$currentpagelinkback}
        {$url2 = "&amp;"|explode:$url[1]}
        {$stringToReplace = "`$url2[0]`"}
    {else}
        {$stringToReplace = ""}
    {/if}
    {if !$loggedin && $currencies && is_array($currencies)}
        <div class="dropdown-menu dropdown-menu-right">
            <div class="dropdown-menu-items has-scroll">
                {foreach $currencies as $currency}
                    <div class="dropdown-menu-item {if $activeCurrency.id == $currency.id}active{/if}">
                        <a href="{$currentpagelinkback|replace:$stringToReplace:""}{$divChar}currency={$currency.id}" rel="nofollow">
                            <span>{$currency.code}</span>
                        </a>
                    </div>
                {/foreach}
            </div>                 
        </div>
        {if isset($RSThemes['addonSettings']['hover_triggered_submenu_expansion']) && $RSThemes['addonSettings']['hover_triggered_submenu_expansion'] == "enabled" && (($RSThemes.layouts.templateLayout != 'left-nav' && $RSThemes.layouts.templateLayout != 'left-nav-wide') || (isset($navtype) && $navtype == "secondary"))}
            <div class="dropdown-menu-filler"></div>
        {/if}
    {/if}
{/if}