{************************************************* 

RSThemes - Website Builder - Edit Location Modal

1. Modal Top
2. Modal Form 
    2.1. Item
        2.1.1. Select Location
        2.1.2. Title
        2.1.3. Description
        2.1.4. Location position
        2.1.5. Location Status
        2.1.6. Show Item Link
        2.1.7. Item Link Type
        2.1.8. Custom Url
        2.1.9. Linked Page
        2.1.10. Open Url In New Window
        2.1.11. Graphic Container
    2.2. Advanced Settings    
        2.2.1. Custom Item Class
    2.3. Hidden Inputs
    2.4. Modal Actions

*************************************************}

<div 
    class="modal modal--lg modal--media modal--media-scroll" 
    id="editLocationItemModal" 
    data-edit-location-item-modal
>
    <div class="modal__dialog">
        <div class="modal__content">
            {* 1. Modal Top *}
            <div class="modal__top top">
                <h4 class="top__title h6">Edit Location {include file="adminarea/includes/helpers/docs.tpl" link=$cms_docs->modal['item']['add_edit']['location']}</h4>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link cancel__item" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>

            {* 2. Modal Form *}
            <form 
                id="editLocationForm" 
                data-edit-location-item-form 
                data-ajax-url="{$helper->url('CustomPage@getListItem',['templateName' => $template->getMainName()])}"
                data-assets-url="{$whmcsURL}/templates/{$themeName}/assets"
                data-load-icons-url="{$whmcsURL}/modules/addons/RSThemes/src/Api/clientApi.php?controller=Icon&method=renderTabs&items="
            >
                <div class="modal__body has-scroll">
                    {* 2.1. Item *}
                    <div class="modal__section">
                        {* 2.1.1. Select Location *}
                        <div class="form-group form-group--language">
                            <label class="form-label">
                                Select location
                                {if $cms_tooltips->modal['item']['add_edit']['location']['select_location']['content']}
                                    {if isset($cms_tooltips->modal['item']['add_edit']['location']['select_location']['url']) && $cms_tooltips->modal['item']['add_edit']['location']['select_location']['url'] != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['location']['select_location']['url']}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include 
                                        file="adminarea/includes/helpers/popover.tpl" 
                                        popoverClasses="notification__popover popover__right-top"
                                        popoverBody="{$cms_tooltips->modal['item']['add_edit']['location']['select_location']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                            </label>
                            <select class="form-control" name="item[location]" data-location-select>                                
                                <option value="custom">Custom Location</option>
                                <option value="rs_selectize_divider">divider</option>
                                {foreach $predefined_locations as $key => $location}
                                    <option value="{$key}">{$location['country_full']} - {$location['city_full']}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="collapse" id="edit-location-custom" data-location-custom >
                            {* 2.1.2. Title *}
                            <div class="form-group">
                                <label class="form-label">
                                    Location title
                                    {if $cms_tooltips->modal['item']['add_edit']['location']['title']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['location']['title']['url']) && $cms_tooltips->modal['item']['add_edit']['location']['title']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['location']['title']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right-top"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['location']['title']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </label>
                                <input class="form-control" type="text" data-edit-title name="item[title]" value=""/>
                            </div>

                            {* 2.1.3. Description *}
                            <div class="form-group">
                                <label class="form-label">
                                    Location description
                                    {if $cms_tooltips->modal['item']['add_edit']['location']['description']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['location']['description']['url']) && $cms_tooltips->modal['item']['add_edit']['location']['description']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['location']['description']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['location']['description']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </label>
                                <textarea data-html-editor class="form-control" data-edit-description rows="2" name="item[description]"></textarea>
                            </div>

                            {* 2.1.4. Location position *}
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">
                                            Position top
                                            {if $cms_tooltips->modal['item']['add_edit']['location']['position_top']['content']}
                                                {if isset($cms_tooltips->modal['item']['add_edit']['location']['position_top']['url']) && $cms_tooltips->modal['item']['add_edit']['location']['position_top']['url'] != ""}
                                                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['location']['position_top']['url']}' target='_blank'>Learn More</a>"}
                                                {else}
                                                    {assign var="popoverFooter" value=false}
                                                {/if}
                                                {include 
                                                    file="adminarea/includes/helpers/popover.tpl" 
                                                    popoverClasses="notification__popover popover__right"
                                                    popoverBody="{$cms_tooltips->modal['item']['add_edit']['location']['position_top']['content']}"
                                                    popoverFooter="{$popoverFooter}"
                                                }
                                            {/if}
                                        </label>
                                        <input class="form-control" data-edit-position-top type="number" name="item[location_position_top]" value=""/>
                                    </div>    
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">
                                            Position left
                                            {if $cms_tooltips->modal['item']['add_edit']['location']['position_left']['content']}
                                                {if isset($cms_tooltips->modal['item']['add_edit']['location']['position_left']['url']) && $cms_tooltips->modal['item']['add_edit']['location']['position_left']['url'] != ""}
                                                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['location']['position_left']['url']}' target='_blank'>Learn More</a>"}
                                                {else}
                                                    {assign var="popoverFooter" value=false}
                                                {/if}
                                                {include 
                                                    file="adminarea/includes/helpers/popover.tpl" 
                                                    popoverClasses="notification__popover popover__right"
                                                    popoverBody="{$cms_tooltips->modal['item']['add_edit']['location']['position_left']['content']}"
                                                    popoverFooter="{$popoverFooter}"
                                                }
                                            {/if}
                                        </label>
                                        <input class="form-control" data-edit-position-left type="number" name="item[location_position_left]" value=""/>
                                    </div>    
                                </div>
                            </div>
                        </div>
                        {* 2.1.5. Location Status *}
                        <div class="form-group">
                            <label class="form-label">
                                Location status
                                {if $cms_tooltips->modal['item']['add_edit']['location']['status']['content']}
                                    {if isset($cms_tooltips->modal['item']['add_edit']['location']['status']['url']) && $cms_tooltips->modal['item']['add_edit']['location']['status']['url'] != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['location']['status']['url']}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include 
                                        file="adminarea/includes/helpers/popover.tpl" 
                                        popoverClasses="notification__popover popover__right"
                                        popoverBody="{$cms_tooltips->modal['item']['add_edit']['location']['status']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                            </label>
                            <select class="form-control" name="item[location_status]" data-default-select-value="none" data-edit-location-status>
                                <option value="none">None</option>
                                <option value="new">New</option>
                                <option value="comming_soon">Coming Soon</option>
                            </select>
                        </div>

                        {* 2.1.6. Show Item Link *}
                        <div class="form-group" data-toggle-button-link>
                            <label 
                                class="form-label is-pointer m-b-0x m-t-2x"
                                data-toggle="lu-collapse"
                                data-target="#item-add-modal-link"
                            >
                                <span class="form-text d-flex align-items-center">
                                    Show link for this item
                                    {if $cms_tooltips->modal['item']['add_edit']['location']['show_link']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['location']['show_link']['url']) && $cms_tooltips->modal['item']['add_edit']['location']['show_link']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['location']['show_link']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['location']['show_link']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </span>
                                <div class="switch switch--success m-l-0x">
                                    <input type="hidden" name="item[show_link]" value="0" />
                                    <input class="switch__checkbox" name="item[show_link]" value="1" type="checkbox"  data-show-button-link>
                                    <span class="switch__container">
                                        <span class="switch__handle"></span>
                                    </span>
                                </div>
                            </label>
                        </div>
                        <div class="collapse" id="item-add-modal-link" data-show-button-link-items data-toggle-button-link>

                            {* 2.1.7. Item Link Type *}
                            <div class="form-group">
                                <label class="form-label form-label--basic">
                                    Item link type
                                    {if $cms_tooltips->modal['item']['add_edit']['location']['link_type']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['location']['link_type']['url']) && $cms_tooltips->modal['item']['add_edit']['location']['link_type']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['location']['link_type']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['location']['link_type']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </label>
                                <select class="form-control" name="item[link_type]" data-button-link-type data-edit-link-type data-default-select-value="custom-url">
                                    <option value="custom-url" selected>Custom URL</option>
                                    <option value="whmcs-page">WHMCS Page</option>
                                    <option value="homepage">Homepage</option>
                                </select>
                            </div>

                            {* 2.1.8. Custom Url *}
                            <div class="form-group" data-button-custom-url>
                                <label class="form-label">
                                    Custom URL
                                    {if $cms_tooltips->modal['item']['add_edit']['location']['custom_url']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['location']['custom_url']['url']) && $cms_tooltips->modal['item']['add_edit']['location']['custom_url']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['location']['custom_url']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['location']['custom_url']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </label>
                                <input class="form-control" type="text" name="item[custom_url]" data-custom-url-button-input data-edit-custom-url value=""/>
                            </div>

                            {* 2.1.9. Linked Page *}
                            <div class="form-group is-hidden" data-button-linked-page>
                                <label class="form-label">
                                    Linked Page
                                    {if $cms_tooltips->modal['item']['add_edit']['location']['linked_page']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['location']['linked_page']['url']) && $cms_tooltips->modal['item']['add_edit']['location']['linked_page']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['location']['linked_page']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['location']['linked_page']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </label>
                                <select class="form-control" name="item[whmcs_page]" data-linked-page-button-input data-edit-page>
                                    {foreach $pages as $page}
                                        <option value="{$page['name']}">{$page['label']}</option>
                                    {/foreach}
                                </select>
                            </div>

                            {* 2.1.10. Open Url In New Window *}
                            <div class="form-group">                        
                                <label class="form-label is-pointer m-b-0x m-t-2x">
                                    <span class="form-text d-flex align-items-center">
                                        Open URL in new window
                                        {if $cms_tooltips->modal['item']['add_edit']['location']['target_blank']['content']}
                                            {if isset($cms_tooltips->modal['item']['add_edit']['location']['target_blank']['url']) && $cms_tooltips->modal['item']['add_edit']['location']['target_blank']['url'] != ""}
                                                {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['location']['target_blank']['url']}' target='_blank'>Learn More</a>"}
                                            {else}
                                                {assign var="popoverFooter" value=false}
                                            {/if}
                                            {include 
                                                file="adminarea/includes/helpers/popover.tpl" 
                                                popoverClasses="notification__popover popover__right"
                                                popoverBody="{$cms_tooltips->modal['item']['add_edit']['location']['target_blank']['content']}"
                                                popoverFooter="{$popoverFooter}"
                                            }
                                        {/if}
                                    </span>
                                    <div class="switch switch--success m-l-0x">
                                        <input type="hidden" name="item[target_blank]" value="0" />
                                        <input class="switch__checkbox" name="item[target_blank]" value="1" type="checkbox" data-edit-target-blank>
                                        <span class="switch__container">
                                            <span class="switch__handle"></span>
                                        </span>
                                    </div>
                                </label>
                            </div>
                        </div>    

                        {* 2.1.11. Graphic Container *}
                        <div class="collapse show" id="location-edit-modal-tabs" data-icons-tabs>
                            {include file="adminarea/pages/includes/modal/other/icon-tabs.tpl" type='location-edit'}
                        </div>
                    </div>

                    {* 2.2. Advanced Settings *}
                    <div 
                        class="modal__section-header top collapsed m-t-3x" 
                        data-toggle="lu-collapse" 
                        data-target="#editLocation-advanced-settings" 
                        data-product-advanced-settings-toogle
                    >
                        <span class="top__title p-md">Advanced Settings</span>
                        <button type="button" class="top__toolbar btn btn--link">
                            <span class="btn__text">Expand</span>
                            <span class="btn__text">Hide</span>
                            <i class="btn__icon ls ls-down"></i>
                        </button>
                    </div>
                    <div class="modal__section-content collapse" id="editLocation-advanced-settings" data-product-advanced-settings>
                        {* 2.2.1. Custom Item Class *}
                        <div class="form-group m-t-2x">
                            <label class="form-label">
                                Item custom class
                                {if $cms_tooltips->modal['item']['add_edit']['location']['custom_class']['content']}
                                    {if isset($cms_tooltips->modal['item']['add_edit']['location']['custom_class']['url']) && $cms_tooltips->modal['item']['add_edit']['location']['custom_class']['url'] != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['location']['custom_class']['url']}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include 
                                        file="adminarea/includes/helpers/popover.tpl" 
                                        popoverClasses="notification__popover popover__right"
                                        popoverBody="{$cms_tooltips->modal['item']['add_edit']['location']['custom_class']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                            </label>
                            <input class="form-control" type="text" name="item[custom_classes]" data-edit-custom-classes value=""/>
                        </div>
                    </div>

                    {* 2.3. Hidden Inputs *}
                    <input type="hidden" name="item[list_name]" id="locationListName" data-edit-list-name value=""/>
                    <input type="hidden" name="item[key]" id="locationKey" data-edit-key value=""/>
                    <input type="hidden" name="item[position]" id="locationPosition" data-edit-position value=""/>
                    <input type="hidden" name="item[section]" data-edit-section-index value=""/>
                    <input type="hidden" name="item[group]" data-edit-group-index value=""/>
                    <input type="hidden" name="item[show_icon]" value="1"/>
                </div>

                {* 2.4. Modal Actions *}
                <div class="modal__actions">
                    <button class="btn btn--primary" data-edit-location-item-btn type="submit" form="editLocationForm">
                        <span class="btn__text">Edit</span>
                        <span class="btn__preloader preloader"></span>
                    </button>
                    <a class="btn btn--default btn--outline cancel__item" data-dismiss="lu-modal">
                        <span class="btn__text">Cancel</span>
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>