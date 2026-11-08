<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title"> 
            {$lang.settings.section.order_process.product_description_settings.title}
            {if isset($tooltips.settings.order_process.product_description_settings.title)}
                {if isset($tooltips.settings.order_process.product_description_settings.url) && $tooltips.settings.order_process.product_description_settings.url != ""}
                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.order_process.product_description_settings.url}' target='_blank'>Learn More</a>"}
                {else}
                    {assign var="popoverFooter" value=false}
                {/if}
                {include 
                    file="adminarea/includes/helpers/popover.tpl" 
                    popoverClasses="notification__popover"
                    popoverBody="{$tooltips.settings.order_process.product_description_settings.title}"
                    popoverFooter="{$popoverFooter}"
                }
            {/if}
        </h6>
        <label>
            <div class="switch">
                <input type="hidden" name="settings[product_description_style]" value="default" />
                <input 
                    class="switch__checkbox" 
                    name="settings[product_description_style]" 
                    value="clear" type="checkbox"
                    {if $settings['product_description_style'] != "default" } checked="checked" {/if}
                > 
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div>
</div>