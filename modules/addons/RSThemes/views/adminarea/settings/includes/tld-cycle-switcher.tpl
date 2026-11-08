<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title"> 
            {$lang.settings.section.order_process.tld_cycle_switcher.title}
            {if isset($tooltips.settings.order_process.tld_cycle_switcher.title)}
                {if isset($tooltips.settings.order_process.tld_cycle_switcher.url) && $tooltips.settings.order_process.tld_cycle_switcher.url != ""}
                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.order_process.tld_cycle_switcher.url}' target='_blank'>Learn More</a>"}
                {else}
                    {assign var="popoverFooter" value=false}
                {/if}
                {include 
                    file="adminarea/includes/helpers/popover.tpl" 
                    popoverClasses="notification__popover"
                    popoverBody="{$tooltips.settings.order_process.tld_cycle_switcher.title}"
                    popoverFooter="{$popoverFooter}"
                }
            {/if}
        </h6>
        <label>
            <div class="switch">
                <input type="hidden" name="settings[tld_cycle_switcher]" value="hidden" />
                <input 
                    class="switch__checkbox" 
                    name="settings[tld_cycle_switcher]" 
                    value="true" type="checkbox" 
                    {if $settings['tld_cycle_switcher']=="true" } checked="checked" {/if}
                > 
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div>
</div>