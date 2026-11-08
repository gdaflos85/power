<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title"> 
            {$lang.settings.section.general.hide_discounts.title}
            {if isset($tooltips.settings.general.hide_discounts.title)}
                {if isset($tooltips.settings.general.hide_discounts.url) && $tooltips.settings.general.hide_discounts.url != ""}
                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.general.hide_discounts.url}' target='_blank'>Learn More</a>"}
                {else}
                    {assign var="popoverFooter" value=false}
                {/if}
                {include 
                    file="adminarea/includes/helpers/popover.tpl" 
                    popoverClasses="notification__popover"
                    popoverBody="{$tooltips.settings.general.hide_discounts.title}"
                    popoverFooter="{$popoverFooter}"
                }
            {/if}
        </h6>
        <label>
            <div class="switch">
                <input type="hidden" name="settings[hide_discounts]" value="hidden" />
                <input 
                    class="switch__checkbox" 
                    name="settings[hide_discounts]" 
                    value="true" type="checkbox" 
                    {if $settings['hide_discounts']=="true" } checked="checked" {/if}
                > 
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div>
</div>