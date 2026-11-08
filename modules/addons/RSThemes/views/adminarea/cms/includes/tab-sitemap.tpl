<div class="tab-pane {if $smarty.get.tab == 'sitemap'}is-active{/if}" id="settings-sitemap">
    <form id="sitemapForm" method="post" action="{$helper->url("Template@sitemapSave",['templateName'=>$template->getMainName()])}">
        <div class="section">
            <div class="section__header">
                <h3 class="section__title">
                    Sitemap Manager
                    {include file="adminarea/includes/helpers/docs.tpl" link=$cms_docs->pages['sitemap_manager']}
                </h3>
            </div>
            <div class="">
                <div class="panel panel--collapse col-sm-12">
                    <div class="collapse-toggle">
                        <h6 class="top__title">
                            Sitemap
                        </h6>
                    </div>
                    <div  class="collapse show">
                        <div class="form-group d-flex p-h-3x p-b-2x p-t-3x">
                            <span class="form-label text-default m-w-240 m-r-1x m-b-0x">
                                Enable Sitemap
                                {if $cms_tooltips->pages['sitemap']['sitemap']['enable']['content']}
                                    {if isset($cms_tooltips->pages['sitemap']['sitemap']['enable']['url']) && $cms_tooltips->pages['sitemap']['sitemap']['enable']['url'] != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->pages['sitemap']['sitemap']['enable']['url']}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include 
                                        file="adminarea/includes/helpers/popover.tpl" 
                                        popoverClasses="notification__popover"
                                        popoverBody="{$cms_tooltips->pages['sitemap']['sitemap']['enable']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                            </span>
                            <label>
                                <div class="switch switch--primary">
                                    <input type="hidden" name="enabled" value="0"/>
                                    <input class="switch__checkbox" id="sitemap_enable_disable" name="enabled" value="1" type="checkbox" {if $sitemap->enabled}checked="checked"{/if}>
                                    <span class="switch__container"><span class="switch__handle"></span></span>
                                </div>
                            </label>
                        </div>
                        <div class="form-group p-h-3x p-t-1x" {if !$sitemap->enabled}style="display:none;"{/if} id="sitemap_enable_disable_buttons">
                            <button type="button" class="btn btn--primary m-r-1x" onclick="submitSitemap('{$helper->url("Template@sitemapGen",['templateName'=>$template->getMainName()])}')">Generate Sitemap</button>
                            <button type="button" class="btn btn--secondary" onclick="submitSitemap('{$helper->url("Template@sitemapPreview",['templateName'=>$template->getMainName()])}','_blank')">Preview Sitemap</button>
                            {if $sitemapUpdate}
                                <p class="p-sm m-t-2x m-b-0x"><span class="text-faded">Last Updated:</span> {date("jS \of  F Y H:i",$sitemapUpdate)}</p>
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel--collapse col-sm-12">
                <div class="collapse-toggle">
                    <h6 class="top__title">
                        Settings
                    </h6>
                </div>
                <div class="collapse show">
                    <div class="form-group d-flex p-h-3x p-b-1x p-t-3x">
                        <span class="form-label text-default m-w-240 m-r-1x m-b-0x">
                            Include in robots.txt
                           {if $cms_tooltips->pages['sitemap']['settings']['include_robots']['content']}
                                {if isset($cms_tooltips->pages['sitemap']['settings']['include_robots']['url']) && $cms_tooltips->pages['sitemap']['settings']['include_robots']['url'] != ""}
                                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->pages['sitemap']['settings']['include_robots']['url']}' target='_blank'>Learn More</a>"}
                                {else}
                                    {assign var="popoverFooter" value=false}
                                {/if}
                                {include 
                                    file="adminarea/includes/helpers/popover.tpl" 
                                    popoverClasses="notification__popover"
                                    popoverBody="{$cms_tooltips->pages['sitemap']['settings']['include_robots']['content']}"
                                    popoverFooter="{$popoverFooter}"
                                }
                            {/if}
                        </span>
                        <label>
                            <div class="switch switch--primary">
                                <input type="hidden" name="" value="0"/>
                                <input class="switch__checkbox" name="robots" value="1" type="checkbox" {if $sitemap->robots}checked="checked"{/if}>
                                <span class="switch__container"><span class="switch__handle"></span></span>
                            </div>
                        </label>
                    </div>
                    {*<div class="form-group d-flex p-h-3x p-v-1x">
                        <span class="form-label text-default form-text m-r-7x m-b-0x m-w-170">Pages<i class="ls ls-info-circle m-l-1x" data-toggle="lu-tooltip" data-title="Enable sitemap tooltip"></i></span>
                        <label class="checkbox m-t-0x">
                            <input id="selectAll" class="form-checkbox" type="checkbox" name="allSites" value="1" {if $sitemap->allSites}checked="checked"{/if}>
                            <span class="form-indicator"></span>
                            <span class="form-text m-l-1x">Include All Page Types</span>
                        </label>
                    </div>
                    <div class="form-group d-flex p-h-3x p-v-0x">
                        <span class="form-label text-default form-text m-r-7x m-b-0x m-w-170"></span>
                        <div class="check-group d-flex p-v-2x m-v-1x">
                            <div class="form-group p-0x m-r-2x m-l-2x">
                                <label class="checkbox m-t-0x">
                                    <input class="form-checkbox pages_element" type="checkbox" name="pages[website]" value="website" {if $sitemap->allSites || $sitemap->pages->website}checked="checked"{/if}>
                                    <span class="form-indicator"></span>
                                    <span class="form-text m-l-1x">Website Pages</span>
                                </label>
                            </div>
                            {foreach $categories as $key => $category}
                                <div class="form-group p-0x m-r-2x">
                                    <label class="checkbox m-t-0x">
                                        <input class="form-checkbox pages_element" type="checkbox" name="pages[{$category}]" value="{$category}" {if $sitemap->allSites || $sitemap->pages->$category}checked="checked"{/if}>
                                        <span class="form-indicator"></span>
                                        <span class="form-text m-l-1x">{ucfirst($category)}</span>
                                    </label>
                                </div>
                            {/foreach}
                        </div>
                    </div>*}

                    <div class="form-group d-flex p-h-3x p-t-1x p-b-3x">
                        <span class="form-label text-default m-w-240 m-r-1x m-b-0x">
                            Frequency
                            {if $cms_tooltips->pages['sitemap']['settings']['frequency']['content']}
                                {if isset($cms_tooltips->pages['sitemap']['settings']['frequency']['url']) && $cms_tooltips->pages['sitemap']['settings']['frequency']['url'] != ""}
                                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->pages['sitemap']['settings']['frequency']['url']}' target='_blank'>Learn More</a>"}
                                {else}
                                    {assign var="popoverFooter" value=false}
                                {/if}
                                {include 
                                    file="adminarea/includes/helpers/popover.tpl" 
                                    popoverClasses="notification__popover"
                                    popoverBody="{$cms_tooltips->pages['sitemap']['settings']['frequency']['content']}"
                                    popoverFooter="{$popoverFooter}"
                                }
                            {/if}
                        </span>
                        <select class="form-control selectized m-w-250" name="frequency" style="opacity: 1; display: none;" tabindex="-1">
                            <option value="always" {if $sitemap->frequency == "always"}selected{/if}>always</option>
                            <option value="hourly" {if $sitemap->frequency == "hourly"}selected{/if}>hourly</option>
                            <option value="daily" {if $sitemap->frequency == "daily"}selected{/if}>daily</option>
                            <option value="weekly" {if $sitemap->frequency == "weekly"}selected{/if}>weekly</option>
                            <option value="monthly" {if $sitemap->frequency == "monthly"}selected{/if}>monthly</option>
                            <option value="yearly" {if $sitemap->frequency == "yearly"}selected{/if}>yearly</option>
                            <option value="never" {if $sitemap->frequency == "never"}selected{/if}>never</option>
                        </select>
                    </div>
                    
                    <div class="form-group d-flex align-items-start p-h-3x p-v-1x">
                        <input type="hidden" name="pages[website]" value="website">
                        <span class="form-label text-default m-w-240 m-r-1x m-b-0x">
                            Include Additional Pages
                            {if $cms_tooltips->pages['sitemap']['settings']['include_sitemap_pages']['content']}
                                {if isset($cms_tooltips->pages['sitemap']['settings']['include_sitemap_pages']['url']) && $cms_tooltips->pages['sitemap']['settings']['include_sitemap_pages']['url'] != ""}
                                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->pages['sitemap']['settings']['include_sitemap_pages']['url']}' target='_blank'>Learn More</a>"}
                                {else}
                                    {assign var="popoverFooter" value=false}
                                {/if}
                                {include 
                                    file="adminarea/includes/helpers/popover.tpl" 
                                    popoverClasses="notification__popover"
                                    popoverBody="{$cms_tooltips->pages['sitemap']['settings']['include_sitemap_pages']['content']}"
                                    popoverFooter="{$popoverFooter}"
                                }
                            {/if}
                        </span>
                        <div class="d-flex flex-column">
                            <label class="checkbox d-flex m-t-0x is-pointer">
                                <input class="form-checkbox" type="checkbox" name="productGroups" value="1" {if $sitemap->productGroups}checked="checked"{/if}>
                                <span class="form-indicator"></span>
                                <span class="form-text m-l-1x">Product Group Pages</span>
                            </label>
                            <label class="checkbox d-flex m-t-0x is-pointer">
                                <input class="form-checkbox" type="checkbox" name="announcements" value="1" {if $sitemap->announcements}checked="checked"{/if}>
                                <span class="form-indicator"></span>
                                <span class="form-text m-l-1x">Announcement Articles Pages</span>
                            </label>
                            <label class="checkbox d-flex m-t-0x is-pointer">
                                <input class="form-checkbox" type="checkbox" name="knowledgebase" value="1" {if $sitemap->knowledgebase}checked="checked"{/if}>
                                <span class="form-indicator"></span>
                                <span class="form-text m-l-1x">Knowledgebase Categories and Articles Pages</span>
                            </label>
                            <label class="checkbox d-flex m-t-0x is-pointer">
                                <input class="form-checkbox" type="checkbox" name="downloads" value="1" {if $sitemap->downloads}checked="checked"{/if}>
                                <span class="form-indicator"></span>
                                <span class="form-text m-l-1x">Download Categories Pages</span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group d-flex p-h-3x p-t-1x p-b-3x is-hidden">
                        <span class="form-label text-default m-w-240 m-r-1x m-b-0x">
                            Update
                            {if $cms_tooltips->pages['sitemap']['settings']['update']['content']}
                                {if isset($cms_tooltips->pages['sitemap']['settings']['update']['url']) && $cms_tooltips->pages['sitemap']['settings']['update']['url'] != ""}
                                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->pages['sitemap']['settings']['update']['url']}' target='_blank'>Learn More</a>"}
                                {else}
                                    {assign var="popoverFooter" value=false}
                                {/if}
                                {include 
                                    file="adminarea/includes/helpers/popover.tpl" 
                                    popoverClasses="notification__popover"
                                    popoverBody="{$cms_tooltips->pages['sitemap']['settings']['update']['content']}"
                                    popoverFooter="{$popoverFooter}"
                                }
                            {/if}
                        </span>
                        <select class="form-control selectized m-w-250" name="update" style="opacity: 1; display: none;" tabindex="-1">
                            <option value="hourly" {if $sitemap->update == "hourly"}selected{/if}>hourly</option>
                            <option value="daily" {if $sitemap->update == "daily"}selected{/if}>daily</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-actions p-t-2x">
                <button type="submit" class="btn btn--primary" onclick="submitSitemap('{$helper->url("Template@sitemapSave",['templateName'=>$template->getMainName()])}')">Save Changes</button>
            </div>
        </div>
    </form>
    {literal}
        <script>
            function submitSitemap(url,blank="")
            {
                $('#sitemapForm').attr('action',url);
                $('#sitemapForm').attr('target',blank)
                $('#sitemapForm').submit();
            }
                
            $("#sitemap_enable_disable").click(function() {
                if($(this).is(":checked")) {
                    $("#sitemap_enable_disable_buttons").show(500);
                } else {
                    $("#sitemap_enable_disable_buttons").hide(500);
                }
            });
        </script>
    {/literal}
</div>