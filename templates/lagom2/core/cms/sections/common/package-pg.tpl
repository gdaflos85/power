{if file_exists("{$smarty.current_dir}/overwrites/package-pg.tpl")}
    {include file="{$smarty.current_dir}/overwrites/package-pg.tpl"}  
{else}

    {* assign packages cols *}
    {include file="{$smarty.current_dir}/feature-cols.tpl"}

    {* assign price *}
    {$formatedPrice = false}
    {$pricePeriod = false}
    {$packageMonthlyBreakdown = false}
    {$packageDiscountValue = false}
    {if isset($product['group']['price']['type']) && $product['group']['price']['type'] == "recurring"}
        {if $package_price_display == "cheapest"}
            {if $display_billing_monthly_price}
                {$formatedPrice = formatCurrency($product['group']['price']['tabs'][$product['group']['price']['bestCycle']]['price'])}
                {$pricePeriod = 'monthly'}
            {else}
                {$formatedPrice = formatCurrency($product['group']['price']['tabs'][$product['group']['price']['bestCycle']]['real_price'])}
                {$pricePeriod = $product['group']['price']['bestCycle']}
            {/if}
            {if $product['apply_promocode'] == 1}
                {$bestCycle = $product.group.price.bestCycle}
                {$packageDiscountValue = $product.group.price.tabs.$bestCycle.discount.percentage|round}
            {/if}
        {else}
            {if isset($product['group']['price']['tabs'][$package_price_display]) && $product['group']['price']['tabs'][$package_price_display]['price'] != "-1"}
                {if $display_billing_monthly_price}
                    {$formatedPrice = formatCurrency($product['group']['price']['tabs'][$package_price_display]['price'])}
                    {$packageMonthlyBreakdown = true}
                {else}
                    {$formatedPrice = formatCurrency($product['group']['price']['tabs'][$package_price_display]['real_price'])}
                    {$pricePeriod = $package_price_display}
                {/if}
                {if $product['apply_promocode'] == 1}
                    {$packageDiscountValue = $product.group.price.tabs.$package_price_display.discount.percentage|round}
                {/if}
            {else}
                {$firstAvailableCycle = false}
                {foreach $product['group']['price']['tabs'] key=$key item=$checkPrice}
                    {if $checkPrice['price'] != "-1"}
                        {$firstAvailableCycle = $key}
                        {break}
                    {/if}
                {/foreach}
                {if $firstAvailableCycle}
                    {if $display_billing_monthly_price}
                        {$formatedPrice = formatCurrency($product['group']['price']['tabs'][$firstAvailableCycle]['price'])}
                        {$packageMonthlyBreakdown = true}
                    {else}
                        {$formatedPrice = formatCurrency($product['group']['price']['tabs'][$firstAvailableCycle]['real_price'])}
                        {$pricePeriod = $firstAvailableCycle}
                    {/if}
                    {if $product['apply_promocode'] == 1}
                        {$packageDiscountValue = $product.group.price.tabs.$firstAvailableCycle.discount.percentage|round}
                    {/if}
                {/if}
            {/if}
        {/if}
    {elseif isset($product['group']['price']['type']) && $product['group']['price']['type'] == "onetime"}
        {$formatedPrice = formatCurrency($product['group']['price']['tabs']['onetime']['price'])}
        {$pricePeriod = 'onetime'}    
    {elseif isset($product['group']['price']) && $product['group']['price'] == "free"}
        {$formatedPrice = formatCurrency("0.00")}       
    {/if}     

    <div class="{foreach $cols as $col} {$col}{/foreach} package-col {if $featureSlider}content-slider-item{/if}">
        {if $productType != "default" || $productType == "graphic"}
            <a href="{$product.url}" class="package package-pg package-link is-{$productStyle} {if $productType == "condensed"} package-sm {elseif $productType == "graphic"} package-type-graphic package-condensed package-sm{/if} {if $productType != "default"} package-{$productType}{/if}{if $product.custom_classes} {$product.custom_classes}{/if}{if $productCustomClasses} {$productCustomClasses}{/if} {if !$displayBestPrice && $dataPrice[$product['product_id']][$firstBillingCycle]|replace:" ":"" == "NotAvailable"} is-disabled{/if}">
            {if $packageDiscountValue}<label class="label label-savings label-package-discount">{$packageDiscountValue}% OFF</label>{/if}
        {else}
            <div class="package package-pg is-{$productStyle} {if $productType != "default"} package-{$productType}{/if}{if $product.custom_classes} {$product.custom_classes}{/if}{if $productCustomClasses} {$productCustomClasses}{/if} {if !$displayBestPrice && $dataPrice[$product['product_id']][$firstBillingCycle]|replace:" ":"" == "NotAvailable"} is-disabled{/if}">
            {if $packageDiscountValue}<label class="label label-savings label-package-discount">{$packageDiscountValue}% OFF</label>{/if}
        {/if}
            {if $product['show_icon'] && ($product['icon'] || $product['font-icon'] || $product['media'] || $product['illustration'])}
                {if isset($product['illustration'])}
                    <div class="package-graphic package-illustration" data-animation-css>
                        {include file="{$smarty.current_dir}/graphic.tpl" 
                            graphic=$product['illustration']
                            type="illustration"
                        }
                    </div> 
                {elseif isset($product['media'])}
                    <div class="package-graphic package-media">
                        {include file="{$smarty.current_dir}/graphic.tpl" 
                            graphic=$product['media']
                            type="media"
                            elementTitle=$product['group']['name']
                        }
                    </div>
                {else}
                    <div class="package-graphic package-icon" data-animation-css>
                        {if isset($product['icon'])}
                            {include file="{$smarty.current_dir}/graphic.tpl" 
                                graphic=$product['icon']
                                type="icon"
                                theme=$theme
                            }
                        {elseif isset($product['font-icon'])}
                            <div class="font-icon {if isset($product['font-icon']) && $product['font-icon']|strstr:"fa-"} font-icon-fa{/if}">
                                <i class="{$product['font-icon']}"></i>
                            </div>
                        {/if}   
                    </div>
                {/if}
            {/if}
            <h3 class="package-title {if $productType == "condensed"} h6{/if}">
                {$product['group']['name']}
            </h3>
            {if $product['group']['description']} 
                <div class="package-body">
                    <div class="package-content {if $productType == "default" || $productType == "link"} p-lg{/if}">
                        {$product['group']['description']}
                    </div>
                </div>
            {/if} 
            <div class="package-box">
                {if $productType == "default"}
                    <div class="package-header">
                        {include 
                            file="{$smarty.current_dir}/package/price.tpl"
                            type=$productType
                            priceValue=$formatedPrice
                            montlyBreakdown=$packageMonthlyBreakdown
                            cycle=$pricePeriod    
                            startingFrom=true
                        } 
                        <div class="package-actions">
                        <a href="{$product.url}" class="btn btn-primary {if $productType == "default"} btn-lg{/if}" data-btn-loader>
                                <span class="btn-text">{$LANG.learnmore}</span>
                                <div class="loader loader-button hidden" >
                                    {include file="{$smarty.current_dir}/../../../../includes/common/loader.tpl" classes="spinner-sm"}
                                </div>
                            </a>
                        </div>   
                    </div>
                {/if}
                {if $productType != "default"}
                    <div class="package-actions">
                        <div class="btn btn-link flex-row-reverse {if $productType != "condensed"} btn-lg{/if}">
                            <div class="btn-icon">
                                <i class="ls ls-arrow-right"></i>
                            </div>
                            <div class="btn-text">
                                {$LANG.startingat} <span class="btn-price"> &nbsp{$formatedPrice|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"} {if isset($pricePeriod) && $pricePeriod}{if $pricePeriod == "onetime"} {$LANG.orderpaymenttermonetime}{else} /{$LANG['pricingCycleShort'][$pricePeriod]}{/if}{/if}</span>
                            </div>
                        </div>
                    </div>
                {/if}
            </div>
        {if $productType != "default"}
        </a>
        {else}
        </div>
        {/if}            
    </div>    
{/if}    