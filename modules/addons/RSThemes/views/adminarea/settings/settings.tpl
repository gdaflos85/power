{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/includes/breadcrumb.tpl"}
{/block}

{block name="template-tabs"}
    {include file="adminarea/includes/tabs.tpl"}
{/block}

{block name="template-content"}
    <form 
        id="settingsForm" 
        action="{$helper->url('Template@saveSettings',['templateName'=>$template->getMainName()])}" 
        method="POST" 
        data-check-unsaved-changes
    >
        <input type="hidden" name="settings_tab" value="{if $smarty.get.settingsTab}{$smarty.get.settingsTab}{else}settings-general{/if}"> 
       
        <div class="section">
            <div class="d-flex">
                <div class="app-main__sidebar">
                    <div class="tabs tabs--block m-w-200 is-sticky">
                        <div 
                            class="tabs__nav"
                            data-options="navStorage:localStorage; localStorageId:custom-slider-23; slideToClickedSlide: true;"
                        >
                            {include file="adminarea/settings/includes/tabs.tpl"}   
                        </div>
                    </div>
                </div>
                <div class="app-main__content">
                    <div class="tabs__body">
                        <div class="tab-content">
                            {* Tab DisplayRules *}
                            {if \RSThemes\Helpers\ContentChecker::checkCmsInstalled()}
                                {include file="adminarea/settings/includes/display-rule.tpl"}
                            {/if}
                           
                            {* Tab General Settings *}
                            <div class="tab-pane {if $smarty.get.settingsTab == 'settings-general' || (!\RSThemes\Helpers\ContentChecker::checkCmsInstalled() && !isset($smarty.get.settingsTab))} is-active {/if}" id="settings-general">
                                <div class="t-c__top top" data-top-search data-toggler-options="toggleClass: is-open;">
                                    <div class="top__toolbar">
                                        <h3 class="section__title">{$lang.settings.section.general.title}{include file="adminarea/includes/helpers/docs.tpl" link=$docs.settings.general_settings}</h3>
                                        
                                    </div>
                                </div>
                                <div class="d-flex">
                                    <div class="app-main__content">
                                        <div class="section">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    {* Alternate Links *}
                                                    {include file="adminarea/settings/includes/hreflang-links.tpl"}

                                                    {* Client ID Display *}
                                                    {include file="adminarea/settings/includes/show-client-id.tpl"}

                                                    {* Convert 0.00 Prices To "Free" *}
                                                    {include file="adminarea/settings/includes/free-product-price.tpl"}

                                                    {* Cookie box *}
                                                    {include file="adminarea/settings/includes/cookie-box.tpl"}
                                                
                                                    {* Custom Logo URL *}
                                                    {include file="adminarea/settings/includes/custom-logo-url.tpl"}   

                                                    {* Custom Language List *}
                                                    {include file="adminarea/settings/includes/custom-language-list.tpl"}
                                                    
                                                    {* Dark Mode *}
                                                    {include file="adminarea/settings/includes/display-mode-switcher.tpl"}   
                                                    
                                                    {* Gravatar *}
                                                    {include file="adminarea/settings/includes/gravatar.tpl"}

                                                    {* Hide Billing Cycle Discounts *}
                                                    {include file="adminarea/settings/includes/hide-discounts.tpl"}

                                                    {* Pricing updates on currency change *}
                                                    {include file="adminarea/settings/includes/whmcs-currency-update.tpl"}
                                                    
                                                    {* Section Titles Capitalization *}
                                                    {include file="adminarea/settings/includes/capitalize_section_titles.tpl"}
                                                    
                                                    {* Table Status Icons *}
                                                    {include file="adminarea/settings/includes/show-status-icon.tpl"}

                                                    {* Table Cache Duration *}
                                                    {include file="adminarea/settings/includes/table-filter-cache-duration.tpl"}

                                                    {* Ajax Data Tables *}
                                                    {include file="adminarea/settings/includes/ajax-data-tables.tpl"}

                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                </div>
                            </div>

                            {* Tab Layout *}
                            <div class="tab-pane {if $smarty.get.settingsTab == 'settings-layout'} is-active {/if}" id="settings-layout">
                                <div class="t-c__top top" data-top-search data-toggler-options="toggleClass: is-open;">
                                    <div class="top__toolbar">
                                        <h3 class="section__title">{$lang.settings.section.layout.title}{include file="adminarea/includes/helpers/docs.tpl" link=$docs.settings.layout_settings}</h3>
                                    </div>
                                </div>
                                <div class="d-flex">
                                    <div class="app-main__content">
                                        <div class="section">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    {* Affixed Navigation *}
                                                    {include file="adminarea/settings/includes/affixed_navigation.tpl"}

                                                    {* Affixed Sidebars *}
                                                    {include file="adminarea/settings/includes/sticky-sidebars.tpl"}

                                                    {* Account Details Sidebar Panel *}
                                                    {include file="adminarea/settings/includes/account-details-sidebar-box.tpl"} 
                                                    
                                                    {* Footer Company Description *}
                                                    {include file="adminarea/settings/includes/footer-company-description.tpl"}

                                                    {* Footer Supported Payment Gateways *}
                                                    {include file="adminarea/settings/includes/footer-supported-payment-gateways.tpl"}

                                                    {* Main Menu Hover-Triggered Submenu Expansion *}
                                                    {include file="adminarea/settings/includes/hover-triggered-submenu-expansion.tpl"}

                                                    {* Main Menu Mobile Style *}
                                                    {include file="adminarea/settings/includes/mobile-menu-style.tpl"}
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                </div>
                            </div>

                            {* Tab Order Process Settings *}
                            <div class="tab-pane {if $smarty.get.settingsTab == 'settings-order'} is-active {/if}" id="settings-order">
                                <div class="t-c__top top" data-top-search
                                     data-toggler-options="toggleClass: is-open;">
                                    <div class="top__toolbar">
                                        <h3 class="section__title">{$lang.settings.section.order_process.title}{include file="adminarea/includes/helpers/docs.tpl" link=$docs.settings.order_process_settings}</h3>
                                        
                                    </div>
                                </div>
                                <div class="d-flex">
                                    <div class="app-main__content">
                                        <div class="section">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    {* Enhanced Free Domain Display *}
                                                    {include file="adminarea/settings/includes/product-domain-free-price.tpl"}

                                                    {* Hide Product Nameservers *}
                                                    <div class="panel panel--collapse">
                                                        {include file="adminarea/settings/includes/group-inputs.tpl"
                                                        switchId= 'name-field'
                                                        title=$lang.settings.section.order_process.hide_product_nameservers.title
                                                        name='hide_nameserver_fields'
                                                        label=$lang.settings.section.order_process.hide_product_nameservers.title
                                                        tooltip=$tooltips.settings.order_process.hide_product_nameservers
                                                        value=$settings['hide_nameserver_fields']  
                                                    }
                                                    </div>

                                                    {* Hide Product Hostname *}
                                                    <div class="panel panel--collapse">
                                                        {include file="adminarea/settings/includes/group-inputs.tpl"
                                                        switchId= 'password-field'
                                                        title=$lang.settings.section.order_process.hide_product_hostname.title
                                                        name='hide_password_fields'
                                                        label=$lang.settings.section.order_process.hide_product_hostname.title
                                                        tooltip=$tooltips.settings.order_process.hide_product_hostname.hide_product_hostname
                                                        value=$settings['hide_password_fields']
                                                        customHostname=true
                                                        }
                                                    </div>

                                                    {* Product Custom Description Formatting *}
                                                    {include file="adminarea/settings/includes/product-description-settings.tpl"}

                                                    {* Product Package Settings *}
                                                    {include file="adminarea/settings/includes/product-package-settings.tpl"}

                                                    {* Product Price Calculation *}
                                                    {include file="adminarea/settings/includes/product-price-settings.tpl"}

                                                    {* Password Strength For Root Password Field *}
                                                    {include file="adminarea/settings/includes/enable-pw-strength.tpl"}

                                                    {* Show Promo Code Banner Label *}
                                                    {include file="adminarea/settings/includes/promocode-banner-label.tpl"}

                                                    {* Show TLD Cycle Switcher *}
                                                    {include file="adminarea/settings/includes/tld-cycle-switcher.tpl"}
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
        </div>
    </form>
{/block}

{block name="template-modals"}
    {* Unsaved Changes *}
    {include file="adminarea/includes/modals/unsaved-changes.tpl"}

    {* Cookie Box Translation *}
    {include file="adminarea/includes/modals/cookie-box-translation.tpl"}

    {* Save Confirmation *}
    {include file="adminarea/includes/modals/save-confirmation.tpl"}

    {* Dark Mode Switcher in Navigation *}
    {include file="adminarea/includes/modals/dark-mode-switcher-in-navigation.tpl"}

    {* Footer Company Description Translation *}
    {include file="adminarea/includes/modals/footer-company-description-translation.tpl"}

    {* Footer Supported Payment Gateways Translation *}
    {include file="adminarea/includes/modals/footer-supported-payment-gateway-translation.tpl"}

    {* Footer Supported Payment Gateways Icons *}
    {include file="adminarea/includes/modals/footer-supported-payment-gateway-icons.tpl"}

    {* Footer Supported Payment Gateways Icons Remove *}
    {include file="adminarea/includes/modals/footer-supported-payment-gateway-icons-remove.tpl"}

{/block}

{block name="template-actions"}
    <div class="app-main__actions">
        <div class="container">
            <a class="btn btn--primary" data-changes-save="#settingsForm" data-form-validate="#settingsForm" data-check-unsaved-changes>
                <span class="btn__text">{$lang.general.save_changes}</span>
                <span class="btn__preloader preloader"></span>
            </a>
            <a class="btn btn--default btn--outline " href="{$helper->url('Template@settings',['templateName'=>$template->getMainName()])}">
                <span class="btn__text">{$lang.general.cancel}</span>
                <span class="btn__preloader preloader"></span>
            </a>
        </div>
    </div>
{/block}
