{if !$display_billing_cycle}
    {if isset($price_calculation) && $price_calculation == "lowest"}
        {$displayBestPrice = true}
    {else}
        {$displayFirstAvailableCycle = true}
    {/if}
{/if}

{if isset($package_slider) && $package_slider != "" && $display_package_slider && $type != "horizontal"}
    {$sliderOn = true}
    {if $package_slider == "all"}
        {$package_slider = "desktop,tab-h,tab-v,mob"}
        {$slider = ","|explode:$package_slider}
    {else}
        {$slider = ","|explode:$package_slider}
    {/if}
{/if}
{assign var=darkIcons value=false}
{if ($theme == "primary" || $theme == "secondary") && $style != "boxed"}
    {assign var=darkIcons value=true}
{/if}
<div class="site-section section-{$theme} {if $overlay} section-overlay{/if} {if $combined}section-combined{/if} {if $custom_class} {$custom_class}{/if}">
    {include file="{$smarty.current_dir}/../../common/anchor.tpl"} 
    <div class="container container-title {if $sliderOn}container-slider{/if}">
         {if $caption}
            <span class="section-caption">{$caption|unescape:'html'}</span>
        {/if}
        {if $title}
            <h2 class="section-title">{$title|unescape:'html'}</h2>
        {/if}
        {if $subtitle}
            <div class="section-subtitle">{$subtitle|unescape:'html'}</div>
        {/if}
        <div class="section-content section-content-packages">
            {if is_array($products_group['groups']) && count($products_group['groups']) > 1 || $display_billing_cycle}
                <div class="tabs-multiple-container {if is_array($products_group['groups']) && count($products_group['groups']) <= 1}no-tabs{/if}{if $display_billing_cycle && ($billing_cycle|@count > 1 || $billing_cycle.0 == 'all')}has-billing-cycle{/if}">
                    {if is_array($products_group['groups']) && count($products_group['groups']) > 1}
                        <div class="tabs content-slider"  data-cms-content-slider>
                            <ul class="nav nav-lg nav-tabs nav-tabs-slider content-slider-wrapper" data-content-slider-wrapper>
                                {foreach from=$products_group['groups'] key=key item=$group}
                                    <li class="content-slider-item nav-item">
                                        <a 
                                            class="nav-link {if $group@first}active{else}tab-not-clicked{/if}" 
                                            data-product-group-change="{$key}" 
                                            data-multitab 
                                            data-multitab-target="{if isset($group['group_name_tab_link'])}#tab-compare-{$group['group_name_tab_link']}-{$key}-{$sectionId}{else}#tab-compare-{strtolower($group['group_name']|replace:" ":"-"|replace:"/":"-"|replace:"&amp;":"and")}-{$sectionId}{/if}" 
                                            href='{if isset($group['group_name_tab_link'])}#tab-{$group['group_name_tab_link']}-{$key}-{$sectionId}{else}#tab-{strtolower($group['group_name']|replace:" ":"-"|replace:"/":"-"|replace:"&amp;":"and")}-{$sectionId}{/if}' 
                                            data-toggle="tab"  
                                            data-animation-init
                                        >
                                            <span class="nav-link-text">{$group['group_name']|unescape:'html'}</span>
                                            {* <span class="nav-link-icon"> *}
                                                {* Icon/Flag Img examples for tabs *}
                                                {* <i class="lm lm-info"></i> *}
                                                {* <img src="templates/lagom2/assets/img/flags/croatian.svg"/> *}

                                            {* </span> *}
                                        </a>
                                    </li>
                                {/foreach}
                            </ul>
                        </div>
                    {/if}
                    {if $display_billing_cycle}  
                        
                        {$pricingCycles = ['monthly' => ['6','monthly'], 'quarterly' => ['5','quarterly'], 'semiannually' => ['4','semiannually'], 'annually' => ['3','annually'], 'biennially' => ['2','biennially'], 'triennially' => ['1','triennially']]}
                        {if $reverse_billing_cycle_order == "1"}
                            {$pricingCycles = array_reverse($pricingCycles)}
                        {/if}
                        {$choosenCycles = false}
                        {if $billing_cycle[0] != "all"}
                            {$choosenCycles = true}
                        {/if}
                        
                        {if is_array($products_group['groups']) && count($products_group['groups']) > 0}
                            {foreach $products_group['groups'] key=groupKey item=$group}
                                {foreach from=$group['fields']['products_list'] key=key item=$product}             
                                    {if isset($product['product']['price']['tabs'])}                       
                                        {foreach from=$product['product']['price']['tabs'] key=tabKey item=$tab}
                                            {if $tab.price != "-1" && $tab.discount.percentage != "0"}
                                                {if $tabKey == 'monthly'}
                                                    {append 'discountMonthly' $tab.discount.percentage index=$key}
                                                    {append 'discountTabsTemp' $discountMonthly index=$tabKey}  
                                                {/if}
                                                {if $tabKey == 'quarterly'}
                                                    {append 'discountQuarterly' $tab.discount.percentage index=$key}
                                                    {append 'discountTabsTemp' $discountQuarterly index=$tabKey}
                                                {/if}
                                                {if $tabKey == 'semiannually'}                                                
                                                    {append 'discountSemiannually' $tab.discount.percentage index=$key}
                                                    {append 'discountTabsTemp' $discountSemiannually index=$tabKey}
                                                {/if}
                                                {if $tabKey == 'annually'}
                                                    {append 'discountAnnually' $tab.discount.percentage index=$key}
                                                    {append 'discountTabsTemp' $discountAnnually index=$tabKey}
                                                {/if}
                                                {if $tabKey == 'biennially'}
                                                    {append 'discountBiennially' $tab.discount.percentage index=$key}
                                                    {append 'discountTabsTemp' $discountBiennially index=$tabKey}
                                                {/if}
                                                {if $tabKey == 'triennially'}
                                                    {append 'discountTriennially' $tab.discount.percentage index=$key}
                                                    {append 'discountTabsTemp' $discountTriennially index=$tabKey}
                                                {/if}
                                            {/if}
                                        {/foreach} 
                                    {/if}    
                                {/foreach}
                                {append 'discountTabs' $discountTabsTemp index=$groupKey}
                            {/foreach}
                        {/if} 
                        <div class="product-billing-switcher {if $billing_cycle|@count == 1 && $billing_cycle.0 != 'all'} hidden{/if}">
                            <div class="btn-group {if is_array($products_group['groups']) && count($products_group['groups']) > 1} hidden{else} hidden-md hidden-sm hidden-xs{/if}" role="group">
                                {if $choosenCycles}     
                                    {if $reverse_billing_cycle_order == "1"}  
                                        {$reverse_billing_cycle = array_reverse($billing_cycle)}
                                    {/if}
                                    {foreach from=$pricingCycles|@array_reverse:true key=key item=$cycle}
                                        {if $key|in_array:$billing_cycle}
                                        {if $reverse_billing_cycle_order == "1"}
                                            {$firstAvailableCycle = $reverse_billing_cycle[0]}
                                        {else}
                                            {$firstAvailableCycle = $billing_cycle[0]}
                                        {/if}
                                            {$switchActive = false}
                                            {$discount = false}
                                            {$dataDiscount = false}
                                            {if $firstAvailableCycle == $key}
                                                {$switchActive = "active"}
                                            {/if}
                                            {if isset($discountTabs) && is_array($discountTabs) && isset($discountTabs[0][$cycle[1]])}
                                                {$discount = min($discountTabs[0][$cycle[1]])}
                                            {/if}
                                            {if is_array($products_group['groups']) && count($products_group['groups']) > 1 && isset($discountTabs) && is_array($discountTabs)}
                                                {$dataDiscount = $discountTabs}
                                            {/if}
                                            {include 
                                                file="{$smarty.current_dir}/../../common/package/cycle-switcher-button.tpl"
                                                cycle=$cycle[0]
                                                active=$switchActive
                                                name=$cycle[1]
                                                discount=$discount
                                                dataDiscount=$dataDiscount
                                            }  
                                        {/if}
                                    {/foreach}
                                {else}
                                    {foreach from=$pricingCycles|@array_reverse:true key=key item=$cycle}
                                        {$switchActive = false}
                                        {$discount = false}
                                        {$dataDiscount = false}
                                        {if $cycle@first}
                                            {$firstAvailableCycle = $key}
                                            {$switchActive = "active"}
                                        {/if}
                                        {if isset($discountTabs) && is_array($discountTabs) && isset($discountTabs[0][$cycle[1]])}
                                            {$discount = min($discountTabs[0][$cycle[1]])}
                                        {/if}
                                        {if is_array($products_group['groups']) && count($products_group['groups']) > 1 && isset($discountTabs) && is_array($discountTabs)}
                                            {$dataDiscount = $discountTabs}
                                        {/if}
                                        
                                        {include 
                                            file="{$smarty.current_dir}/../../common/package/cycle-switcher-button.tpl"
                                            cycle=$cycle[0]
                                            active=$switchActive
                                            name=$cycle[1]
                                            discount=$discount
                                            dataDiscount=$dataDiscount
                                        }   
                                    {/foreach} 
                                {/if}  
                            </div>
                            <div class="btn-dropdown">
                                <span class="{if is_array($products_group['groups']) && count($products_group['groups']) > 1}{else} visible-md visible-sm visible-xs{/if}">{$LANG.orderbillingcycle}</span>
                                <div class="dropdown dropdown-cycle-switcher {if is_array($products_group['groups']) && count($products_group['groups']) > 1}{else} visible-md visible-sm visible-xs{/if}">
                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                        <span id="cycle-text">
                                            <span class="btn-text">
                                                <span class="btn-text">
                                                    {if $firstAvailableCycle eq "monthly"}
                                                        {$LANG.orderpaymenttermmonthly}
                                                    {elseif $firstAvailableCycle eq "quarterly"}
                                                        {$LANG.orderpaymenttermquarterly}
                                                    {elseif $firstAvailableCycle eq "semiannually"}
                                                        {$LANG.orderpaymenttermsemiannually}
                                                    {elseif $firstAvailableCycle eq "annually"}
                                                        1-{$LANG.orderForm.year}
                                                    {elseif $firstAvailableCycle eq "biennially"}
                                                        2-{$LANG.orderForm.years}
                                                    {elseif $firstAvailableCycle eq "triennially"}
                                                        3-{$LANG.orderForm.years}
                                                    {/if}
                                                </span> 
                                            </span>
                                            
                                            <label 
                                                class="label label-xs label-save {if isset($discountTabs) && is_array($discountTabs) && isset($discountTabs[0][$firstAvailableCycle])}{else}hidden{/if}"
                                                {if is_array($products_group['groups']) && count($products_group['groups']) > 1 && isset($discountTabs) && is_array($discountTabs)}
                                                
                                                    data-change-discount='[{foreach from=$discountTabs key=key item=$d}"{if isset($d[$firstAvailableCycle]) && is_array($d[$firstAvailableCycle])}{min($d[$firstAvailableCycle])}{else}0{/if}"{if !$d@last},{/if}{/foreach}]'
                                                {/if}
                                            >
                                                {$rslang->trans('packages.save')}&nbsp;
                                                <span data-change-discount-value>
                                                    {if isset($discountTabs[0][$firstAvailableCycle])}
                                                        {min($discountTabs[0][$firstAvailableCycle])}
                                                    {/if}
                                                </span>%
                                            </label>
                                        </span>
                                        <i class="ls ls-caret"></i>
                                    </button>
                                    <div class="dropdown-menu {if is_array($products_group['groups']) && count($products_group['groups']) > 1}dropdown-menu-right{/if}">
                                        {if $choosenCycles}                                    
                                            {if $reverse_billing_cycle_order == "1"}
                                                {$reverse_billing_cycle = array_reverse($billing_cycle)}
                                            {/if}
                                            {foreach from=$pricingCycles|@array_reverse:true key=key item=$cycle}
                                                {if $key|in_array:$billing_cycle}
                                                    {if $reverse_billing_cycle_order == "1"}
                                                        {$firstAvailableCycle = $reverse_billing_cycle[0]}
                                                    {else}
                                                        {$firstAvailableCycle = $billing_cycle[0]}
                                                    {/if}
                                                    {$switchActive = false}
                                                    {$discount = false}
                                                    {$dataDiscount = false}
                                                    {if $firstAvailableCycle == $key}
                                                        {$switchActive = "active"}
                                                    {/if}
                                                    {if isset($discountTabs) && is_array($discountTabs) && isset($discountTabs[0][$cycle[1]])}
                                                        {$discount = min($discountTabs[0][$cycle[1]])}
                                                    {/if}
                                                    {if is_array($products_group['groups']) && count($products_group['groups']) > 1 && isset($discountTabs) && is_array($discountTabs)}
                                                        {$dataDiscount = $discountTabs}
                                                    {/if}

                                                    {include 
                                                        file="{$smarty.current_dir}/../../common/package/cycle-switcher-button.tpl"
                                                        cycle=$cycle[0]
                                                        active=$switchActive
                                                        name=$cycle[1]
                                                        class="dropdown-item"
                                                        discount=$discount
                                                        dataDiscount=$dataDiscount
                                                    }  
                                                {/if}
                                            {/foreach}
                                        {else}
                                            {foreach from=$pricingCycles|@array_reverse:true key=key item=$cycle}
                                                {$switchActive = false}
                                                {$discount = false}
                                                {$dataDiscount = false}
                                                {if $cycle@first}
                                                    {$firstAvailableCycle = $key}
                                                    {$switchActive = "active"}
                                                {/if}
                                                {if isset($discountTabs) && is_array($discountTabs) && isset($discountTabs[0][$cycle[1]])}
                                                    {$discount = min($discountTabs[0][$cycle[1]])}
                                                {/if}
                                                {if is_array($products_group['groups']) && count($products_group['groups']) > 1 && isset($discountTabs) && is_array($discountTabs)}
                                                    {$dataDiscount = $discountTabs}
                                                {/if}
            
                                                {include 
                                                    file="{$smarty.current_dir}/../../common/package/cycle-switcher-button.tpl"
                                                    cycle=$cycle[0]
                                                    active=$switchActive
                                                    name=$cycle[1]
                                                    class="dropdown-item"
                                                    discount=$discount
                                                    dataDiscount=$dataDiscount
                                                }   
                                            {/foreach} 
                                        {/if}  
                                    </div>
                                </div>
                            </div>
                        </div> 
                    {/if}
                </div>
            {/if}
            {if is_array($products_group['groups']) && count($products_group['groups']) > 0}    
                <div class="tab-content">
                    {foreach $products_group['groups'] key=key item=$group}
                        {if isset($group['fields']['products_list']) && is_array($group['fields']['products_list']) && count($group['fields']['products_list']) > 0}
                            <div class="tab-pane content-slider-parent {if $group@first}active{/if}" id='{if isset($group['group_name_tab_link'])}tab-{$group['group_name_tab_link']}-{$key}-{$sectionId}{else}tab-{strtolower($group['group_name']|replace:" ":"-"|replace:"/":"-"|replace:"&amp;":"and")}-{$sectionId}{/if}'>
                                {if $sliderOn}
                                    <div class="section-slider content-slider content-slider-mixed {foreach $slider as $slide} res-{$slide|lower|replace:" ":"-"}{/foreach}" data-cms-content-slider >
                                    <div class="slider-cover-before"></div>
                                {/if} 
                                    
                                    <div class="row row-eq-height row-lg row-cols-mixed row-packages-{$group['fields']['products_list']|count} {if $sliderOn}content-slider-wrapper{foreach $slider as $slide} content-slider-{$slide|lower|replace:" ":"-"}{/foreach}{else}row-eq-height{/if}" {if $sliderOn}data-content-slider-wrapper{/if} {if $enable_stock_control}data-product-qty-controller='[{foreach from=$group['fields']['products_list'] key=key item=$product}"{$product.product_id}"{if !$product@last},{/if}{/foreach}]' data-ajax-url="{$WEB_ROOT}/modules/addons/RSThemes/src/Api/clientApi.php?controller=StockControl&method=getStockControl&id="{/if}>    
                                        {foreach from=$group['fields']['products_list'] key=key item=$product}
                                            {if isset($product['product']) && is_array($product['product']) && count($product['product']) > 0}
                                                {$stockControl = false}
                                                {if $enable_stock_control && $product['product']['stockControl'] == "1"}
                                                    {$stockControl = true}
                                                {/if}
                                                {include file="{$smarty.current_dir}/../../common/package.tpl" 
                                                    product=$product  
                                                    productStyle=$style                            
                                                    productType=$type
                                                    productSize=$size
                                                    featureColsDesktop=$cols_desktop
                                                    featureColsTabH=$cols_tab_h
                                                    featureColsTabV=$cols_tab_v
                                                    featureColsMob=$cols_mob
                                                    featureSlider=$sliderOn
                                                    productCustomClasses=$package_custom_classes
                                                    theme=$darkIcons
                                                    productStockControl=$stockControl
                                                }   
                                            {/if}   
                                        {/foreach}   
                                    </div>
                                {if $sliderOn}
                                        <div class="slider-cover-after"></div>
                                    </div>
                                    <div class="swiper-button-next" data-next-slide>
                                        <i class="lm lm-arrow-thin-right"></i>
                                    </div>
                                    <div class="swiper-button-prev" data-prev-slide>
                                        <i class="lm lm-arrow-thin-left"></i>
                                    </div>
                                {/if}
                            </div>
                        {/if}    
                    {/foreach}
                </div>
            {/if}    
            {if isset($additional_product_info) && $additional_product_info != ""}
                <div class="section-additional-info">
                    {$additional_product_info|unescape:'html'}
                </div>
            {/if}
        </div>
        {if $buttons}
            <div class="section-actions">
                <div class="section-actions-buttons">
                    {foreach $buttons as $button}
                        {include file="{$smarty.current_dir}/../../common/button.tpl"}
                    {/foreach}
                </div>
            </div>
        {/if}
    </div>
</div>