{************************************************* 

RSThemes - Website Builder - Edit Button Modal

1. Modal Top
2. Modal Form 
    2.1. Button
        2.1.1. Size
        2.1.2. Style
        2.1.3. Type
        2.1.4. Text
        2.1.5. Link Type
        2.1.6. Custom Url
        2.1.7. Linked Page
        2.1.8. Linked Product
        2.1.9. Custom Class
        2.1.10. Open Url In New Window
        2.1.11. Show Graphic Switcher
        2.1.12. Graphic Container
    2.2. Hidden Inputs
    2.3. Modal Actions

*************************************************}

<div class="modal modal--lg modal--media modal--media-scroll" id="editButtonItemModal" data-edit-button-item-modal>
    <div class="modal__dialog">
        <div class="modal__content">
            {* 1. Modal Top *}
            <div class="modal__top top">
                <h4 class="top__title h6">Edit "Button" {include file="adminarea/includes/helpers/docs.tpl" link=$cms_docs->modal['item']['add_edit']['button']}</h4>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link cancel__item" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>

            {* 2. Modal Form *}
            <form 
                id="editButtonForm" 
                data-edit-button-item-form
                data-ajax-url="{$helper->url('CustomPage@getButtonItem',['templateName' => $template->getMainName()])}"
                data-assets-url="{$whmcsURL}/templates/{$themeName}/assets"
                data-load-icons-url="{$whmcsURL}/modules/addons/RSThemes/src/Api/clientApi.php?controller=Icon&method=renderTabs&items="
            >
                <div class="modal__body has-scroll">
                    <div class="modal__section">
                        {* 2.1.1. Size *}
                        <div class="form-group">
                            <label class="form-label">
                                Button size
                                {if $cms_tooltips->modal['item']['add_edit']['button']['size']['content']}
                                    {if isset($cms_tooltips->modal['item']['add_edit']['button']['size']['url']) && $cms_tooltips->modal['item']['add_edit']['button']['size']['url'] != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['button']['size']['url']}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include 
                                        file="adminarea/includes/helpers/popover.tpl" 
                                        popoverClasses="notification__popover popover__right-top"
                                        popoverBody="{$cms_tooltips->modal['item']['add_edit']['button']['size']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                            </label>
                            <select class="form-control" data-edit-size name="item[size]" required style="opacity: 1">
                                <option value="extra-small">Extra Small</option>
                                <option value="small">Small</option>
                                <option value="default">Default</option>
                                <option value="large" selected>Large</option>
                                <option value="extra-large">Extra Large</option>
                            </select>
                        </div>

                        {* 2.1.2. Style *}
                        <div class="form-group">
                            <label class="form-label">
                                Button style
                                {if $cms_tooltips->modal['item']['add_edit']['button']['style']['content']}
                                    {if isset($cms_tooltips->modal['item']['add_edit']['button']['style']['url']) && $cms_tooltips->modal['item']['add_edit']['button']['style']['url'] != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['button']['style']['url']}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include 
                                        file="adminarea/includes/helpers/popover.tpl" 
                                        popoverClasses="notification__popover popover__right"
                                        popoverBody="{$cms_tooltips->modal['item']['add_edit']['button']['style']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                            </label>
                            <select class="form-control" data-edit-style name="item[style]" required style="opacity: 1">
                                <option value="solid" selected>Solid</option>
                                <option value="outline">Outline</option>
                                <option value="link">Link</option>
                            </select>
                        </div>

                        {* 2.1.3. Type *}
                        <div class="form-group">
                            <label class="form-label">
                                Button type
                                {if $cms_tooltips->modal['item']['add_edit']['button']['type']['content']}
                                    {if isset($cms_tooltips->modal['item']['add_edit']['button']['type']['url']) && $cms_tooltips->modal['item']['add_edit']['button']['type']['url'] != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['button']['type']['url']}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include 
                                        file="adminarea/includes/helpers/popover.tpl" 
                                        popoverClasses="notification__popover popover__right"
                                        popoverBody="{$cms_tooltips->modal['item']['add_edit']['button']['type']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                            </label>
                            <select class="form-control" data-edit-type name="item[type]" required style="opacity: 1">
                                <option value="primary" selected>Primary</option>
                                <option value="primary-faded">Primary Faded</option>
                                <option value="secondary">Secondary</option>
                                <option value="default">Default</option>
                                <option value="info">Info</option>
                                <option value="success">Success</option>
                                <option value="warning">Warning</option>
                                <option value="danger">Danger</option>
                            </select>
                        </div>

                        {* 2.1.4. Text *}
                        <div class="form-group">
                            <label class="form-label">
                                Button text
                                {if $cms_tooltips->modal['item']['add_edit']['button']['text']['content']}
                                    {if isset($cms_tooltips->modal['item']['add_edit']['button']['text']['url']) && $cms_tooltips->modal['item']['add_edit']['button']['text']['url'] != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['button']['text']['url']}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include 
                                        file="adminarea/includes/helpers/popover.tpl" 
                                        popoverClasses="notification__popover popover__right"
                                        popoverBody="{$cms_tooltips->modal['item']['add_edit']['button']['text']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                            </label>
                            <input class="form-control" type="text" name="item[text]" data-edit-text value=""/>
                        </div>

                        {* 2.1.5. Link Type *}
                        <div class="form-group">
                            <label class="form-label form-label--basic">
                                    Button link type
                                    {if $cms_tooltips->modal['item']['add_edit']['button']['link_type']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['button']['link_type']['url']) && $cms_tooltips->modal['item']['add_edit']['button']['link_type']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['button']['link_type']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['button']['link_type']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </label>
                            <select
                                class="form-control"
                                name="item[link_type]"
                                data-button-link-type
                                data-edit-link-type
                            >
                                <option value="custom-url" selected>Custom URL</option>
                                <option value="whmcs-page">WHMCS Page</option>
                                <option value="whmcs-product">WHMCS Product</option>
                                <option value="homepage">Homepage</option>
                            </select>
                        </div>

                        {* 2.1.6. Custom Url *}
                        <div class="form-group" data-button-custom-url>
                            <label class="form-label">
                                Custom URL
                                {if $cms_tooltips->modal['item']['add_edit']['button']['custom_url']['content']}
                                    {if isset($cms_tooltips->modal['item']['add_edit']['button']['custom_url']['url']) && $cms_tooltips->modal['item']['add_edit']['button']['custom_url']['url'] != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['button']['custom_url']['url']}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include 
                                        file="adminarea/includes/helpers/popover.tpl" 
                                        popoverClasses="notification__popover popover__right"
                                        popoverBody="{$cms_tooltips->modal['item']['add_edit']['button']['custom_url']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                            </label>
                            <input class="form-control" type="text" name="item[custom_url]" data-custom-url-button-input data-edit-custom-url value=""/>
                        </div>

                        {* 2.1.7. Linked Page *}
                        <div class="form-group is-hidden" data-button-linked-page>
                            <label class="form-label">
                                Linked page
                                {if $cms_tooltips->modal['item']['add_edit']['button']['linked_page']['content']}
                                    {if isset($cms_tooltips->modal['item']['add_edit']['button']['linked_page']['url']) && $cms_tooltips->modal['item']['add_edit']['button']['linked_page']['url'] != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['button']['linked_page']['url']}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include 
                                        file="adminarea/includes/helpers/popover.tpl" 
                                        popoverClasses="notification__popover popover__right"
                                        popoverBody="{$cms_tooltips->modal['item']['add_edit']['button']['linked_page']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                            </label>
                            <select class="form-control" name="item[whmcs_page]" data-linked-page-button-input data-edit-page style="opacity: 1">
                                {foreach $pages as $page}
                                    <option value="{$page['name']}">{$page['label']}</option>
                                {/foreach}
                            </select>
                        </div>

                        {* 2.1.8. Linked Product *}
                        <div class="form-group is-hidden" data-button-linked-product>
                            <label class="form-label">
                                Linked product
                                {if $cms_tooltips->modal['item']['add_edit']['button']['linked_product']['content']}
                                    {if isset($cms_tooltips->modal['item']['add_edit']['button']['linked_product']['url']) && $cms_tooltips->modal['item']['add_edit']['button']['linked_product']['url'] != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['button']['linked_product']['url']}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include 
                                        file="adminarea/includes/helpers/popover.tpl" 
                                        popoverClasses="notification__popover popover__right"
                                        popoverBody="{$cms_tooltips->modal['item']['add_edit']['button']['linked_product']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                            </label>
                            <select class="form-control" name="item[whmcs_product]" data-linked-product-button-input data-edit-product style="opacity: 1">
                                {foreach $productGroups as $productGroup}
                                    {foreach $products as $product}
                                        {if $productGroup['id'] == $product['gid']}
                                            <option value="{$product['id']}">{$productGroup['name']} - {$product['name']}</option>
                                        {/if}
                                    {/foreach}
                                {/foreach}
                            </select>
                        </div>

                        {* 2.1.9. Custom Class *}
                        <div class="form-group">
                            <label class="form-label">
                                    Button custom class
                                    {if $cms_tooltips->modal['item']['add_edit']['button']['custom_class']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['button']['custom_class']['url']) && $cms_tooltips->modal['item']['add_edit']['button']['custom_class']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['button']['custom_class']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['button']['custom_class']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </label>
                            <input class="form-control" type="text" name="item[custom_classes]" data-edit-custom-classes value=""/>
                        </div>

                        {* 2.1.10. Open Url In New Window *}
                        <div class="form-group">                        
                            <label class="form-label is-pointer m-b-0x m-t-2x">
                                <span class="form-text d-flex align-items-center">
                                    Open URL in new window
                                    {if $cms_tooltips->modal['item']['add_edit']['button']['target_blank']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['button']['target_blank']['url']) && $cms_tooltips->modal['item']['add_edit']['button']['target_blank']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['button']['target_blank']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['button']['target_blank']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </span>
                                <div class="switch switch--success m-l-0x">
                                    <input type="hidden" name="item[target_blank]" value="0" />
                                    <input class="switch__checkbox" name="item[target_blank]" value="1" data-edit-target-blank type="checkbox">
                                    <span class="switch__container">
                                        <span class="switch__handle"></span>
                                    </span>
                                </div>
                            </label>
                        </div>

                        {* 2.1.11. Show Graphic Switcher *}
                        <div class="form-group">
                            <label 
                                class="form-label is-pointer m-b-0x m-t-2x"
                                data-toggle="lu-collapse"
                                data-target="#button-edit-modal-tabs"
                            >
                                <span class="form-text d-flex align-items-center">
                                    Show graphic for this item
                                    {if $cms_tooltips->modal['item']['add_edit']['button']['show_graphic']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['button']['show_graphic']['url']) && $cms_tooltips->modal['item']['add_edit']['button']['show_graphic']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['button']['show_graphic']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['button']['show_graphic']['content']}"
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

                        {* 2.1.12. Graphic Container *}
                        <div class="collapse" id="button-edit-modal-tabs" data-product-tabs data-icons-tabs>
                            {include file="adminarea/pages/includes/modal/icon-tabs.tpl" type='button-edit'}
                        </div>
                    </div>

                    {* 2.2. Hidden Inputs *}    
                    <input type="hidden" name="item[list_name]" data-edit-list-name value=""/>
                    <input type="hidden" name="item[index]" data-edit-key value=""/>
                    <input type="hidden" name="item[position]" data-edit-position value=""/>
                    <input type="hidden" name="item[section]" data-edit-section-index value=""/>
                    <input type="hidden" name="item[group]" data-edit-group-index value=""/>
                    <input type="hidden" name="item[hide_modal_icon]" data-list-modal-icon value=""/>
                </div>

                {* 2.3. Modal Actions *}
                <div class="modal__actions">
                    <button class="btn btn--primary" data-edit-button-item-btn  type="submit" form="editButtonForm">
                        <span class="btn__text">Edit Button</span>
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