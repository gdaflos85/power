<div 
    class="modal modal--lg modal--media" 
    id="modalAddNewSection" 
    {if $type=="pageSection"}data-modal-section-add{/if}
>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <h4 class="top__title h6">
                    {$lang.page.page_sections.modal.add_section.title} 
                    {include file="adminarea/includes/helpers/docs.tpl" link=$cms_docs->modal['section']['add']}
                </h4>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link cancel__item" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <form 
                id="addNewSectionForm" 
                {if $type == "pageSection"}
                    data-ajax-url="{$helper->url('CustomPage@addNewSection',['templateName'=>$template->getMainName()])}" 
                    data-modal-section-add-form
                {/if}
                {if $type == "predefined"}
                    action="{$helper->url('Section@create',['templateName' => $template->getMainName()])}" method="POST"
                {/if}
            >
                <div class="modal__body">
                    {if $type=="pageSection"}
                        <ul class="nav nav--h nav--tabs m-b-2x" data-modal-section-add-tabs>
                            <li class="nav__item is-active">
                                <a class="nav__link" data-toggle="lu-tab" href="#new-section-create" data-radio-tab>
                                    <input class="is-hidden" type="radio" name="newSection[type]" value="new" checked>
                                    <span>{$lang.page.page_sections.modal.add_section.create_new}</span>
                                </a>
                            </li>
                            <li class="nav__item  {if $sections->isEmpty()}is-disabled{/if}">
                                <a class="nav__link" data-toggle="lu-tab" href="#new-section-predefined" data-radio-tab>
                                    <input class="is-hidden" type="radio" name="newSection[type]" value="predefined">
                                    <span>{$lang.page.page_sections.modal.add_section.choose_predefined}</span>
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane is-active" id="new-section-create">
                                <div data-media-container>
                                    <div class="media__search input-group">
                                        <i class="input-group__addon lm lm-search"></i>
                                        <input type="text" class="form-control" placeholder="Search" data-media-search="">
                                    </div>
                                    <div class="media">
                                        <div class="media__list has-scroll" data-media-list>
                                            {foreach $sectionTypes as $sectionType}
                                                {if $sectionType['default_type']}
                                                    {$sectionComingSoon = false}
                                                    {$sectionThumb = false}
                                                    {$sectionChecked = false}
                                                    {$sectionRequiredExtenstion = false}
                                                    {if $sectionType@first}
                                                        {$sectionChecked = true}
                                                    {/if}
                                                    {if isset($sectionType['comingsoon'])}
                                                        {$sectionComingSoon = true}
                                                    {/if}
                                                    {if isset($sectionType['thumb'])}
                                                        {$sectionThumb = $sectionType['thumb']}
                                                    {/if}
                                                    {if isset($sectionType['required_extension'])}
                                                        {$sectionRequiredExtenstion = $sectionType['required_extension']}
                                                    {/if}
                                                    {include 
                                                        file="adminarea/pages/includes/modal/section/media-item.tpl"
                                                        name=$sectionType['name']
                                                        slug=$sectionType['slug']
                                                        inputName="newSection[new]"
                                                        value=$sectionType['slug']
                                                        comingsoon=$sectionComingSoon
                                                        thumb=$sectionThumb
                                                        checked=$sectionChecked
                                                        requiredExtenstion=$sectionRequiredExtenstion
                                                    }
                                                {/if}
                                            {/foreach}
                                            {include file="adminarea/includes/media/no-data.tpl"}
                                        </div>
                                    </div>
                                </div> 
                            </div>
                            <div class="tab-pane" id="new-section-predefined">
                                {if $sections->isNotEmpty()}
                                    <div data-media-container>
                                        <div class="media__search input-group">
                                            <i class="input-group__addon lm lm-search"></i>
                                            <input type="text" class="form-control" placeholder="Search" data-media-search="">
                                        </div>
                                        <div class="media">
                                            <div class="media__list has-scroll" data-media-list>
                                                {foreach $sections as $section}
                                                    {$sectionThumb = false} 
                                                    {if isset($section->type['thumb'])}
                                                        {$sectionThumb = $section->type['thumb']}
                                                    {/if}  
                                                    {include 
                                                        file="adminarea/pages/includes/modal/section/media-item.tpl"
                                                        type="predefined"
                                                        originalName=$section->type['name']
                                                        name=$section->name
                                                        slug=$section->type['slug']
                                                        inputName="newSection[predefined]"
                                                        value=$section->id
                                                        thumb=$sectionThumb
                                                    }
                                                {/foreach}
                                                {include file="adminarea/includes/media/no-data.tpl"}
                                            </div>
                                        </div>
                                    </div> 
                                {/if}     
                            </div>
                        </div>  
                       
                        <input id="section_language" type="hidden" name="language" value="{$language}">
                        <input id="section_order" type="hidden" name="order" value="" data-modal-section-add-order> {*order where section must be placed*}
                        <input id="section_index" type="hidden" name="index" value="" data-modal-section-add-index> {*generates static index for each section +1 every new section*}
                        <input id="section_type" type="hidden" name="stype" value="" data-modal-section-add-type>  {* section type value*}
                    {/if} 

                    {if $type == "predefined"}
                        <div data-media-container>
                            <div class="media__search input-group">
                                <i class="input-group__addon lm lm-search"></i>
                                <input type="text" class="form-control" placeholder="Search" data-media-search="">
                            </div>
                            <div class="media">
                                <div class="media__list has-scroll" data-media-list>
                                    {foreach $sectionTypes as $sectionType}
                                        {if $sectionType['default_type']}
                                            {$sectionComingSoon = false}
                                            {$sectionThumb = false}
                                            {$sectionChecked = false}                                            
                                            {if $sectionType@first}
                                                {$sectionChecked = true}
                                            {/if}
                                            {if isset($sectionType['comingsoon'])}
                                                {$sectionComingSoon = true}
                                            {/if}
                                            {if isset($sectionType['thumb'])}
                                                {$sectionThumb = $sectionType['thumb']}
                                            {/if}
                                            {include 
                                                file="adminarea/pages/includes/modal/section/media-item.tpl"
                                                type="default"
                                                name=$sectionType['name']
                                                slug=$sectionType['slug']
                                                value=$sectionType['slug']
                                                comingsoon=$sectionComingSoon
                                                thumb=$sectionThumb
                                                inputName="type"
                                                checked=$sectionChecked
                                            }
                                        {/if}
                                    {/foreach}
                                    {include file="adminarea/includes/media/no-data.tpl"}
                                </div>
                            </div>
                        </div> 
                    {/if} 
                </div>
                <div class="modal__actions">
                    <button 
                        class="btn btn--primary" 
                        type="submit" 
                        form="addNewSectionForm" 
                        {if $type=="pageSection"}
                            data-modal-section-add-submit
                        {/if}
                    >
                        <span class="btn__text">{$lang.page.page_sections.modal.add_section.title}</span>
                        <span class="btn__preloader preloader"></span>
                    </button>
                    <a class="btn btn--default btn--outline cancel__item" data-dismiss="lu-modal">
                        <span class="btn__text">{$lang.general.cancel}</span>
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>