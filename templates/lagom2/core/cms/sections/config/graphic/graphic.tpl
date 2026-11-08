
{* 
* ******************************************
    CMS Side Graphic Section - Types
    type-1 -> Predefined Lagom Illustration
    type-2 -> Custom graphics in predefined container
    type-3 -> Custom graphics filling full background
* ******************************************
*}
{$sideTypes = ['left','right']}
{$centerTypes = ['top-center','bottom-center','center']}

<div class="site-section section-sides section-graphic {if $title_position == "above" && $graphic_type != "type-3"} section-graphic-title-above{/if} section-graphic-{$graphic_position} section-graphic-{$graphic_type} section-{$theme} {if $overlay} section-overlay{/if} {if $combined}section-combined{/if} {if $custom_class} {$custom_class}{/if}">
    {include file="{$smarty.current_dir}/../../common/anchor.tpl"} 
    {if $title_position == "above" && ($caption || $title || $subtitle) && $graphic_type != "type-3"}
        <div class="container container-title {if $graphic_type == "type-1"} container-type-1{/if}">
            {if $caption}
                <span class="section-caption">{$caption|unescape:'html'}</span>
            {/if}
            {if $title}
                <h2 class="section-title">{$title|unescape:'html'}</h2>
            {/if}
            {if $subtitle}
                <p class="section-subtitle">{$subtitle|unescape:'html'}</p>
            {/if}
        </div>
    {/if}
    <div class="container container-default">
        {if $title || $caption || $subtitle || $buttons}
            <div class="section-content">
                {if $title_position == "inside" || $graphic_type == "type-3"}
                    {if $caption}
                        <span class="section-caption">{$caption|unescape:'html'}</span>
                    {/if}
                    {if $title}
                        <h2 class="section-title">{$title|unescape:'html'}</h2>
                    {/if}
                    {if $subtitle}
                        <p class="section-subtitle">{$subtitle|unescape:'html'}</p>
                    {/if}
                {/if}
                {if $desc}
                    <div class="section-desc">{$desc|unescape:'html'}</div>
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
                    <div class="section-actions">
                        {if $buttons}
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
        {/if}
        {if $graphic.graphic && ($graphic_type == "type-1" || $graphic_type == "type-2")}
            <div class="section-background {if $graphic_type == "type-2"}background-type-2{/if}" data-animation-css>
                <div class="section-graphic">
                    {include file="{$smarty.current_dir}/../../common/graphic.tpl" 
                        graphic=$graphic.graphic
                        type=$graphic.type
                    }
                </div>
                {if $graphic_type == "type-1" && !$disable_background_shape}
                    <div class="section-shape">
                        {include file="{$smarty.current_dir}/../../../../../assets/svg-illustrations/cms/section-shape.tpl"}
                    </div>
                {/if}
            </div>
        {/if}
        {if $graphic.graphic && $graphic_type == "type-3" && ($graphic_position == "left" || $graphic_position == "right")}
            <div class="section-background section-background-side" data-animation-css>
                {include file="{$smarty.current_dir}/../../common/graphic.tpl" 
                    graphic=$graphic.graphic
                    type=$graphic.type
                }
            </div>
        {/if}   
    </div>
    {if $graphic.graphic && $graphic_type == "type-3" && ($graphic_position == "top-center" || $graphic_position == "bottom-center" || $graphic_position == "center")}
        {if $graphic.graphic|strstr:".tpl"}
            <div class="section-background section-background-side">
                {include file="{$smarty.current_dir}/../../common/graphic.tpl" 
                    graphic=$graphic.graphic
                    type=$graphic.type
                }
            </div>
        {else}
            <div class="section-background  banner-graphic-background banner-graphic-background-image" style="background-image: url('{$WEB_ROOT}/templates/{$template}/assets/img/page-manager/{$graphic.graphic}');">
            </div>
        {/if}
    {/if}   
</div> 