{if isset($sectionGroupField)}
    {if isset($sectionGroupInputValue) && is_countable($sectionGroupInputValue)}
        {assign var=newGroupItemPosition value=sizeof($sectionGroupInputValue) + 1} {*get the list size and add 1 to get the next position of the item*}
    {else}
        {assign var=newGroupItemPosition value=1}
    {/if}   

    {if isset($sectionGroupField['icons'])}
        {assign var=showModalIconsTabs value=$sectionGroupField['icons']}
    {/if}
    <div class="form-group">
        <label class="form-label">
            {$sectionGroupField['label']}
            <a href="#addNewButtonItemModal" class="btn btn--link btn--success m-l-a p-r-0x {if !isset($sectionGroupInputValue) || empty($sectionGroupInputValue)}is-hidden{/if}"
               data-add-new-item="button"
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
            btnAddAction='addNewButtonItemModal'
            btnEditAction='editButtonItemModal'
            listType='button'
            groupIndex=$groupIndex
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
                {if $sectionField['tooltip']}
                    {if isset($sectionField['tooltip_url']) && $sectionField['tooltip_url'] != ""}
                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$sectionField['tooltip_url']}' target='_blank'>Learn More</a>"}
                    {else}
                        {assign var="popoverFooter" value=false}
                    {/if}
                    {include 
                        file="adminarea/includes/helpers/popover.tpl" 
                        popoverClasses="notification__popover"
                        popoverBody="{$sectionField['tooltip']}"
                        popoverFooter="{$popoverFooter}"
                    }
                {/if}
                <a href="#addNewButtonItemModal" class="btn btn--link btn--sm m-l-a p-r-0x {if !isset($sectionFieldValue) || empty($sectionFieldValue)}is-hidden{/if}"
                   data-add-new-item="button"
                   data-list-name="{$sectionField['name']}"
                   data-new-index=""
                   data-new-position="{$newPosition}"
                   data-section="{$sectionIndex}"
                   data-toggle="lu-modal"
                   data-backdrop="static"
                   data-keyboard="false"
                   {if isset($sectionField['icons'])} data-show-modal-icon='{if !$showModalIconsTabs}false{else}true{/if}'{/if} >
                    <i class="btn__icon ls ls-plus"></i>
                    <span class="btn__text">
                    Add New
                </span>
                </a>
            </label>

            {include file='adminarea/pages/includes/sortable-list.tpl'
            items=$sectionFieldValue
            btnAddAction='addNewButtonItemModal'
            btnEditAction='editButtonItemModal'
            listType='button'
            }

            <input type="hidden" data-section="{$sectionIndex}" data-list="{$sectionField['name']}"
                   name="sections[{$sectionIndex}][lang][{$sectionField['name']}]" value="">
        </div>
    </div>
{/if}

