{assign var=darkIcons value=false}
{if ($theme == "primary" || $theme == "secondary") && $tld_list_style != "boxed"}
    {assign var=darkIcons value=true}
{/if}

<div class="site-section section-title-above section-features section-features-tlds section-{$theme} {if $overlay} section-overlay{/if} {if $combined}section-combined{/if} {if $custom_class} {$custom_class}{/if}">
    {include file="{$smarty.current_dir}/../../common/anchor.tpl"} 
    <div class="container {if $display_tlds_slider}container-slider{/if} {if $tlds_slider_type == "screen-slider"}full-screen-slider{/if}">
        {if $caption}
            <span class="section-caption">{$caption|unescape:'html'}</span>
        {/if}
        {if $title}
            <h2 class="section-title">{$title|unescape:'html'}</h2>
        {/if}
        {if $subtitle}
            <div class="section-subtitle">{$subtitle|unescape:'html'}</div>
        {/if}
        <div class="section-content section-content-features content-slider-parent">
            {if isset($tld_list) && is_array($tld_list) && count($tld_list) > 0}    
                {if $display_tlds_slider}
                    <div class="section-slider content-slider content-slider-features {if $tld_list_size != "default"}features-sizes-sm{/if} {if $tlds_slider_type == "screen-slider"}screen-slider" data-screen-slider-simple {else}" data-cms-content-slider{/if}>   
                        <div class="slider-cover-before"></div>
                        <div class="content-slider-wrapper  row-eq-height {if $tlds_slider_type == "screen-slider"} screen-slider-wrapper" data-screen-slider-wrapper{else}" data-content-slider-wrapper{/if}>
                {else}
                <div class="row row-eq-height row-eq-height-xs row-lg {if $tld_list_size != "default"}features-sizes-sm{/if}">
                {/if}
                    {foreach $tld_list as $tld}     
                        {if is_array($tld.domain)}
                            {include file="{$smarty.current_dir}/../../common/tld.tpl" 
                                tld=$tld  
                                tldLayout=$tld_list_layout
                                tldStyle=$tld_list_style 
                                tldSize=$tld_list_size
                                tldPricing=$tld_list_pricing
                                tldSliderType=$tlds_slider_type
                                featureColsDesktop=$cols_desktop
                                featureColsTabH=$cols_tab_h
                                featureColsTabV=$cols_tab_v
                                featureColsMob=$cols_mob
                                tldCustomClasses=$tlds_custom_classes
                                displaySlider=$display_tlds_slider
                                featureSliderType=$tlds_slider_type
                                btnText=$pricingText
                                linkedPage=$link_to_page
                            }
                        {/if}
                    {/foreach}
                </div>
                {if $display_tlds_slider}
                    <div class="slider-cover-after"></div>
                    </div>  
                    <div class="swiper-button-next" data-next-slide>
                        <i class="lm lm-arrow-thin-right"></i>
                    </div>
                    <div class="swiper-button-prev" data-prev-slide>
                        <i class="lm lm-arrow-thin-left"></i>
                    </div>  
                {/if}  
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