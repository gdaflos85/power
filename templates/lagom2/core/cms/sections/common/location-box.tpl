{if file_exists("{$smarty.current_dir}/overwrites/location-box.tpl")}
    {include file="{$smarty.current_dir}/overwrites/location-box.tpl"} 
{else}
    {include file="{$smarty.current_dir}/feature-cols.tpl"}
    <div class="{foreach $cols as $col} {$col}{/foreach}">
        {if ((($location.link_type == "custom-url" || $location.link_type == "homepage") && $location.custom_url != "") || ($location.link_type == "whmcs-page" && $location.whmcs_page != "")) && $location.show_link == "1"}
            <a href="{if $location.link_type == "custom-url" ||  $location.link_type == "homepage"}{if $location.link_type == "homepage" || $location.custom_url|substr:0:1 == "/"}{$WEB_ROOT}{/if}{$location.custom_url}{elseif $location.link_type == "whmcs-page"}{$WEB_ROOT}{if $location.url|substr:0:1 != "/"}/{/if}{$location.url}{/if}" {if $location['target_blank']} target="_blank"{/if} data-feature-link
        {else}    
            <div
        {/if}
        class="feature feature-location-box{if $locationSize == "large"} feature-lg{elseif $locationSize == "small"} feature-sm{/if}{if $locationStyle == 'boxed'} is-boxed{elseif $locationStyle == 'bordered'} is-bordered {else} feature-default{/if}{if $locationIconPosition == "left" || $locationIconPosition == "right"} feature-horizontal{/if} feature-icon-{$locationIconPosition} {if $location.custom_classes} {$location.custom_classes}{/if}{if $locationCustomClasses} {$locationCustomClasses}{/if} {if !$location.description && $location.show_link == '0'}feature-title-only{/if} {if $location.location_status == "comming_soon"}feature-location-unavailable{/if}">
            <div class="feature-body">
                <div class="feature-icon feature-location-flag"  data-animation-css>
                    {include file="{$smarty.current_dir}/graphic.tpl" 
                        graphic=$location.media|default:"default/World.png"
                        type="media"
                        elementTitle=$location.title
                    }
                </div>
                {if $location.title || $location.description || $location.link_type}
                    <div class="feature-content">
                        {if $location.title}
                            <h3 class="feature-title">
                                {if $location.location == "custom"}
                                    {$location.title|unescape:'html'}
                                {else}
                                    {$rslang->trans($location.title)}
                                {/if}
                                {if $location.location_status && $location.location_status != "none"}
                                    <label class="label label-rounded label-sm label-{if $location.location_status == "new"}savings{elseif $location.location_status == "comming_soon"}info{/if}">{$rslang->trans($location.location_status)}</label>
                                {/if}
                            </h3>
                        {/if}
                        {if $location.description && $location.description !== ' '}
                            <div class="feature-desc">
                                {if $location.location == "custom"}
                                    {$location.description|unescape:'html'}
                                {else}
                                    {$rslang->trans($location.description)}
                                {/if}
                            </div>
                        {/if}
                    </div>
                    {if ((($location.link_type == "custom-url" || $location.link_type == "homepage") && $location.custom_url != "") || ($location.link_type == "whmcs-page" && $location.whmcs_page != "")) && $location.show_link == "1"}
                        <div class="feature-location-arrow">
                            {if $locationIconPosition == "left" || $locationIconPosition == "top-center"}
                                <i class="lm lm-arrow-medium-right"></i>
                            {else}
                                <i class="lm lm-arrow-medium-left"></i>
                            {/if}
                        </div>
                    {/if}
                {/if}
            </div>
        {if ((($location.link_type == "custom-url" || $location.link_type == "homepage") && $location.custom_url != "") ||  ($location.link_type == "whmcs-page" && $location.whmcs_page != "")) && $location.show_link == "1"}
            </a>
        {else}    
            </div>
        {/if}
    </div>
{/if}    
