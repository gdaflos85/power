<div class="widget panel {*has-drag-icon*} of-visible m-b-0x">
    <div class="widget__body">
        <div class="widget__content" data-section-fields>
            {assign var=sectionLang value=$section['lang'][$language]['translation']}
            {assign var=hasSubSection value=false}
            <input name="language" value="{$language}" type="hidden"> 
            {foreach $section['type']['fields'] as $sectionKey => $sectionField}
                {if $sectionField['type'] == "subsection"}
                    {assign var=hasSubSection value=true}
                {/if}
                {assign var=sectionFieldValue value=$sectionLang[$sectionField['name']]}
                {include file="adminarea/pages/custom/sections/inputs/{$sectionField['type']}.tpl"
                    sectionIndex=0
                    sectionField=$sectionField
                    sectionFieldValue=$sectionFieldValue
                    sectionIndex=$sectionIndex
                }
                {if $sectionField@last && $hasSubSection}
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}     
            {/foreach}
        </div>
    </div>
</div>