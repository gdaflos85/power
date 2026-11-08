{if isset($sectionGroupField)}
    {if isset($sectionGroupInputValue) && is_countable($sectionGroupInputValue)}
        {assign var=newGroupItemPosition value=sizeof($sectionGroupInputValue) + 1} {*get the list size and add 1 to get the next position of the item*}
    {else}
        {assign var=newGroupItemPosition value=1}
    {/if}   
    {if isset($sectionGroupField['icons'])}
        {assign var=showModalIconsTabs value=$sectionGroupField['icons']}
    {/if}
    {$isComparison = false}

    {if isset($sectionField['fields']) && is_array($sectionField['fields'])}    
        {foreach $sectionField['fields'] as $field}
            {if $field.type == "comparison-table"}  
                {$isComparison = "comparison_table"}
                {break}
            {/if}
        {/foreach}
    {/if}
    <div class="form-group">
        <label class="form-label">
            {$sectionGroupField['label']}
            <a href="#addNewProductItemModal" class="btn btn--link btn--success m-l-a p-r-0x {if !isset($sectionGroupInputValue) || empty($sectionGroupInputValue)}is-hidden{/if}"
               data-add-new-item="product"
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
                    Add New
                </span>
            </a>
        </label>
        {include file='adminarea/pages/includes/sortable-list.tpl'
            items=$sectionGroupInputValue
            btnAddAction='addNewProductItemModal'
            btnEditAction='editProductItemModal'
            listType='product'
            groupIndex=$groupIndex
            comparison=$isComparison
        }
        <input type="hidden" data-section="{$sectionIndex}" data-list="{$sectionGroupField['name']}" data-group="{$groupIndex}"
               name="sections[{$sectionIndex}][lang][{$sectionField['name']}][groups][{$groupIndex}][fields][{$sectionGroupField['name']}]" value="">
    </div>
{else}
    {if isset($sectionFieldValue) && is_countable($sectionFieldValue)}
        {assign var=newPosition value=sizeof($sectionFieldValue) + 1} {*get the list size and add 1 to get the next position of the item*}
    {else}
        {assign var=newPosition value=1}
    {/if}  
    {if isset($sectionField['icons'])} 
        {assign var=showModalIconsTabs value=$sectionField['icons']}
    {/if}
    <div class="section__field col-12">
        <div class="form-group">
            <label class="form-label">
                {$sectionField['label']}
                <a href="#addNewProductItemModal" class="btn btn--link btn--sm m-l-a p-r-0x {if !isset($sectionFieldValue) || empty($sectionFieldValue)}is-hidden{/if}"
                   data-add-new-item="product"
                   data-list-name="{$sectionField['name']}"
                   data-new-index=""
                   data-new-position="{$newPosition}"
                   data-section="{$sectionIndex}"
                   data-toggle="lu-modal"
                   data-backdrop="static"
                   data-keyboard="false"
                   {if isset($sectionField['icons'])} data-show-modal-icon='{if !$showModalIconsTabs}false{else}true{/if}'{/if}>
                    <i class="btn__icon ls ls-plus"></i>
                    <span class="btn__text">
                    Add New
                </span>
                </a>
            </label>
            {include file='adminarea/pages/includes/sortable-list.tpl'
            items=$sectionFieldValue
            btnAddAction='addNewProductItemModal'
            btnEditAction='editProductItemModal'
            listType='product'
            }
            <input type="hidden" data-section="{$sectionIndex}" data-list="{$sectionField['name']}"
                   name="sections[{$sectionIndex}][lang][{$sectionField['name']}]" value="">
        </div>
    </div>
{/if}


