{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/cms/breadcrumb.tpl" type="custom_page"}
{/block}

{block name="template-content"}
    <form id="editCustomPage"
        action="{$helper->url('CustomPage@save',['templateName'=>$template->getMainName(), 'pageId' => $customPage->id])}"
        method="POST"
        enctype="multipart/form-data"
        data-autosave
        data-autosave-url="{$helper->apiUrl('CmsApi@pageAutosave', ['templateName'=>$template->getMainName()])}"
        {if $autosaveExists && $smarty.get.autosave != "1"}
            data-autosave-show-modal
        {/if}
    >
        <input name="id" value="{$customPage->id}" type="hidden">
        <input name="type" value="{$customPage->type}" type="hidden">
        <input type="hidden" name="customFilename" value="{$customPage->settings['filename']}">
        <div class="block {if $customPage->type}block--{$customPage->type}{/if} is-loading">
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
                                            class="form-control form-control--lg" 
                                            name="name" 
                                            value="{$customPage->name}"
                                            data-page-name
                                            placeholder="{$lang.page.page_title.input_placeholder}"
                                            data-current="{$customPage->name}"                                                
                                            required
                                        >
                                    </div>    
                                    <div class="form-group m-b-0x">
                                        {if $isHomepage}    
                                            <div class="permalink">
                                                <span class="permalink__title">
                                                    <strong>{$lang.page.page_title.permalink}</strong>
                                                </span>
                                                <div class="permalink__content">
                                                    <span class="permalink__link permalink__link--static">
                                                        {$whmcsURL}
                                                    </span>
                                                </div>
                                            </div>
                                            <input type="hidden" name="url" value="{$customPage->url}">
                                        {else}
                                            <div class="permalink" data-page-name-permalink>
                                                <input type="hidden" name="" value="{$customPage->url}" data-page-name-temp>
                                                <input type="hidden" name="url" value="{$customPage->url}" data-page-name-permalink-input="{$whmcsURL}/" data-ajax-url="{$helper->url('CustomPage@checkPageUrl',['templateName'=>$template->getMainName()])}">
                                                <span class="permalink__title">
                                                    <strong>{$lang.page.page_title.permalink}</strong>
                                                </span>
                                                <div class="permalink__content">
                                                    <span class="permalink__link permalink__link--static" data-page-name-permalink-link>
                                                    {$whmcsURL}/<span class="permalink__link" data-page-name-permalink-value contenteditable="true">{$customPage->url}</span>
                                                    </span>
                                                    <button class="permalink__edit-btn btn btn--icon btn--link" type="button" data-page-name-permalink-edit-btn>
                                                        <i class="btn__icon ls ls-edit"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        {/if}
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
                            {$lang.page.page_sections.header}
                            {include file="adminarea/includes/helpers/docs.tpl" link=$cms_docs->page['page_sections']}
                        </h3>
                        <div class="top__toolbar">
                            <button
                                type="button"
                                class="btn btn--secondary"
                                data-toggle="lu-modal"
                                data-target="#modalAddNewSection"
                                data-section-add
                                data-section-header-btn
                                data-order="{if is_countable($customPage->sections)}{sizeof($customPage->sections) + 1}{else}1{/if}"
                                data-index="{if is_countable($customPage->sections)}{sizeof($customPage->sections)}{else}0{/if}"
                                data-language="{$language}"
                            >
                                <i class="btn__icon ls ls-plus"></i>
                                <span class="btn__text">{$lang.general.add_new}</span>
                            </button>
                        </div>
                    </div>
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
                                data-ajax-url="{$helper->url('CustomPage@sectionsChangeLanguage',['templateName'=>$template->getMainName(), 'customPageId' => $customPage->id, 'autosave' => $history['autosave'], 'history' => $history['history']])}"
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
                    <div class="section__loader preloader-container is-hidden" data-page-loader>
                        <div class="preloader preloader--lg"></div>
                    </div>
                    <div id="custom-page-sections" class="section__body d-flex flex-column" data-page-builder> 
                        {include file='adminarea/pages/custom/sections/index.tpl' pageSections=$customPageSections language=$language}
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
                                    data-order="{if is_countable($customPageSectionsStypes['expired_promo'])}{sizeof($customPageSectionsStypes['expired_promo']) + 1}{else}1{/if}"
                                    data-index="{if is_countable($customPageSectionsStypes['expired_promo'])}{sizeof($customPageSectionsStypes['expired_promo']) + 10000}{else}10000{/if}"
                                >
                                    <i class="btn__icon ls ls-plus"></i>
                                    <span class="btn__text">{$lang.general.add_new}</span>
                                </button>
                            </div>
                        </div>
                        <div id="promotions-settings" class="section__body d-flex flex-column" data-page-builder-expired-promo>
                            {include file='adminarea/pages/custom/sections/index.tpl' language=$language pageSections=$customPageSectionsStypes['expired_promo'] sType="expired_promo" counterStart=10000}
                        </div>
                    </div>
                {/if} 
            </div>
            <div class="block__sidebar block__sidebar--md is-sticky" data-page-settings>
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
                                                <input class="switch__checkbox" name="settings[published]" value="1" type="checkbox" {if ($customPage->settings['published'])} checked {/if}>
                                                <span class="switch__container"><span class="switch__handle"></span></span>
                                            </div>
                                        </label>
                                    </div>
                                    {if $pageType != "promo"}
                                        <div class="form-group d-flex p-b-1x m-b-0x">
                                            <span class="form-label text-default form-text m-r-2x m-b-0x" style="flex-grow: 1">Set as Homepage
                                            {if $cms_tooltips->page['settings']['general']['set_as_homepage']['content']}
                                                    {if isset($cms_tooltips->page['settings']['general']['set_as_homepage']['url']) && $cms_tooltips->page['settings']['general']['set_as_homepage']['url'] != ""}
                                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->page['settings']['general']['set_as_homepage']['url']}' target='_blank'>Learn More</a>"}
                                                    {else}
                                                        {assign var="popoverFooter" value=false}
                                                    {/if}
                                                    {include 
                                                        file="adminarea/includes/helpers/popover.tpl" 
                                                        popoverClasses="notification__popover popover__top"
                                                        popoverBody="{$cms_tooltips->page['settings']['general']['set_as_homepage']['content']}"
                                                        popoverFooter="{$popoverFooter}"
                                                    }
                                                {/if}
                                            </span>
                                            <label>
                                                <div class="switch switch--primary">
                                                    <input type="hidden" name="isHomepage" value="0">
                                                    <input class="switch__checkbox" name="isHomepage" value="1" type="checkbox" {if $isHomepage} checked {/if}>
                                                    <span class="switch__container"><span class="switch__handle"></span></span>
                                                </div>
                                            </label>
                                        </div>
                                    {/if}
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
                                            <input type="text" class="form-control" name="settings[body_class]" value="{if $customPage->settings['body_class']}{$customPage->settings['body_class']}{/if}">
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
                                    <input class="is-hidden" name="seoEnabled" value="1" type="checkbox" checked data-seo-enable> 
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
                                            SEO Title
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
                                        <input class="form-control" type="text" data-max="64" data-form-counter-input data-seo-input-title value="{$customPage->seo_title_whmcs_lang}" data-ajax-url="{$helper->url('Page@updateSeoTranslations',['templateName'=>$template->getMainName()])}">
                                        <input type="hidden" name="seoTitle" value="{$customPage->seo_title_translations}" data-seo-translation-title>
                                    </div>
                                    <div class="form-group" data-form-counter>
{*                                         <label class="form-label">Seo Description<span class="form-label__counter">(<span data-form-counter-value>{if isset($page)}{$page->seoDescription|count_characters:true}{/if}</span>/160)</span></label>*}
                                        <label class="form-label">
                                            SEO Description
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
                                        <textarea class="form-control" type="text" maxlength="160" data-seo-input-description data-form-counter-input data-ajax-url="{$helper->url('Page@updateSeoTranslations',['templateName'=>$template->getMainName()])}">{$customPage->seo_description_whmcs_lang}</textarea>
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
    {include file='adminarea/pages/includes/modal/seo-image.tpl'}
    {include file='adminarea/pages/includes/modal/seo-image-remove.tpl'}
    {include file='adminarea/pages/includes/modal/section/section-add.tpl' type="pageSection"}
    {include file='adminarea/pages/includes/modal/section/section-delete.tpl'}
    {include file='adminarea/pages/includes/modal/other/page-delete.tpl'}

    {if $autosaveExists}
        {include file='adminarea/pages/includes/modal/other/load-autosave.tpl'}
    {/if}

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

{block name="template-sidebar"}
    {if $historyList|count > 0}
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
                            href="{$helper->url('CustomPage@show',['templateName'=>$template->getMainName(), 'pageId' => $customPage->id])}" 
                            class="btn btn-default"                             
                        >
                            <div class="list-group__item-content">
                                <div class="list-group__item-date">Current Version</div>
                            </div>
                            <span class="btn btn--link btn--xs">Load</span>
                        </a>
                        {foreach $historyList|@array_reverse as $hist}                            
                            <a 
                                href="{$helper->url('CustomPage@show',['templateName'=>$template->getMainName(), 'pageId' => $customPage->id, 'history' => $hist->fileId])}" 
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

{block name="template-actions"}
    <div class="app-main__actions">
        <div class="container d-flex">
            <div class="flex-grow-1">
                <button type="submit" class="btn btn btn--primary is-disabled" form="editCustomPage" data-page-save-changes data-changes-save>
                    <span class="btn__text">Save Changes</span>
                    <span class="btn__preloader preloader preloader--light"></span>
                </button>
                <a class="btn btn--default btn--outline " href="{$helper->url('Template@pages',['templateName'=>$template->getMainName(), 'tab' => 'website'])}">
                    <span class="btn__text">Cancel</span>
                    <span class="btn__preloader preloader"></span>
                </a>
            </div>
            {if $historyList|count > 0}
                <div class="m-r-2x">
                    <button type="button" class="btn btn--default btn--outline" data-app-sidebar-slide-open>
                        <span class="btn__text">Show Edit History</span>
                        <span class="btn__preloader preloader"></span>
                    </button>
                </div>
            {/if}
            
            <div class="m-r-2x">
                <a class="btn btn--default btn--outline" href="#deletePageModal" data-toggle="lu-modal" data-backdrop="static" data-keyboard="false">
                    <span class="btn__text">Delete</span>
                    <span class="btn__preloader preloader"></span>
                </a>
            </div>
            <div class="m-r-2x">
                <button type="button" id="customPageDuplicate" class="btn btn--default btn--outline" data-toggle="lu-modal" data-backdrop="static" data-keyboard="false">
                    <span class="btn__text">Duplicate</span>
                    <span class="btn__preloader preloader"></span>
                </button>
            </div>
        </div>
    </div>
{/block}

{block name="template-scripts"}
   <script
  src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"
  integrity="sha256-lSjKY0/srUM9BE3dPm+c4fBo1dky2v27Gdjm2uoZaL0="
  crossorigin="anonymous"></script>
    
    <script type="text/javascript" src="{$helper->script('plugins/summernote.js')}"></script>
    <script type="text/javascript" src="{$helper->script('lagom-cms.js')}?v={$cms_version}"></script>
    <script>
        $("#customPageDuplicate").on("click", function(e){
            e.preventDefault();
            $('#editCustomPage').attr('action', "{$helper->url('CustomPage@create',['templateName' => $template->getMainName(),'duplicate' => 1])}").submit();
        });
    </script>
{/block}
