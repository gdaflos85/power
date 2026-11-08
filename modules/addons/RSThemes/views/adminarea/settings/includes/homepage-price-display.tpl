<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.general.homepage_price_display.title}
            {if isset($tooltips.settings.general.homepage_price_display.title)}
                {if isset($tooltips.settings.general.homepage_price_display.url) && $tooltips.settings.general.homepage_price_display.url != ""}
                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.general.homepage_price_display.url}' target='_blank'>Learn More</a>"}
                {else}
                    {assign var="popoverFooter" value=false}
                {/if}
                {include 
                    file="adminarea/includes/helpers/popover.tpl" 
                    popoverClasses="notification__popover"
                    popoverBody="{$tooltips.settings.general.homepage_price_display.title}"
                    popoverFooter="{$popoverFooter}"
                }
            {/if}
        </h6>
        <label>
            <div class="switch">
                <input type="hidden" name="settings[display_longest_billing_cycle_monthly_price]" value="0"/>
                <input class="switch__checkbox"
                        name="settings[display_longest_billing_cycle_monthly_price]"
                        value="1"
                        type="checkbox" {if $settings['display_longest_billing_cycle_monthly_price']} checked="checked" {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div>
</div>