{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/cms/breadcrumb.tpl" type="section"}
{/block}

{block name="template-content"}
    <form id="editSectionForm" 
        action="{$helper->url('Section@update',['templateName'=>$template->getMainName(), 'sectionId' => $sectionId])}"
        method="POST"
        enctype="multipart/form-data"
        data-autosave
        data-autosave-url="{$helper->apiUrl('CmsApi@predefinedAutosave', ['templateName'=>$template->getMainName()])}"
        {if $autosaveExists && $smarty.get.autosave != "1"}
            data-autosave-show-modal
        {/if}
    >   <input type="hidden" name="id" value="{$sectionId}">
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
                                    value="{$section->name}"
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
                            <label class="form-label">Choose Language To Edit</label>
                            <div class="has-dropdown">
                                <a 
                                    class="btn btn btn--default btn--outline btn--block btn--language" 
                                    href="" 
                                    data-toggle="lu-dropdown" 
                                    data-display="static" 
                                    data-placement="bottom left" 
                                    data-section-language
                                    data-ajax-url="{$helper->url('Section@changeSectionLanguage',['templateName' => $template->getMainName(), 'sectionId' => $section->id])}"
                                >
                                    <span class="btn__text" data-value="{$language}">{ucfirst($language)}</span>
                                    <span class="btn__icon btn__icon-arrow ls ls-caret" data-arrow-target></span>
                                </a>
                                <div class="dropdown dropdown--language" data-dropdown-menu data-section-language-menu>
                                    <div class="dropdown__arrow" data-arrow></div>
                                    <div class="dropdown__menu">
                                        <ul class="nav">
                                            {foreach $whmcsLanguages as $whmcsLanguage}
                                                <li class="nav__item {if $whmcsLanguage == $language}is-active{/if}">
                                                    <a class="nav__link" data-section-language-menu-item="{$whmcsLanguage}" data-section-language-menu-item-text="{ucfirst($whmcsLanguage)}">
                                                        <span class="nav__link-text">{ucfirst($whmcsLanguage)}</span>
                                                        <span class="nav__link-icon ls ls-check"></span>
                                                    </a>
                                                </li>
                                            {/foreach}                                         
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="section__loader preloader-container is-hidden" data-section-loader>
                            <div class="preloader preloader--lg"></div>
                        </div>
                        <div class="section__content" data-section-content>
                            {include file="adminarea/sections/fields.tpl" section=$sectionValues}
                        </div>
                    </div>
                </div>
            </div>
            {include file='adminarea/sections/includes/sidebar.tpl'}  
        </div>
    </form>
{/block}

{block name="template-actions"}
    <div class="app-main__actions">
        <div class="container d-flex">
            <div style="flex-grow: 1">
                <button id="saveSectionButton" class="btn btn--primary is-disabled" type="submit" form="editSectionForm" data-section-save>
                    <span class="btn__text">Save Changes</span>
                    <span class="btn__preloader preloader preloader--light"></span>
                </button>
                <a class="btn btn--default btn--outline" href="{$helper->url('Template@pages',['templateName'=>$template->getMainName(), 'tab' => 'section'])}">
                    <span class="btn__text">Cancel</span>
                    <span class="btn__preloader preloader"></span>
                </a>
            </div>
            {if isset($historyList) && $historyList|count > 0}
                <div class="m-r-2x">
                    <button type="button" class="btn btn--default btn--outline" data-app-sidebar-slide-open>
                        <span class="btn__text">Show Edit History</span>
                        <span class="btn__preloader preloader"></span>
                    </button>
                </div>
            {/if}
            <div class="m-r-2x">
                <a class="btn btn--default btn--outline" href="#deleteSectionModal" data-toggle="lu-modal" data-backdrop="static" data-keyboard="false">
                    <span class="btn__text">{$lang.general.delete}</span>
                    <span class="btn__preloader preloader"></span>
                </a>
            </div>
        </div>
    </div>
{/block}

{block name="template-modals"}
    {include file='adminarea/pages/includes/modal/modals.tpl'}
    {include file='adminarea/sections/includes/modal-remove-section.tpl'}  
    {if $autosaveExists}
        {include file='adminarea/pages/includes/modal/other/load-autosave.tpl' autosave_type='predefined'}
    {/if}
{/block}

{block name="template-sidebar"}
    {if isset($historyList) && $historyList|count > 0}
        <div class="app-main__sidebar app-main__sidebar--fixed app-main__sidebar--slide" data-app-sidebar-slide>
            <div class="section">
                <div class="section__header top">
                    <h3 class="section__title top__title">Edit History</h3>
                    <div class="section__actions top__actions">
                        <button class="close btn btn--xs btn--icon btn--link" data-app-sidebar-slide-close><i class="btn__icon lm lm-close"></i></button>
                    </div>
                </div>    
                <div class="section__body">
                    <div class="list-group list-group--history">
                        <a class="list-group__item {if !$smarty.get.history}is-active{/if}"
                            href="{$helper->url('Section@show',['templateName'=>$template->getMainName(), 'sectionId' => $section->id])}"
                            class="btn btn-default"                             
                        >
                            <div class="list-group__item-content">
                                <div class="list-group__item-date">Current Version</div>
                            </div>
                            <span class="btn btn--link btn--xs">Load</span>
                        </a>
                        {foreach $historyList|@array_reverse as $hist}                            
                            <a 
                                href="{$helper->url('Section@edit',['templateName'=>$template->getMainName(), 'sectionId' => $sectionId, 'history' => $hist->fileId])}"
                                class="list-group__item {if $smarty.get.history == $hist->fileId}is-active{/if}" 
                            >   
                                <div class="list-group__item-content">
                                    <div class="list-group__item-date"><span>Modified:</span>{date("m-d-Y H:i:s",$hist->fileModified)}</div>
                                    <div class="list-group__item-user"><span>Edited by:</span>{$hist->adminFirstname} {$hist->adminLastname}</div>
                                </div>
                                <span class="btn btn--link btn--xs">Load</span>
                            </a>
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
    {/if}
{/block}

{block name="template-scripts"}
    <script type="text/javascript" src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script type="text/javascript" src="{$helper->script('plugins/summernote.js')}"></script>
    <script type="text/javascript" src="{$helper->script('lagom-cms.js')}"></script>
{/block}
