{if isset($sectionGroupField)}
    <input
        type="hidden"
        name="sections[{$sectionIndex}][lang][{$sectionField['name']}][groups][{$groupIndex}][fields][{$sectionGroupField['name']}]"
        value="{$sectionGroupInputValue}"
        {foreach $sectionGroupField['attributes'] as $attribute} data-{$attribute['name']}="{$attribute['value']}" {/foreach}
    >
{else}
    <input 
        type="hidden" 
        name="sections[{$sectionIndex}][lang][{$sectionField['name']}]" 
        value="{if $sectionFieldValue}{$sectionFieldValue}{elseif $sectionField['default']}{$sectionField['default']}{/if}"
    >
{/if}