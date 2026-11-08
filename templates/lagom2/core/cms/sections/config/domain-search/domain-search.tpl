
{* 
* ******************************************
    CMS Side Graphic Section - Types
    type-0 -> No graphic, center aligned content (Formally as Type 1 in addon)
    type-1 -> Predefined Lagom Illustration
    type-2 -> Custom graphics in predefined container
    type-3 -> Custom graphics filling full background
* ******************************************
*}
{$sideTypes = ['left','right']}
{$centerTypes = ['top-center','bottom-center']}

<div class="site-section section-domains {if $graphic_type == "type-0"} section-center section-graphic-{$graphic_type}{else}section-sides section-graphic  section-graphic-{$graphic_position} section-graphic-{$graphic_type}{/if} section-{$theme} {if $overlay} section-overlay{/if} {if $combined}section-combined{/if} {if $custom_class} {$custom_class}{/if}">
    {include file="{$smarty.current_dir}/../../common/anchor.tpl"} 
    <div class="container container-default">
        <div class="section-content">
            {if $caption}
                <span class="section-caption">{$caption|unescape:'html'}</span>
            {/if}
            {if $title}
                <h2 class="section-title">{$title|unescape:'html'}</h2>
            {/if}
            {if $subtitle}
                <p class="section-subtitle">{$subtitle|unescape:'html'}</p>
            {/if}
            {if $desc}
                <div class="section-desc">{$desc|unescape:'html'}</div>
            {/if}
            {if $domain_type}
                <div class="section-domain-search">
                    {if $domain_type == "tabs"}
                        <ul class="banner-nav nav nav-tabs">
                            <li>
                                <a class="tab-nav-domain active" href="#tab-register" data-type="register" data-toggle="tab">
                                    {$LANG.navdomainsearch}
                                </a>
                            </li>
                            <li>
                                <a class="tab-nav-domain" href="#tab-transfer" data-type="transfer" data-toggle="tab">                                     
                                    {$LANG.domaintransfer}
                                </a>
                            </li>
                        </ul>
                        <div class="banner-tab-content tab-content">
                            <div id="tab-register" class="tab-pane active">  
                                {include file="{$smarty.current_dir}/../../common/domain-search.tpl" type="register"}
                            </div>
                            <div id="tab-transfer" class="tab-pane">  
                                {include file="{$smarty.current_dir}/../../common/domain-search.tpl" type="transfer"}
                            </div>
                        </div>
                    {else}
                        {include file="{$smarty.current_dir}/../../common/domain-search.tpl" type=$domain_type}
                    {/if}      
                    {if $show_spotlight_tlds && is_array($spotlights_tlds)}
                        {* TODO: Add class with pointer-events blocked <991 if 4 or more tlds added *}
                        <div class="section-tlds tlds-register content-slider" data-cms-content-slider>
                            <div class="content-slider-wrapper" data-content-slider-wrapper>
                                {foreach $spotlights_tlds as $spotlight}
                                    <div class="tld content-slider-item">
                                        <div class="tld-suffix">
                                            {$spotlight.ext|replace:".":"<span>.</span>"}
                                        </div>
                                        <div class="tld-price">
                                            <span class="price-transfer">{$spotlight.price.transfer|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}</span>
                                            <span class="price-register">{$spotlight.price.register|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}</span>
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    {/if}
                </div>
            {/if}
            {if $buttons} 
                <div class="section-actions">
                    {if $buttons}
                        <div class="section-actions-buttons">
                            {foreach $buttons as $button}
                                {include file="{$smarty.current_dir}/../../common/button.tpl"}
                            {/foreach}
                        </div>
                    {/if}
                </div>
            {/if}
        </div>
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
    {if $graphic.graphic && $graphic_type == "type-3" && ($graphic_position == "top-center" || $graphic_position == "bottom-center")}
        {if $graphic.graphic|strstr:".tpl"}
            <div class="section-background section-background-side">
                {include file="{$smarty.current_dir}/../../common/graphic.tpl" 
                    graphic=$graphic.graphic
                    type=$graphic.type
                }
            </div>
        {else}
            <div class="section-background section-background-image" style="background-image: url('{$WEB_ROOT}/templates/{$template}/assets/img/page-manager/{$graphic.graphic}');">
            </div>
        {/if}
    {/if}   
</div> 