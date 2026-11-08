{assign var=sectionLang value=$pageSection['lang'][$language]['translation']}
{foreach $pageSection['type']['fields'] as $sectionKey => $sectionField}
    {$sectionCurrentName = false}
    {if $sectionField['name'] == "caption"}
        {$sectionCurrentName = $sectionLang[$sectionField['name']]}
        {if $sectionCurrentName != ""}
            {break}
        {/if}
    {/if}
    {if (!$sectionCurrentName || $sectionCurrentName == "") &&  $sectionField['name'] == "title"}
        {$sectionCurrentName = $sectionLang[$sectionField['name']]}
        {if $sectionCurrentName != ""}
            {break}
        {/if}
    {/if}
    {if (!$sectionCurrentName || $sectionCurrentName == "") &&  $sectionField['name'] == "predefined_section"}
        {$sectionCurrentId = $sectionLang[$sectionField['name']]}
        {foreach $sections as $section}
            {if $sectionCurrentId == $section->id}
                {$sectionCurrentName = $section->name}
            {/if}   
        {/foreach}
        {break}
    {/if}
{/foreach}
<section 
    data-section 
    data-section-index="{$sectionIndex}" 
    data-section-position="{$pageSection['order']}" 
    style="order: {$pageSection['order']}"
>
    {if $sectionPost}
        {var_dump($sectionPost)}
    {/if}
    <a 
        class="btn btn--sm btn--link btn--block btn--add-section" 
        href="#" 
        data-toggle="lu-modal" 
        data-target="#modalAddNewSection"
        data-section-add
        {if isset($sType)}data-section-type="{$sType}"{elseif isset($pageSection['stype'])}data-section-type="{$pageSection['stype']}"{/if}
        data-order="{$pageSection['order']}" 
        data-index="{if is_array($customPage->sections) || is_object($customPage->sections)}{if $counterStart}{sizeof($customPage->sections) + $counterStart}{else}{sizeof($customPage->sections)}{/if}{/if}"
        data-language="{$language}"
    >
        <div class="text-bg">
            <i class="btn__icon ls ls-plus"></i>
            <span class="btn__text m-l-0x">Add New Section</span>
        </div>
        <div class="dashed-line"></div>
    </a>
    
    <div class="widget panel {*has-drag-icon*} of-visible m-b-0x">
        <div class="widget__top top top--collapsible">
            <div class="top__title collapsed" data-section-top data-toggle="lu-collapse" data-target="#page-section-content-{$sectionIndex}">
                <span class="btn btn--icon btn--circle btn--xs i-c-3x">
                    <i class="btn__icon ls ls-down"></i>
                </span>
                {$pageSection['type']['name']} {if $sectionCurrentName}- <span class="top__title-light">&nbsp;{$sectionCurrentName}</span>{/if}
            </div>
            <div class="top__toolbar">
                <button
                    class="btn btn--sm btn--link btn--icon i-c-4x"
                    type="button"
                    data-duplicate-section
                    data-ajax-url="{$helper->url('CustomPage@addNewSection',['templateName'=>$template->getMainName()])}"
                    data-type="{$pageSection['type']['slug']}"
                    data-stype="{$pageSection['stype']}"
                >
                    <i class="btn__icon ls ls-copy" data-toggle="lu-tooltip" data-title="Duplicate"></i>
                </button>
                <button
                    class="btn btn--sm btn--link btn--icon i-c-4x"
                    type="button"
                    data-toggle="lu-modal"
                    data-target="#modalRemoveSection"
                    data-section-remove
                >
                    <i class="btn__icon ls ls-trash" data-toggle="lu-tooltip" data-title="{$lang.general.remove}"></i>
                </button>
                <label class="switch switch--primary m-r-1x" data-toggle="lu-tooltip" data-title="{$lang.page.page_sections.show_hide}">
                    <input type="hidden" name="sections[{$sectionIndex}][visible]" value="0" />
                    <input class="switch__checkbox" name="sections[{$sectionIndex}][visible]" value="1" type="checkbox" {if $pageSection['visibility']}checked="checked"{/if}>
                    <span class="switch__container"><span class="switch__handle"></span></span>
                </label>
                <div class="has-dropdown dropdown__section-style" data-toggle="lu-tooltip" {if $pageSection['type']['slug'] == 'banner-promotion-manager'}data-title="{$lang.page.page_sections.managed_pm}" style="cursor: not-allowed;"{else}data-title="{$lang.page.page_sections.section_style}"{/if}>
                    <a class="btn btn--sm btn--link btn--icon" href="" data-toggle="lu-dropdown" data-placement="bottom right" data-section-style-button {if $pageSection['type']['slug'] == 'banner-promotion-manager'}disabled{/if}>
                        <span class="btn__icon bg-{$pageSection['theme']}" data-arrow-target data-section-style-icon></span>
                    </a>
                    <div class="dropdown dropdown--style-change" data-dropdown-menu>
                        <div class="dropdown__arrow" data-arrow></div>
                        <div class="dropdown__menu">
                            <ul class="nav">
                                <li class="nav__item {if $pageSection['theme'] == 'default'} is-active {/if}">
                                    <a class="nav__link" href="#" data-section-style="default" data-section-index="{$sectionIndex}">
                                        <span class="section-style__elipse bg-default"></span>
                                        <span class="nav__link-text">Default</span>
                                    </a>
                                </li>
                                <li class="nav__item {if $pageSection['theme'] == 'gray'} is-active {/if}">
                                    <a class="nav__link" href="#" data-section-style="gray" data-section-index="{$sectionIndex}">
                                        <span class="section-style__elipse bg-gray"></span>
                                        <span class="nav__link-text">Gray</span>
                                    </a>
                                </li>
                                <li class="nav__item {if $pageSection['theme'] == 'primary'} is-active {/if}">
                                    <a class="nav__link" href="#" data-section-style="primary" data-section-index="{$sectionIndex}">
                                        <span class="section-style__elipse bg-primary"></span>
                                        <span class="nav__link-text">Primary</span>
                                    </a>
                                </li>
                                <li class="nav__item {if $pageSection['theme'] == 'secondary'} is-active {/if}">
                                    <a class="nav__link" href="#" data-section-style="secondary" data-section-index="{$sectionIndex}">
                                        <span class="section-style__elipse bg-secondary"></span>
                                        <span class="nav__link-text">Secondary</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="move-actions d-flex m-l-1x">
                    <a type="button" class="move-actions__btn" data-move-up="{$pageSection['order']}" data-index="{$sectionIndex}">
                        <i class="ls ls-arrow-up" data-toggle="lu-tooltip" data-title="Move Up"></i>
                    </a>
                    <a type="button" class="move-actions__btn" data-move-down="{$pageSection['order']}" data-index="{$sectionIndex}">
                        <i class="ls ls-arrow-down" data-toggle="lu-tooltip" data-title="Move Down"></i>
                    </a>
                </div>
            </div>
        </div>
        <div class="widget__body collapse" data-section-body id="page-section-content-{$sectionIndex}">
            <div class="widget__content">              
                {assign var=hasSubSection value=false}
                {foreach $pageSection['type']['fields'] as $sectionKey => $sectionField}
                    {if $sectionField['type'] == "subsection"}
                        {assign var=hasSubSection value=true}
                    {/if}
                    {assign var=sectionFieldValue value=$sectionLang[$sectionField['name']]}
                    {include file="adminarea/pages/custom/sections/inputs/{$sectionField['type']}.tpl" sectionKey=$sectionKey sectionIndex=$sectionIndex}
                    {if $sectionField@last && $hasSubSection}
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/if}     
                {/foreach}
            </div>
            <input type="hidden" class="page_section_{$sectionIndex}_theme" name="sections[{$sectionIndex}][theme]" value="{$pageSection['theme']}" data-section-theme>
            <input type="hidden" class="page_section_{$sectionIndex}_order" name="sections[{$sectionIndex}][order]" value="{$pageSection['order']}" data-section-order>
            {if isset($pageSection['id'])}
                <input type="hidden" class="page_section_{$sectionIndex}_id" name="sections[{$sectionIndex}][id]" value="{$pageSection['id']}">
            {/if}
            {if isset($pageSection['lang'][$language]['id'])}
                <input type="hidden" class="page_section_{$sectionIndex}_lang_id" name="sections[{$sectionIndex}][langId]" value="{$pageSection['lang'][$language]['id']}">
            {/if}
            <input type="hidden" class="page_section_{$sectionIndex}_type" name="sections[{$sectionIndex}][type]" value="{$pageSection['type']['slug']}">
            <input type="hidden" class="page_Section_{$sectionIndex}_stype" name="sections[{$sectionIndex}][stype]" value="{$pageSection['stype']}">
        </div>
    </div>
</section>