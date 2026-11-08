<div class="tab-pane {if $smarty.get.tab == 'promotion'} is-active {/if}" id="pages-promotion" data-cms-mass-actions>
    <div class="t-c__top top m-b-3x" data-top-search data-toggler-options="toggleClass: is-open;">
        <div class="top__toolbar">
            <h3 class="section__title">
                Promotion Pages
                {include file="adminarea/includes/helpers/docs.tpl" link=$cms_docs->pages['website_pages']}
            </h3>
           
        </div>
        <div class="top__toolbar is-right">
            <div class="top__search input-group">
                <span class="input-group__icon lm lm-search"></span>
                <input class="form-control input-group__form-control table-search" data-toggler-options="toggleFocus: true; clearOnBlur: true;" value="" placeholder="Search..." id="table-searchCMSPromotion" >
            </div>
            <button
                    class="btn btn--primary {if empty($promoPagesAdded)} is-disabled {/if}"
                    type="button"
                    data-add-new-page
                    data-ajax-url="{$helper->url('CustomPage@customPageVerify', ['templateName'=>$template->getMainName()])}"
                    data-location-href="{$helper->url('CustomPage@new',['templateName'=>$template->getMainName()])}&type=promo"
            >
                <i class="btn__icon lm lm-plus"></i>
                <span class="btn__text">Add New</span>
            </button>
        </div>
    </div>
    <div class="section">
        {if !empty($promoPagesAdded)}
            <div class="t-c__body t-c__body--boxed">
                <table class="t-c__table table mob-table--block" id="promotions-tableCMS" data-services-table data-search-input="#table-searchCMSPromotion" data-order='[[3, "asc"], [0, "asc"]]' data-clickable-rows="true" data-responsive="false">
                    <colgroup>
                        <col class="table__col-10">
                        <col class="table__col-5">
                        <col class="table__col-5">
                        <col class="table__col-3">
                        <col class="table__col-0">
                    </colgroup>
                    <thead>
                    <tr>
                        <th class="content-name">
                            <label class="checkbox m-t-0x m-b-0x">
                                <input class="form-checkbox" type="checkbox" name="massActionSelectAll" data-mass-actions-select-all> 
                                <span class="form-indicator"></span>
                            </label>
                            <span class="cell-name">Name</span>
                            <span class="sorting-icons-box">
                                {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                            </span>
                        </th>
                        <th>
                            <span class="cell-url">URL</span>
                            <span class="sorting-icons-box">
                                {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                            </span>
                        </th>
                        <th>
                            <span class="cell-url">Expiry Date</span>
                            <span class="sorting-icons-box">
                                {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                            </span>
                        </th>
                        <th>
                            <span class="cell-status">Status</span>
                            <span class="sorting-icons-box">
                                {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                            </span>
                        </th>
                        <th>
                            <span class="cell-seo d-inline-flex align-items-center">
                                Indexing
                                {if $tooltips['pages']['table']['indexing']['content']}
                                    {if isset($tooltips['pages']['table']['indexing']['url']) && $tooltips['pages']['table']['indexing']['url'] != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips['pages']['table']['indexing']['url']}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include 
                                        file="adminarea/includes/helpers/popover.tpl" 
                                        popoverClasses="notification__popover popover__top"
                                        popoverBody="{$tooltips['pages']['table']['indexing']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                            </span>
                            <span class="sorting-icons-box">
                                {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                            </span>
                        </th>
                        <th class="cell-actions no-sort">
                            <span class="sorting-icons-box">
                                {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                            </span>
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    {if isset($websitePages['promo']) && !empty($websitePages['promo'])}
                        {foreach $websitePages['promo'] as $key => $websitePage}
                            <tr>
                                <td class="cell-name">
                                    <div class="content-name">
                                        <label class="checkbox m-t-0x m-b-0x">
                                            <input class="form-checkbox" type="checkbox" name="massActionCheckbox" data-mass-actions-checkbox value="{$websitePage->id}"> 
                                            <span class="form-indicator"></span>
                                        </label>
                                        <a href="{$helper->url('CustomPage@show',['templateName' => $template->getMainName(), 'pageId' => $websitePage->id])}"><strong>{ucfirst($websitePage->name)}</strong></a>
                                    </div>
                                </td>

                                <td class="cell-url">
                                    {if $homepageId == $websitePage->id}
                                        <span class="label label--info label--outline">Homepage</span>
                                        <a href="{$whmcsURL}/index.php" target="_blank">
                                            <span>/index.php</span>
                                        </a>
                                    {else}
                                        <a href="{$whmcsURL}/{$websitePage->url}" target="_blank">
                                            <span>/{$websitePage->url}</span>
                                        </a>
                                    {/if}
                                </td>
                                <td class="cell-expiry-date">
                                    {if isset(($websitePage->settings['promo'])) && $websitePage->settings['promo']['promotionDisplayTimeEnabled'] == "1" && $websitePage->settings['promo']['promotionEndDate']}
                                        {$websitePage->settings['promo']['promotionEndDate']|date_format:"%Y.%m.%d %H:%M"}
                                    {else}
                                        -
                                    {/if}
                                </td>
                                <td class="cell-status" {if $websitePage->settings['published']}data-order="1"{else}data-order="999999999999"{/if}>
                                    {if $websitePage->settings['published']}
                                        <span class="label label--success label--outline">Published</span>
                                    {else}
                                        <span class="label label--default is-disabled label--outline">Disabled</span>
                                    {/if}
                                </td>
                                <td class="cell-seo">
                                    <div class="status">
                                        {if $websitePage->seo_robots}
                                            <span class="status__seo-dial status__seo-dial--on m-l-2x"></span>
                                            <span class="is-hidden">1</span>
                                        {else}
                                            <span class="status__seo-dial m-l-2x"></span>
                                            <span class="is-hidden">0</span>
                                        {/if}
                                    </div>
                                </td>
                                <td class="cell-actions">
                                    <a class="btn btn--xs btn--default btn--outline" href="{$helper->url('CustomPage@show',['templateName' => $template->getMainName(), 'pageId' => $websitePage->id])}">
                                        <span class="btn__text">Manage</span>
                                    </a>
                                </td>
                            </tr>
                        {/foreach}
                    {/if}
                    </tbody>
                </table>
            </div>
        {else}
            <div class="section__body  panel ">
                <div class="section__builder">
                    <div class="builder__icon text-center">
                        <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M12.3856 16.4751L27.0847 1.80041C29.4918 -0.600136 33.393 -0.600136 35.8001 1.80041L38.1943 4.19069C40.6017 6.59403 40.6017 10.492 38.1943 12.8928L23.425 27.6375C22.3476 28.7132 20.8866 29.3177 19.3628 29.3177H11.9949C11.1658 29.3177 10.4995 28.6359 10.5202 27.8084L10.7051 20.3855C10.7421 18.9155 11.3436 17.5154 12.3856 16.4751ZM36.1082 6.27339L33.7151 3.88424C32.4599 2.63246 30.425 2.63246 29.1704 3.88368L27.9611 5.09096L34.899 12.0173L36.1088 10.8095C37.3632 9.55845 37.3632 7.5263 36.1082 6.27339ZM32.8128 14.1L25.8749 7.17369L14.4719 18.5578C13.9651 19.0638 13.6726 19.7447 13.6545 20.4592L13.5059 26.3705L19.3629 26.3723C20.0113 26.3723 20.6365 26.1472 21.1339 25.7402L21.339 25.5548L32.8128 14.1ZM18.6696 0.0759835C19.4843 0.0759835 20.1448 0.735339 20.1448 1.54869C20.1448 2.29427 19.5898 2.91044 18.8698 3.00796L18.6696 3.0214H11.3155C6.35587 3.0214 3.14341 6.30596 2.95873 11.4067L2.95032 11.8753V28.2008C2.95032 33.4173 6.00656 36.8485 10.8685 37.0458L11.3155 37.0548H28.6712C33.6431 37.0548 36.8458 33.7773 37.0299 28.6701L37.0383 28.2008V20.2914C37.0383 19.478 37.6988 18.8187 38.5135 18.8187C39.2603 18.8187 39.8775 19.3727 39.9752 20.0916L39.9886 20.2914V28.2008C39.9886 34.9991 35.6752 39.779 29.1313 39.9927L28.6712 40.0002H11.3155C4.67062 40.0002 0.206456 35.3745 0.00697185 28.6718L0 28.2008V11.8753C0 5.08376 4.32451 0.297515 10.8562 0.0834665L11.3155 0.0759835H18.6696Z" fill="#1062FE"/>
                        </svg>
                    </div>
                    <h5 class="builder__title">Welcome in our website builder</h5>
                    <p class="p-md builder__desc text-center m-b-4x">Please decide whether you’d like to load default template pages, or start from scratch by creating your own pages based on our
                        <span class="form-label__counter label-docs"><a href="https://lagom.rsstudio.net/docs/website-builder/page-manager/" target="_blank" class="btn--link btn--xs p-0x"> documentation</a></span>.
                    </p>
                    <div class="builder__actions">
                        <button 
                            class="btn btn--primary m-r-1x" 
                            data-load-theme-pages 
                            data-ajax-url="{$helper->url('CustomPage@customPageVerify', ['templateName'=>$template->getMainName()])}" 
                            data-type="promo" 
                            {* data-btn-loader *}
                        >
                            <span class="btn__preloader preloader preloader--light"></span>
                            <span class="btn__text">Load Theme Pages</span>
                        </button>                        
                        <button 
                            type="button" 
                            class="btn btn--secondary" 
                            data-href="{$helper->url('CustomPage@loadCustomPages',['templateName' => $template->getMainName(), 'load' => false, 'tab' => 'promotion'])}&type=promo" 
                            data-ajax-url="{$helper->url('CustomPage@customPageVerify', ['templateName'=>$template->getMainName()])}"
                            data-btn-loader
                            data-start-from-scratch
                        >
                            <span class="btn__preloader preloader"></span>
                            <span class="btn__text">Start From Scratch</span>
                        </button>
                        
                    </div>
                </div>
            </div>
        {/if}
    </div>
</div>