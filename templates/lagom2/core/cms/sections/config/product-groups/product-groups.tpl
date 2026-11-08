<div class="site-section section-{$theme} {if $overlay} section-overlay{/if} {if $combined}section-combined{/if} {if $custom_class} {$custom_class}{/if}">
    {include file="{$smarty.current_dir}/../../common/anchor.tpl"} 
    {if isset($package_slider) && $package_slider != "" && $display_package_slider}
        {$sliderOn = true}
        {if $package_slider == "all"}
            {$package_slider = "desktop,tab-h,tab-v,mob"}
            {$slider = ","|explode:$package_slider}
        {else}
            {$slider = ","|explode:$package_slider}
        {/if}
    {/if}
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
            {if is_array($products_group['groups']) && count($products_group['groups']) > 1}
                <div class="tabs-multiple-container {if is_array($products_group['groups']) && count($products_group['groups']) <= 1}no-tabs{/if}{if $display_billing_cycle}has-billing-cycle{/if}">
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
                                        </a>
                                    </li>
                                {/foreach}
                            </ul>
                        </div>
                    {/if}
                </div>
            {/if}
            {if is_array($products_group['groups']) && count($products_group['groups']) > 0}    
                <div class="tab-content">
                    {foreach $products_group['groups'] key=key item=$group}
                        {if isset($group['fields']['product_groups']) && is_array($group['fields']['product_groups']) && count($group['fields']['product_groups']) > 0}
                            <div class="tab-pane content-slider-parent {if $group@first}active{/if}" id='{if isset($group['group_name_tab_link'])}tab-{$group['group_name_tab_link']}-{$key}-{$sectionId}{else}tab-{strtolower($group['group_name']|replace:" ":"-"|replace:"/":"-"|replace:"&amp;":"and")}-{$sectionId}{/if}'>
                                {if $sliderOn}
                                    <div class="section-slider content-slider content-slider-mixed {foreach $slider as $slide} res-{$slide|lower|replace:" ":"-"}{/foreach}" data-cms-content-slider >
                                    <div class="slider-cover-before"></div>
                                {/if} 
                                <div class="row row-eq-height row-lg row-cols-mixed {if is_array($group['fields']['product_groups'])}row-packages-{$group['fields']['product_groups']|count}{/if} {if $sliderOn}content-slider-wrapper{foreach $slider as $slide} content-slider-{$slide|lower|replace:" ":"-"}{/foreach}{else}row-eq-height{/if}" {if $sliderOn}data-content-slider-wrapper{/if}>
                                    {foreach from=$group['fields']['product_groups'] key=key item=$product}
                                        {include file="{$smarty.current_dir}/../../common/package-pg.tpl" 
                                            product=$product  
                                            productStyle=$style                            
                                            productType=$type
                                            productSize=$size
                                            productLink=$product.whmcs_page
                                            featureColsDesktop=$cols_desktop
                                            featureColsTabH=$cols_tab_h
                                            featureColsTabV=$cols_tab_v
                                            featureColsMob=$cols_mob
                                            featureSlider=$sliderOn
                                            productCustomClasses=$package_custom_classes
                                        }     
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