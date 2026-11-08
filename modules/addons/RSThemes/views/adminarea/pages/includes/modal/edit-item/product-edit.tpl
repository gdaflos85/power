{************************************************* 

RSThemes - Website Builder - Edit Product Modal

1. Modal Top
2. Modal Form 
    2.1. Product Group
    2.2. Product
    2.3. Product Info
        2.3.1. Title
        2.3.2. Description
        2.3.3. Replace Url
        2.3.4. Link Text
        2.3.5. Link Type
        2.3.6. Custom Url
        2.3.7. Linked Page
        2.3.8. Open Url In New Window
        2.3.9. Show Graphic Switcher
        2.3.10. Graphic Container 
    2.4. Advanced Settings    
        2.4.1  Apply Promocode
        2.4.2. Promocode Select
        2.4.3. Custom Description
        2.4.4. Custom Price
        2.4.5. Custom Package Class 
    2.5. Hidden Inputs
    2.6. Modal Actions

*************************************************}

<div 
    class="modal modal--lg modal--media modal--media-scroll" 
    id="editProductItemModal" 
    data-edit-product-item-modal
>
    <div class="modal__dialog">
        <div class="modal__content">
            {* 1. Modal Top *}
            <div class="modal__top top">
                <h4 class="top__title h6">
                    Edit Product 
                    {include file="adminarea/includes/helpers/docs.tpl" link=$cms_docs->modal['item']['add_edit']['product']}
                </h4>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link cancel__item" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>

            {* 2. Modal Form *}
            <form
                id="editProductForm"
                data-edit-product-item-form
                data-ajax-url="{$helper->url('CustomPage@getListItem',['templateName' => $template->getMainName()])}"
                data-assets-url="{$whmcsURL}/templates/{$themeName}/assets"
                data-load-icons-url="{$whmcsURL}/modules/addons/RSThemes/src/Api/clientApi.php?controller=Icon&method=renderTabs&items="
            >
                <div class="modal__body overflow-y-visible" data-edit-product-item-modal-body>
                    <div class="modal__section">
                        <div class="modal__section-content">    
                            {* 2.1. Product Group *}  
                            <div class="form-group">
                                <label class="form-label">
                                    Product Group
                                    {if $cms_tooltips->modal['item']['add_edit']['product']['group']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['product']['group']['url']) && $cms_tooltips->modal['item']['add_edit']['product']['group']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['product']['group']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right-top"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['product']['group']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </label>
                                <select
                                    class="form-control"
                                    name="item[group_id]"
                                    data-lang="{$language}"
                                    data-ajax-url="{$helper->url('CustomPage@getGroupProducts',['templateName' => $template->getMainName(), 'language' => $language])}"
                                    data-edit-group-id
                                    data-change-product-group="product"
                                    required
                                >
                                    <option value="" selected>Choose Product Group</option>
                                    {foreach $productGroups as $productGroup}
                                        {if !$productGroup->hidden}
                                            <option value="{$productGroup->id}">{$productGroup->name}</option>
                                        {/if}
                                    {/foreach}
                                    {foreach $productGroups as $productGroup}
                                        {if $productGroup->hidden}
                                            <option value="{$productGroup->id}">{$productGroup->name} (hidden)</option>
                                        {/if}
                                    {/foreach}
                                </select>
                            </div>

                            {* 2.2. Product *}
                            <div class="form-group">
                                <label class="form-label">
                                    Product
                                    {if $cms_tooltips->modal['item']['add_edit']['product']['product']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['product']['product']['url']) && $cms_tooltips->modal['item']['add_edit']['product']['product']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['product']['product']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['product']['product']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </label>
                                <select
                                    class="form-control"
                                    name="item[product_id]"
                                    data-lang="{$language}"
                                    data-ajax-url="{$helper->url('CustomPage@getGroupProductData',['templateName' => $template->getMainName()])}" required
                                    data-edit-product-id
                                    data-change-product
                                >
                                    <option value="" selected>Choose Product</option>
                                </select>
                            </div>
                        </div>
                    </div>    

                    {* 2.3. Product Info *}
                    <div class="modal__section is-hidden" data-product-info>
                        <div class="modal__section-content">
                            
                            {* 2.3.1. Title *}
                            <div class="form-group">
                                <div class="d-flex">
                                    <label class="form-label flex-grow-1">
                                        Title
                                        {if $cms_tooltips->modal['item']['add_edit']['product']['title']['content']}
                                            {if isset($cms_tooltips->modal['item']['add_edit']['product']['title']['url']) && $cms_tooltips->modal['item']['add_edit']['product']['title']['url'] != ""}
                                                {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['product']['title']['url']}' target='_blank'>Learn More</a>"}
                                            {else}
                                                {assign var="popoverFooter" value=false}
                                            {/if}
                                            {include 
                                                file="adminarea/includes/helpers/popover.tpl" 
                                                popoverClasses="notification__popover popover__right"
                                                popoverBody="{$cms_tooltips->modal['item']['add_edit']['product']['title']['content']}"
                                                popoverFooter="{$popoverFooter}"
                                            }
                                        {/if}
                                    </label>
                                    <a
                                        href="#"
                                        target="_blank"
                                        data-product-link
                                        data-default-url="{$whmcsURL}/{$adminPath}/configproducts.php?action=edit&id="
                                    >
                                        <span class="form-label">Edit</span>
                                    </a>
                                </div>
                                <input
                                    class="form-control product__title is-disabled"
                                    type="text"
                                    name="item[title]"
                                    value=""
                                    data-product-title
                                />
                            </div>

                            {* 2.3.2. Description *}
                            <div class="form-group">
                                <div class="d-flex">
                                    <label class="form-label flex-grow-1">
                                        Description
                                        {if $cms_tooltips->modal['item']['add_edit']['product']['description']['content']}
                                            {if isset($cms_tooltips->modal['item']['add_edit']['product']['description']['url']) && $cms_tooltips->modal['item']['add_edit']['product']['description']['url'] != ""}
                                                {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['product']['description']['url']}' target='_blank'>Learn More</a>"}
                                            {else}
                                                {assign var="popoverFooter" value=false}
                                            {/if}
                                            {include 
                                                file="adminarea/includes/helpers/popover.tpl" 
                                                popoverClasses="notification__popover popover__right"
                                                popoverBody="{$cms_tooltips->modal['item']['add_edit']['product']['description']['content']}"
                                                popoverFooter="{$popoverFooter}"
                                            }
                                        {/if}
                                    </label>
                                    <a
                                        href="#"
                                        target="_blank"
                                        data-product-link
                                        data-default-url="{$whmcsURL}/{$adminPath}/configproducts.php?action=edit&id="
                                    >
                                        <span class="form-label">Edit</span>
                                    </a>
                                </div>
                                <textarea
                                    class="form-control product__description is-disabled"
                                    rows="2" name="item[description]"
                                    data-product-description
                                    >
                                </textarea>
                            </div>

                            {* 2.3.3. Replace Url *}
                            <div class="form-group" data-toggle-button-link>
                                <label 
                                    class="form-label is-pointer m-b-0x m-t-2x"
                                    data-toggle="lu-collapse"
                                    data-target="#product-add-modal-replace-url"
                                >
                                    <span class="form-text d-flex align-items-center">
                                        Replace default order button with custom link
                                        {if $cms_tooltips->modal['item']['add_edit']['product']['replace_url']['content']}
                                            {if isset($cms_tooltips->modal['item']['add_edit']['product']['replace_url']['url']) && $cms_tooltips->modal['item']['add_edit']['product']['replace_url']['url'] != ""}
                                                {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['product']['replace_url']['url']}' target='_blank'>Learn More</a>"}
                                            {else}
                                                {assign var="popoverFooter" value=false}
                                            {/if}
                                            {include 
                                                file="adminarea/includes/helpers/popover.tpl" 
                                                popoverClasses="notification__popover popover__right"
                                                popoverBody="{$cms_tooltips->modal['item']['add_edit']['product']['replace_url']['content']}"
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

                            <div class="collapse" id="product-add-modal-replace-url" data-show-button-link-items data-toggle-button-link data-toggle-sidebar-on>
                                {* 2.3.4. Link Text *}
                                <div class="form-group" >
                                    <label class="form-label">
                                        Link text
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
                                    <input class="form-control" type="text" name="item[link_text]" value="" data-edit-link-text/>
                                </div>

                                {* 2.3.5. Link Type *}
                                <div class="form-group">
                                    <label class="form-label form-label--basic">
                                        Link type
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
                                    <select class="form-control" name="item[link_type]" data-button-link-type data-edit-link-type data-default-select-value="custom-url">
                                        <option value="custom-url" selected>Custom URL</option>
                                        <option value="whmcs-page">WHMCS Page</option>
                                        <option value="homepage">Homepage</option>
                                    </select>
                                </div>

                                {* 2.3.6. Custom Url *}
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
                                    <input class="form-control" type="text" name="item[custom_url]" data-custom-url-button-input data-edit-custom-url value=""/>
                                </div>

                                {* 2.3.7. Linked Page *}
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
                                    <select class="form-control" name="item[whmcs_page]" data-linked-page-button-input data-edit-page>
                                        {foreach $pages as $page}
                                            <option value="{$page['name']}">{$page['label']}</option>
                                        {/foreach}
                                    </select>
                                </div>

                                {* 2.3.8. Open Url In New Window *}
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
                                            <input class="switch__checkbox" name="item[target_blank]" data-edit-target-blank value="1" type="checkbox">
                                            <span class="switch__container">
                                                <span class="switch__handle"></span>
                                            </span>
                                        </div>
                                    </label>
                                </div>
                            </div>
                            {* 2.3.9. Show Graphic Switcher *}
                            <div class="form-group is-hidden" data-product-icon>
                                <label class="form-label is-pointer m-w-360 m-b-0x m-t-2x" data-toggle="lu-collapse" data-target="#product-edit-modal-tabs">
                                    <span class="form-text d-flex align-items-center">
                                        Show graphic for this item
                                        {if $cms_tooltips->modal['item']['add_edit']['product']['show_graphic']['content']}
                                            {if isset($cms_tooltips->modal['item']['add_edit']['product']['show_graphic']['url']) && $cms_tooltips->modal['item']['add_edit']['product']['show_graphic']['url'] != ""}
                                                {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['product']['show_graphic']['url']}' target='_blank'>Learn More</a>"}
                                            {else}
                                                {assign var="popoverFooter" value=false}
                                            {/if}
                                            {include 
                                                file="adminarea/includes/helpers/popover.tpl" 
                                                popoverClasses="notification__popover popover__right"
                                                popoverBody="{$cms_tooltips->modal['item']['add_edit']['product']['show_graphic']['content']}"
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

                            {* 2.3.10. Graphic Container *}
                            <div class="collapse" id="product-edit-modal-tabs" data-product-tabs data-icons-tabs>
                                {include file="adminarea/pages/includes/modal/tabs.tpl" type='product-edit'}
                            </div>
                        </div>
                    
                        {* 2.4. Advanced Settings *}
                        <div 
                            class="modal__section-header top collapsed m-t-3x" 
                            data-toggle="lu-collapse" 
                            data-target="#addNewProduct-advanced-settings" 
                            data-product-advanced-settings-toogle
                        >
                            <span class="top__title p-md">Advanced Settings</span>
                            <button type="button" class="top__toolbar btn btn--link">
                                <span class="btn__text">Expand</span>
                                <span class="btn__text">Hide</span>
                                <i class="btn__icon ls ls-down"></i>
                            </button>
                        </div>
                        <div class="modal__section-content collapse" id="addNewProduct-advanced-settings" data-product-advanced-settings>
                            
                            {* 2.4.1 Apply Promocode *}
                            <div class="form-group">
                                <label class="form-label is-pointer m-w-360 m-b-0x m-t-2x" data-toggle="lu-collapse" data-target="#product-edit-modal-promocode">
                                    <span class="form-text d-flex align-items-center">
                                        Apply promotion code to this product
                                        {if $cms_tooltips->modal['item']['add_edit']['product']['apply_promocode']['content']}
                                            {if isset($cms_tooltips->modal['item']['add_edit']['product']['apply_promocode']['url']) && $cms_tooltips->modal['item']['add_edit']['product']['apply_promocode']['url'] != ""}
                                                {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['product']['apply_promocode']['url']}' target='_blank'>Learn More</a>"}
                                            {else}
                                                {assign var="popoverFooter" value=false}
                                            {/if}
                                            {include 
                                                file="adminarea/includes/helpers/popover.tpl" 
                                                popoverClasses="notification__popover popover__right"
                                                popoverBody="{$cms_tooltips->modal['item']['add_edit']['product']['apply_promocode']['content']}"
                                                popoverFooter="{$popoverFooter}"
                                            }
                                        {/if}
                                    </span>
                                    <div class="switch switch--success m-l-0x">
                                        <input type="hidden" name="item[apply_promocode]" value="0" />
                                        <input class="switch__checkbox" name="item[apply_promocode]" value="1" type="checkbox" data-apply-promocode>
                                        <span class="switch__container">
                                            <span class="switch__handle"></span>
                                        </span>
                                    </div>
                                </label>
                            </div>

                            {* 2.4.2. Promocode Select *}
                            <div class="collapse" id="product-edit-modal-promocode" data-product-promocode>
                                <div class="form-group">
                                    <select class="form-control" name="item[promocode]">
                                        {foreach $promoCodes as $promoCode}
                                            <option value="{$promoCode.id}">{$promoCode.code}</option>
                                        {/foreach}
                                    </select>
                                    <div class="form-feedback form-feedback-md form-feedback-danger form-feedback--icon text-danger-lighter">
                                        Selected promotional code for this product will overwrite the code that was selected for the entire section
                                    </div>
                                </div>
                            </div>

                            {* 2.4.3. Custom Description *}
                            <div class="form-group m-t-2x">
                                <div class="d-flex">
                                    <label class="form-label">
                                        Custom Description
                                        {if $cms_tooltips->modal['item']['add_edit']['product']['custom_description']['content']}
                                            {if isset($cms_tooltips->modal['item']['add_edit']['product']['custom_description']['url']) && $cms_tooltips->modal['item']['add_edit']['product']['custom_description']['url'] != ""}
                                                {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['product']['custom_description']['url']}' target='_blank'>Learn More</a>"}
                                            {else}
                                                {assign var="popoverFooter" value=false}
                                            {/if}
                                            {include 
                                                file="adminarea/includes/helpers/popover.tpl" 
                                                popoverClasses="notification__popover popover__right"
                                                popoverBody="{$cms_tooltips->modal['item']['add_edit']['product']['custom_description']['content']}"
                                                popoverFooter="{$popoverFooter}"
                                            }
                                        {/if}
                                    </label>
                                </div>
                                <textarea
                                    class="form-control"
                                    rows="2" name="item[custom_description]"
                                    data-product-custom-description
                                ></textarea>
                            </div>

                            {* 2.4.4. Custom Price *}
                            {include file="adminarea/pages/includes/modal/product/custom-price.tpl"}

                            {* 2.4.5. Custom Package Class *}
                            <div class="form-group">
                                <label class="form-label">
                                    Custom Classes
                                    {if $cms_tooltips->modal['item']['add_edit']['product']['custom_class']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['product']['custom_class']['url']) && $cms_tooltips->modal['item']['add_edit']['product']['custom_class']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['product']['custom_class']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['product']['custom_class']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </label>
                                <input class="form-control" type="text" name="item[custom_classes]" data-edit-custom-classes value=""/>
                            </div>
                        </div>
                    </div>
                    
                    {* 2.5. Hidden Inputs *}
                    <input type="hidden" name="item[list_name]" data-edit-list-name value=""/>
                    <input type="hidden" name="item[key]" data-edit-key value=""/>
                    <input type="hidden" name="item[position]" data-edit-position value=""/>
                    <input type="hidden" name="item[section]" data-edit-section-index value=""/>
                    <input type="hidden" name="item[group]" data-edit-group-index value=""/>
                    <input type="hidden" name="item[hide_modal_icon]" data-list-modal-icon value=""/>
                </div>

                {* 2.6. Modal Actions *}
                <div class="modal__actions">
                    <button class="btn btn--primary" data-edit-product-item-btn type="submit" form="editProductForm">
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