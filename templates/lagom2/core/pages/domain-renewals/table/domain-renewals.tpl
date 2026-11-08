{include file="orderforms/$carttpl/common.tpl"}
<div class="main-grid{if $mainGrid} {$mainGrid}{/if}">
    {* {if $RSThemes['pages'][$templatefile]['config']['hideSidebar'] != '1'}
        <div class="main-sidebar">
            {if $RSThemes['addonSettings']['sticky_sidebars'] == "true"}<div class="sidebar-sticky" {if $RSThemes.addonSettings.show_affixed_navigation == 'enabled'}data-sidebar-sticky{/if}>{/if}
                {include file="orderforms/$carttpl/sidebar-categories.tpl"}
            {if $RSThemes['addonSettings']['sticky_sidebars'] == "true"}</div>{/if}
        </div>
    {/if} *}
    <div class="main-content{if $mainContentClasses} {$mainContentClasses}{/if}">
        {* {if $RSThemes['pages'][$templatefile]['config']['hideSidebar'] != '1'}
            {include file="orderforms/$carttpl/sidebar-categories-collapsed.tpl"}
        {/if} *}
        {if $renewalsData}
            {assign var=iconsPages value=['clientareadomains', 'supportticketslist', 'clientareainvoices', 'clientareaproducts', 'clientareaquotes']}
            <div class="alert alert-lagom alert-danger w-hidden" data-renewal-alert-no-domain>
                <div class="alert-body">
                    {$LANG.domainrenewalsnoneavailable}
                </div>
            </div>
            <div class="alert alert-lagom alert-success w-hidden" data-renewal-alert-added>
                <div class="alert-body">
                    {$rslang->trans('order.renew_all_success')}
                </div>
            </div>
            <div class="alert alert-primary alert-lagom alert-domain-renewals hidden" data-domain-renewals-add-all-container>
                <div class="alert-content">
                    <div class="icon">{include file="$template/includes/common/svg-icon.tpl" icon="64-free-domain-name-3"}</div>
                    <div class="description">
                        <p class="title p-lg">{$rslang->trans('order.renew_domains')}</p>
                        <span class="desc p-d m-b-0">{$rslang->trans('order.renew_all_desc')|sprintf2:"<span data-domain-renewals-add-all-counter></span>"}</span>
                    </div>
                </div>
                <div class="alert-action">
                    <button type="button" 
                        data-check-renew-url="{$WEB_ROOT}/modules/addons/RSThemes/src/Api/clientApi.php?controller=ClientData&method=getCountClientRenewDomains" 
                        data-ajax-url="{$WEB_ROOT}/modules/addons/RSThemes/src/Api/clientApi.php?controller=ClientData&method=doClientRenewDomains" 
                        data-renewals-in-cart="{$renewalsInCart}"
                        data-domain-renewals-add-all 
                        class="btn btn-primary-faded"
                        >
                        <span class="btn-text"><i class="ls ls-refresh"></i>{$rslang->trans('order.renew_all')}</span>
                        <div class="loader loader-button hidden" >
                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}  
                        </div>
                    </button>
                </div>
            </div>
            
            {include file="$template/includes/tablelist.tpl" tableName="RenewalList" ajaxUrl="/modules/addons/RSThemes/src/Api/clientApi.php?controller=ClientData&method=getClientDomainRenewals" tableIncludes="domain-renewals" startOrderCol="2" filterColumn="2"}
            <script type="text/javascript">
                jQuery(document).ready( function ()
                {
                    {if isset($RSThemes.addonSettings.enable_table_ajax_load) && $RSThemes.addonSettings.enable_table_ajax_load == "enabled"}
                    {else}
                        jQuery('.table-container').removeClass('loading');
                        jQuery('#tableLoading').addClass('hidden');
                    {/if}
                });
            </script>
            <div class="table-container {if isset($RSThemes.addonSettings.enable_table_ajax_load) && $RSThemes.addonSettings.enable_table_ajax_load == "enabled"}table-container-ajax{/if} loading">
                {* <div class="table-top">
                    <div class="d-flex">
                        <label>{$LANG.clientareahostingaddonsview}</label>
                        <div class="dropdown view-filter-btns {if $RSThemes.addonSettings.show_status_icon == 'displayed' && in_array($templatefile, $iconsPages)}iconsEnabled{/if}" >
                            <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                {if $RSThemes.addonSettings.show_status_icon == 'displayed' && in_array($templatefile, $iconsPages)}
                                    {if file_exists("templates/$template/assets/img/status-icons/status-all.tpl")}
                                        <span class="status-icon status-status-all" style="font-size: 0;">
                                            {include file="$template/assets/img/status-icons/status-all.tpl"}      
                                        </span>
                                    {/if}
                                {else}
                                    <span class="status hidden"></span>
                                {/if}
                                <span class="filter-name">{$rslang->trans('generals.all_entries')}</span>
                                <i class="ls ls-caret"></i>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <li>
                                    <a href="#">
                                        <span data-value="all">
                                            {if $RSThemes.addonSettings.show_status_icon == 'displayed'}
                                                {if file_exists("templates/$template/assets/img/status-icons/status-all.tpl")}
                                                    <span class="status-icon status-status-all">
                                                        {include file="$template/assets/img/status-icons/status-all.tpl"}      
                                                    </span>
                                                {/if}
                                                <span class="filter-name">{$rslang->trans('generals.all_entries')}</span>
                                            {else}
                                                {$rslang->trans('generals.all_entries')}
                                            {/if}
                                        </span>
                                    </a>
                                </li>
                                {foreach key=num item=status from=$RSDomainsStatuses}
                                    {if $RSThemes.addonSettings.show_status_icon == 'displayed' && in_array($templatefile, $iconsPages)}
                                        <li>
                                            <a href="#">
                                                <span class="status status-{$status.statusClass} {if $RSThemes.addonSettings.show_status_icon == 'displayed'}dot-hidden{/if}" data-value="{$status.status}" data-status-class="{$status.statusClass}">
                                                    {if $RSThemes.addonSettings.show_status_icon == 'displayed'}
                                                        {if file_exists("templates/$template/assets/img/status-icons/{$status.statusClass}.tpl")}
                                                            <span class="status-icon status-{$status.statusClass}">
                                                                {include file="$template/assets/img/status-icons/{$status.statusClass}.tpl"}      
                                                            </span>
                                                        {else}
                                                            <span class="status-icon status-{$status.statusClass}">
                                                                {include file="$template/assets/img/status-icons/default.tpl"}      
                                                            </span>
                                                        {/if}                     
                                                    {/if}
                                                    <span class="filter-name">
                                                        {if $status.status == "freeWithService"}
                                                            {lang key='domainRenewal.freeWithService'}
                                                        {elseif $status.status == "unavailable"}
                                                            {lang key='domainunavailable'}
                                                        {elseif $status.status == "domainrenewalspastgraceperiod"}
                                                            {lang key='domainrenewalspastgraceperiod'}
                                                        {elseif $status.status == "beforeRenewLimitDays"}  
                                                            {$rslang->trans('order.beforeRenewLimit')}
                                                        {elseif $status.status = "availableforrenewal"}
                                                            {lang key='orderavailable'}
                                                        {/if}
                                                    </span>
                                                </span>
                                            </a>
                                        </li>
                                    {else}
                                        <li><a href="#">
                                            <span class="status status-{$status.statusClass}" data-value="{$status.status}" data-status-class="{$status.statusClass}">
                                                {if $status.status == "freeWithService"}
                                                    {lang key='domainRenewal.freeWithService'}
                                                {elseif $status.status == "unavailable"}
                                                    {lang key='domainunavailable'}
                                                {elseif $status.status == "domainrenewalspastgraceperiod"}
                                                    {lang key='domainrenewalspastgraceperiod'}
                                                {elseif $status.status == "beforeRenewLimitDays"}  
                                                    {$rslang->trans('order.beforeRenewLimit')}
                                                {elseif $status.status = "availableforrenewal"}
                                                    {lang key='orderavailable'}
                                                {/if}
                                            </span>
                                        </a></li>
                                    {/if}
                                {/foreach}
                            </ul>
                        </div>
                        <button id="clearFilters" type="button" class="btn btn-link btn-xs hidden">{$rslang->trans('generals.clear_filters')}<i class="ls ls-close"></i></button>
                    </div>
                </div> *}
                <table id="tableRenewalList" class="table table-list">
                    <thead>
                        <tr>
                            <th data-priority="1"><button type="button" class="btn-table-collapse"></button>Domain<span class="sorting-arrows"></span></th>
                            <th data-priority="5">Expiry date<span class="sorting-arrows"></span></th>
                            <th data-priority="2">&nbsp;</th>        
                        </tr>
                    </thead>
                    <tbody>
                        {if !isset($RSThemes.addonSettings.enable_table_ajax_load) || $RSThemes.addonSettings.enable_table_ajax_load == "disabled"}
                        {else}
                        {/if}
                    </tbody>
                </table>
                <div class="loader loader-table" id="tableLoading">
                    {include file="$template/includes/common/loader.tpl"}  
                </div>
            </div>
        {else}
            <div class="message message-no-data">
                <div class="message-image">
                    {include file="$template/includes/common/svg-icon.tpl" icon="domain"}              
                </div>
                <h6 class="message-title">{lang key='domainRenewal.noDomains'}</h6>
            </div>        
        {/if} 
    </div>
    {if $renewalsData}
        <div class="main-sidebar main-sidebar-summary {if $RSThemes['pages'][$templatefile]['config']['hideSidebar'] == '1'} main-sidebar-lg{/if}">
            <div class="sidebar-sticky sidebar-sticky-summary">
                <div class="panel panel-summary panel-summary-{$summaryStyle} m-b-0x" id="orderSummary">
                    <div class="loader" id="orderSummaryLoader">
                        {if $summaryStyle == 'default'}
                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}
                        {else}
                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}
                        {/if} 
                    </div>
                    <div class="panel-heading">
                        <h2 class="panel-title">{$LANG.ordersummary}</h2>
                    </div>
                    <div id="producttotal" data-summary-style="{$summaryStyle}"></div>
                </div>
                {if $hasDomainsInGracePeriod}
                    <small class="text-light m-t-20" style="display: block;">* {lang key='domainRenewal.graceRenewalPeriodDescription'}</small>
                {/if}
            </div>
        </div>
        <div class="order-summary order-summary-mob" id="orderSummaryMob" data-fixed-actions href="#orderSummary">                        
            <a href="{$WEB_ROOT}/cart.php?a=view" class="btn btn-lg btn-primary-faded btn-checkout" id="checkout">  
                <span><i class="ls ls-share"></i> {$LANG.orderForm.checkout}</span>
                <div class="loader loader-button hidden">{include file="$template/includes/common/loader.tpl" classes="spinner-sm"} </div>
            </a>
        </div>
    {/if}        
    <form id="removeRenewalForm" method="post" action="{$WEB_ROOT}/cart.php">
        <input type="hidden" name="a" value="remove" />
        <input type="hidden" name="r" value="" id="inputRemoveItemType" />
        <input type="hidden" name="i" value="" id="inputRemoveItemRef" />
        <div class="modal fade modal-remove-item" id="modalRemoveItem" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="{lang key='orderForm.close'}">
                            <i class="lm lm-close"></i>
                        </button>
                        <h3 class="modal-title">
                            <span>{lang key='orderForm.removeItem'}</span>
                        </h5>
                    </div>
                    <div class="modal-body">
                        {lang key='cartremoveitemconfirm'}
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">{lang key='yes'}</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">{lang key='no'}</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>recalculateRenewalTotals();</script>
</div>