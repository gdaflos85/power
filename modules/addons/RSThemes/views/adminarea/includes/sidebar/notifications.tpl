<div class="app-main__sidebar app-main__sidebar--fixed app-main__sidebar--notifications app-main__sidebar--slide" data-app-sidebar-slide app-sidebar-alert-container>
    <div class="section">
        <div class="section__header top">
            <span class="top__icon"><i class="lm lm-bell"></i></span>
            <h3 class="section__title top__title h6">Notifications</h3>
            <div class="section__actions top__actions">
                <div class="mark-all tooltip-toggle" data-app-sidebar-alert-mark-as-read data-toggle="lu-tooltip" data-title="Mark all as read">
                    <i class="lm lm-inbox"></i>
                </div>
                <button class="close btn btn--xs btn--icon btn--link" data-app-sidebar-slide-close><i class="btn__icon lm lm-close"></i></button>
            </div>
        </div>    
        <div class="section__body" app-sidebar-alert-body>
            <div class="list-group list-group--notification">
                {$hasNotifications = false}
                {if $newChangedAnyMenuVersion || $integrationAllowed || $template->license()->getAddonSidebarMessages()}
                    {$hasNotifications = true}
                {/if}
                {* no data notifcation *}
                
                <div class="list-group__item list-group__item--no-data {if $hasNotifications}is-hidden{/if}" app-sidebar-alert-no-data>
                    <div class="list-group__item-icon">
                        <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M16.5 23.625C15.9375 24.375 15.625 25.25 15.625 26.25C15.625 28.6875 17.5625 30.625 20 30.625C22.4375 30.625 24.375 28.6875 24.375 26.25C24.375 25.25 24.0625 24.375 23.5 23.625C22.375 23.5 21.1875 23.4375 20 23.4375C18.8125 23.4375 17.625 23.5 16.5 23.625Z" fill="#1062FE" stroke="#1062FE" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M24.3125 4.1875C23.9375 2.1875 22.125 0.625 20 0.625C17.875 0.625 16.0625 2.1875 15.6875 4.1875M35.625 28.1875C33.625 25.8125 32.5 23.25 32.5 20.5V16.25C32.5 9.375 26.875 3.75 20 3.75C13.125 3.75 7.5 9.375 7.5 16.25V20.5C7.5 23.25 6.375 25.8125 4.375 28.1875M4.375 28.1875C3.5625 29.125 3.125 30.1875 3.125 31.25C3.125 33.5 5 35.5 8.0625 37C11.125 38.4375 15.3125 39.375 20 39.375C24.6875 39.375 28.875 38.4375 31.9375 37C35 35.5 36.875 33.5 36.875 31.25C36.875 29 35 27 31.9375 25.5C28.875 24.0625 24.6875 23.125 20 23.125C15.3125 23.125 11.125 24.0625 8.0625 25.5C6.5 26.25 5.25 27.1875 4.375 28.1875Z" stroke="#17191C" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </div>
                    <div class="list-group__item-title p-d m-b-0x">No notification found</div>
                    <div class="list-group__item-desc p-sm m-b-0x">We’ll let you know when we get messages for you.</div>
                </div>
                
                {if $template->license()->getAddonSidebarMessages()}
                    {$template->license()->getAddonSidebarMessages()}
                {/if}
                {* notifications *}
                
                {if $template->newVersionAvailable()}
                    {assign var="isStable" value=true}
                    {assign var="checkVersion" value="-"|explode:$template->getVersion()}
                    
                    {assign var="isNewVersionStable" value=true}
                    {assign var="checkNewVersion" value=$template->newVersion()|replace:"Lagom ":""}
                    {assign var="checkNewVersion" value="-"|explode:$checkNewVersion}

                    {if isset($checkNewVersion[1]) && $checkNewVersion[1] != ""}
                        {assign var="isNewVersionStable" value=false}
                    {/if}

                    {if $isNewVersionStable}
                        {include 
                            file="adminarea/includes/alert/sidebar-alert.tpl"
                            sidebarAlertIconClass="ls-text-cloud text-danger"
                            sidebarAlertTitle="New Version Available"
                            sidebarAlertDesc="A new version of <b>Lagom WHMCS Client Theme</b> is available to download. Log in to the RS Studio client portal and download the latest version."
                            sidebarAlertActions='<a href="https://rsstudio.net/my-account/" target="_blank" class="btn btn--secondary btn--notification">Download Now</a>'
                            sidebarAlertHideable=true
                            sidebarAlertHideableId="lagomNewVersion`$template->newVersion()`"
                        }
                    {/if}
                {/if}
                
                {* New Menu Version*}
                {if $newChangedAnyMenuVersion}
                    {include 
                        file="adminarea/includes/alert/sidebar-alert.tpl"
                        sidebarAlertIconClass="ls-exclamation-circle text-primary"
                        sidebarAlertTitle="New Menu Version Available!"
                        sidebarAlertDesc="Addon has detected theme version change. Install Learn more about implemented changes in our changelog."
                        sidebarAlertActions="newMenuVersionImport"
                        sidebarAlertHideable=true
                        sidebarAlertHideableId="lagomNewMenuVersion-`$template->getVersion()`"
                    }
                {/if}

                {if isset($integrationAllowed) && $integrationAllowed}
                    {if $integratonType == "cms"}
                        {include 
                            file="adminarea/includes/alert/sidebar-alert.tpl"
                            sidebarAlertIconClass="ls-exclamation-circle text-primary"
                            sidebarAlertTitle=$lang['alert']['cms_integration_available']['title']
                            sidebarAlertDesc="`$lang['alert']['cms_integration_available']['desc']`<br/> `$lang['alert']['cms_integration_available']['desc2']`"
                            sidebarAlertActions="newIntegrationImport"
                            integrationType=$integratonType
                            sidebarAlertHideable=true
                            sidebarAlertHideableId="lagomIntegration-`$integratonType`-`$integrationVersion`"
                        }
                    {else}
                        {include 
                            file="adminarea/includes/alert/sidebar-alert.tpl"
                            sidebarAlertIconClass="ls-exclamation-circle text-primary"
                            sidebarAlertTitle=$lang['alert']['integration_available']['title']
                            sidebarAlertDesc="`$lang['alert']['integration_available']['desc']`<br/> `$lang['alert']['integration_available']['desc2']`"
                            sidebarAlertActions="newIntegrationImport"
                            integrationType=$integratonType
                            sidebarAlertHideable=true
                            sidebarAlertHideableId="lagomIntegration-`$integratonType`-`$integrationVersion`"
                        }
                    {/if}    
                {/if}

                {* SAMPLE ALERTS
                    <div class="list-group__item ">
                        <div class="list-group__item-title p-d"><i class="ls ls ls-check text-success"></i>Success Message</div>
                        <div class="list-group__item-desc p-sm">We’ll let you know when we get messages for you.</div>
                        <div class="list-group__item-action">
                            <button class="btn btn--secondary btn--notification">Learn More</button>
                            <button class="btn btn--notification btn--default btn--outline">Dismiss</button>
                            <span class="date p-xs">2023-07-20 16:23:00</span>
                        </div>
                    </div>
                    <div class="list-group__item ">
                        <div class="list-group__item-title p-d"><i class="ls ls-text-cloud text-warning"></i>Success Message</div>
                        <div class="list-group__item-desc p-sm">We’ll let you know when we get messages for you.</div>
                        <div class="list-group__item-action">
                            <button class="btn btn--notification btn--default btn--outline">Dismiss</button>
                            <span class="date p-xs">2023-07-20 16:23:00</span>
                        </div>
                    </div>
                    <div class="list-group__item ">
                        <div class="list-group__item-title p-d"><i class="ls ls-text-cloud text-warning"></i>Success Message</div>
                        <div class="list-group__item-desc p-sm">We’ll let you know when we get messages for you.</div>
                        <div class="list-group__item-action">
                            <button class="btn btn--notification btn--default btn--outline">Dismiss</button>
                            <span class="date p-xs">2023-07-20 16:23:00</span>
                        </div>
                    </div>
                    <div class="list-group__item ">
                        <div class="list-group__item-title p-d"><i class="ls ls-text-cloud text-warning"></i>Success Message</div>
                        <div class="list-group__item-desc p-sm">We’ll let you know when we get messages for you.</div>
                        <div class="list-group__item-action">
                            <button class="btn btn--notification btn--default btn--outline">Dismiss</button>
                            <span class="date p-xs">2023-07-20 16:23:00</span>
                        </div>
                    </div>
                *}
            </div>
        </div>
        <div class="section__footer">
            <button class="btn btn--link btn--default is-hidden" data-app-sidebar-alert-hide>
                <span class="btn__text">Hide Non-Important Alerts</span>
            </button>
            <button class="btn btn--link btn--default is-hidden" data-app-sidebar-alert-show>
                <span class="btn__text">Show Hidden Alerts</span>
            </button>
        </div>    
    </div>
</div>