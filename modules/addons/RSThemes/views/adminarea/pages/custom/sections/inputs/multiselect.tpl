{if isset($sectionGroupField)}
    {assign var=groupMultiOptions value=explode(',', $sectionGroupInputValue)}
    <div class="form-group {$sectionField['container_class']}" {foreach $sectionField['container_attributes'] as $attribute} data-{$attribute['name']}="{$attribute['value']}" {/foreach}>
        <label class="form-label">{$sectionGroupField['label']}</label>
        <select class="form-control multiselect form-control--basic" name="sections[{$sectionIndex}][lang][{$sectionField['name']}][groups][{$groupIndex}][fields][{$sectionGroupField['name']}][]" multiple {foreach $sectionField['attributes'] as $attribute} data-{$attribute['name']}="{$attribute['value']}" {/foreach}>
            {foreach $sectionGroupField['options'] as $groupOption}
                <option value="{$groupOption}" {if in_array($groupOption, $groupMultiOptions)} selected {/if}>{$groupOption}</option>
            {/foreach}
        </select>
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
    {if $sectionFieldValue|strstr:","}
        {assign var=multiOptions value=explode(',', $sectionFieldValue)}
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
            {if $sectionField['label']}
                <label 
                    class="form-label" 
                    {foreach $sectionField['label_attributes'] as $attribute} data-{$attribute['name']}="{$attribute['value']}" {/foreach}
                >
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
            {/if}
            <select 
                class="form-control multiselect form-control--basic" 
                name="sections[{$sectionIndex}][lang][{$sectionField['name']}][]" 
                multiple 
                {foreach $sectionField['attributes'] as $attribute} 
                    data-{$attribute['name']}="{$attribute['value']}" 
                {/foreach}>
                {foreach $sectionField['options'] as $option}
                    {if is_array($option)}
                        <option value="{$option['value']}" {if (is_array($multiOptions) && in_array($option['value'], $multiOptions))}selected{elseif $sectionFieldValue == $option['value']}selected{elseif isset($option['default']) && $option['default'] && !is_array($multiOptions) && !$sectionFieldValue}selected{/if}>{$option['name']}</option>
                    {else}
                        <option value="{$option}" {if is_array($multiOptions) && in_array($option, $multiOptions)} selected {/if}>{$option}</option>
                    {/if}
                {/foreach}
            </select>
        </div>
    </div>
    {if isset($sectionField['container_break']) && $sectionField['container_break']}
        </div>
        <div class="row m-t-2x">
    {/if}
{/if}

