<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.order_process.promocode_banner_label.title}
            {if isset($tooltips.settings.order_process.promocode_banner_label.title)}
                {if isset($tooltips.settings.order_process.promocode_banner_label.url) && $tooltips.settings.order_process.promocode_banner_label.url != ""}
                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.order_process.promocode_banner_label.url}' target='_blank'>Learn More</a>"}
                {else}
                    {assign var="popoverFooter" value=false}
                {/if}
                {include 
                    file="adminarea/includes/helpers/popover.tpl" 
                    popoverClasses="notification__popover"
                    popoverBody="{$tooltips.settings.order_process.promocode_banner_label.title}"
                    popoverFooter="{$popoverFooter}"
                }
            {/if}
        </h6>
        <label>
            <div class="switch">
                <input type="hidden" name="settings[promocode_banner_label]" value="hidden"/>
                <input class="switch__checkbox"
                        name="settings[promocode_banner_label]" value="enabled"
                        type="checkbox" {if isset($settings['promocode_banner_label']) && $settings['promocode_banner_label'] == "enabled"} checked="checked" {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div> 
</div>