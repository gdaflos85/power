{if isset($sectionGroupField)}
    <div class="form-group {$sectionField['container_class']}" {foreach $sectionField['container_attributes'] as $attribute} data-{$attribute['name']}="{$attribute['value']}" {/foreach}>
        <label class="form-label is-pointer m-w-360 m-b-0x m-t-2x">
            <span class="form-text">{$sectionGroupField['label']}</span>
            <div class="switch switch--success">
                <input type="hidden" name="sections[{$sectionIndex}][lang][{$sectionField['name']}][groups][{$groupIndex}][fields][{$sectionGroupField['name']}]" value="0" />
                <input class="switch__checkbox" {foreach $sectionField['attributes'] as $attribute} data-{$attribute['name']}="{$attribute['value']}" {/foreach}
                       name="sections[{$sectionIndex}][lang][{$sectionField['name']}][groups][{$groupIndex}][fields][{$sectionGroupField['name']}]"
                       value="1" type="checkbox"{if $sectionGroupInputValue} checked {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div>
{else}
    <div class="section__field col-12 {$sectionField['container_class']}" {foreach $sectionField['container_attributes'] as $attribute} data-{$attribute['name']}="{$attribute['value']}" {/foreach}>
        <div class="form-group">
            <label class="form-label is-pointer m-b-0x" {foreach $sectionField['label_attributes'] as $attribute} data-{$attribute['name']}="{$attribute['value']}" {/foreach}>
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
                    <input type="hidden" name="sections[{$sectionIndex}][lang][{$sectionField['name']}]" value="0" />
                    <input class="switch__checkbox" {foreach $sectionField['attributes'] as $attribute} data-{$attribute['name']}="{if is_array($attribute['value'])}{foreach $attribute['value'] as $attrValue}{$attrValue}{if !$attrValue@last},{/if}{/foreach}{else}{$attribute['value']}{/if}" {/foreach} name="sections[{$sectionIndex}][lang][{$sectionField['name']}]" value="1" type="checkbox" {if $sectionFieldValue} checked {/if}>
                    <span class="switch__container">
                        <span class="switch__handle"></span>
                    </span>
                </div>
            </label>
        </div>
    </div>
{/if}