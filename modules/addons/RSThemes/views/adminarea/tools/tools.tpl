{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/includes/breadcrumb.tpl"} 
{/block}

{block name="template-tabs"}
    {include file="adminarea/includes/tabs.tpl"} 
{/block}

{block name="template-content"}
    <div class="section">    
        <h3 class="section__title">Service Tools</h3>
        <div class="section__body">
            <div class="panel d-flex align-items-center">
                <div class="panel__body">
                    <h6>Restore Default Menus</h6>
                    <p class="text-gray m-b-0x">Restore default settings for all navigation menus, <b>ONLY</b> for currently selected <a href="https://lagom.rsstudio.net/docs/website-builder/display-rules/#display-rule" target="_blank">"Display Rule"</a>.</p>
                </div>  
                <div class="p-l-3x m-l-a panel__actions">
                    <button
                        class="btn btn--primary"
                        type="button"
                        data-toggle="lu-modal"
                        data-backdrop="static"
                        data-keyboard="false"
                        data-target="#reimport-menu"
                    >
                        Restore
                    </button>
                </div>  
            </div>
        </div>
        <div class="panel d-flex align-items-center">
            <div class="panel__body">
                <h6>Product Pricing Cache</h6>
                <p class="text-gray m-b-0x">Clear pricing cache stored in Lagom database. Action may be required if pricing shown in Lagom pages has not been automatically updated. <a href="https://lagom.rsstudio.net/docs/website-builder/caching/#pricing-cache" target="_blank">Learn more..</a></p>
            </div>
            <div class="p-l-3x m-l-a panel__actions">
                <button
                        class="btn btn--primary"
                        type="button"
                        data-toggle="lu-modal"
                        data-backdrop="static"
                        data-keyboard="false"
                        data-target="#refresh-product-pricing-cache"
                >
                    Refresh
                </button>
            </div>
        </div>
        <div class="panel d-flex align-items-center">
            <div class="panel__body">
                <h6>Refresh Cache Key for CSS & JS</h6>
                <p class="text-gray m-b-0x">Genereates a unique hash to CSS and JS files, ensuring the latest versions are loaded by bypassing server cache.</p>
            </div>
            <div class="p-l-3x m-l-a panel__actions">
                <button
                    class="btn btn--primary"
                    type="button"
                    data-ajax-url="/modules/addons/RSThemes/src/Api/adminApi.php?controller=QuickApi&method=resetCacheKey"
                    data-reset-cache-key
                    data-success-text="Cache Key was refreshed successfully"
                >
                    <span class="btn__text">Refresh</span>
                    <span class="btn__preloader preloader"></span>
                </button>
            </div>
        </div>
        {if $template->getActiveDisplay()->name == 'CMS'}
            <div class="panel d-flex align-items-center">
                <div class="panel__body">
                    <h6>Menu Cache</h6>
                    <p class="text-gray m-b-0x">Clear main navigation cache stored in Lagom database. Action may be required if main navigation won't be automatically updated on your website. <a href="https://lagom.rsstudio.net/docs/website-builder/caching/#main-navigation-caching" target="_blank">Learn more..</a></p>
                </div>
                <div class="p-l-3x m-l-a panel__actions">
                    <button
                            class="btn btn--primary"
                            type="button"
                            data-toggle="lu-modal"
                            data-backdrop="static"
                            data-keyboard="false"
                            data-target="#refresh-menu-cache"
                    >
                        Refresh
                    </button>
                </div>
            </div>
            <div class="panel d-flex align-items-center">
                <div class="panel__body">
                    <h6>Section Cache</h6>
                    <p class="text-gray m-b-0x">Clear CMS section cache stored in Lagom database. Action may be required if CMS page content has not been automatically updated. <a href="https://lagom.rsstudio.net/docs/website-builder/caching/#page-sections-caching" target="_blank">Learn more..</a></p>
                </div>
                <div class="p-l-3x m-l-a panel__actions">
                    <button
                            class="btn btn--primary"
                            type="button"
                            data-toggle="lu-modal"
                            data-backdrop="static"
                            data-keyboard="false"
                            data-target="#refresh-section-cache"
                    >
                        Refresh
                    </button>
                </div>
            </div>
            {if $isNginx}
                <div class="panel d-flex align-items-center">
                    <div class="panel__body">
                        <h6>NGINX .htaccess Generator Tool</h6>
                        <p class="text-gray m-b-0x">Automatically updates NGINX rewrite rules when pages are modified. This tool manages backups of your current configurations, applies new settings, and verifies the NGINX configuration. <a href="https://lagom.rsstudio.net/docs/website-builder/installation/#nginx-server" target="_blank">Learn more..</a></p>
                    </div>
                    <div class="p-l-3x m-l-a panel__actions">
                        <button
                                class="btn btn--primary"
                                type="button"
                                data-toggle="lu-modal"
                                data-backdrop="static"
                                data-keyboard="false"
                                data-target="#generate-nginx-htaccess"
                        >
                            Generate
                        </button>
                    </div>
                </div>
            {/if}
        {/if}
    </div>
{/block}

{block name="template-modals"}
    {include file="adminarea/includes/modals/refresh-product-pricing-cache.tpl"}
    {include file="adminarea/includes/modals/reimport-menu.tpl"}
    {if $template->getActiveDisplay()->name == 'CMS'}
        {include file="adminarea/includes/modals/refresh-menu-cache.tpl"}
        {include file="adminarea/includes/modals/refresh-section-cache.tpl"}
        {if $isNginx}
            {include file="adminarea/includes/modals/generate-nginx-htaccess.tpl"}
        {/if}    
    {/if}    
{/block}

{block name="template-scripts"}
    <script type="text/javascript" src="{$helper->script('service-tools.js')}?v={$template->getRSThemesVersion()}"></script>
{/block}
