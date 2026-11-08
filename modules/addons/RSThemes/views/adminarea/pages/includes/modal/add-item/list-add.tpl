{************************************************* 

RSThemes - Website Builder - Add New Item Modal

1. Modal Top
2. Modal Form 
    2.1. Item
        2.1.1. Stat
        2.1.2. Title
        2.1.3. Description
        2.1.4. Show Item Link
        2.1.5. Item Link Text
        2.1.6. Item Link Type
        2.1.7. Custom Url
        2.1.8. Linked Page
        2.1.9. Open Url In New Window
        2.1.10. Show Graphic Switcher
        2.1.11. Graphic Container
    2.2. Advanced Settings    
        2.2.1. Custom Item Class
    2.3. Hidden Inputs
    2.4. Modal Actions

*************************************************}

<div 
    class="modal modal--lg modal--media modal--media-scroll" 
    id="addNewListItemModal" 
    data-add-new-list-item-modal
>
    <div class="modal__dialog">
        <div class="modal__content">
            {* 1. Modal Top *}
            <div class="modal__top top">
                <h4 class="top__title h6">Add New Item {include file="adminarea/includes/helpers/docs.tpl" link=$cms_docs->modal['item']['add_edit']['list']}</h4>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link cancel__item" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>

            {* 2. Modal Form *}
            <form 
                id="addNewItemForm" 
                data-add-new-list-item-form 
                data-ajax-url="{$helper->url('CustomPage@getListItem',['templateName' => $template->getMainName()])}"
                data-assets-url="{$whmcsURL}/templates/{$themeName}/assets"
                data-load-icons-url="{$whmcsURL}/modules/addons/RSThemes/src/Api/clientApi.php?controller=Icon&method=renderTabs&items="
            >
                <div class="modal__body has-scroll">
                    {* 2.1. Item *}
                    <div class="modal__section">
                        {* 2.1.1. Stat *}
                        <div class="form-group is-hidden" data-toggle-stat>
                            <label class="form-label">
                                Item stat
                                {if $cms_tooltips->modal['item']['add_edit']['list']['stat']['content']}
                                    {if isset($cms_tooltips->modal['item']['add_edit']['list']['stat']['url']) && $cms_tooltips->modal['item']['add_edit']['list']['stat']['url'] != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['list']['stat']['url']}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include 
                                        file="adminarea/includes/helpers/popover.tpl" 
                                        popoverClasses="notification__popover popover__right-top"
                                        popoverBody="{$cms_tooltips->modal['item']['add_edit']['list']['stat']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                            </label>
                            <input class="form-control" type="text" name="item[stat]" value=""/>
                        </div>

                        {* 2.1.2. Title *}
                        <div class="form-group" data-toggle-sidebar-off>
                            <label class="form-label">
                                Item title
                                {if $cms_tooltips->modal['item']['add_edit']['list']['title']['content']}
                                    {if isset($cms_tooltips->modal['item']['add_edit']['list']['title']['url']) && $cms_tooltips->modal['item']['add_edit']['list']['title']['url'] != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['list']['title']['url']}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include 
                                        file="adminarea/includes/helpers/popover.tpl" 
                                        popoverClasses="notification__popover popover__right-top"
                                        popoverBody="{$cms_tooltips->modal['item']['add_edit']['list']['title']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                            </label>
                            <input class="form-control" type="text" name="item[title]" value=""/>
                        </div>

                        {* 2.1.3. Description *}
                        <div class="form-group" data-toggle-sidebar-off>
                            <label class="form-label">
                                Item description
                                {if $cms_tooltips->modal['item']['add_edit']['list']['description']['content']}
                                    {if isset($cms_tooltips->modal['item']['add_edit']['list']['description']['url']) && $cms_tooltips->modal['item']['add_edit']['list']['description']['url'] != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['list']['description']['url']}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include 
                                        file="adminarea/includes/helpers/popover.tpl" 
                                        popoverClasses="notification__popover popover__right"
                                        popoverBody="{$cms_tooltips->modal['item']['add_edit']['list']['description']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                            </label>
                            <textarea data-html-editor class="form-control" rows="2" name="item[description]"></textarea>
                        </div>

                        {* 2.1.4. Show Item Link *}
                        <div class="form-group" data-toggle-button-link data-toggle-sidebar-off>
                            <label 
                                class="form-label is-pointer m-b-0x m-t-2x"
                                data-toggle="lu-collapse"
                                data-target="#item-add-modal-link"
                            >
                                <span class="form-text d-flex align-items-center">
                                    Show link for this item
                                    {if $cms_tooltips->modal['item']['add_edit']['list']['show_link']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['list']['show_link']['url']) && $cms_tooltips->modal['item']['add_edit']['list']['show_link']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['list']['show_link']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['list']['show_link']['content']}"
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
                        <div class="collapse" id="item-add-modal-link" data-show-button-link-items data-toggle-button-link data-toggle-sidebar-on>
                            {* 2.1.5. Item Link Text *}
                            <div class="form-group" >
                                <label class="form-label">
                                    Item link text
                                    {if $cms_tooltips->modal['item']['add_edit']['list']['link_text']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['list']['link_text']['url']) && $cms_tooltips->modal['item']['add_edit']['list']['link_text']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['list']['link_text']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['list']['link_text']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </label>
                                <input class="form-control" type="text" name="item[link_text]" value=""/>
                            </div>

                            {* 2.1.6. Item Link Type *}
                            <div class="form-group">
                                <label class="form-label form-label--basic">
                                    Item link type
                                    {if $cms_tooltips->modal['item']['add_edit']['list']['link_type']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['list']['link_type']['url']) && $cms_tooltips->modal['item']['add_edit']['list']['link_type']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['list']['link_type']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['list']['link_type']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </label>
                                <select class="form-control" name="item[link_type]" data-button-link-type data-default-select-value="custom-url">
                                    <option value="custom-url" selected>Custom URL</option>
                                    <option value="whmcs-page">WHMCS Page</option>
                                    <option value="homepage">Homepage</option>
                                </select>
                            </div>

                            {* 2.1.7. Custom Url *}
                            <div class="form-group" data-button-custom-url>
                                <label class="form-label">
                                    Custom URL
                                    {if $cms_tooltips->modal['item']['add_edit']['list']['custom_url']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['list']['custom_url']['url']) && $cms_tooltips->modal['item']['add_edit']['list']['custom_url']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['list']['custom_url']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['list']['custom_url']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </label>
                                <input class="form-control" type="text" name="item[custom_url]" data-custom-url-button-input value=""/>
                            </div>

                            {* 2.1.8. Linked Page *}
                            <div class="form-group is-hidden" data-button-linked-page>
                                <label class="form-label">
                                    Linked Page
                                    {if $cms_tooltips->modal['item']['add_edit']['list']['linked_page']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['list']['linked_page']['url']) && $cms_tooltips->modal['item']['add_edit']['list']['linked_page']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['list']['linked_page']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['list']['linked_page']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </label>
                                <select class="form-control" name="item[whmcs_page]" data-linked-page-button-input>
                                    {foreach $pages as $page}
                                        <option value="{$page['name']}">{$page['label']}</option>
                                    {/foreach}
                                </select>
                            </div>

                            {* 2.1.9. Open Url In New Window *}
                            <div class="form-group">                        
                                <label class="form-label is-pointer m-b-0x m-t-2x">
                                    <span class="form-text d-flex align-items-center">
                                        Open URL in new window
                                        {if $cms_tooltips->modal['item']['add_edit']['list']['target_blank']['content']}
                                            {if isset($cms_tooltips->modal['item']['add_edit']['list']['target_blank']['url']) && $cms_tooltips->modal['item']['add_edit']['list']['target_blank']['url'] != ""}
                                                {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['list']['target_blank']['url']}' target='_blank'>Learn More</a>"}
                                            {else}
                                                {assign var="popoverFooter" value=false}
                                            {/if}
                                            {include 
                                                file="adminarea/includes/helpers/popover.tpl" 
                                                popoverClasses="notification__popover popover__right"
                                                popoverBody="{$cms_tooltips->modal['item']['add_edit']['list']['target_blank']['content']}"
                                                popoverFooter="{$popoverFooter}"
                                            }
                                        {/if}
                                    </span>
                                    <div class="switch switch--success m-l-0x">
                                        <input type="hidden" name="item[target_blank]" value="0" />
                                        <input class="switch__checkbox" name="item[target_blank]" value="1" type="checkbox">
                                        <span class="switch__container">
                                            <span class="switch__handle"></span>
                                        </span>
                                    </div>
                                </label>
                            </div>
                        </div>    
                       
                        {* 2.1.10. Show Graphic Switcher *}
                        <div class="form-group">
                            <label 
                                class="form-label is-pointer m-b-0x m-t-2x"
                                data-toggle="lu-collapse"
                                data-target="#list-add-modal-tabs"
                            >
                                <span class="form-text d-flex align-items-center">
                                    Show graphic for this item
                                    {if $cms_tooltips->modal['item']['add_edit']['list']['show_graphic']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['list']['show_graphic']['url']) && $cms_tooltips->modal['item']['add_edit']['list']['show_graphic']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['list']['show_graphic']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['list']['show_graphic']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </span>
                                <div class="switch switch--success m-l-0x">
                                    <input type="hidden" name="item[show_icon]" value="0" />
                                    <input class="switch__checkbox" name="item[show_icon]" value="1" type="checkbox" data-show-icon-tabs>
                                    <span class="switch__container">
                                        <span class="switch__handle"></span>
                                    </span>
                                </div>
                            </label> 
                        </div>

                        {* 2.1.11. Graphic Container *}
                        <div class="collapse" id="list-add-modal-tabs" data-icons-tabs>
                            {include file="adminarea/pages/includes/modal/tabs.tpl" type='item-add'}
                        </div>
                    </div>

                    {* 2.2. Advanced Settings *}
                    <div 
                        class="modal__section-header top collapsed m-t-3x" 
                        data-toggle="lu-collapse" 
                        data-target="#addNewItem-advanced-settings" 
                        data-product-advanced-settings-toogle
                    >
                        <span class="top__title p-md">Advanced Settings</span>
                        <button type="button" class="top__toolbar btn btn--link">
                            <span class="btn__text">Expand</span>
                            <span class="btn__text">Hide</span>
                            <i class="btn__icon ls ls-down"></i>
                        </button>
                    </div>
                    <div class="modal__section-content collapse" id="addNewItem-advanced-settings" data-product-advanced-settings>
                        {* 2.2.1. Custom Item Class *}
                        <div class="form-group m-t-2x">
                            <label class="form-label">
                                Item custom class
                                {if $cms_tooltips->modal['item']['add_edit']['list']['custom_class']['content']}
                                    {if isset($cms_tooltips->modal['item']['add_edit']['list']['custom_class']['url']) && $cms_tooltips->modal['item']['add_edit']['list']['custom_class']['url'] != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['list']['custom_class']['url']}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include 
                                        file="adminarea/includes/helpers/popover.tpl" 
                                        popoverClasses="notification__popover popover__right"
                                        popoverBody="{$cms_tooltips->modal['item']['add_edit']['list']['custom_class']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                            </label>
                            <input class="form-control" type="text" name="item[custom_classes]" value=""/>
                        </div>
                    </div>

                    {* 2.3. Hidden Inputs *}
                    <input type="hidden" name="item[list_name]" data-list-name value=""/>
                    <input type="hidden" name="item[new_index]" data-list-new-index value=""/>
                    <input type="hidden" name="item[new_position]" data-list-new-position value=""/>
                    <input type="hidden" name="item[section]" data-list-section-index value=""/>
                    <input type="hidden" name="item[group]" data-list-group-index value=""/>
                    <input type="hidden" name="item[hide_modal_icon]" data-list-modal-icon value=""/>
                    <input type="hidden" name="item[hide_modal_link]" data-list-modal-link value=""/>
                    <input type="hidden" name="item[sidebar_type]" data-list-modal-sidebar-type value=""/>
                    <input type="hidden" name="item[show_stats]" data-list-modal-show-stats value=""/>
                </div>

                {* 2.4. Modal Actions *}
                <div class="modal__actions">
                    <button class="btn btn--primary" data-add-new-list-btn  type="submit" form="addNewItemForm">
                        <span class="btn__text">Add New Item</span>
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