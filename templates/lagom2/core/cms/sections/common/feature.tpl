{if file_exists("{$smarty.current_dir}/overwrites/feature.tpl")}
    {include file="{$smarty.current_dir}/overwrites/feature.tpl"} 
{else}
    {include file="{$smarty.current_dir}/feature-cols.tpl"}
    <div class="{foreach $cols as $col} {$col}{/foreach}{if $displaySlider}{if $featureSliderType == "screen-slider"} screen-slider-item{else} content-slider-item{/if}{/if}">
        {if ((($feature.link_type == "custom-url" || $feature.link_type == "homepage") && $feature.custom_url != "") ||  ($feature.link_type == "whmcs-page" && $feature.whmcs_page != "")) && $feature.show_link == "1"}
            <a href="{if $feature.link_type == "custom-url" ||  $feature.link_type == "homepage"}{if $feature.link_type == "homepage" || $feature.custom_url|substr:0:1 == "/"}{$WEB_ROOT}{/if}{$feature.custom_url}{elseif $feature.link_type == "whmcs-page"}{$WEB_ROOT}{if $feature.url|substr:0:1 != "/"}/{/if}{$feature.url}{/if}" {if $feature['target_blank']} target="_blank"{/if} data-feature-link
        {else}    
            <div
        {/if}
        class="feature {if $featureSize == "large"} feature-lg{elseif $featureSize == "small"} feature-sm{/if}{if $featureStyle == 'boxed'} is-boxed{elseif $featureStyle == 'bordered'} is-bordered{/if}{if $featureIconPosition == "left" || $featureIconPosition == "right"} feature-horizontal{/if} feature-icon-{$featureIconPosition} {if $feature.custom_classes} {$feature.custom_classes}{/if}{if $featureCustomClasses} {$featureCustomClasses}{/if} {if !$feature.description && $feature.show_link == '0'}feature-title-only{/if}">
            <div class="feature-body">
                {if $feature.show_icon && ($feature.icon || $feature.media || $feature['font-icon'])}
                    <div class="feature-icon{if $statNum} stat-icon{/if}"  data-animation-css>
                        {if isset($feature.icon)}
                            {include file="{$smarty.current_dir}/graphic.tpl" 
                                graphic=$feature.icon
                                type="icon"
                                theme=$theme
                            }
                        {elseif isset($feature['font-icon'])}
                            <div class="font-icon {if isset($feature['font-icon']) && $feature['font-icon']|strstr:"fa-"} font-icon-fa{/if}">
                                <i class="{$feature['font-icon']}"></i>
                            </div>
                        {else}
                            {include file="{$smarty.current_dir}/graphic.tpl" 
                                graphic=$feature.media
                                type="media"
                                elementTitle=$feature.title
                            }
                        {/if}
                    </div>
                {/if}
                {if $feature.title || $feature.description || $feature.link_type || $feature.stat}
                <div class="feature-content">
                        {if $feature.stat}
                            <p class="feature-stat" data-animation="" data-animation-options="type: featureValue; mobileAnimation: true; ">
                                <span data-animation-bar-value="{$feature.stat}">{$feature.stat|unescape:'html'}</span>
                            </p>
                        {/if}
                        {if $feature.title}
                            {if $featureValue}  
                                {if $feature.title|strstr:"."|| $feature.title|strstr:","}
                                    {$valueRound = true}
                                {/if}
                                <h3 class="feature-title {if $feature.title|strstr:'feature-number'}feature-title-flex{/if}" data-animation data-animation-options="type: featureValue; mobileAnimation: true; {if $valueRound}valueRound: 100{/if}"><span data-animation-bar-value="{$feature.title|unescape:'html'}">{if $feature.title|strstr:'feature-number'}{$feature.title|unescape:'html'|replace:'</span>':'</span><span>'}</span>{else}{$feature.title|unescape:'html'}{/if}</span></h3>
                            {else}
                                <h3 class="feature-title {if $feature.title|strstr:'feature-number'}feature-title-flex{/if}">{if $feature.title|strstr:'feature-number'}{$feature.title|unescape:'html'|replace:'</span>':'</span><span>'}</span>{else}{$feature.title|unescape:'html'}{/if}</h3>
                            {/if}
                        {/if}
                        {if $feature.description && $feature.description !== ' '}
                            <div class="feature-desc">
                                {$feature.description|unescape:'html'}
                            </div>
                        {/if}
                        {if (((($feature.link_type == "custom-url" || $feature.link_type == "homepage") && $feature.custom_url != "") || ($feature.link_type == "whmcs-page" && $feature.whmcs_page != "")) && isset($feature.link_text) && $feature.link_text != "") && $feature.show_link == "1"}
                            <div class="btn btn-link {if $featureSize == "large"}btn-lg{/if} flex-row-reverse">
                                <div class="btn-icon">
                                    <i class="ls ls-arrow-right"></i> 
                                </div>
                                <div class="btn-text">
                                    {if isset($frontHelper)}{$frontHelper->langParse($feature.link_text)}{else}{$feature.link_text}{/if}
                                </div>
                            </div>
                        {/if}
                    </div>
                {/if}
            </div>
        {if ((($feature.link_type == "custom-url" || $feature.link_type == "homepage") && $feature.custom_url != "") ||  ($feature.link_type == "whmcs-page" && $feature.whmcs_page != "")) && $feature.show_link == "1"}
            </a>
        {else}    
            </div>
        {/if}
    </div>
{/if}    
