{if isset($sectionGroupField)}
    {if isset($sectionGroupInputValue) && is_countable($sectionGroupInputValue)}
        {assign var=newGroupItemPosition value=sizeof($sectionGroupInputValue) + 1} {*get the list size and add 1 to get the next position of the item*}
    {else}
        {assign var=newGroupItemPosition value=1}
    {/if}   
    {if isset($sectionGroupField['icons'])}
        {assign var=showModalIconsTabs value=$sectionGroupField['icons']}
    {/if}

    <label class="form-label">
        {$sectionGroupField['label']}
        <a href="#addNewComparisonTableCategoryModal" class="btn btn--link btn--success m-l-a p-r-0x {if !isset($sectionGroupInputValue) || empty($sectionGroupInputValue)}is-hidden{/if}"
            data-add-new-item="comparison-category"
            data-list-name="{$sectionGroupField['name']}"
            data-new-index=""
            data-new-position="{$newGroupItemPosition}"
            data-section="{$sectionIndex}"
            data-group="{$groupIndex}"
            data-toggle="lu-modal"
            data-backdrop="static"
            data-keyboard="false"
            {if isset($sectionGroupField['icons'])} data-show-modal-icon='{if !$showModalIconsTabs}false{else}true{/if}'{/if}>
            <i class="btn__icon ls ls-plus"></i>
            <span class="btn__text">
                Add Category
            </span>
        </a>
        <a href="#addNewComparisonTableItemModal" class="btn btn--link btn--success p-r-0x {if !isset($sectionGroupInputValue) || empty($sectionGroupInputValue)}is-hidden{/if}"
            data-add-new-item="comparison-item"
            data-list-name="{$sectionGroupField['name']}"
            data-new-index=""
            data-new-position="{$newGroupItemPosition}"
            data-section="{$sectionIndex}"
            data-group="{$groupIndex}"
            data-toggle="lu-modal"
            data-backdrop="static"
            data-keyboard="false"
            {if isset($sectionGroupField['icons'])} data-show-modal-icon='{if !$showModalIconsTabs}false{else}true{/if}'{/if}>
            <i class="btn__icon ls ls-plus"></i>
            <span class="btn__text">
                Add Feature
            </span>
        </a>
    </label>
    {include file='adminarea/pages/includes/comparison-list.tpl'
        items=$sectionGroupInputValue
        btnAddAction='addNewComparisonTableItemModal'
        btnEditAction='editComparisonTableItemModal'
        groupIndex=$groupIndex
        listType="comparison-item"
    }
    <input 
        type="hidden" 
        data-section="{$sectionIndex}" 
        data-list="{$sectionGroupField['name']}" 
        data-group="{$groupIndex}"
        name="sections[{$sectionIndex}][lang][{$sectionField['name']}][groups][{$groupIndex}][fields][{$sectionGroupField['name']}]" 
        {if isset($sectionGroupField['icons'])}
            data-show-modal-icon="{if !$showModalIconsTabs}false{else}true{/if}"
        {/if}
        {if isset($sectionGroupField['link'])} 
            data-show-modal-link="{if !$sectionGroupField['link']}false{else}true{/if}"
        {/if}
        {if isset($sidebarType) && $sidebarType}data-list-sidebar-type{/if}
        value=""
    >
    
{else}
    
{/if}