{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/cms/breadcrumb.tpl" type="custom_page"}
{/block}

{block name="template-content"}
    <form
        id="newCustomPageForm"
        action="{$helper->url('CustomPage@create',['templateName' => $template->getMainName()])}"
        method="POST"
        enctype="multipart/form-data"
    >
        <input type="hidden" name="customFilename" value="">
        <input type="hidden" name="type" value="{$pageType}">
        <div class="block {if $pageType}block--{$pageType}{/if} is-loading">
            <div class="block__body" style="max-width: calc(100% - 368px);">
                <div class="section">
                    <div class="section__header">
                        <h3 class="section__title">
                            {$lang.page.page_title.header}
                            {include file="adminarea/includes/helpers/docs.tpl" link=$cms_docs->page['page_title']}
                        </h3>
                    </div>
                    <div class="section__content">
                        <div class="widget panel">
                            <div class="widget__body">
                                <div class="widget__content" data-page-name-container>
                                    <div class="form-group">
                                        <input
                                            data-page-name
                                            class="form-control form-control--lg"
                                            name="name"
                                            value=""
                                            placeholder="{$lang.page.page_title.input_placeholder}"
                                            data-current=""
                                            required
                                        >
                                    </div>
                                    <div class="form-group m-b-0x">
                                        <div class="permalink" data-page-name-permalink>
                                            <input type="hidden" name="" value="" data-page-name-temp>
                                            <input type="hidden" name="url" value="" data-page-name-permalink-input="{$whmcsURL}/" data-ajax-url="{$helper->url('CustomPage@checkPageUrl',['templateName'=>$template->getMainName()])}">
                                            <span class="permalink__title">
                                                <strong>{$lang.page.page_title.permalink}</strong>
                                            </span>
                                            <div class="permalink__content">
                                                <span class="permalink__link permalink__link--static" data-page-name-permalink-link>
                                                {$whmcsURL}/<span class="permalink__link is-hidden" data-page-name-permalink-value contenteditable="true"></span>
                                                </span>
                                                <button class="permalink__edit-btn btn btn--icon btn--link is-hidden" type="button" data-page-name-permalink-edit-btn>
                                                    <i class="btn__icon ls ls-edit"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div data-page-name-alert>
                                        <span class="alert alert--outline alert--danger alert--xs is-hidden m-b-0x m-t-1x" data-page-name-alert-name>Page name can't be empty</span>
                                        <span 
                                            class="alert alert--outline alert--danger alert--xs is-hidden m-b-0x m-t-1x" 
                                            data-page-name-alert-url
                                            data-page-name-alert-url-message-empty="Page URL can't be empty"
                                            data-page-name-alert-url-message-notvalid="Page URL is not valid, please try different one"
                                            data-page-name-alert-url-message-exists="Page URL already exists, please try different one"
                                        ></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="section">
                    <div class="section__header top">
                        <h3 class="section__title top__title">
                            {if $pageType == "promo"}
                                Promotion Sections
                                {include file="adminarea/includes/helpers/docs.tpl" link=$cms_docs->page['promotions']['page_sections']}
                            {else}
                                {$lang.page.page_sections.header}
                                {include file="adminarea/includes/helpers/docs.tpl" link=$cms_docs->page['page_sections']}
                            {/if}   
                        </h3>
                        <div class="top__toolbar">
                            <button
                                type="button"
                                class="btn btn--secondary"
                                data-toggle="lu-modal"
                                data-target="#modalAddNewSection"
                                data-section-add
                                data-section-header-btn
                                data-order="1"
                                data-index="0">
                                <i class="btn__icon ls ls-plus"></i>
                                <span class="btn__text">{$lang.general.add_new}</span>
                            </button>
                        </div>
                    </div>
                    <div class="form-group form-group--language">
                        <input type="hidden" name="language" value="{$language}">
                        <label class="form-label">Choose Language To Edit</label>
                        <div
                            {if $cms_tooltips->page['new']['change_language']} 
                                data-toggle="lu-tooltip"
                                title="{$cms_tooltips->page['new']['change_language']}"
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
                    <div id="settings" class="section__body d-flex flex-column" data-page-builder>
                        {include file='adminarea/pages/custom/sections/index.tpl' language=$language}
                    </div>
                </div>

                {if $pageType == "promo"}
                    <div class="section">
                        <div class="section__header top">
                            <h3 class="section__title top__title">
                                Expired Promotion Sections
                                {include file="adminarea/includes/helpers/docs.tpl" link=$cms_docs->page['promotions']['page_sections_expired']}
                            </h3>
                            <div class="top__toolbar">
                                <button
                                    type="button"
                                    class="btn btn--secondary"
                                    data-toggle="lu-modal"
                                    data-target="#modalAddNewSection"
                                    data-section-add
                                    data-section-type="expired_promo"
                                    data-section-header-btn
                                    data-order="1"
                                    data-index="10000">
                                    <i class="btn__icon ls ls-plus"></i>
                                    <span class="btn__text">{$lang.general.add_new}</span>
                                </button>
                            </div>
                        </div>
                        <div id="promotions-settings" class="section__body d-flex flex-column" data-page-builder-expired-promo>
                            {include file='adminarea/pages/custom/sections/index.tpl' language=$language sType="expired_promo"}
                        </div>
                    </div>
                {/if}    
            </div>

            <div class="block__sidebar block__sidebar--md is-sticky">
                <div class="section">
                    <h3 class="section__title">Page Settings
                        {include file="adminarea/includes/helpers/docs.tpl" link=$cms_docs->page['page_settings']}
                    </h3>
                    <div class="section__body">
                        <div class="widget panel of-visible">
                            <label class="widget__top top">
                                <div class="top__title">
                                    General
                                </div>
                            </label>
                            <div class="widget__body">
                                <div class="widget__content">
                                    <div class="form-group d-flex p-b-1x m-b-0x">
                                        <span class="form-label text-default form-text m-r-2x m-b-0x" style="flex-grow: 1">Publish Page
                                            {if $cms_tooltips->page['settings']['general']['publish']['content']}
                                                {if isset($cms_tooltips->page['settings']['general']['publish']['url']) && $cms_tooltips->page['settings']['general']['publish']['url'] != ""}
                                                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->page['settings']['general']['publish']['url']}' target='_blank'>Learn More</a>"}
                                                {else}
                                                    {assign var="popoverFooter" value=false}
                                                {/if}
                                                {include 
                                                    file="adminarea/includes/helpers/popover.tpl" 
                                                    popoverClasses="notification__popover popover__top"
                                                    popoverBody="{$cms_tooltips->page['settings']['general']['publish']['content']}"
                                                    popoverFooter="{$popoverFooter}"
                                                }
                                            {/if}
                                        </span>
                                        <label>
                                            <div class="switch switch--primary">
                                                <input type="hidden" name="settings[published]" value="0">
                                                <input class="switch__checkbox" name="settings[published]" value="1" type="checkbox">
                                                <span class="switch__container"><span class="switch__handle"></span></span>
                                            </div>
                                        </label>
                                    </div>
                                    {*
                                    <div class="form-group d-flex p-b-1x m-b-0x">
                                        <span class="form-label text-default form-text m-r-2x m-b-0x" style="flex-grow: 1">Promo Page
                                            <i class="ls ls-info-circle m-l-1x tooltip drop-target" data-toggle="lu-tooltip" data-title="Promo Page"></i>
                                        </span>
                                        <label>
                                            <div class="switch switch--primary">
                                                <input type="hidden" name="settings[is_promo_page]" value="0">
                                                <input class="switch__checkbox" name="settings[is_promo_page]" value="1" type="checkbox">
                                                <span class="switch__container"><span class="switch__handle"></span></span>
                                            </div>
                                        </label>
                                    </div>
                                    *}
                                    <div class="form-group m-b-0x">
                                        <span class="form-label text-default form-text m-r-2x m-b-1x" style="flex-grow: 1">Body class
                                            {if $cms_tooltips->page['settings']['general']['body_class']['content']}
                                                {if isset($cms_tooltips->page['settings']['general']['body_class']['url']) && $cms_tooltips->page['settings']['general']['body_class']['url'] != ""}
                                                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->page['settings']['general']['body_class']['url']}' target='_blank'>Learn More</a>"}
                                                {else}
                                                    {assign var="popoverFooter" value=false}
                                                {/if}
                                                {include
                                                file="adminarea/includes/helpers/popover.tpl"
                                                popoverClasses="notification__popover popover__top"
                                                popoverBody="{$cms_tooltips->page['settings']['general']['body_class']['content']}"
                                                popoverFooter="{$popoverFooter}"
                                                }
                                            {/if}
                                        </span>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="settings[body_class]" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        {if $pageType == "promo"}
                            {include file="adminarea/pages/custom/promotions/sidebar.tpl"} 
                        {/if}    

                        <div class="widget panel of-visible">
                            <label class="widget__top top">
                                <div class="top__title">
                                    SEO
                                </div>
                                <div class="top__actions">
                                    <input class="is-hidden" name="seoEnabled" value="1" type="hidden" checked data-seo-enable>
                                </div>
                            </label>
                            <div class="widget__body widget__body--seo {*if !$customPage->seo_enabled} is-hidden{/if*}" data-seo-section>
                                <div class="widget__content">
                                    <div class="form-group" data-form-counter>
                                        <label class="form-label">
                                            Search Engine Indexing
                                            {if $cms_tooltips->page['settings']['seo']['robots']['content']}
                                                {if isset($cms_tooltips->page['settings']['seo']['robots']['url']) && $cms_tooltips->page['settings']['seo']['robots']['url'] != ""}
                                                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->page['settings']['seo']['robots']['url']}' target='_blank'>Learn More</a>"}
                                                {else}
                                                    {assign var="popoverFooter" value=false}
                                                {/if}
                                                {include 
                                                    file="adminarea/includes/helpers/popover.tpl" 
                                                    popoverClasses="notification__popover popover__top"
                                                    popoverBody="{$cms_tooltips->page['settings']['seo']['robots']['content']}"
                                                    popoverFooter="{$popoverFooter}"
                                                }
                                            {/if}
                                        </label>
                                        <select class="form-control selectized m-w-250" name="seoRobots" style="opacity: 1; display: none;" tabindex="-1">
                                            <option value="1" {if $customPage->seo_robots} selected{/if}>Allow</option>
                                            <option value="0" {if !$customPage->seo_robots} selected {/if}>Disallow</option>
                                        </select>
                                    </div>
                                    <div class="form-group" data-form-counter>
{*                                         <label class="form-label">Seo Title<span class="form-label__counter">(<span data-form-counter-value>{if isset($page)}{$customPage->seoTitle|count_characters:true}{else}0{/if}</span>/64)</span></label>*}
                                        <label class="form-label" data-form-counter>
                                            Seo Title
                                            <span class="form-label__counter">(<span data-form-counter-value>{if isset($customPage)}{$customPage->seo_title[$whmcsLang->value]|count_characters:true}{else}0{/if}</span>/64)</span>
                                            {if $cms_tooltips->page['settings']['seo']['title']['content']}
                                                {if isset($cms_tooltips->page['settings']['seo']['title']['url']) && $cms_tooltips->page['settings']['seo']['title']['url'] != ""}
                                                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->page['settings']['seo']['title']['url']}' target='_blank'>Learn More</a>"}
                                                {else}
                                                    {assign var="popoverFooter" value=false}
                                                {/if}
                                                {include 
                                                    file="adminarea/includes/helpers/popover.tpl" 
                                                    popoverClasses="notification__popover popover__top"
                                                    popoverBody="{$cms_tooltips->page['settings']['seo']['title']['content']}"
                                                    popoverFooter="{$popoverFooter}"
                                                }
                                            {/if}
                                            <a class="form-label__translate seo-translation" data-seo-translation="title" href="#titleSeoTranslationModal" data-toggle="lu-modal" data-backdrop="static" data-keyboard="false">
                                                Translate
                                            </a>
                                        </label>
                                        <input class="form-control" type="text" data-max="64" data-seo-input-title value="{$customPage->seo_title_whmcs_lang}" data-ajax-url="{$helper->url('Page@updateSeoTranslations',['templateName'=>$template->getMainName()])}">
                                        <input type="hidden" name="seoTitle" value="{$customPage->seo_title_translations}" data-seo-translation-title>
                                    </div>
                                    <div class="form-group" data-form-counter>
{*                                         <label class="form-label">Seo Description<span class="form-label__counter">(<span data-form-counter-value>{if isset($page)}{$page->seoDescription|count_characters:true}{/if}</span>/160)</span></label>*}
                                       <label class="form-label">
                                            Seo Description
                                            <span class="form-label__counter">(<span data-form-counter-value>{if isset($customPage)}{$customPage->seo_description[$whmcsLang->value]|count_characters:true}{else}0{/if}</span>/160)</span>
                                             {if $cms_tooltips->page['settings']['seo']['description']['content']}
                                                {if isset($cms_tooltips->page['settings']['seo']['description']['url']) && $cms_tooltips->page['settings']['seo']['description']['url'] != ""}
                                                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->page['settings']['seo']['description']['url']}' target='_blank'>Learn More</a>"}
                                                {else}
                                                    {assign var="popoverFooter" value=false}
                                                {/if}
                                                {include 
                                                    file="adminarea/includes/helpers/popover.tpl" 
                                                    popoverClasses="notification__popover popover__top"
                                                    popoverBody="{$cms_tooltips->page['settings']['seo']['description']['content']}"
                                                    popoverFooter="{$popoverFooter}"
                                                }
                                            {/if}
                                            <a class="form-label__translate seo-translation" data-seo-translation="description" href="#descriptionSeoTranslationModal" data-toggle="lu-modal" data-backdrop="static" data-keyboard="false">
                                                Translate
                                            </a>
                                        </label>
                                        <textarea class="form-control" type="text" maxlength="160" data-seo-input-description data-ajax-url="{$helper->url('Page@updateSeoTranslations',['templateName'=>$template->getMainName()])}">{$customPage->seo_description_whmcs_lang}</textarea>
                                        <input type="hidden" name="seoDescription" value="{$customPage->seo_description_translations}" data-seo-translation-description>
                                    </div>
                                    <div class="form-group m-b-0x" data-seo-container>
                                        <label class="form-label">
                                            Social Image
                                             {if $cms_tooltips->page['settings']['seo']['image']['content']}
                                                {if isset($cms_tooltips->page['settings']['seo']['image']['url']) && $cms_tooltips->page['settings']['seo']['image']['url'] != ""}
                                                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->page['settings']['seo']['image']['url']}' target='_blank'>Learn More</a>"}
                                                {else}
                                                    {assign var="popoverFooter" value=false}
                                                {/if}
                                                {include 
                                                    file="adminarea/includes/helpers/popover.tpl" 
                                                    popoverClasses="notification__popover popover__top"
                                                    popoverBody="{$cms_tooltips->page['settings']['seo']['image']['content']}"
                                                    popoverFooter="{$popoverFooter}"
                                                }
                                            {/if}
                                        </label>
                                        <a class="btn btn--secondary btn--block {if $customPage->seo_image}is-hidden{/if}" href="#seoImageModal" data-toggle="lu-modal" data-backdrop="static" data-keyboard="false"  data-seo-btn>
                                            Choose Image
                                        </a>
                                        <input type="hidden" name="seoImage" data-seo-input value="{if $customPage->seo_image}{$customPage->seo_image}{/if}">
                                        <div class="media media--seo d-block {if $customPage->seo_image}{else}is-hidden{/if}" data-seo-image-container>
                                            <div class="media__content">
                                                <div class="media__body">
                                                    <a href="#seoImageModal" data-toggle="lu-modal" data-backdrop="static" data-keyboard="false" data-seo-image-container class="img-container img-container--boxed d-flex">
                                                        <img data-seo-image src="{if $customPage->seo_image} /templates/{$themeName}/assets/img/page-manager/{$customPage->seo_image} {/if}" alt="{if $customPage->seo_image} {$customPage->seo_image} {/if}"/>
                                                    </a>
                                                </div>
                                                <div class="media__footer">
                                                    <div class="seo-image-name truncate" data-seo-image-name>
                                                        {if $customPage->seo_image} {$customPage->seo_image} {/if}
                                                    </div>
                                                    <a 
                                                        class="btn btn--icon btn--link" 
                                                        data-toggle="lu-modal"
                                                        href="#deleteSeoImageModal"
                                                    >
                                                        <i 
                                                            class="btn__icon lm lm-trash"
                                                            data-toggle="lu-tooltip"
                                                            data-title="{$lang.general.remove}"
                                                        ></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="block__loader preloader-container">
                <div class="preloader preloader--lg"></div>
            </div>
        </div>
    </form>
    {include file="adminarea/pages/includes/modal/seo-translation.tpl"
        type='title'
        label='SEO Title Translation Modal'
    }
    {include file="adminarea/pages/includes/modal/seo-translation.tpl"
        type='description'
        label='SEO Description Translation Modal'
    }
    {include file='adminarea/pages/includes/modal/modals.tpl'}
    {include file="adminarea/pages/includes/modal/seo-image.tpl"}
    {include file='adminarea/pages/includes/modal/seo-image-remove.tpl'}
    {include file='adminarea/pages/includes/modal/section/section-add.tpl' type="pageSection"}
    {include file='adminarea/pages/includes/modal/section/section-delete.tpl'}
    
    <form data-duplicate-section-form class="is-hidden">
        <input type="hidden" name="language" value="{$language}">
        <input type="hidden" name="order" value="" data-duplicate-section-order> 
        <input type="hidden" name="duplicateIndex" value="" data-duplicate-section-index>
        <input type="hidden" name="index" value="" data-duplicate-section-new-index> 
        <input type="hidden" name="stype" value="" data-duplicate-section-stype>
        <input type="hidden" name="newSection[new]" value="" data-duplicate-section-type>
        <input type="hidden" name="newSection[type]" value="new">
    </form>
{/block}

{block name="template-actions"}
    <div class="app-main__actions">
        <div class="container">
            <button type="submit" class="btn btn btn--primary is-disabled" form="newCustomPageForm" data-page-save-changes data-changes-save>
                <span class="btn__text">Save Changes</span>
                <span class="btn__preloader preloader preloader--light"></span>
            </button>
            <a class="btn btn--default btn--outline " href="{$helper->url('Template@pages',['templateName'=>$template->getMainName(), 'tab' => 'website'])}">
                <span class="btn__text">Cancel</span>
                <span class="btn__preloader preloader"></span>
            </a>
        </div>
    </div>
{/block}

{block name="template-scripts"}
    <script type="text/javascript" src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script type="text/javascript" src="{$helper->script('plugins/summernote.js')}"></script>
    <script type="text/javascript" src="{$helper->script('lagom-cms.js')}?v={$cms_version}"></script>
{/block}