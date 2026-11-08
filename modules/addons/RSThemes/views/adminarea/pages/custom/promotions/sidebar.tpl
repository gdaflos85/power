{*Promotion Display Time*}
<div class="widget panel of-visible">
    <label class="widget__top top">
        <div class="top__title">
            Promotion Display Time
        </div>
        <div class="top__actions">
            <div class="switch" data-toggle="lu-collapse" data-target="#promotion-display-time">
                <input type="hidden" name="settings[promo][promotionDisplayTimeEnabled]" value="0">
                <input class="switch__checkbox" name="settings[promo][promotionDisplayTimeEnabled]" value="1" type="checkbox" {if $customPage->settings['promo']['promotionDisplayTimeEnabled']} checked {/if}>
                <span class="switch__container"><span class="switch__handle"></span></span>
            </div>
        </div>
    </label>
    <div class="widget__body widget__body--seo collapse{if $customPage->settings['promo']['promotionDisplayTimeEnabled']} show{/if}" id="promotion-display-time">
        <div class="widget__content">
            <div class="form-group">
                <label class="form-label">
                    Start Date
                    {if $cms_tooltips->page['settings']['promotion']['display_time']['start_date']['content']}
                        {if isset($cms_tooltips->page['settings']['promotion']['display_time']['start_date']['url']) && $cms_tooltips->page['settings']['promotion']['display_time']['start_date']['url'] != ""}
                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->page['settings']['promotion']['display_time']['start_date']['url']}' target='_blank'>Learn More</a>"}
                        {else}
                            {assign var="popoverFooter" value=false}
                        {/if}
                        {include 
                            file="adminarea/includes/helpers/popover.tpl" 
                            popoverClasses="notification__popover popover__top"
                            popoverBody="{$cms_tooltips->page['settings']['promotion']['display_time']['start_date']['content']}"
                            popoverFooter="{$popoverFooter}"
                        }
                    {/if}
                </label>
                <input type="datetime-local" class="form-control" name="settings[promo][promotionStartDate]" value="{if $customPage->settings['promo']['promotionStartDate']}{$customPage->settings['promo']['promotionStartDate']}{/if}">
            </div>
            <div class="form-group">
                <label class="form-label">
                    End Date
                    {if $cms_tooltips->page['settings']['promotion']['display_time']['end_date']['content']}
                        {if isset($cms_tooltips->page['settings']['promotion']['display_time']['end_date']['url']) && $cms_tooltips->page['settings']['promotion']['display_time']['end_date']['url'] != ""}
                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->page['settings']['promotion']['display_time']['end_date']['url']}' target='_blank'>Learn More</a>"}
                        {else}
                            {assign var="popoverFooter" value=false}
                        {/if}
                        {include 
                            file="adminarea/includes/helpers/popover.tpl" 
                            popoverClasses="notification__popover popover__top"
                            popoverBody="{$cms_tooltips->page['settings']['promotion']['display_time']['end_date']['content']}"
                            popoverFooter="{$popoverFooter}"
                        }
                    {/if}
                </label>
                <input type="datetime-local" class="form-control" name="settings[promo][promotionEndDate]" value="{if $customPage->settings['promo']['promotionEndDate']}{$customPage->settings['promo']['promotionEndDate']}{/if}">
            </div>
            <div data-promotion-end-date-action-container>
                <div class="form-group m-b-0x">
                    <label class="form-label">
                        Action After End Date
                        {if $cms_tooltips->page['settings']['promotion']['display_time']['action_after_end_date']['content']}
                            {if isset($cms_tooltips->page['settings']['promotion']['display_time']['action_after_end_date']['url']) && $cms_tooltips->page['settings']['promotion']['display_time']['action_after_end_date']['url'] != ""}
                                {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->page['settings']['promotion']['display_time']['action_after_end_date']['url']}' target='_blank'>Learn More</a>"}
                            {else}
                                {assign var="popoverFooter" value=false}
                            {/if}
                            {include 
                                file="adminarea/includes/helpers/popover.tpl" 
                                popoverClasses="notification__popover popover__top"
                                popoverBody="{$cms_tooltips->page['settings']['promotion']['display_time']['action_after_end_date']['content']}"
                                popoverFooter="{$popoverFooter}"
                            }
                        {/if}
                    </label>
                    <select data-promotion-end-date-action-select class="form-control" name="settings[promo][promotionEndDateAction]">
                        <option {if isset($customPage->settings['promo']['promotionEndDateAction']) && $customPage->settings['promo']['promotionEndDateAction'] == "expired_sections"}selected{/if} value="expired_sections">Display Expired Promotion Sections</option>
                        <option {if isset($customPage->settings['promo']['promotionEndDateAction']) && $customPage->settings['promo']['promotionEndDateAction'] == "whmcs_page"}selected{/if} value="whmcs_page">WHMCS Redirection</option>
                        <option {if isset($customPage->settings['promo']['promotionEndDateAction']) && $customPage->settings['promo']['promotionEndDateAction'] == "custom_url"}selected{/if} value="custom_url">Custom URL Redirection</option>
                        <option {if isset($customPage->settings['promo']['promotionEndDateAction']) && $customPage->settings['promo']['promotionEndDateAction'] == "homepage"}selected{/if} value="homepage">Homepage Redirection</option>
                    </select>
                </div>
                <div class="well m-t-2x m-b-0x {if (isset($customPage->settings['promo']['promotionEndDateAction']) && ($customPage->settings['promo']['promotionEndDateAction'] == "expired_sections" || $customPage->settings['promo']['promotionEndDateAction'] == "homepage")) || !isset($customPage->settings['promo']['promotionEndDateAction'])}is-hidden{/if}" data-promotion-end-date-action-well>
                    <div class="form-group m-b-0x {if isset($customPage->settings['promo']['promotionEndDateAction']) && $customPage->settings['promo']['promotionEndDateAction'] != "whmcs_page"}is-hidden{/if}" data-promotion-end-date-action-content="whmcs_page">
                        <label class="form-label">WHMCS Page</label>
                        <select class="form-control form-control--long-items" name="settings[promo][promotionEndDateActionWhmcs]">
                            {foreach $pages as $page}
                                <option value="{$page['name']}" {if isset($customPage->settings['promo']['promotionEndDateActionWhmcs']) && $customPage->settings['promo']['promotionEndDateActionWhmcs'] == $page['name']}selected{/if}>{$page['label']}</option>
                            {/foreach}
                        </select>
                    </div>  
                    <div class="form-group m-b-0x {if isset($customPage->settings['promo']['promotionEndDateAction']) && $customPage->settings['promo']['promotionEndDateAction'] != "custom_url"}is-hidden{/if}"  data-promotion-end-date-action-content="custom_url">
                        <label class="form-label">Custom URL</label>
                        <input class="form-control" name="settings[promo][promotionEndDateActionCustom]" value="{if isset($customPage->settings['promo']['promotionEndDateActionCustom']) && !empty($customPage->settings['promo']['promotionEndDateActionCustom'])}{$customPage->settings['promo']['promotionEndDateActionCustom']}{/if}">
                    </div>
                </div>
            </div>    
        </div>
    </div>   
</div>    
{* Promotion Layout & Style *}
<div class="widget panel of-visible">
    <label class="widget__top top">
        <div class="top__title">
            Promotion Layout & Style
        </div>
    </label>
    <div class="widget__body widget__body--seo">
        <div class="widget__content">
            <div class="form-group">
                <label class="form-label">
                    Theme
                    {if $cms_tooltips->page['settings']['promotion']['layout_style']['theme']['content']}
                        {if isset($cms_tooltips->page['settings']['promotion']['layout_style']['theme']['url']) && $cms_tooltips->page['settings']['promotion']['layout_style']['theme']['url'] != ""}
                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->page['settings']['promotion']['layout_style']['theme']['url']}' target='_blank'>Learn More</a>"}
                        {else}
                            {assign var="popoverFooter" value=false}
                        {/if}
                        {include 
                            file="adminarea/includes/helpers/popover.tpl" 
                            popoverClasses="notification__popover popover__top"
                            popoverBody="{$cms_tooltips->page['settings']['promotion']['layout_style']['theme']['content']}"
                            popoverFooter="{$popoverFooter}"
                        }
                    {/if}
                </label>
                <select class="form-control" name="settings[promo][promotionTheme]">
                    <option value="default" {if isset($customPage->settings['promo']['promotionTheme']) && $customPage->settings['promo']['promotionTheme'] == "default"}selected{/if}>Default</option>
                    {* <option value="cyber_monday" {if isset($customPage->settings['promo']['promotionTheme']) && $customPage->settings['promo']['promotionTheme'] == "cyber_monday"}selected{/if}>Cyber Monday</option> *}
                    <option value="black_week" {if isset($customPage->settings['promo']['promotionTheme']) && $customPage->settings['promo']['promotionTheme'] == "black_week"}selected{/if}>Black Week</option>
                    <option value="christmas_sale" {if isset($customPage->settings['promo']['promotionTheme']) && $customPage->settings['promo']['promotionTheme'] == "christmas_sale"}selected{/if}>Christmas Sale</option>
                </select>
            </div>
            <div class="form-group">
                <label class="form-label">
                    Navigation Type
                    {if $cms_tooltips->page['settings']['promotion']['layout_style']['nav_type']['content']}
                        {if isset($cms_tooltips->page['settings']['promotion']['layout_style']['nav_type']['url']) && $cms_tooltips->page['settings']['promotion']['layout_style']['nav_type']['url'] != ""}
                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->page['settings']['promotion']['layout_style']['nav_type']['url']}' target='_blank'>Learn More</a>"}
                        {else}
                            {assign var="popoverFooter" value=false}
                        {/if}
                        {include 
                            file="adminarea/includes/helpers/popover.tpl" 
                            popoverClasses="notification__popover popover__top"
                            popoverBody="{$cms_tooltips->page['settings']['promotion']['layout_style']['nav_type']['content']}"
                            popoverFooter="{$popoverFooter}"
                        }
                    {/if}
                </label>
                <select class="form-control" name="settings[promo][promotionNavType]">
                    <option value="website" {if isset($customPage->settings['promo']['promotionNavType']) && $customPage->settings['promo']['promotionNavType'] == "website"}selected{/if}>Website Navigation</option>
                    <option value="Client Portal" {if isset($customPage->settings['promo']['promotionNavType']) && $customPage->settings['promo']['promotionNavType'] == "Client Portal"}selected{/if}>Client Area Navigation</option>
                    <option value="Order Process" {if isset($customPage->settings['promo']['promotionNavType']) && $customPage->settings['promo']['promotionNavType'] == "Order Process"}selected{/if}>Order Process Navigation</option>
                    <option value="Only Logo" {if isset($customPage->settings['promo']['promotionNavType']) && $customPage->settings['promo']['promotionNavType'] == "Only Logo"}selected{/if}>Only Logo</option>
                </select>
            </div>
        </div>
    </div>   
</div>    