{if isset($sectionGroupField)}
    <div class="form-group">
        <label class="form-label">
            {$sectionGroupField['label']}
            {if $sectionGroupField['tooltip']}
                {if isset($sectionGroupField['tooltip_url']) && $sectionGroupField['tooltip_url'] != ""}
                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$sectionGroupField['tooltip_url']}' target='_blank'>Learn More</a>"}
                {else}
                    {assign var="popoverFooter" value=false}
                {/if}
                {include 
                    file="adminarea/includes/helpers/popover.tpl" 
                    popoverClasses="notification__popover"
                    popoverBody="{$sectionGroupField['tooltip']}"
                    popoverFooter="{$popoverFooter}"
                }
            {/if}
        </label>
        <textarea 
            class="form-control" 
            data-html-editor name="sections[{$sectionIndex}][lang][{$sectionField['name']}][groups][{$groupIndex}][fields][{$sectionGroupField['name']}]"
        >{if $sectionGroupInputValue}{$sectionGroupInputValue}{/if}</textarea>
    </div>
{else}
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
            </label>
            <textarea 
                class="form-control" 
                data-html-editor 
                name="sections[{$sectionIndex}][lang][{$sectionField['name']}]"
            >{if $sectionFieldValue}{$sectionFieldValue}{/if}</textarea>
        </div>
    </div>
{/if}