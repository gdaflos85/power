{if $slides|count neq 0}
    <style type="text/css">
        .site .site-banner:before {
            display: none;
        }
            .site .site-banner + .site-section.section-slider-btn{
                padding-top: 0;
            }
        .tile-container img {
            margin-bottom: 16px;
        }

        @media (max-width: 1199px) {
            .site .site-banner.site-slider .slider-background > * img {
                width: 100% !important;
            }
        }

        {if $slides|@count eq 1}
        .site .site-banner {
            padding-bottom: 100px;
        }
        {/if}
    </style>
    <div data-promo-slider {if $autoslideBannerDisable} class="autoPromoDisable"{/if}>
        <div class="site-banner site-slider site-slider-custom banner banner-sides {if $slide->slide_options['config']['graphic_type'] neq "custom_icon"}banner-predefined-graphic{/if}">
            <div class="container">
                <div class="slider-wrapper">
                    <div class="slider-slides" data-promo-slider-wrapper>
                        {foreach from=$slides item=slide key=key_slide}
                            <div class="slider-slide {if !$slide->slide_options['config']['banner_style_active']}slide-default{/if}{if $slide->slide_options['config']['graphic_type'] eq "custom_icon" && strlen($slide->slide_icon_custom) < 1} graphic-custom-empty{/if} {if $slide->slide_options['config']['graphic_type'] eq "background"}slider-slide-custom-bg{elseif $slide->slide_options['config']['graphic_type'] eq "custom_icon"}slider-slide-custom-icon{else}slider-slide-default{/if}{if ($slide->slide_options['config']['color'] != "transparent") && ($slide->slide_options['config']['color2'] != "transparent") || ($slide->slide_options['config']['graphic_type'] == "background")} slider-slide-transparent{/if}{if ($slide->slide_options['config']['color'] == "transparent") && ($slide->slide_options['config']['color2'] == "transparent") && ($slide->slide_options['config']['graphic_type'] == "background")} dark-font{/if}"
                                 id="slider-slide-{$slide->id}" data-animation-type="{$slide->slide_options['config']['animation']}">

                                <div class="banner-content" data-animation-content>
                                    {if strlen($slide->getField('slide_caption_home',$activeLocale.language)) > 0}
                                        <span class="banner-caption" {if $slide->slide_options['config']['banner_style_active'] && $slide->slide_options['config']['color_caption']}style="color: {$slide->slide_options['config']['color_caption']};"{/if}>
                                                {$slide->getField('slide_caption_home',$activeLocale.language)|unescape:'html'}
                                            </span>
                                    {/if}
                                    {if strlen($slide->getField('slide_title_home',$activeLocale.language)) > 0}
                                        <h1 class="banner-title" {if $slide->slide_options['config']['banner_style_active'] && $slide->slide_options['config']['color_title']}style="color: {$slide->slide_options['config']['color_title']};"{/if}>
                                            {$slide->getField('slide_title_home',$activeLocale.language)|unescape:'html'}
                                        </h1>
                                    {/if}
                                    {if strlen($slide->getField('slide_description_home' , $activeLocale.language)) > 0}
                                        <div class="banner-desc" {if $slide->slide_options['config']['banner_style_active'] && $slide->slide_options['config']['color_desc']}style="color: {$slide->slide_options['config']['color_desc']};"{/if}>
                                            <p>{$slide->getField('slide_description_home' , $activeLocale.language)|unescape:'html'}</p>
                                        </div>
                                    {/if}
                                    <div class="banner-actions">
                                        {if strlen($slide->getField('slide_text_btn_home' , $activeLocale.language)) > 0}
                                            <a href="{$slide->slide_product_url_home}"
                                               class="btn btn-lg btn-primary">{$slide->getField('slide_text_btn_home' , $activeLocale.language)}</a>
                                        {/if}
                                        {if strlen($slide->getField('slide_secondary_button_text' , $activeLocale.language)) > 0}
                                            <a href="{$slide->slide_secondary_button_url}"
                                               class="btn btn-lg btn-outline btn-outline-light {if $slide->slide_options['config']['banner_style_active']}btn-light{/if}">{$slide->getField('slide_secondary_button_text' , $activeLocale.language)}</a>
                                        {/if}
                                    </div>
                                </div>
                                {if $slide->slide_options['config']['graphic_type'] neq "background"}
                                    <div class="banner-background">
                                        <div class="banner-graphics {if $slide->slide_options['config']['graphic_type'] eq "custom_icon"} graphics-custom{else}graphics-predefined{/if}">
                                            <div class="banner-graphic {if $slide->slide_options['config']['graphic_type'] eq "custom_icon"} graphic-custom{else}graphics-predefined{/if}" style="justify-content: center!important;" data-animation-icons>
                                                {if strlen($slide->slide_icon_custom) < 1}
                                                    {if $styleName == "modern"}
                                                        {if file_exists("{$smarty.current_dir}/../../../assets/svg-illustrations/products/modern/{$slide->slide_icon}.tpl")}
                                                            {include file="{$smarty.current_dir}/../../../assets/svg-illustrations/products/modern/{$slide->slide_icon}.tpl"}
                                                        {/if}
                                                    {else}
                                                        {if file_exists("{$smarty.current_dir}/../../../assets/svg-illustrations/products/{$slide->slide_icon}.tpl")}
                                                            {include file="{$smarty.current_dir}/../../../assets/svg-illustrations/products/{$slide->slide_icon}.tpl"}
                                                        {/if}
                                                    {/if}
                                                {else}
                                                    <img style="opacity:0;" class="banner-custom-icon"
                                                         src="{$systemurl}templates/{$template}/core/extensions/PromoBanners/uploads/{$slide->slide_icon_custom}"
                                                         alt="">
                                                {/if}
                                            </div>
                                        </div>
                                    </div>
                                {/if}
                            </div>
                        {/foreach}
                    </div>
                </div>
            </div>

            <div class="slider-background" data-promo-slider-background>
                {foreach from=$slides item=slide key=key_slide}
                    {if ($slide->slide_begin_time <= $smarty.now && $slide->slide_end_time >= $smarty.now) || ($slide->slide_begin_time eq 0 && $slide->slide_end_time eq 0) || ($slide->slide_begin_time <= $smarty.now && !$slide->slide_end_time)}
                    <div {if $slide->slide_options['config']['banner_style_active']}id="slider-slide-{$slide->id}-bg"{/if} class="slide {if !$slide->slide_options['config']['banner_style_active']} slide-{$sectionStyle}-bg{/if}" style="overflow: hidden" {$slide->slide_options['config']['graphic_type']}>
                        {if !$slide->slide_options['config']['banner_style_active'] || (!$slide->slide_options['config']['color'] && !$slide->slide_options['config']['color2'] && $slide->slide_options['config']['graphic_type'] neq "background")}
                            <div class="container">
                                <div class="banner-background">
                                    <div class="banner-shape">
                                            {if file_exists("{$smarty.current_dir}/../../../assets/svg-illustrations/site/banner-shape.tpl")}
                                                {include file="{$smarty.current_dir}/../../../assets/svg-illustrations/site/banner-shape.tpl"}
                                            {/if}
                                    </div>
                                </div>
                            </div>
                        {/if}
                        {if $slide->slide_icon_custom && $slide->slide_options['config']['graphic_type'] eq "background"}
                            <img id="slider-slide-{$slide->id}-bg-image"
                                 src="{$systemurl}templates/{$template}/core/extensions/PromoBanners/uploads/{$slide->slide_icon_custom}">
                        {/if}
                    </div>
                    {/if}
                {/foreach}
            </div>
        </div>

        {if $slides|count > 1}
            <div class="site-section section-graphic section-slider-btn section-slider-btn-extension">
                <div class="container">
                    <div class="section-content">
                        <div class="slider-navigation slider-navigation-promotion row" data-promo-slider-pagination promotion-navigation-slider>
                            <div class="swiper-wrapper swiper-wrapper-extension row flex-nowrap ">
                            {assign var="loopIndex" value=0 }
                                {foreach from=$slides item=slide key=key_slide}
                                    {assign var="loopIndex" value=$loopIndex + 1 }
                                    <div class="swiper-slide swiper-slide-extension col-xl5 col-lg-3 col-md-4 col-6" data-tile-slide-index="{$loopIndex}">
                                        <div class="tile" data-promo-slider-pagination-item >
                                            {if $slide->slide_options.config['paginationIcon']}
                                                {if strpos($slide->slide_options.config['paginationIcon'], '.') != false}
                                                    <div class="tile-container">
                                                        <img width="64" height="64" class="img-responsive"
                                                             src="{$systemurl}templates/{$template}/core/extensions/PromoBanners/uploads/{$slide->slide_options.config['paginationIcon']}"
                                                             alt="">
                                                    </div>
                                                {else}
                                                {if file_exists("{$smarty.current_dir}/../../../assets/svg-icon/{$slide->slide_pagination_icon}.tpl")}
                                                    {include file="{$smarty.current_dir}/../../../assets/svg-icon/{$slide->slide_pagination_icon}.tpl"}
                                                {/if}
                                                {/if}
                                            {else}
                                                {if file_exists("{$smarty.current_dir}/../../../assets/svg-icon/{$slide->slide_pagination_icon}.tpl")}
                                                    {include file="{$smarty.current_dir}/../../../assets/svg-icon/{$slide->slide_pagination_icon}.tpl"}
                                                {/if}
                                            {/if}
                                            <span class="title">{$slide->getField('slide_pagination_title_home' , $activeLocale.language)}</span>
                                            <div class="tile-loader">
                                                <div class="tile-loader-progress"></div>
                                            </div>
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                            <div class="swiper-pagination swiper-pagination-promotion swiper-pagination-extension animation-paused"></div>
                        </div>
                    </div>
                </div>
            </div>
        {/if}
    </div>
{/if}