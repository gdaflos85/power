{if isset($sectionGroupField)}
    <div class="form-group {$sectionGroupField['container_class']}" {foreach $sectionGroupField['container_attributes'] as $attribute} data-{$attribute['name']}="{$attribute['value']}" {/foreach}>
        <label class="form-label">{$sectionGroupField['label']}</label>
        <input class="form-control"
               type="text"
               name="sections[{$sectionIndex}][lang][{$sectionField['name']}][groups][{$groupIndex}][fields][{$sectionGroupField['name']}]"
               value="{$sectionGroupInputValue}"
               {foreach $sectionGroupField['attributes'] as $attribute} data-{$attribute['name']}="{$attribute['value']}" {/foreach}
        >
    </div>
{else}
    <div class="section__field col-12 {$sectionField['container_class']}" {foreach $sectionField['container_attributes'] as $attribute} data-{$attribute['name']}="{$attribute['value']}" {/foreach}>
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
            <input 
                class="form-control" 
                type="text" 
                name="sections[{$sectionIndex}][lang][{$sectionField['name']}]" 
                value="{$sectionFieldValue}"
                {if $sectionField['placeholder']}placeholder="{$sectionField['placeholder']}"{/if}
                {foreach $sectionField['label_attributes'] as $attribute} data-{$attribute['name']}="{$attribute['value']}" {/foreach}
            >
        </div>
    </div>
{/if}




