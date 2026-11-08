

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
<div class="site-banner banner banner-cms banner-domain banner-{$theme} banner-{$type} {if $type|in_array:$sideTypes} banner-sides{else} banner-center{/if} {if $type == "type-1"} banner-predefined-graphic{elseif $type == "type-2"} banner-custom-graphic {elseif $type== "type-3" || $type== "type-4" } banner-custom-graphic-bg {elseif $type == "type-5"} banner-custom-graphic-overlap {elseif $type == "type-6"} banner-no-graphic{/if} {if $overlay} section-overlay{/if} {if $combined}section-combined{/if} {if $custom_class} {$custom_class}{/if}" data-site-banner>
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
            {if $form_type}
                <div class="banner-search-domain">
                    {include file="{$smarty.current_dir}/../../common/forms/{$form_type}.tpl" customClass="has-shadow"}        
                </div>
            {/if}
            {if $buttons}
                <div class="banner-actions">
                    {if $buttons}
                        <div class="banner-actions-buttons">
                            {foreach $buttons as $button}
                                {include file="{$smarty.current_dir}/../../common/button.tpl"}
                            {/foreach}
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