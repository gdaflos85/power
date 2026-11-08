<div class="site-section section-title-above section-location section-location-{$section_type} section-{$theme} {if $overlay} section-overlay{/if} {if $combined}section-combined{/if} {if $custom_class} {$custom_class}{/if}">
    {include file="{$smarty.current_dir}/../../common/anchor.tpl"} 
    <div class="container">
        {if $caption}
            <span class="section-caption">{$caption|unescape:'html'}</span>
        {/if}
        {if $title}
            <h2 class="section-title">{$title|unescape:'html'}</h2>
        {/if}
        {if $subtitle}
            <div class="section-subtitle">{$subtitle|unescape:'html'}</div>
        {/if}
        {if is_array($locations) && count($locations) > 0}
            <div class="section-content section-content-features">
                <div class="location-map location-map-{$map_style} on-{$theme}">
                    {include file="{$smarty.current_dir}/../../../../../assets/img/cms/map.tpl"}
                    {foreach $locations as $location}
                        <div class="location-point {if $location.location_status == "comming_soon"}location-point-unavailable{/if} location-point-{$pointer_style} {if $boxes_custom_classes} {$boxes_custom_classes}{/if} {if $location.custom_classes} {$location.custom_classes}{/if}" id="location-pin-{$sectionId}-{$location.index}"
                            style="top:{$location.location_position_top}px; left:{$location.location_position_left}px;"
                            data-location-popover
                            data-container="#location-pin-{$sectionId}-{$location.index}" 
                            data-toggle="popover"
                            data-content='
                                <div class="popover-location-icon">
                                    <img 
                                        src="{$WEB_ROOT}/templates/{$template}/assets/img/page-manager/{$location.media|default:"default/World.png"}"  
                                        alt="{if $title || $caption || $elementTitle}{if isset($pageSeoTitle)}{$pageSeoTitle|unescape:'html'|strip_tags} - {/if}{if $elementTitle && $elementTitle != ""}{$elementTitle|unescape:'html'|strip_tags}{else}{if $title}{$title|unescape:'html'|strip_tags}{elseif $caption}{$caption|unescape:'html'|strip_tags}{/if}{/if}{/if}">
                                    {* <img src="/templates/lagom2/assets/img/page-manager/default/NI - Nicaragua.png"/> *}
                                </div>
                                <div class="popover-location-content">
                                    <div class="popover-location-title">
                                        {if $location.location == "custom"}
                                        {$location.title|unescape:'html'|replace:"<br>":""}{if $location.title|strstr:"<br>"}{else},&nbsp;{/if}
                                        {else}
                                            {$rslang->trans($location.title)}{if $location.title|strstr:"<br>"}{else},&nbsp;{/if}
                                        {/if}
                                    </div>
                                    <div class="popover-location-desc">
                                        {if $location.location == "custom"}
                                            {$location.description|unescape:'html'}
                                        {else}
                                            {$rslang->trans($location.description)}
                                        {/if}
                                    </div>
                                </div>
                                {if $location.location_status && $location.location_status != "none"}
                                    <div class="label label-rounded {if $box_size == "small"}label-xs{elseif $box_size =="default"}label-sm{/if} label-{if $location.location_status == "new"}savings{elseif $location.location_status == "comming_soon"}info{/if}">{$rslang->trans($location.location_status)}</div>
                                {/if}
                            ' 
                            {* data-html="true" *}
                            
                            data-template='
                                {if ((($location.link_type == "custom-url" || $location.link_type == "homepage") && $location.custom_url != "") || ($location.link_type == "whmcs-page" && $location.whmcs_page != "")) && $location.show_link == "1"}
                                    <a href="{if $location.link_type == "custom-url" ||  $location.link_type == "homepage"}{if $location.link_type == "homepage" || $location.custom_url|substr:0:1 == "/"}{$WEB_ROOT}{/if}{$location.custom_url}{elseif $location.link_type == "whmcs-page"}{$WEB_ROOT}{if $location.url|substr:0:1 != "/"}/{/if}{$location.url}{/if}" {if $location['target_blank']} target="_blank"{/if} data-popover-location-link 
                                    class="popover location-popup {if $location.location_status == "comming_soon"}location-popup-unavailable{/if} location-popup-link location-popup-{$box_size} location-popup-icon-{$box_icon_position} {if $box_style == "boxed"}is-boxed{elseif $box_style == "bordered"}is-bordered{else}is-dafault{/if}" role="tooltip"><div class="arrow"></div><div class="popover-body {if $location.title|strstr:"<br>"}popover-location-content-column{/if}"></div>
                                {else}
                                    <div class="popover location-popup {if $location.location_status == "comming_soon"}location-popup-unavailable{/if} location-popup-{$box_size} location-popup-icon-{$box_icon_position} {if $box_style == "boxed"}is-boxed{elseif $box_style == "bordered"}is-bordered{else}is-dafault{/if}" role="tooltip"><div class="arrow"></div><div class="popover-body {if $location.title|strstr:"<br>"}popover-location-content-column{/if}"></div>
                                {/if}
                                {if ((($location.link_type == "custom-url" || $location.link_type == "homepage") && $location.custom_url != "") ||  ($location.link_type == "whmcs-page" && $location.whmcs_page != "")) && $location.show_link == "1"}
                                    </a> 
                                {else}    
                                    </div>
                                {/if}
                            '
                            data-trigger="hover"
                            {* data-trigger="click" *}
                            data-delay='{ "show": 100, "hide": 300 }'
                        >
                            {if $pointer_style == "pin"}
                                {include file="{$smarty.current_dir}/../../../../../assets/img/cms/location-pin.tpl"
                                location=$location}
                            {else}
                                {include file="{$smarty.current_dir}/../../../../../assets/img/cms/location-point.tpl"}
                            {/if}     
                        </div>
                    {/foreach}
                </div>
                <div class="location-boxes row row-eq-height row-eq-height-xs row-lg hidden-sm hidden-xs">
                    {foreach $locations as $location}     
                        {include file="{$smarty.current_dir}/../../common/location-box.tpl" 
                            location=$location  
                            locationStyle=$box_style 
                            locationIconPosition=$box_icon_position
                            locationSize=$box_size
                            featureColsDesktop=$cols_desktop
                            featureColsTabH=$cols_tab_h
                            featureColsTabV=$cols_tab_v
                            featureColsMob=$cols_mob
                            locationCustomClasses=$boxes_custom_classes
                        }
                    {/foreach}
                    {if $display_map_bg == '1'}
                        <div class="location-bg-map">
                            {include file="{$smarty.current_dir}/../../../../../assets/img/cms/map.tpl"}
                        </div>
                    {/if}
                </div>
                <div class="location-list {if $box_style == 'boxed'} is-boxed{elseif $box_style == 'bordered'} is-bordered{/if} visible-sm visible-xs">
                    {foreach $locations as $location}   
                        {if ((($location.link_type == "custom-url" || $location.link_type == "homepage") && $location.custom_url != "") || ($location.link_type == "whmcs-page" && $location.whmcs_page != "")) && $location.show_link == "1"}
                            <a class="location-list-element location-list-element-link {if $location.location_status == "comming_soon"}location-list-element-unavailable{/if}" href="{if $location.link_type == "custom-url" ||  $location.link_type == "homepage"}{if $location.link_type == "homepage" || $location.custom_url|substr:0:1 == "/"}{$WEB_ROOT}{/if}{$location.custom_url}{elseif $location.link_type == "whmcs-page"}{$WEB_ROOT}{if $location.url|substr:0:1 != "/"}/{/if}{$location.url}{/if}" {if $location['target_blank']} target="_blank"{/if}>
                        {else}    
                            <div class="location-list-element {if $location.location_status == "comming_soon"}location-list-element-unavailable{/if}">
                        {/if}
                            <div class="location-list-icon">
                                {include file="{$smarty.current_dir}/../../common/graphic.tpl" graphic=$location.media|default:"default/World.png" type="media" elementTitle=$location.title}
                            </div>
                            <div class="location-list-content">
                                <div class="location-list-title">
                                    {if $location.location == "custom"}
                                        {$location.title|unescape:'html'}
                                    {else}
                                        {$rslang->trans($location.title)}
                                    {/if}
                                </div>
                                <div class="location-list-desc">
                                    {if $location.location == "custom"}
                                        <b class="hidden-xs">&nbsp;-</b> {$location.description|unescape:'html'}
                                    {else}
                                        <b class="hidden-xs">&nbsp;-</b> {$rslang->trans($location.description)}
                                    {/if}
                                </div>
                            </div>
                            <label class="label location-list-label label-rounded label-xs label-{if $location.location_status == "new"}savings{elseif $location.location_status == "comming_soon"}info{/if}">{$rslang->trans($location.location_status)}</label>
                        {if ((($location.link_type == "custom-url" || $location.link_type == "homepage") && $location.custom_url != "") || ($location.link_type == "whmcs-page" && $location.whmcs_page != "")) && $location.show_link == "1"}
                            </a>
                        {else}    
                            </div>
                        {/if}
                    {/foreach}
                </div>
            </div>    
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
            </div>
        {/if}
    </div>   
</div> 