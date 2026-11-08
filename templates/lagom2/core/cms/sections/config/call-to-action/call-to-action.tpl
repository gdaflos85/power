<div class="site-section section-{$theme} section-cta{if $type == "horizontal"} section-cta-horizontal{/if}{if $style == "boxed"} section-cta-boxed{/if} {if $overlay} section-overlay{/if} {if $combined}section-combined{/if} {if $custom_class} {$custom_class}{/if}">
    {include file="{$smarty.current_dir}/../../common/anchor.tpl"}
    <div class="container">
        <div class="section-box {if $style == "boxed"} is-boxed{/if}">
            {if $type == "horizontal"}
                <div class="section-content">
            {/if}
            {if isset($caption) && !empty($caption)}
                <h3 class="section-caption h6">{$caption|unescape:'html'}</h3>
            {/if}
            {if isset($title) && !empty($title)}
                <h2 class="section-title h2 text-bold">{$title|unescape:'html'}</h2>
            {/if}
            {if isset($subtitle) && !empty($subtitle)}
                <div class="section-subtitle">{$subtitle|unescape:'html'}</div>
            {/if}
            {if $type == "horizontal"}
                </div>
            {/if}
            {if !empty($buttons) || $show_product_pricing}
                <div class="section-actions">
                    {if !empty($buttons)}
                        <div class="section-actions-buttons">
                            {foreach $buttons as $button}
                                {include file="{$smarty.current_dir}/../../common/button.tpl"}
                            {/foreach}  
                        </div>
                    {/if}
                    {if $show_product_pricing && !empty($product_group_pricing)}
                        <div class="section-actions-price price price-lg">
                            {if !isset($product_group_pricing.product) || empty($product_group_pricing.product) || $product_group_pricing.product.hasConfigurableOptions}
                                <span class="price-title">{$LANG.startingat}</span>
                            {/if}
                            {$formatedPrice = false}
                            {$pricePeriod = false}
                            {$packageMonthlyBreakdown = false}
                            {if isset($product_group_pricing.product) && !empty($product_group_pricing.product)}
                                {if isset($product_group_pricing.product['price']['type']) && $product_group_pricing.product['price']['type'] == "recurring"}
                                    {if $display_billing_monthly_price}
                                        {$formatedPrice = formatCurrency($product_group_pricing.product['price']['tabs'][$product_group_pricing.product['price']['bestCycle']]['price'])}
                                        {$pricePeriod = 'monthly'}
                                    {else}
                                        {$formatedPrice = formatCurrency($product_group_pricing.product['price']['tabs'][$product_group_pricing.product['price']['bestCycle']]['real_price'])}
                                        {$pricePeriod = $product_group_pricing.product['price']['bestCycle']}
                                    {/if}
                                {elseif isset($product_group_pricing.product['price']['type']) && $product_group_pricing.product['price']['type'] == "onetime"}
                                    {$formatedPrice = formatCurrency($product_group_pricing.product['price']['tabs']['onetime']['price'])}
                                    {$pricePeriod = 'onetime'}    
                                {elseif isset($product_group_pricing.product['price']) && $product_group_pricing.product['price'] == "free"}
                                    {$formatedPrice = formatCurrency("0.00")}       
                                {/if}
                            {else}
                                {if isset($product_group_pricing['price']['type']) && $product_group_pricing['price']['type'] == "recurring"}
                                    {if $display_billing_monthly_price}
                                        {$formatedPrice = formatCurrency($product_group_pricing['price']['tabs'][$product_group_pricing['price']['bestCycle']]['price'])}
                                        {$pricePeriod = 'monthly'}
                                    {else}
                                        {$formatedPrice = formatCurrency($product_group_pricing['price']['tabs'][$product_group_pricing['price']['bestCycle']]['real_price'])}
                                        {$pricePeriod = $product_group_pricing['price']['bestCycle']}
                                    {/if}
                                {elseif isset($product_group_pricing['price']['type']) && $product_group_pricing['price']['type'] == "onetime"}
                                    {$formatedPrice = formatCurrency($product_group_pricing['price']['tabs']['onetime']['price'])}
                                    {$pricePeriod = 'onetime'}    
                                {elseif isset($product_group_pricing['price']) && $product_group_pricing['price'] == "free"}
                                    {$formatedPrice = formatCurrency("0.00")}       
                                {/if}
                            {/if}
                            <span class="price-ammount">
                                {$formatedPrice|replace:$WHMCSCurrency.suffix:" <sub>`$WHMCSCurrency.suffix`</sub>"}{if isset($pricePeriod) && $pricePeriod}<sub>{if isset($montlyBreakdown) && $montlyBreakdown}/{$LANG.pricingCycleShort.monthly}{elseif $pricePeriod == "onetime"} {$LANG.orderpaymenttermonetime}{else}/{$LANG.pricingCycleShort.$pricePeriod}{/if}</sub>{/if}
                            </span>  
                        </div>
                    {/if}
                </div>
            {/if}
        </div>
    </div>
</div>