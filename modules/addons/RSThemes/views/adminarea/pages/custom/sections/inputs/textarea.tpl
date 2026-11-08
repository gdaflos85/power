{if isset($sectionGroupField)}
    <div class="form-group">
        <label class="form-label">{$sectionGroupField['label']}</label>
        <textarea class="form-control" name="sections[{$sectionIndex}][lang][{$sectionField['name']}][groups][{$groupIndex}][fields][{$sectionGroupField['name']}]">
            {$sectionGroupInputValue}
        </textarea>
    </div>
{else}
    <div class="section__field col-12">
        <div class="form-group">
            <label class="form-label">{$sectionField['label']}</label>
            <textarea 
                class="form-control" 
                name="sections[{$sectionIndex}][lang][{$sectionField['name']}]"
                {if $sectionField['placeholder']}placeholder="{$sectionField['placeholder']}"{/if}
            >{$sectionFieldValue}</textarea>
        </div>
    </div>
{/if}


