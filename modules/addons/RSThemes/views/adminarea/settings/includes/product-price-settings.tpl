<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.order_process.product_price_calculation.title}
        </h6>
    </div>
    <div class="collapse show">
        <div class="form-group p-t-3x" >
            <label class="form-label">
                {$lang.settings.section.order_process.product_price_calculation.label}
                {if isset($tooltips.settings.order_process.product_price_calculation.title)}
                    {if isset($tooltips.settings.order_process.product_price_calculation.url) && $tooltips.settings.order_process.product_price_calculation.url != ""}
                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.order_process.product_price_calculation.url}' target='_blank'>Learn More</a>"}
                    {else}
                        {assign var="popoverFooter" value=false}
                    {/if}
                    {include 
                        file="adminarea/includes/helpers/popover.tpl" 
                        popoverClasses="notification__popover"
                        popoverBody="{$tooltips.settings.order_process.product_price_calculation.title}"
                        popoverFooter="{$popoverFooter}"
                    }
                {/if}
            </label>
            <select class="form-control selectized opacity-1" name="settings[price_calculation]" tabindex="-1">
                <option value="default" {if $settings['price_calculation'] == 'default'} selected {/if}>{$lang.settings.section.order_process.product_price_calculation.price.default}</option>
                <option value="lowest" {if $settings['price_calculation'] == 'lowest'} selected {/if}>{$lang.settings.section.order_process.product_price_calculation.price.lowest}</option>
            </select>
        </div>
    </div>
</div>