<div class="tab-pane {if $smarty.get.tab == 'export-import'}is-active{/if}" id="settings-export-import">
    <div class="section">
        <div class="section__header">
            <h3 class="section__title">
                Export
                {include file="adminarea/includes/helpers/docs.tpl" link=$cms_docs->pages['export']}
            </h3>
        </div>
        <div class="section__content" data-lagom-cms-export-container>
            <form method="post" action="{$helper->url('CustomPage@pageExport',['templateName'=>$template->getMainName(), 'pageName' => $pageName])}" method="POST">
                <div class="widget panel overflow-visible">
                    <div class="widget__content p-3x">
                        <div class="form-group form-group--parent m-b-0x">
                            <div class="d-flex flex-column accordion" id="exportAccordion" data-radio-accordion>
                                <div class="form-check m-b-2x">
                                    <label class="m-b-0x collapse-label collapsed" data-toggle="lu-radio-collapse" data-target="#export-all-pages" aria-expanded="true" aria-controls="export-all-pages">
                                        <input class="radio-accordion form-radio" type="radio" name="select-to-export" checked data-lagom-cms-export-radio="all">
                                        <span class="form-indicator"></span>
                                        <span class="form-text  d-flex align-items-center m-l-1x">
                                            Export All Pages
                                            {if $cms_tooltips->pages['export']['all_pages']['content']}
                                                {if isset($cms_tooltips->pages['export']['all_pages']['url']) && $cms_tooltips->pages['export']['all_pages']['url'] != ""}
                                                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->pages['export']['all_pages']['url']}' target='_blank'>Learn More</a>"}
                                                {else}
                                                    {assign var="popoverFooter" value=false}
                                                {/if}
                                                {include 
                                                    file="adminarea/includes/helpers/popover.tpl" 
                                                    popoverClasses="notification__popover"
                                                    popoverBody="{$cms_tooltips->pages['export']['all_pages']['content']}"
                                                    popoverFooter="{$popoverFooter}"
                                                }
                                            {/if}
                                        </span>
                                    </label>
                                </div>
                                <div class="form-group accordion-select p-0x m-0x collapse show" id="export-all-pages" data-parent="#exportAccordion">
                                    {foreach $websitePages['website'] as $page}
                                        <input type="hidden" name="pages[]" value="{$page->id}" data-lagom-cms-export-input>
                                    {/foreach}
                                    {foreach $websitePages['promo'] as $page}
                                        <input type="hidden" name="pages[]" value="{$page->id}" data-lagom-cms-export-input>
                                    {/foreach}
                                </div>
                               <div class="form-check m-b-0x">
                                    <label class="m-b-0x collapse-label collapsed" data-toggle="lu-radio-collapse" data-target="#export-selected-pages" aria-expanded="true" aria-controls="export-selected-pages">
                                        <input class="group-radio form-radio" type="radio" name="select-to-export" data-lagom-cms-export-radio="selected">
                                        <span class="form-indicator"></span>
                                        <span class="form-text d-flex align-items-center m-l-1x">
                                            Export Selected Pages
                                            {if $cms_tooltips->pages['export']['selected_pages']['content']}
                                                {if isset($cms_tooltips->pages['export']['selected_pages']['url']) && $cms_tooltips->pages['export']['selected_pages']['url'] != ""}
                                                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->pages['export']['selected_pages']['url']}' target='_blank'>Learn More</a>"}
                                                {else}
                                                    {assign var="popoverFooter" value=false}
                                                {/if}
                                                {include 
                                                    file="adminarea/includes/helpers/popover.tpl" 
                                                    popoverClasses="notification__popover"
                                                    popoverBody="{$cms_tooltips->pages['export']['selected_pages']['content']}"
                                                    popoverFooter="{$popoverFooter}"
                                                }
                                            {/if}
                                        </span>
                                    </label>
                                    <div class="form-group accordion-select p-0x p-l-3x m-b-0x collapse" id="export-selected-pages" data-parent="#exportAccordion">
                                        <select disabled class="form-control multiselect form-control--basic group-multi-select m-t-2x" name="pages[]" multiple required data-lagom-cms-export-select>
                                            <option value="">Select Page To Export</option>
                                            {foreach $websitePages['website'] as $key => $websitePage}
                                                <option value="{$websitePage->id}">{$websitePage->name}</option>
                                            {/foreach}
                                            {foreach $websitePages['promo'] as $key => $websitePage}
                                                <option value="{$websitePage->id}">{$websitePage->name}</option>
                                            {/foreach}
                                        </select>
                                        <label class="m-b-0x m-t-2x">
                                            <input class="group-checkbox form-checkbox" type="checkbox" name="export-predefined-sections" checked>
                                            <span class="form-indicator"></span>
                                            <span class="form-text d-flex align-items-center m-l-1x">
                                                Export Predefined Sections
                                                {if $cms_tooltips->pages['export']['export_predefined']['content']}
                                                    {if isset($cms_tooltips->pages['export']['export_predefined']['url']) && $cms_tooltips->pages['export']['export_predefined']['url'] != ""}
                                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->pages['export']['export_predefined']['url']}' target='_blank'>Learn More</a>"}
                                                    {else}
                                                        {assign var="popoverFooter" value=false}
                                                    {/if}
                                                    {include 
                                                        file="adminarea/includes/helpers/popover.tpl" 
                                                        popoverClasses="notification__popover"
                                                        popoverBody="{$cms_tooltips->pages['export']['export_predefined']['content']}"
                                                        popoverFooter="{$popoverFooter}"
                                                    }
                                                {/if}
                                            </span>
                                        </label>
                                    </div>

                                </div>    
                            </div>
                        </div>
                        <div class="p-t-3x d-flex align-items-center">
                            <button class="btn btn--primary" data-lagom-cms-export-submit data-lagom-cms-export-success-message="Export pages completed successfully." type="submit">
                                <span class="btn__text">Export</span>
                                <span class="btn__preloader preloader preloader--light"></span>
                            </button>
                            <div class="alert alert--outline alert--info alert--xs m-b-0x m-l-2x w-a is-hidden" data-lagom-cms-export-submit-alert>
                                <i class="ls ls-info-circle text-info m-r-1x"></i> This action can take several minutes.
                            </div>
                        </div>
                        {* TODO: <div class="form-group d-flex p-b-2x m-b-0x">
                            <span class="form-label text-default form-text m-r-2x m-b-0x" style="flex-grow: 1">Include Sitemap Settings
                                <i class="ls ls-info-circle m-l-1x tooltip drop-target" data-toggle="lu-tooltip" data-title="Example tooltip text"></i>
                            </span>
                            <label>
                                <div class="switch switch--primary">
                                    <input type="hidden" name="" value="0">
                                    <input class="switch__checkbox" name="" value="1" type="checkbox">
                                    <span class="switch__container"><span class="switch__handle"></span></span>
                                </div>
                            </label>
                        </div>
                        <div class="form-group d-flex m-b-0x">
                            <span class="form-label text-default form-text m-r-2x m-b-0x" style="flex-grow: 1">Include Website Optimization Settings
                                <i class="ls ls-info-circle m-l-1x tooltip drop-target" data-toggle="lu-tooltip" data-title="Example tooltip text"></i>
                            </span>
                            <label>
                                <div class="switch switch--primary">
                                    <input type="hidden" name="" value="0">
                                    <input class="switch__checkbox" name="" value="1" type="checkbox">
                                    <span class="switch__container"><span class="switch__handle"></span></span>
                                </div>
                            </label>
                        </div> *}
                        
                    </div>
                    
                </div>
            </form>
        </div>
    </div>
    <div class="section">
        <div class="section__header">
            <h3 class="section__title">
                Import
                {include file="adminarea/includes/helpers/docs.tpl" link=$cms_docs->pages['import']}
            </h3>    
            
        </div>   
        <div class="section__content">
            <div class="widget panel overflow-visible">
                <div class="widget__content p-3x">
                    <div class="form-group form-group--parent m-b-0x">
                        <div class="d-flex flex-column accordion" id="importAccordion">
                            <form 
                                enctype="multipart/form-data" 
                                action="{$helper->url('CustomPage@pageImport',['templateName'=>$template->getMainName(), 'pageName' => $pageName])}" 
                                data-ajax-url="{$helper->apiUrl('CmsApi@pageDuplicateValidation', ['templateName'=>$template->getMainName()])}"
                                method="POST" 
                                data-lagom-cms-import
                                class="form"
                            >
                                <input type="hidden" name="overwrite" value="" data-lagom-cms-import-overwrite>
                                <div class="media media--custom media--import-pages m-t-0x">
                                    <div class="media__wrapper" data-lagom-cms-import-btn>
                                        <i class="media__icon ls ls-upload"></i>
                                        <strong class="media__title p-md">Click to Upload</strong>
                                        <span class="media__desc p-xs">Allowed extensions .zip</span>
                                    </div>
                                    <input type="file" name="pageimport" data-lagom-cms-import-input>
                                    <div class="media__list row w-100 is-hidden" data-lagom-cms-import-file-container>
                                        <div class="media__item col-md-12">
                                            <div class="media__item-content">
                                                <div class="media__item-icon">
                                                    {assign var="iconsPath" value="./../../../../../../../templates/{$themeName}/assets/svg-icon"}
                                                    {include file="{$iconsPath}/addon-email-forwarding.tpl"}
                                                </div>
                                                <div class="media__item-footer">
                                                    <span class="media__item-filename" data-lagom-cms-import-file-filename></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                                <div class="form__actions m-t-3x">
                                    <button class="btn btn--primary is-disabled" type="button" data-lagom-cms-import-submit>
                                        <span class="btn__text">Import</span>
                                        <span class="btn__preloader preloader preloader--light m-l-3x"></span>
                                    </button>
                                </div>   
                            </form>
                        </div>
                    </div>
                </div>
            </div>            
        </div>        
    </div>   
</div>

<div class="modal modal--lg modal--hero" id="importPagesModal" data-import-pages-modal>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <div class="top__title type-4 text-danger"><i class="ls ls-exclamation-circle m-r-2x"></i>Import Pages</div>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body">
                <p>Following page urls exists</p>
                <div class="list-group" data-import-pages-modal-url data-page-url="{$helper->url('CustomPage@show',['templateName' => $template->getMainName()])}">

                </div>
                <br />
                <p>Following page names exists:</p>
                <div class="list-group" data-import-pages-modal-pages data-page-url="{$helper->url('CustomPage@show',['templateName' => $template->getMainName()])}">

                </div>
            </div>
            <div class="modal__actions">
                <button type="button" data-import-pages-modal-overwrite class="btn btn--danger">
                    <span class="btn__text">Overwrite existing pages</span>
                    <span class="btn__preloader preloader preloader--light"></span>
                </button>
                <button type="button" data-import-pages-modal-duplicate class="btn btn--primary">
                    <span class="btn__text">Save as new pages</span>
                    <span class="btn__preloader preloader preloader--light"></span>
                </button>
                <button data-dismiss="lu-modal" aria-label="Close" type="button" class="btn btn--default btn--outline"><span class="btn__text">{$lang.general.cancel}</span></button>
            </div>
        </div>
    </div>
</div>