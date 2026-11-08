{*TODO gdzieś tu trzeba dorzyucić $sectionIndex - w debugu masz wszyustko jak cos*}
{*pojedyńczy widok grupowej sekcji*}

<div class="list-group__sortable" data-group-item="{$group['group_index']}" data-group-position="{$group['group_order']}" data-section="{$sectionIndex}" style="order:{$group['group_order']}">
    <div id="list-item-group-{$group['group_index']}" class="list-group__item flex-column panel p-0x">
        <div class="list-group__top top" id="group-collapse-{$group['group_index']}" aria-expanded="false">
            <div class="move-actions">
                <a class="move-actions__btn" type="button" data-group-move-up="{$group['group_order']}" data-index="{$group['group_index']}" data-section="{$sectionIndex}">
                    <i class="btn__icon ls ls-arrow-up" data-toggle="lu-tooltip" data-title="Move Up"></i>
                </a>
                <a class="move-actions__btn" type="button" data-group-move-down="{$group['group_order']}" data-index="{$group['group_index']}" data-section="{$sectionIndex}">
                    <i class="btn__icon ls ls-arrow-down" data-toggle="lu-tooltip" data-title="Move Down"></i>
                </a>
            </div>
            <a 
                href="#" 
                class="top__title" 
                data-group-item-title 
                data-toggle="lu-collapse"
                data-target="#collapse-s{$sectionIndex}-g{$group['group_index']}"
                aria-expanded="false"
                aria-controls="collapse-s{$sectionIndex}-g{$group['group_index']}"
                data-index="{$group['group_index']}"
                data-section="{$sectionIndex}"
            >
                {$group['group_name']}
            </a>
            <div class="top__toolbar">
                <button
                    type="button"
                    class="btn btn--icon btn--link btn--sm collapsed"
                    data-toggle="lu-collapse"
                    data-target="#collapse-s{$sectionIndex}-g{$group['group_index']}"
                    aria-expanded="false"
                    aria-controls="collapse-s{$sectionIndex}-g{$group['group_index']}"
                    data-edit-group-item
                    data-index="{$group['group_index']}"
                >
                    <i class="btn__icon lm lm-edit" data-toggle="lu-tooltip" data-title="Edit" data-lang-edit="Edit" data-lang-cancel="Cancel"></i>
                </button>
                <button
                    type="button"
                    class="btn btn--icon btn--link btn--sm"
                    href="#deleteGroupModal"
                    data-toggle="lu-modal"
                    data-backdrop="static"
                    data-keyboard="false"
                    data-remove-group-item
                    data-index="{$group['group_index']}"
                    data-section="{$sectionIndex}"
                    data-position="{$group['group_order']}"
                >  
                    <i class="btn__icon lm lm-trash" data-toggle="lu-tooltip" data-title="Remove"></i>
                </button>
            </div>
        </div>
        <div class="list-group__bottom collapse {if $collapsed} show {/if}" id="collapse-s{$sectionIndex}-g{$group['group_index']}">
            <div class="list-group__content">
                <fieldset data-group-fieldset class="m-b-2x {if !$grouped}is-hidden{/if}"> 
                    <div class="form-group">
                        <label class="control-label">
                            Group Title
                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='inline_url' target='_blank'>Learn More</a>"}
                            {include 
                                file="adminarea/includes/helpers/popover.tpl" 
                                popoverClasses="notification__popover"
                                popoverBody="inline_description"
                                popoverFooter="{$popoverFooter}"
                            }
                        </label>
                        <input 
                            type="text" 
                            class="form-control"
                            name="sections[{$sectionIndex}][lang][{$sectionField['name']}][groups][{$group['group_index']}][group_name]"
                            value="{$group['group_name']}"
                            data-group-name
                            data-index="{$group['group_index']}"
                            data-section="{$sectionIndex}"
                            placeholder="Enter group name..."
                        >
                    </div>
                </fieldset>
                {foreach $sectionField['fields'] as $sectionGroupInput}
                    {include file="adminarea/pages/custom/sections/inputs/{$sectionGroupInput['type']}.tpl"
                        groupIndex=$group['group_index']
                        sectionGroupInputValue=$group['fields'][$sectionGroupInput['name']]
                        sectionGroupField=$sectionGroupInput
                    }
                {/foreach}
            </div>
            <input type="hidden"
                   class="group_order_{$group['group_index']}"
                   name="sections[{$sectionIndex}][lang][{$sectionField['name']}][groups][{$group['group_index']}][group_order]"
                   value="{$group['group_order']}"
                   data-group-order
            >
            <input type="hidden"
                   name="sections[{$sectionIndex}][lang][{$sectionField['name']}][groups][{$group['group_index']}][group_index]"
                   value="{$group['group_index']}"
                   data-group-index
            >
        </div>
    </div>
</div>
