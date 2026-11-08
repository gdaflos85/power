{if isset($sectionGroupField)}
    <div class="form-group">
        <label class="form-label">{$sectionGroupField['label']}</label>
        <select class="form-control" name="sections[{$sectionIndex}][lang][{$sectionField['name']}][groups][{$groupIndex}][fields][{$sectionGroupField['name']}]">
            {foreach $sections as $section}
                <option value="{$section->id}" {if $sectionGroupInputValue == $section->id} selected {/if}>{$section->name}</option>
            {/foreach}
        </select>
    </div>
{else}
    <div class="section__field col-12">
        <div class="form-group">
            <label class="form-label">{$sectionField['label']}</label>
            <select class="form-control" name="sections[{$sectionIndex}][lang][{$sectionField['name']}]">
                {foreach $sections as $section}
                    <option value="{$section->id}" {if $sectionFieldValue == $section->id} selected {/if}>{$section->name}</option>
                {/foreach}
            </select>
        </div>
    </div>
{/if}

