{assign var="iconLocation" value="./../../../../assets/svg-icons"}
{assign var="iconsPath" value="./../../../../../../../templates/{$themeName}/assets/svg-icon"}
{assign var="illustrationsPath" value="./../../../../../../../templates/{$themeName}/assets/svg-illustrations"}

{assign var="imagesPath" value="{$whmcsURL}/templates/{$themeName}/assets/img"}

{if isset($groupIndex) && isset($sectionGroupField['icons'])}
    {assign var=showModalIconsTabs value=$sectionGroupField['icons']}
{elseif isset($sectionField['icons'])}
    {assign var=showModalIconsTabs value=$sectionField['icons']}
{/if}
{if isset($sectionGroupField['link'])} 
    {assign var=showModalLinks value=$sectionGroupField['link']}
{elseif isset($sectionField['link'])} 
    {assign var=showModalLinks value=$sectionField['link']}
{/if}
{if isset($sectionGroupField['sidebar'])} 
    {assign var=sidebarType value=$sectionGroupField['sidebar']}
{elseif isset($sectionField['sidebar'])} 
    {assign var=sidebarType value=$sectionField['sidebar']}
{/if}

{$showModalStatsField = false}
{if isset($sectionGroupField['stats'])} 
    {assign var=showModalStatsField value=$sectionGroupField['stats']}
{elseif isset($sectionField['stats'])} 
    {assign var=showModalStatsField value=$sectionField['stats']}
{/if}

{*TODO obsłużyć jeszcze grupy - zmienna $groupId*}
<ul class="sortableList list-page-manager list list--sortable {if empty($items)}is-hidden{/if}"
    {if isset($groupIndex)}
        data-item-list="{$sectionGroupField['name']}"
    {else}
        data-item-list="{$sectionField['name']}"
    {/if}
    
    data-section="{$sectionIndex}"
    data-item-list-type="{$listType}"
    {if isset($groupIndex)}
        data-group="{$groupIndex}"
    {/if}
    {if $comparison}data-item-list-comparison-control="{$comparison}"{/if}
>
    {if !empty($items)}
        {foreach $items as $key => $item}
            <li class="items-list list__item">
                {* {if isset($item['icon']) || isset($item['illustration']) || isset($item['font-icon']) || isset($item['media']) || isset($item['show_icon'])} *}
                    <div class="list__item-icon {if isset($item['location'])}list__item-icon--flag{else}i-c-4x{/if} icon-{$item['index']} m-l-0x {if !$item['show_icon']}is-hidden{/if}">
                        {if isset($item['icon'])}
                            {if $item['icon']|strstr:".tpl"}
                                {if file_exists("{$whmcsDir}/templates/{$themeName}/assets/svg-icon/{$item['icon']}")}
                                    {include file="{$iconsPath}/{$item['icon']}"}
                                {else}
                                    {include file="adminarea/pages/includes/sortable-list/edit-btn.tpl" type="placeholder" classes="btn btn--icon btn--link btn--xs" scope=parent}
                                {/if}
                            {else}
                                {if file_exists("{$whmcsDir}/templates/{$themeName}/assets/svg-icon/{$item['icon']}.tpl")}
                                    {include file="{$iconsPath}/{$item['icon']}.tpl"}
                                {else}
                                    {include file="adminarea/pages/includes/sortable-list/edit-btn.tpl" type="placeholder" classes="btn btn--icon btn--link btn--xs" scope=parent}
                                {/if}
                            {/if}  
                        {/if}
                        {if isset($item['illustration'])}
                            {if $item['illustration']|strstr:".tpl"}
                                {if file_exists("{$whmcsDir}/templates/{$themeName}/assets/svg-illustrations/{$item['illustration']}")}
                                    {include file="{$illustrationsPath}/{$item['illustration']}"}
                                {else}
                                    {include file="adminarea/pages/includes/sortable-list/edit-btn.tpl" type="placeholder" classes="btn btn--icon btn--link btn--xs" scope=parent}
                                {/if}
                            {else}
                                {if file_exists("{$whmcsDir}/templates/{$themeName}/assets/svg-illustrations/{$item['illustration']}.tpl")}
                                    {include file="{$illustrationsPath}/{$item['illustration']}.tpl"}
                                {else}
                                    {include file="adminarea/pages/includes/sortable-list/edit-btn.tpl" type="placeholder" classes="btn btn--icon btn--link btn--xs" scope=parent}
                                {/if}
                            {/if}  
                        {/if}
                        {if isset($item['font-icon'])}
                            <i class="{$item['font-icon']}"></i>
                        {/if}
                        {if isset($item['media'])}
                            {if $item['media'] !== 'undefined'}
                                <img style="max-height: 130px;object-fit:cover;object-position:center;" src="{$imagesPath}/page-manager/{$item['media']}" alt="{$item['media']}">
                            {/if}
                        {/if}
                        {if !isset($item['icon']) && !isset($item['illustration']) && !isset($item['font-icon']) && !isset($item['media'])}
                            {include file="adminarea/pages/includes/sortable-list/edit-btn.tpl" type="placeholder" classes="btn btn--icon btn--link btn--xs" scope=parent}
                        {/if}
                    </div>
                {* {/if} *}
                {*TODO długie imie wchodzi na opis*}
                <div 
                    class="list__item-name {if isset($item['slide_id']) && $item['slide_id'] == "all"}w-a{/if}" 
                    data-name
                    href="#{$btnEditAction}"
                    data-edit-item
                    data-toggle="lu-modal"
                    data-backdrop="static"
                    data-keyboard="false"
                    data-section="{$sectionIndex}"
                    
                    {if isset($groupIndex)}
                        data-list-name="{$sectionGroupField['name']}"
                    {else}
                        data-list-name="{$sectionField['name']}"
                    {/if}
                    
                    data-key="{$item['index']}"
                    data-position="{$item['position']}"

                    {*Icon types*}
                    {if isset($item['icon'])}
                        data-icon="{$item['icon']}"
                    {/if}
                    {if isset($item['font-icon'])}
                        data-font-icon="{$item['font-icon']}"
                    {/if}
                    {if isset($item['media'])}
                        data-media="{$item['media']}"
                    {/if} 
                    {if isset($item['illustration'])}
                        data-illustration="{$item['illustration']}"
                    {/if}

                    {* item / products / groups*}
                    {if isset($item['title'])}
                        data-title="{$item['title']|escape:"html"}"
                    {/if}
                    {if isset($item['description'])}
                        data-description="{$item['description']|escape:"html"}"
                    {/if}

                    {* products / groups*}
                    {if isset($item['show_icon'])}
                        data-show-icon="{$item['show_icon']}"
                    {/if}
                    {if isset($item['group_id'])}
                        data-group_id="{$item['group_id']}"
                        {if isset($item['whmcs_page'])}
                            data-whmcs-page='{$item['whmcs_page']}'
                        {/if}
                    {/if}
                    {if isset($item['product_id'])}
                        data-product_id="{$item['product_id']}"
                    {/if}

                    {if $item['custom_description']}
                        data-custom_description = "{$item['custom_description']|escape:"html"}"
                    {/if}
                    {if $item['custom_price_before']}
                        data-custom_price_before = "{$item['custom_price_before']}"
                    {/if}
                    {if $item['custom_price_after']}
                        data-custom_price_after = "{$item['custom_price_after']}"
                    {/if}
                    {if $item['custom_price_label']}
                        data-custom_price_label = "{$item['custom_price_label']}"
                    {/if}
                    {if $item['custom_multi_price']}
                        data-custom_multi_price = '{$item['custom_multi_price']}'
                    {/if}
                    {* testimonials*}
                    {if isset($item['author'])}
                        data-author="{$item['author']}"
                    {/if}
                    {if isset($item['domain'])}
                        data-domain="{$item['domain']}"
                    {/if}
                    {if isset($item['domain_url'])}
                        data-domain-url="{$item['domain_url']}"
                    {/if}
                    {if isset($item['date'])}
                        data-date="{$item['date']}"
                    {/if}

                    {* buttons *}
                    {if isset($item['text'])}
                        data-text="{$item['text']}"
                    {/if}
                    {if isset($item['type'])}
                        data-type="{$item['type']}"
                    {/if}
                    {if isset($item['style'])}
                        data-style="{$item['style']}"
                    {/if}
                    {if isset($item['size'])}
                        data-size="{$item['size']}"
                    {/if}
                    {if isset($item['link_type'])}
                        data-link-type="{$item['link_type']}"
                    {/if}
                    {if isset($item['link_type']) && $item['link_type'] == 'custom-url'}
                        data-custom-url="{$item['custom_url']}"
                    {/if}
                    {if isset($item['link_type']) && $item['link_type'] == 'whmcs-page'}
                        data-whmcs-page='{$item['whmcs_page']}'
                        data-url="{$item['url']}"
                    {/if}
                    {if isset($item['link_type']) && $item['link_type'] == 'homepage'}
                        data-custom-url="/"
                    {/if}
                    {if isset($item['link_type']) && $item['link_type'] == 'whmcs-product'}
                         data-whmcs-product='{$item['whmcs_product']}'
                    {/if}
                    {if isset($item['link_text'])}
                        data-link-text="{$item['link_text']}"
                    {/if}
                    {if isset($item['custom_classes'])}
                        data-custom-classes="{$item['custom_classes']}"
                    {/if}
                    {if isset($item['target_blank'])}
                        data-target-blank="{$item['target_blank']}"
                    {/if}
                    {if isset($item['show_link'])}
                        data-show-link="{$item['show_link']}"
                    {/if}

                    {* group *}
                    {if isset($groupIndex)}
                        data-group="{$groupIndex}"
                    {/if}

                    {* domains *}
                    {if isset($item['domain_id'])}
                        data-domain-id="{$item['domain_id']}"
                    {/if}

                    {* locations *}
                    {if isset($item['location'])}
                        data-location="{$item['location']}"
                    {/if}
                    {if isset($item['location_status'])}
                        data-location-status="{$item['location_status']}"
                    {/if}
                    {if isset($item['location_position_top'])}
                        data-location-position-top="{$item['location_position_top']}"
                    {/if}
                    {if isset($item['location_position_left'])}
                        data-location-position-left="{$item['location_position_left']}"
                    {/if}

                    {* promocodes *}
                    {if isset($item['apply_promocode'])}
                        data-apply-promocode="{$item['apply_promocode']}"
                    {/if}
                    {if isset($item['promocode'])}
                        data-promocode="{$item['promocode']}"
                    {/if}

                    {* promotion manager *}
                    {if isset($item['slide_id'])}
                        data-slide-id="{$item['slide_id']}"
                    {/if}

                    {if isset($showModalIconsTabs)} data-show-modal-icon='{if !$showModalIconsTabs}false{else}true{/if}'{/if}
                    {if isset($showModalLinks)}data-show-modal-link="{if !$showModalLinks}false{else}true{/if}"{/if}
                    {if isset($showModalStatsField) && $showModalStatsField}data-show-modal-stats{/if}
                    {if isset($item['stat'])}
                        data-stats="{$item['stat']|escape:"html"}"
                    {/if}
                    {if isset($sidebarType) && $sidebarType}data-list-sidebar-type{/if}

                >
                    {if isset($sidebarType) && $sidebarType}
                        {$item['link_text']}
                    {else}
                        {if $item['text']}
                            {$item['text']}
                        {else}
                            
                        <span class="truncate">{$item['title']}</span> {if isset($item['promocode']) && isset($item['apply_promocode']) && $item['apply_promocode'] == "1"}<span class="i-c-2x m-l-1x" data-toggle="lu-tooltip" data-title="A separate promotional code has been chosen for this product"><i class="fas fa-badge-percent text-savings"></i></span>{/if}
                        {/if}
                    {/if}
                </div>
                {*TODO długi opis zawija buttony edycji oraz usuwania *}
                {if $item['custom_url'] || $item['url'] || $item['description'] || $item['custom_description'] || $item['whmcs_product'] || $item['slide_id']}
                <div class="list__item-desc" data-desc>
                    {if $item['custom_description']}
                        {$item['custom_description']|html_entity_decode|escape:"html"}
                    {elseif $item['description'] || $item['slide_id']}
                        {$item['description']|html_entity_decode|escape:"html"}
                    {elseif $item['custom_url'] && !$item['group_id']}
                        {if $item['link_type'] == 'homepage'}
                            <a href="{$whmcsURL}" target="_blank">/</a>
                        {elseif !$item['custom_url']|strstr:"javascript" && !$item['custom_url']|strstr:"tel:" && !$item['custom_url']|strstr:"mailto:" && !$item['custom_url']|strstr:"http" && !$item['custom_url']|strstr:"//"}                            
                            <a href="{$whmcsURL}/{$item['custom_url']}" target="_blank">{if substr($item['custom_url'], 0, 1) != '/'}/{/if}{$item['custom_url']|replace:$whmcsURL:""}</a>
                        {else}
                            <a href="{$item['custom_url']}" target="_blank">{$item['custom_url']|replace:$whmcsURL:""}</a>
                        {/if}
                    {elseif $item['url'] && !$item['group_id']}
                        {if $item['link_type'] == 'homepage'}
                            <a href="{$whmcsURL}" target="_blank">/</a>
                        {elseif !$item['url']|strstr:"javascript" && !$item['url']|strstr:"tel:" && !$item['url']|strstr:"mailto:" && !$item['url']|strstr:"http" && !$item['url']|strstr:"//"}
                            <a href="{$whmcsURL}/{$item['url']}" target="_blank">{if substr($item['custom_url'], 0, 1) != '/'}/{/if}{$item['url']|replace:$whmcsURL:""}</a>
                        {else}
                            <a href="{$item['url']}" target="_blank">{$item['url']|replace:$whmcsURL:""}</a>
                        {/if}
                    {elseif $item['whmcs_product']}
                        <a href="{$whmcsURL}/cart.php?a=add&pid={$item['whmcs_product']}">/cart.php?a=add&pid={$item['whmcs_product']}</a>
                    {/if}

                </div>
                {/if}
                <div class="list__item-actions">
                    {include 
                        file="adminarea/pages/includes/sortable-list/edit-btn.tpl" 
                        classes="btn btn--icon btn--link btn--xs" 
                        showModalIconsTabs=$showModalIconsTabs 
                        showModalLinks=$showModalLinks
                        showModalStatsField=$showModalStatsField
                        sidebarType=$sidebarType
                        scope=parent
                    }
                    <a
                        class="deleteItem btn btn--icon btn--link btn--xs"
                        href="#deleteItemModal"
                        data-toggle="lu-modal"
                        data-backdrop="static"
                        data-delete-item
                        {if isset($groupIndex)}
                            data-list-name="{$sectionGroupField['name']}"
                        {else}
                            data-list-name="{$sectionField['name']}"
                        {/if}
                        data-index="{$item['index']}"
                        data-section="{$sectionIndex}"
                        {if isset($groupIndex)}
                            data-group="{$groupIndex}"
                        {/if}
                    >
                        <i class="btn__icon ls ls-trash" data-toggle="lu-tooltip" data-title="Remove Item"></i>
                    </a>
                </div>
            </li>
        {/foreach}
    {/if}
</ul>
<div 
    class="msg msg--simple msg--bordered {if !empty($items)}is-hidden{/if}" 
    {if isset($groupIndex)}
        data-item-empty-list="{$sectionGroupField['name']}" 
        data-group="{$groupIndex}"
    {else}
        data-item-empty-list="{$sectionField['name']}"
    {/if} 
        data-section="{$sectionIndex}"
    >
    <a 
        href="#{$btnAddAction}" 
        class="msg__body"
        data-add-new-item="{$listType}"
        {if isset($groupIndex)}
            data-list-name="{$sectionGroupField['name']}"
        {else}
            data-list-name="{$sectionField['name']}"
        {/if}
        data-new-index="1"
        data-new-position="1"
        data-section="{$sectionIndex}"
        {if $groupIndex}
            data-group="{$groupIndex}"
        {/if}
        data-toggle="lu-modal"
        data-backdrop="static"
        data-keyboard="false"
        {if isset($sectionGroupField['icons']) || isset($sectionField['icons'])} 
            data-show-modal-icon="{if !$showModalIconsTabs}false{else}true{/if}"
        {/if}
        {if isset($sectionGroupField['link'])} 
            data-show-modal-link="{if !$sectionGroupField['link']}false{else}true{/if}"
        {elseif isset($sectionField['link'])} 
            data-show-modal-link="{if !$sectionField['link']}false{else}true{/if}"
        {/if}
        {if isset($sidebarType) && $sidebarType}data-list-sidebar-type{/if}
        {if isset($showModalStatsField) && $showModalStatsField}data-show-modal-stats{/if}
    >
        <span class="msg__title">No {if isset($groupIndex)}{$sectionGroupField['label']}{else}{$sectionField['label']|lower}{/if} created</span>
        <div class="msg__actions">
            <span class="btn btn--sm btn--link">
                <i class="btn__icon ls ls-plus"></i>
                <span class="btn__text">Add new</span>
            </span>
        </div>
    </a>
</div>
