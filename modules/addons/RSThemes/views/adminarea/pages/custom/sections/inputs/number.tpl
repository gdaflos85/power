{if isset($sectionGroupField)}
    <div class="form-group {$sectionGroupField['container_class']}" {foreach $sectionGroupField['container_attributes'] as $attribute} data-{$attribute['name']}="{$attribute['value']}" {/foreach}>
        <label class="form-label">{$sectionGroupField['label']}</label>
        <input 
            class="form-control" 
            type="number" 
            name="sections[{$sectionIndex}][lang][{$sectionField['name']}][groups][{$groupIndex}][fields][{$sectionGroupField['name']}]"
            value="{if (empty($sectionGroupInputValue)) && $sectionGroupField['range']['start']}{$sectionGroupField['range']['start']}{else}{$sectionGroupInputValue}{/if}" 
            {if $sectionGroupField['range']['min']}min="{$sectionGroupField['range']['min']}"{/if} 
            {if $sectionGroupField['range']['max']}min="{$sectionGroupField['range']['max']}"{/if}
            {foreach $sectionGroupField['attributes'] as $attribute} data-{$attribute['name']}="{$attribute['value']}" {/foreach}
        >
    </div>
{else}

    {if $sectionField['container_collapse_target']}
        {if $pageSection}
            {assign var=sectionLang value=$pageSection['lang'][$language]['translation']}
        {elseif $section}   
            {assign var=pageSection value=$section}
            {assign var=sectionLang value=$section['lang'][$language]['translation']}
        {/if}

        {foreach $pageSection['type']['fields'] as $fields}
            {if $fields['name'] == $sectionField['container_collapse_target']}   
                {assign var="collapseTargetValue" value=$sectionLang[$fields['name']]}
            {/if}
        {/foreach}
    {/if}


    <div 
        {if $sectionField['container_id']}
            id="{$sectionField['container_id']}"
        {/if} 
        class="section__field col-12 {$sectionField['container_class']} {if $sectionField['container_collapse']}collapse {if $collapseTargetValue}show{/if}{/if}" 
        {foreach $sectionField['container_attributes'] as $attribute} 
            data-{$attribute['name']}="{$attribute['value']}" 
        {/foreach}
    >
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
                type="number" 
                name="sections[{$sectionIndex}][lang][{$sectionField['name']}]" 
                value="{if (empty($sectionFieldValue)) && $sectionField['range']['start']}{$sectionField['range']['start']}{else}{$sectionFieldValue}{/if}" 
                {if $sectionField['range']['min']}min="{$sectionField['range']['min']}"{/if} 
                {if $sectionField['range']['max']}max="{$sectionField['range']['max']}"{/if}
                {foreach $sectionField['label_attributes'] as $attribute} data-{$attribute['name']}="{$attribute['value']}" {/foreach}
            >
        </div>
    </div>
{/if}




