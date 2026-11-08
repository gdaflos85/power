<div class="tab-pane {if $smarty.get.tab == 'optimization'}is-active{/if}" id="settings-optimization">
    <div class="section">
        <div class="section__header">
            <h3 class="section__title">
                Website optimization
                {include file="adminarea/includes/helpers/docs.tpl" link=$cms_docs->pages['website_optimization']}
            </h3>
            
        </div>
        <div class="section__content">

            <div class="panel panel--collapse">
                <div class="collapse-toggle">
                    <h6 class="top__title">
                        Website Security Headers
                    </h6>
                </div>
                <div class="collapse show" data-website-security-headers>
                    <div class="form-group d-flex align-items-center p-b-0x" data-x-frame-options data-ajax-url="{$whmcsURL}/modules/addons/RSThemes/src/Api/adminApi.php?controller=CmsApi&method=xFrameOptionsValidate">
                        <span class="form-label text-default m-w-240 m-r-1x m-b-0x">
                            X-Frame-Options:
                            {if $cms_tooltips->pages['optimize']['security_headers']['x_frame_options']['content']}
                                {if isset($cms_tooltips->pages['optimize']['security_headers']['x_frame_options']['url']) && $cms_tooltips->pages['optimize']['security_headers']['x_frame_options']['url'] != ""}
                                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->pages['optimize']['security_headers']['x_frame_options']['url']}' target='_blank'>Learn More</a>"}
                                {else}
                                    {assign var="popoverFooter" value=false}
                                {/if}
                                {include
                                file="adminarea/includes/helpers/popover.tpl"
                                popoverClasses="notification__popover"
                                popoverBody="{$cms_tooltips->pages['optimize']['security_headers']['x_frame_options']['content']}"
                                popoverFooter="{$popoverFooter}"
                                }
                            {/if}
                        </span>
                        <span data-x-frame-options-status-container>
                            <span data-x-frame-options-status="unsecure" class="text-danger is-hidden"><i class="ls ls-close text-danger"></i>Disabled</span>
                            <span data-x-frame-options-status="secure" class="text-success is-hidden"><i class="ls ls-check text-success"></i>Enabled</span>
                            <span data-x-frame-options-status="unknown" class="text-faded is-hidden"><i class="text-faded ls ls-denial"></i>Unknown</span>
                        </span>
                        <span data-x-frame-options-loader class="preloader preloader--sm"></span>
                        <button class="btn btn-primary btn--refresh is-hidden" type="button" data-x-frame-options-refresh>
                            <i class="btn-icon ls ls-refresh"></i>
                            Refresh
                        </button>
                    </div>
                    <form data-header-policy-options data-ajax-url="{$whmcsURL}/modules/addons/RSThemes/src/Api/adminApi.php?controller=CmsApi&method=headerOptionsSave" data-alert-text-sucess="{$lang.general.changes_saved}" data-alert-text-error="{$lang.general.changes_saved_error}">
                        {* <div class="form-group p-b-0x p-t-2x">
                            <label class="form-label d-inline-flex is-pointer">
                                <span class="m-r-3x">Content-Security-Policy</span>
                                <div class="switch switch--success">
                                    <input type="hidden" name="optimizator[csp]" value="0" />
                                    <input class="switch__checkbox" data-option name="optimizator[csp]" value="1" type="checkbox" data-show-icon-tabs {if \RSThemes\Controller\Admin\CustomPageController::checkOptimizeSetting("header_content_security_policy_enabled") == 1} checked {/if}>
                                    <span class="switch__container">
                                        <span class="switch__handle"></span>
                                    </span>
                                </div>
                            </label>
                        </div> *}
                        <div class="form-group p-t-2x">
                            <label class="form-label d-inline-flex is-pointer">
                                <span class="m-w-240 m-r-1x d-flex align-items-center">
                                    Referrer Policy
                                    {if $cms_tooltips->pages['optimize']['security_headers']['referrer_policy']['content']}
                                        {if isset($cms_tooltips->pages['optimize']['security_headers']['referrer_policy']['url']) && $cms_tooltips->pages['optimize']['security_headers']['referrer_policy']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->pages['optimize']['security_headers']['referrer_policy']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include
                                        file="adminarea/includes/helpers/popover.tpl"
                                        popoverClasses="notification__popover"
                                        popoverBody="{$cms_tooltips->pages['optimize']['security_headers']['referrer_policy']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </span>
                                <div class="switch switch--success">
                                    <input type="hidden" name="optimizator[rp]" value="0" />
                                    <input class="switch__checkbox" name="optimizator[rp]" data-option value="1" type="checkbox" data-show-icon-tabs {if \RSThemes\Controller\Admin\CustomPageController::checkOptimizeSetting("header_origin_enabled") == 1} checked {/if}>
                                    <span class="switch__container">
                                        <span class="switch__handle"></span>
                                    </span>
                                </div>
                            </label>
                        </div>
                    </form>
                </div>
            </div>

            <div class="panel panel--collapse" data-optimize-media-quality data-ajax-url="{$whmcsURL}/modules/addons/RSThemes/src/Api/adminApi.php?controller=MediaApi&method=optimizedImagesStatus">
                <div class="collapse-toggle">
                    <h6 class="top__title">
                        Optimize Media Quality
                    </h6>
                    <label data-optimize-media-quality-toggle>
                        <div class="switch {if \RSThemes\Controller\Admin\CustomPageController::checkOptimizeSetting("image_optimize_status") != "1"}collapsed{/if}" >
                            <input type="hidden" name="optimize_enabled" value="0">
                            <input class="switch__checkbox" name="optimize_enabled" value="1"  type="checkbox" {if \RSThemes\Controller\Admin\CustomPageController::checkOptimizeSetting("image_optimize_status") == "1"}checked{/if}>
                            <span class="switch__container">
                                <span class="switch__handle"></span>
                            </span>
                        </div>
                    </label> 
                </div>
                <div class="collapse {if \RSThemes\Controller\Admin\CustomPageController::checkOptimizeSetting("image_optimize_status") == "1"}show{/if}" id="optimize-images" data-optimizemedia-quality-collapse>
                    <div class="form-group d-flex align-items-center p-b-2x p-t-3x p-h-3x m-b-0x">
                        <label class="form-label m-w-240 m-r-1x m-b-0x">Image Quality:
                            {if $cms_tooltips->pages['optimize']['media_quality']['image_quality']['content']}
                                {if isset($cms_tooltips->pages['optimize']['media_quality']['image_quality']['url']) && $cms_tooltips->pages['optimize']['media_quality']['image_quality']['url'] != ""}
                                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->pages['optimize']['media_quality']['image_quality']['url']}' target='_blank'>Learn More</a>"}
                                {else}
                                    {assign var="popoverFooter" value=false}
                                {/if}
                                {include 
                                    file="adminarea/includes/helpers/popover.tpl" 
                                    popoverClasses="notification__popover"
                                    popoverBody="{$cms_tooltips->pages['optimize']['media_quality']['image_quality']['content']}"
                                    popoverFooter="{$popoverFooter}"
                                }
                            {/if}
                        </label>
                        <select class="form-control form-control--sm" name="optimize" data-optimize-media-quality-select>
                            <option {if \RSThemes\Controller\Admin\CustomPageController::checkOptimizeSetting("image_optimize_percent") == 0}selected{/if} value="0">Off</option>
                            <option {if \RSThemes\Controller\Admin\CustomPageController::checkOptimizeSetting("image_optimize_percent") == 90}selected{/if} value="90">90%</option>
                            <option {if \RSThemes\Controller\Admin\CustomPageController::checkOptimizeSetting("image_optimize_percent") == 80}selected{/if} value="80">80%</option>
                            <option {if \RSThemes\Controller\Admin\CustomPageController::checkOptimizeSetting("image_optimize_percent") == 70}selected{/if} value="70">70%</option>
                            <option {if \RSThemes\Controller\Admin\CustomPageController::checkOptimizeSetting("image_optimize_percent") == 60}selected{/if} value="60">60%</option>
                            <option {if \RSThemes\Controller\Admin\CustomPageController::checkOptimizeSetting("image_optimize_percent") == 50}selected{/if} value="50">50%</option>
                            <option {if \RSThemes\Controller\Admin\CustomPageController::checkOptimizeSetting("image_optimize_percent") == 40}selected{/if} value="40">40%</option>
                            <option {if \RSThemes\Controller\Admin\CustomPageController::checkOptimizeSetting("image_optimize_percent") == 30}selected{/if} value="30">30%</option>
                            <option {if \RSThemes\Controller\Admin\CustomPageController::checkOptimizeSetting("image_optimize_percent") == 20}selected{/if} value="20">20%</option>
                            <option {if \RSThemes\Controller\Admin\CustomPageController::checkOptimizeSetting("image_optimize_percent") == 10}selected{/if} value="10">10%</option>
                        </select>
                        <button
                                class="btn btn--sm btn--primary m-l-3x"
                                type="button"
                                data-toggle="lu-modal"
                                data-backdrop="static"
                                data-keyboard="false"
                                data-target="#optimize-media-modal"
                        >
                            Optimize
                        </button>
                    </div>
                    <ul class="list list--info p-h-3x p-b-3x is-hidden" data-optimize-media-quality-results>
                        <li class="list__item">
                            <span class="list__item-label">
                                Total size before optimization:
                            </span>
                            <span class="list__item-value" data-optimize-media-quality-results-before>
                                
                            </span>
                        </li>
                        <li class="list__item">
                            <span class="list__item-label">
                                Total size after optimization:
                            </span>
                            <span class="list__item-value" data-optimize-media-quality-results-after>
                                
                            </span>
                        </li>
                        <li class="list__item">
                            <span class="list__item-label">
                                Total size saved:
                            </span>
                            <span class="list__item-value" data-optimize-media-quality-results-saved>
                                
                            </span>
                        </li>
                    </ul>
                </div>
            </div>
            
            {assign var="disableCacheConfigName" value="{\RSThemes\Helpers\AddonHelper::getCurrentTemplate()}_disable_section_cache"}
            <div class="panel panel--collapse" data-cache-history>
                <form class="collapse-toggle" data-enable-section-cache data-ajax-url="{$whmcsURL}/modules/addons/RSThemes/src/Api/adminApi.php?controller=CmsApi&method=cacheSave" data-alert-text-sucess="{$lang.general.changes_saved}" data-alert-text-error="{$lang.general.changes_saved_error}">
                    <h6 class="top__title">
                        Section Cache
                        {if $cms_tooltips->pages['cache']['enable']['content']}
                            {if isset($cms_tooltips->pages['cache']['enable']['url']) && $cms_tooltips->pages['cache']['enable']['url'] != ""}
                                {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->pages['cache']['enable']['url']}' target='_blank'>Learn More</a>"}
                            {else}
                                {assign var="popoverFooter" value=false}
                            {/if}
                            {include
                            file="adminarea/includes/helpers/popover.tpl"
                            popoverClasses="notification__popover"
                            popoverBody="{$cms_tooltips->pages['cache']['enable']['content']}"
                            popoverFooter="{$popoverFooter}"
                            }
                        {/if}
                    </h6>
                    <label data-enable-section-cache-toggle>
                        <div class="switch switch--success">
                            <input type="hidden" name="disablecache" value="1" />
                            <input data-enable-section-cache-input class="switch__checkbox" name="disablecache" value="0" type="checkbox" {if !\RSThemes\Models\Settings::getValue($disableCacheConfigName)} checked {/if}>
                            <span class="switch__container">
                                <span class="switch__handle"></span>
                            </span>
                        </div>
                    </label> 
                </form>
            </div>
        </div>
    </div>
</div>