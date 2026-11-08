{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/cms/breadcrumb.tpl" type="section"}
{/block}

{block name="template-content"}
    <form id="newSectionForm" action="{$helper->url('Section@store',['templateName'=>$template->getMainName()])}" method="POST">
        <div class="block is-loading">
            <div class="block__body">               
                <div class="section">
                    <h3 class="section__title">Section Name</h3>
                    <div class="section__body panel" data-section-name-container>
                        <div class="form-group m-b-0x" data-section-name-form-group>
                            <div class="input-group">
                                <input 
                                    data-section-name 
                                    class="form-control" 
                                    type="text" 
                                    name="name" 
                                    value="" 
                                    data-ajax-url="{$helper->url('Section@checkSectionName',['templateName'=>$template->getMainName()])}" 
                                    required
                                >
                                <div class="input-group__loader is-hidden" data-section-name-loader>
                                    <span class="preloader"></span>
                                </div>
                            </div>
                            <div class="alert alert--outline alert--danger alert--xs m-b-0x m-t-1x is-hidden" data-section-name-alert data-text-taken="This section name is taken, please try different one." data-text-empty="Section name can't be empty"></div>
                        </div>
                    </div>
                </div>

                <div class="section">
                    <h3 class="section__title">Section Content</h3>
                    <div class="section__body">
                        <div class="form-group form-group--language">
                            <label for="sectionLanguage" class="form-label">Choose Language To Edit</label>
                            <input type="hidden" name="language" value="{$language}">
                            <div 
                                {if $cms_tooltips->section['new']['change_language']}
                                    data-toggle="lu-tooltip"
                                    title="{$cms_tooltips->section['new']['change_language']}"
                                {/if}
                            >
                                <button 
                                    type="button" 
                                    class="btn btn btn--default btn--outline btn--block btn--language is-disabled"                                    
                                >
                                    <span class="btn__text" data-value="{$language}">{ucfirst($language)}</span>
                                    <span class="btn__icon btn__icon-arrow ls ls-caret" data-arrow-target></span>
                                </button>
                            </div>
                        </div>
                        <div id="section-settings">
                            <div class="widget panel {*has-drag-icon*} of-visible m-b-0x">
                                <div class="widget__top top">
                                    <div class="top__title">
                                        {$newSection['name']}
                                    </div>
                                </div>
                                <div class="widget__body">
                                    <div class="widget__content" data-section-fields>
                                        {assign var=hasSubSection value=false}
                                        {foreach $newSection['fields'] as $sectionKey => $sectionField}
                                            {if $sectionField['type'] == "subsection"}
                                                {assign var=hasSubSection value=true}
                                            {/if}
                                            {include file="adminarea/pages/custom/sections/inputs/{$sectionField['type']}.tpl" 
                                                sectionIndex=0 
                                                sectionField=$sectionField
                                                sectionKey=$sectionKey
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
                        </div>
                    </div>
                </div>
            </div>
            {include file='adminarea/sections/includes/sidebar.tpl' section=$newSection}
        </div>
    </form>
{/block}

{block name="template-actions"}
    <div class="app-main__actions">
        <div class="container">
            <div>
                <button id="saveSectionButton" class="btn btn--primary is-disabled-override" type="submit" form="newSectionForm" data-section-save>
                    <span class="btn__text">Save Changes</span>
                    <span class="btn__preloader preloader preloader--light"></span>
                </button>
                <a class="btn btn--default btn--outline" href="{$helper->url('Template@pages',['templateName'=>$template->getMainName(), 'tab' => 'section'])}">
                    <span class="btn__text">Cancel</span>
                    <span class="btn__preloader preloader"></span>
                </a>
            </div>
        </div>
    </div>
{/block}

{block name="template-modals"}
    {include file='adminarea/pages/includes/modal/modals.tpl'}
    {include file='adminarea/sections/includes/modal-remove-section.tpl'}  
{/block}

{block name="template-scripts"}
    <script type="text/javascript" src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script type="text/javascript" src="{$helper->script('plugins/summernote.js')}"></script>
    <script type="text/javascript" src="{$helper->script('lagom-cms.js')}"></script>
{/block}
