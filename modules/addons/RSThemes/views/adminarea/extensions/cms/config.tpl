{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/extensions/cms/includes/breadcrumbs.tpl"}
{/block}

{block name="template-tabs"}
    {include file="adminarea/extensions/cms/includes/tabs.tpl"}
{/block}

{block name="template-content"}
    <div class="block">
        <div class="block__body">
            <div class="section">
                <h3 class="section__title">
                    Settings
                    {include file="adminarea/includes/helpers/docs.tpl" link=$extension->getDocs()->extension['settings']}
                </h3>
                <div class="panel">
                    <form id="cmsSave" action="{$helper->url('Template@extension',['templateName' => $template->getMainName(), 'extension' => $extension->getLinkName(), 'exaction' => "save"])}" method="POST">
                        <div class="form-group">
                            <label class="form-label">
                                History limit
                                {if $extension->getTooltips()->extension['settings']['history_limit']['content']}
                                    {if isset($extension->getTooltips()->extension['settings']['history_limit']['url']) && $extension->getTooltips()->extension['settings']['history_limit']['url'] != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$extension->getTooltips()->extension['settings']['history_limit']['url']}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include 
                                        file="adminarea/includes/helpers/popover.tpl" 
                                        popoverClasses="notification__popover "
                                        popoverBody="{$extension->getTooltips()->extension['settings']['history_limit']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                            </label>
                            <input class="form-control" type="text" name="config[history_limit]" value="{$extension->getHistoryLimit()}"/>
                        </div>
                        <div class="collapse-toggle">
                            <label class="d-flex align-items-center w-100">
                                <span class="form-label m-b-0x">
                                {$lang.settings.section.general.menu_cache_disable.title}
                                {if isset($tooltips.settings.general.menu_cache_disable.title)}
                                    {if isset($tooltips.settings.general.menu_cache_disable.url) && $tooltips.settings.general.menu_cache_disable.url != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.general.menu_cache_disable.url}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include
                                    file="adminarea/includes/helpers/popover.tpl"
                                    popoverClasses="notification__popover"
                                    popoverBody="{$tooltips.settings.general.menu_cache_disable.title}"
                                    popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                                </span>
                            
                                <div class="switch m-l-a" data-toggle="lu-collapse" data-target="#menu_cache_disabled" aria-expanded="true">
                                    <input type="hidden" name="settings[menu_cache_disabled]" value="disabled"/>
                                    <input class="switch__checkbox"
                                           name="settings[menu_cache_disabled]" value="1"
                                           type="checkbox" {if $extension->getMenuCacheDisabled() == "1" } checked="checked" {/if}>
                                    <span class="switch__container">
                                        <span class="switch__handle"></span>
                                    </span>
                                </div>
                            </label>
                        </div>
                        <div class="collapse {if $extension->getMenuCacheDisabled() == "1"} show {/if}" id="menu_cache_disabled">
                            <div class="well m-t-1x m-b-0x">
                                <div class="form-group m-b-0x">
                                    <label class="form-label text-default">
                                        {$lang.settings.section.general.menu_cache_disable.label}
                                    </label>
                                    <select class="form-control selectized opacity-1" name="settings[menu_cache_disabled_menu]" tabindex="-1">
                                        <option value="all" {if $extension->getMenuCacheDisabledMenu() != 'secondary' && $extension->getMenuCacheDisabledMenu() != 'primary'} selected {/if}>{$lang.settings.section.general.menu_cache_disable.all}</option>
                                        <option value="primary" {if $extension->getMenuCacheDisabledMenu() == 'primary'} selected {/if}>{$lang.settings.section.general.menu_cache_disable.primary}</option>
                                        <option value="secondary" {if $extension->getMenuCacheDisabledMenu() == 'secondary'} selected {/if}>{$lang.settings.section.general.menu_cache_disable.secondary}</option>
                                    </select>
                                </div>
                            </div>    
                        </div>
                        <div class="form-group m-t-2x m-b-0x">
                             <label class="d-flex align-items-center w-100">
                                <span class="form-label m-b-0x">
                                    Disable Captcha on CMS Pages
                                    {if $extension->getTooltips()->extension['settings']['disable_captcha']['content']}
                                        {if isset($extension->getTooltips()->extension['settings']['disable_captcha']['url']) && $extension->getTooltips()->extension['settings']['disable_captcha']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$extension->getTooltips()->extension['settings']['disable_captcha']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover "
                                            popoverBody="{$extension->getTooltips()->extension['settings']['disable_captcha']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </span>
                                <div class="switch m-l-a">
                                    <input type="hidden" name="settings[cms_disable_captcha]" value="0"/>
                                    <input class="switch__checkbox"
                                           name="settings[cms_disable_captcha]" value="1"
                                           type="checkbox" {if $extension->getCaptchaDisabled() == "1" } checked="checked" {/if}>
                                    <span class="switch__container">
                                        <span class="switch__handle"></span>
                                    </span>
                                </div>
                            </label>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="block__sidebar info-sidebar-block info-sidebar-block--cms">
            <div class="widget widget--lg">
                <a class="widget__media has-overlay info-sidebar-widget">
                    {include file="adminarea/info/includes/sidebar-logo-lagom-2.tpl"}
                    {include file="adminarea/info/includes/sidebar-lines.tpl"}
                </a>
            </div>
        </div>
    </div>
{/block}

{block name="template-actions"}
    {* 7. Actions *}
    <div class="app-main__actions app-main__actions--support">
        <div class="container">
            <div class="d-flex justify-space-between w-100">
                <div>
                    <button class="btn {if $template->getVersion()|intval >= 2}btn--primary{else}btn--success{/if}" form="cmsSave">
                        <span class="btn__text">Save Changes</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
{/block}