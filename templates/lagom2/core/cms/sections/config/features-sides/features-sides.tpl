{* 
* ******************************************
    CMS Features Sides Section - build on Section Graphic type-2
* ******************************************
*}

<div class="site-section section-sides section-features-sides section-graphic {if $title_position == "above"} section-graphic-title-above{/if} section-graphic-{$features_position} section-graphic-type-2 section-{$theme} {if $overlay} section-overlay{/if} {if $combined}section-combined{/if} {if $custom_class} {$custom_class}{/if}">
    {include file="{$smarty.current_dir}/../../common/anchor.tpl"} 
    {if $title_position == "above" && ($caption || $title || $subtitle)}
        <div class="container container-title">
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
        <div class="section-content">
            {if $title_position == "inside"}
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
                            <{if !isset($product_group_pricing.product) || empty($product_group_pricing.product) || $product_group_pricing.product.hasConfigurableOptions}
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
        <div class="section-features">
            <div class="row row-eq-height row-eq-height-xs row-lg">
                {if isset($features) && is_array($features) && count($features) > 0}
                    {foreach $features as $feature}     
                        {include file="{$smarty.current_dir}/../../common/feature.tpl" 
                            feature=$feature  
                            featureStyle=$features_style 
                            featureIconPosition=$features_icon_position
                            featureSize=$features_size
                            featureColsDesktop=$cols_desktop
                            featureColsTabH=$cols_tab_h
                            featureColsTabV=$cols_tab_v
                            featureColsMob=$cols_mob
                            featureCustomClasses=$features_custom_classes
                            displaySlider=$display_features_slider
                            featureSliderType=$features_slider_type
                            theme=$darkIcons
                        }
                    {/foreach}
                {/if}
            </div>
        </div>
    </div>
</div> 