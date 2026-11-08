

{* 
* ******************************************
    CMS Banner - Types
    type-1 -> Default Lagom banner with predefined illustration
    type-2 -> Left aligned text, with custom graphics on the right column
    type-3 -> Left aligned text, with custom graphics filling full background
    type-4 -> Center aligned text, with custom graphic filling full background
    type-5 -> Center aligned text, with custom graphic filling bottom background
    type-6 -> Center aligned text, with no graphic 
* ******************************************
*}
{$sideTypes = ['type-1','type-2','type-3']}
{$centerTypes = ['type-4','type-5','type-6']}
<div class="site-banner banner banner-cms banner-{$theme} {if $type|in_array:$sideTypes} banner-sides{else} banner-center{/if} banner-{$type} {if $type == "type-1"} banner-predefined-graphic{elseif $type == "type-2"} banner-custom-graphic {elseif $type== "type-3" || $type== "type-4" } banner-custom-graphic-bg {elseif $type == "type-5"} banner-custom-graphic-overlap {elseif $type == "type-6"} banner-no-graphic{/if} {if $overlay} section-overlay{/if} {if $combined}section-combined{/if} {if $custom_class} {$custom_class}{/if}" data-site-banner>
{include file="{$smarty.current_dir}/../../common/anchor.tpl"} 
{if $type|in_array:$centerTypes}
    <div class="banner-body">
{/if}
    <div class="container">
        <div class="banner-content">
            {if $caption}
                <span class="banner-caption">{$caption|unescape:'html'}</span>
            {/if}
            {if $title}
                <h1 class="banner-title">{$title|unescape:'html'}</h1>
            {/if}
            {if $subtitle}
                <div class="banner-subtitle">
                    {$subtitle|unescape:'html'}
                </div>
            {/if}
            {if $pageSettings.promo.promotionDisplayTimeEnabled == "1" && $enable_timer && $time_display == "synchronized" && $pageSettings.promo.promotionEndDate}
                {include file="{$smarty.current_dir}/../../common/timer.tpl" 
                    end_date_timer=$pageSettings.promo.promotionEndDate
                    timer_style=$timer_style
                    time_display="synchronized"
                    countdown_type="synchronized"
                    timezone={date_default_timezone_get()}
                    action_after="hide"
                }
            {else if $time_display == "custom" && (($enable_timer && $countdown_type == "restart" && $start_date) || ($enable_timer && $countdown_type == "synchronized" && $end_date))}
                {include file="{$smarty.current_dir}/../../common/timer.tpl" 
                    start_date_timer=$start_date
                    end_date_timer=$end_date
                    timer_style=$timer_style
                    time_display=$time_display
                    countdown_type=$countdown_type
                    timezone={date_default_timezone_get()}
                    action_after=$action_after
                }
            {/if}
            {if $buttons || $show_product_pricing}
                <div class="banner-actions">
                    {if $buttons}
                        <div class="banner-actions-buttons">
                            {foreach $buttons as $button}
                                {include file="{$smarty.current_dir}/../../common/button.tpl"}
                            {/foreach}
                        </div>
                    {/if}
                    {if $show_product_pricing && !empty($product_group_pricing)}
                        <div class="banner-actions-price price price-lg">
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
        {if $graphic.graphic && ($type == "type-1" || $type == "type-2")}
            <div class="banner-background {if $type == "type-2"}graphic-centered{/if}"  data-animation-css>
                <div class="banner-graphic">
                    {include file="{$smarty.current_dir}/../../common/graphic.tpl" 
                        graphic=$graphic.graphic
                        type=$graphic.type
                    }
                </div>
                {if $type == "type-1" && !$disable_background_shape}
                    <div class="banner-shape">
                        {include file="{$smarty.current_dir}/../../common/graphic.tpl" 
                            graphic="site/banner-shape.tpl"
                            type="illustration"
                        }
                    </div>
                {/if}
            </div>
        {/if}
        {if $graphic.graphic && $type == "type-3"}
            <div class="banner-graphic-background banner-graphic-background-side"  data-animation-css>
                {include file="{$smarty.current_dir}/../../common/graphic.tpl" 
                    graphic=$graphic.graphic
                    type=$graphic.type
                }
            </div>
        {/if}
        </div>
        {if $graphic.graphic && $type == "type-5"}
            <div class="banner-graphic-background" data-animation-css>
                {include file="{$smarty.current_dir}/../../common/graphic.tpl" 
                    graphic=$graphic.graphic
                    type=$graphic.type
                }
            </div>
        {/if}
        {if $graphic.graphic && $type == "type-4"}
            {if $graphic.graphic|strstr:".tpl"}
                <div class="banner-graphic-background banner-graphic-background-image">
                    {include file="{$smarty.current_dir}/../../common/graphic.tpl" 
                        graphic=$graphic.graphic
                        type=$graphic.type
                    }
                </div>
            {else}
                <div class="banner-graphic-background banner-graphic-background-image" style="background-image: url('{$WEB_ROOT}/templates/{$template}/assets/img/page-manager/{$graphic.graphic}');">
                </div>
            {/if}
        {/if}
    {if $type|in_array:$centerTypes}
        </div>
    {/if}
</div>