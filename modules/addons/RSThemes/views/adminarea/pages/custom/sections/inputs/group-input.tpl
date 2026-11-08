{if isset($sectionFieldValue['grouped'])}
    {assign var=grouped value=$sectionFieldValue['grouped']}
{else}
    {assign var=grouped value=$sectionField['grouped']}
{/if}
{if isset($sectionField['group_forced'])}
    {assign var=groupForced value=$sectionField['group_forced']}
{else}
    {assign var=groupForced value=$sectionFieldValue['group_forced']}
{/if}

<div class="section__field col-12">
    <input type="hidden" name="sections[{$sectionIndex}][lang][{$sectionField['name']}][group_forced]"
           value="{if $groupForced}1{else}0{/if}">
    {if !$groupForced}
        <div class="form-group">
            <label class="form-label is-pointer m-b-0x">
                <span class="form-text d-flex align-items-center">
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
                </span>
                <div class="switch switch--success m-l-0x">
                    <input type="hidden" name="sections[{$sectionIndex}][lang][{$sectionField['name']}][grouped]" value="0" />
                    <input
                        class="switch__checkbox"
                        data-group-items
                        data-section="{$sectionIndex}"
                        name="sections[{$sectionIndex}][lang][{$sectionField['name']}][grouped]"
                        value="1"
                        type="checkbox"
                        {if $grouped} checked {/if}
                        data-switch-group-content
                    > {* value which is used to setup init style of group input*}
                    <span class="switch__container">
                        <span class="switch__handle"></span>
                    </span>
                </div>
            </label>
        </div>
    {else}
        <input type="hidden" name="sections[{$sectionIndex}][lang][{$sectionField['name']}][grouped]" value="1">
    {/if}
    
    <div class="form-group {if !$grouped}is-hidden{/if}" data-group-header data-section="{$sectionIndex}">
        <span class="form-label">{$sectionField['name']|ucfirst|replace:"_":" "}
            <button type="button"
                class="btn btn--link btn--sm btn--success m-l-a p-r-0x"
                data-add-new-group
                data-ajax-url="{$helper->url('CustomPage@newGroup',['templateName' => $template->getMainName()])}"
                data-group-name="{$sectionField['name']}"
                data-new-index="{if isset($sectionFieldValue['new_group_index'])}{$sectionFieldValue['new_group_index']}{else}2{/if}"
                data-new-order="{if isset($sectionFieldValue['groups']) && sizeof($sectionFieldValue['groups']) > 0}{sizeof($sectionFieldValue['groups']) + 1}{else}2{/if}"
                data-section="{$sectionIndex}"
                data-grouped-section-name="{$sectionField['group_section']}"
            >
                <i class="btn__icon ls ls-plus"></i>
                <span class="btn__text">
                    Add Group
                </span>
            </button>
        </span>
    </div>
    <div class="sortable-list list-group d-flex list-group--section {if !$grouped}list-group--ungrouped{/if} list-group--simple list-group--p-h-0x list-group--collapse m-b-0x" data-group-list data-section="{$sectionIndex}">
        {if isset($sectionFieldValue['groups'])}
            {foreach $sectionFieldValue['groups'] as $group}
                {include file="adminarea/pages/includes/section-group.tpl" group=$group}
            {/foreach}
        {else} {*empty new grouped section*}
            {include file="adminarea/pages/includes/section-group.tpl"
                collapsed=true
                group=[
                    'group_index' => 1,
                    'group_name' => '',
                    'group_order' => 1
                ]}
        {/if}
    </div>
</div>



