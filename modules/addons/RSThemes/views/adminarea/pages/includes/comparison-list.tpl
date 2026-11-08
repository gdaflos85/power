{assign var="iconLocation" value="./../../../../assets/svg-icons"}
{assign var="iconsPath" value="./../../../../../../../templates/{$themeName}/assets/svg-icon"}
{assign var="illustrationsPath" value="./../../../../../../../templates/{$themeName}/assets/svg-illustrations"}

{assign var="imagesPath" value="{$whmcsURL}/templates/{$themeName}/assets/img"}

{if $pageSection}
    {assign var=sectionLang value=$pageSection['lang'][$language]['translation']}
{elseif $section}
    {assign var=pageSection value=$section}
    {assign var=sectionLang value=$section['lang'][$language]['translation']}
{/if}

{foreach $pageSection['type']['fields'] as $fields}
    {if $fields['name'] == "products_group"}
        {assign var="targetValue" value=$sectionLang[$fields['name']]}
        {if isset($targetValue['groups'][$groupIndex]['fields']['header_title'])}
            {assign var="headerTitle" value=$targetValue['groups'][$groupIndex]['fields']['header_title']}
        {/if}
        {break}
    {/if}
{/foreach}

{$productCount = 0}   
{if isset($targetValue) && isset($targetValue['groups'][$groupIndex]['fields']['products_list']) && is_countable($targetValue['groups'][$groupIndex]['fields']['products_list'])}
    {$productCount = count($targetValue['groups'][$groupIndex]['fields']['products_list'])}  
{/if}
<div 
    class="list-header {if $productCount == 0 || empty($items)}is-hidden{/if}" 
    data-item-list-header
    data-section="{$sectionIndex}"
    {if isset($groupIndex)}
        data-group="{$groupIndex}"
    {/if}
>
    <div class="list-header__name">
        <input 
            class="form-control"
            type="text"        
            name="sections[{$sectionIndex}][lang][{$sectionField['name']}][groups][{$groupIndex}][fields][header_title]" 
            value="{if !$headerTitle}Compare Features{else}{$headerTitle}{/if}"
            data-item-list-header-input
            readonly
        >
        <button 
            type="button"
            class="btn btn--icon btn--link btn--sm"
            data-item-list-header-btn
            data-toggle="lu-tooltip"
            data-title="Edit title"
        >
            <i class="btn__icon ls ls-edit"></i>
        </button>
    </div>
    <div class="list-header__products" data-item-list-header-product-list>
        {if isset($targetValue) && isset($targetValue['groups'][$groupIndex]['fields']['products_list']) && is_countable($targetValue['groups'][$groupIndex]['fields']['products_list'])}
            {foreach $targetValue['groups'][$groupIndex]['fields']['products_list'] as $product}
                <span data-item-list-header-product="{$product.product_id}">{$product.title}</span>
            {/foreach}
        {/if}
    </div>
</div>
<ul class="sortableList no-hover list-page-manager list list--sortable list--comparison {if empty($items) || $productCount < 2}is-hidden{/if}"
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
>
    {if !empty($items)}
        {foreach $items as $key => $item}
            {if isset($item['type']) && $item['type'] == "category"}
                <li class="items-list list__item list__item--category {if $item['hide_item'] == "true"}list__item--hidden{/if}">
                    <div class="list__item-icon i-c-4x icon-{$item['index']} m-l-0x {if !$item['show_icon']}is-hidden{/if}">
                        {if isset($item['icon'])}
                            {if $item['icon']|strstr:".tpl"}
                                {if file_exists("{$whmcsDir}/templates/{$themeName}/assets/svg-icon/{$item['icon']}")}
                                    {include file="{$iconsPath}/{$item['icon']}"}
                                {else}
                                    {include file="adminarea/pages/includes/sortable-list/comparison-edit-btn.tpl" type="placeholder" classes="btn btn--icon btn--link btn--xs" scope=parent}
                                {/if}
                            {else}
                                {if file_exists("{$whmcsDir}/templates/{$themeName}/assets/svg-icon/{$item['icon']}.tpl")}
                                    {include file="{$iconsPath}/{$item['icon']}.tpl"}
                                {else}
                                    {include file="adminarea/pages/includes/sortable-list/comparison-edit-btn.tpl" type="placeholder" classes="btn btn--icon btn--link btn--xs" scope=parent}
                                {/if}
                            {/if}  
                        {/if}
                        {if isset($item['illustration'])}
                            {if $item['illustration']|strstr:".tpl"}
                                {if file_exists("{$whmcsDir}/templates/{$themeName}/assets/svg-illustrations/{$item['illustration']}")}
                                    {include file="{$illustrationsPath}/{$item['illustration']}"}
                                {else}
                                    {include file="adminarea/pages/includes/sortable-list/comparison-edit-btn.tpl" type="placeholder" classes="btn btn--icon btn--link btn--xs" scope=parent}
                                {/if}
                            {else}
                                {if file_exists("{$whmcsDir}/templates/{$themeName}/assets/svg-illustrations/{$item['illustration']}.tpl")}
                                    {include file="{$illustrationsPath}/{$item['illustration']}.tpl"}
                                {else}
                                    {include file="adminarea/pages/includes/sortable-list/comparison-edit-btn.tpl" type="placeholder" classes="btn btn--icon btn--link btn--xs" scope=parent}
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
                            {include file="adminarea/pages/includes/sortable-list/comparison-edit-btn.tpl" type="placeholder" classes="btn btn--icon btn--link btn--xs" scope=parent}
                        {/if}
                    </div>
                    <div 
                        class="list__item-name" 
                        data-name
                        data-edit-item="comparison_category"
                        href="#editComparisonTableCategoryModal"
                        data-toggle="lu-modal" 
                        data-backdrop="static" 
                        data-keyboard="false" 
                        data-section="{$sectionIndex}"
                        {if isset($groupIndex)}
                            data-group="{$groupIndex}"
                        {/if}
                        data-type="category"
                        data-show-icon={$item['show_icon']}
                        {if isset($groupIndex)}
                            data-list-name="{$sectionGroupField['name']}"
                        {else}
                            data-list-name="{$sectionField['name']}"
                        {/if}
                        data-key="{$item['index']}"
                        data-position="{$item['position']}"
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
                        {if isset($item['category-title'])}
                            data-category-title="{$item['category-title']|escape:"html"}"
                        {/if}
                        {if isset($item['custom_classes'])}
                            data-custom-classes="{$item['custom_classes']}"
                        {/if}
                        data-hide-item="{if !isset($item['hide_item'])}false{else}{$item['hide_item']}{/if}"
                    >
                        {$item['category-title']|escape:"html"}
                    </div>
                    <div class="list__item-actions">
                        <div class="has-dropdown">
                            <a 
                                class="btn btn--icon btn--block" 
                                href="" 
                                data-toggle="lu-dropdown" 
                                data-display="static"
                                data-placement="bottom right"
                                data-comparison-item-dropdown
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
                                <span class="btn__icon ls ls-more"></span>
                            </a>
                            <div class="dropdown" data-dropdown-menu>
                                <div class="dropdown__arrow" data-arrow></div>
                                <div class="dropdown__menu">
                                    <ul class="nav">
                                        <li class="nav__item">
                                            <a 
                                                class="nav__link"
                                                data-edit-comparison-feature-item   
                                            >
                                                <span class="nav__link-icon ls ls-edit"></span>
                                                <span class="nav__link-text">Edit Category</span>
                                            </a>
                                        </li>
                                        <li class="nav__item">
                                            <a 
                                                class="nav__link"
                                                data-copy-comparison-category
                                            >
                                                <span class="nav__link-icon ls ls-copy"></span>
                                                <span class="nav__link-text">Copy Category</span>
                                            </a>
                                        </li>
                                        <li class="nav__item" {if $item['hide_item'] == "true"}style="display:none"{/if}>
                                            <a 
                                                class="nav__link"
                                                data-hide-comparison-feature-item
                                            >
                                                <span class="nav__link-icon ls ls-denial"></span>
                                                <span class="nav__link-text">Hide Category</span>
                                            </a>
                                        </li>  
                                        <li class="nav__item" {if $item['hide_item'] == "false"}style="display:none"{/if}>
                                            <a 
                                                class="nav__link"
                                                data-show-comparison-feature-item
                                            >
                                                <span class="nav__link-icon fa fa-eye"></span>
                                                <span class="nav__link-text">Show Category</span>
                                            </a>
                                        </li>                                          
                                        <li class="nav__divider"></li>
                                        <li class="nav__item">
                                            <a 
                                                class="nav__link text-danger"
                                                href="#deleteItemModal"
                                                data-toggle="lu-modal"
                                                data-backdrop="static"
                                                data-delete-comparison-feature-item
                                            >
                                                <span class="nav__link-icon ls ls-trash"></span>
                                                <span class="nav__link-text">Delete</span>
                                            </a>
                                        </li> 
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            {else}
                <li class="items-list list__item list__item--comparison {if $item['hide_item'] == "true"}list__item--hidden{/if}">
                    <div 
                        class="list__item-name"
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
                        {if isset($groupIndex)}
                            data-group="{$groupIndex}"
                        {/if}
                        
                        data-key="{$item['index']}"
                        data-position="{$item['position']}"
                        data-product='{$item['product']|escape:"html"}'
                        data-feature-name="{$item['feature_name']|escape:"html"}"
                        data-hint="{$item['hint']}"
                        data-show-hint="{$item['show_hint']}"
                        data-hide-item="{if !isset($item['hide_item'])}false{else}{$item['hide_item']}{/if}"
                        {if isset($item['custom_classes'])}
                            data-custom-classes="{$item['custom_classes']}"
                        {/if}
                    >
                        {$item['feature_name']}
                        {if $item['show_hint'] &&  $item['show_hint']!="false" && $item['hint'] != ''}
                            <i class="ls ls-info-circle" data-toggle="lu-tooltip" data-title="{$item['hint']}"></i>
                        {/if}
                    </div>
                    <div class="list__item-features">
                        {assign var=products_features value=$item['product']|json_decode:1}
                        {foreach $products_features as $key2 => $feature}
                            <div class="list__item-product" data-product-id="{$key2}">{if $feature.icon && $feature.icon != "" && $feature.icon != "none"}<span class="list__item-icon" data-icon="{$feature.icon}"></span>{/if}{$feature.feature}</div>
                        {/foreach}
                    </div>
                    <div class="list__item-actions">
                        <div class="has-dropdown">
                            <a 
                                class="btn btn--icon btn--block" 
                                href="" 
                                data-toggle="lu-dropdown" 
                                data-display="static"
                                data-placement="bottom right"
                                data-comparison-item-dropdown
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
                                <span class="btn__icon ls ls-more"></span>
                            </a>
                            <div class="dropdown" data-dropdown-menu>
                                <div class="dropdown__arrow" data-arrow></div>
                                <div class="dropdown__menu">
                                    <ul class="nav">
                                        <li class="nav__item">
                                            <a 
                                                class="nav__link"
                                                data-edit-comparison-feature-item
                                            >
                                                <span class="nav__link-icon ls ls-edit"></span>
                                                <span class="nav__link-text">Edit Details</span>
                                            </a>
                                        </li>
                                        <li class="nav__item">
                                            <a 
                                                class="nav__link"
                                                data-copy-comparison-feature-item
                                            >
                                                <span class="nav__link-icon ls ls-copy"></span>
                                                <span class="nav__link-text">Copy Feature</span>
                                            </a>
                                        </li>
                                        <li class="nav__item" {if $item['hide_item'] == "true"}style="display:none;"{/if}>
                                            <a 
                                                class="nav__link"
                                                data-hide-comparison-feature-item
                                            >
                                                <span class="nav__link-icon ls ls-denial"></span>
                                                <span class="nav__link-text">Hide Feature</span>
                                            </a>
                                        </li>   
                                        <li class="nav__item" {if $item['hide_item'] == "false"}style="display:none"{/if}>
                                            <a 
                                                class="nav__link"
                                                data-show-comparison-feature-item
                                            >
                                                <span class="nav__link-icon fa fa-eye"></span>
                                                <span class="nav__link-text">Show Feature</span>
                                            </a>
                                        </li>                                      
                                        <li class="nav__divider"></li>
                                        <li class="nav__item">
                                            <a 
                                                class="nav__link text-danger"
                                                href="#deleteItemModal"
                                                data-toggle="lu-modal"
                                                data-backdrop="static"
                                                data-delete-comparison-feature-item
                                            >
                                                <span class="nav__link-icon ls ls-trash"></span>
                                                <span class="nav__link-text">Delete</span>
                                            </a>
                                        </li> 
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </li>
            {/if}    
        {/foreach}
    {/if}
</ul>


<div 
    class="msg msg--simple msg--info msg--bordered {if $productCount > 1}is-hidden{/if}"
   
    {if isset($groupIndex)}
        data-item-less-list="{$sectionGroupField['name']}" 
        data-group="{$groupIndex}"
    {else}
        data-item-less-list="{$sectionField['name']}"
    {/if} 
        data-section="{$sectionIndex}"
>
    <span class="msg__description">
        To add a list of features, select at least 2 products <br /> that you want to compare with each other
    </span>
</div>

<div 
    class="msg msg--simple msg--bordered {if !empty($items) || $productCount < 2}is-hidden{/if}" 
    {if isset($groupIndex)}
        data-item-empty-list="{$sectionGroupField['name']}" 
        data-group="{$groupIndex}"
    {else}
        data-item-empty-list="{$sectionField['name']}"
    {/if} 
        data-section="{$sectionIndex}"
    >
    <div class="msg__body flex-column">
        <span class="msg__title">No {if isset($groupIndex)}{$sectionGroupField['label']}{else}{$sectionField['label']|lower}{/if} created</span>
        <div class="msg__actions">
            <a 
                href="#{$btnAddAction}" 
                class="btn btn--sm btn--link"
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
            >
                <i class="btn__icon ls ls-plus"></i>
                <span class="btn__text">Add new feature</span>
            </a>
            <a 
                href="#addNewComparisonTableCategoryModal" 
                class="btn btn--sm btn--link"
                data-add-new-item="comparison-category"
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
            >
                <i class="btn__icon ls ls-plus"></i>
                <span class="btn__text">Add new category</span>
            </a>
        </div>
    </div>
</div>