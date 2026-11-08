{************************************************* 

RSThemes - Website Builder - Edit Product Group Modal

1. Modal Top
2. Modal Form 
    2.1. Product Group
    2.2. Group Info
        2.2.1. Title
        2.2.2. Description
        2.2.3. Linked Page
        2.2.4. Show Graphic Switcher
        2.2.5. Graphic Container 
    2.3. Advanced Settings    
        2.3.1. Apply Promocode
        2.3.2. Promocode Select
        2.3.3. Custom Package Class 
    2.4. Hidden Inputs
    2.5. Modal Actions

*************************************************}

<div 
    class="modal modal--lg modal--media modal--media-scroll" 
    id="editGroupItemModal" 
    data-edit-group-item-modal
>
    <div class="modal__dialog">
        <div class="modal__content">

            {* 1. Modal Top *}
            <div class="modal__top top">
                <h4 class="top__title h6">
                    Edit group item 
                    {include file="adminarea/includes/helpers/docs.tpl" link=$cms_docs->modal['item']['add_edit']['product_group']}
                </h4>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link cancel__item" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>

            {* 2. Modal Form *}
            <form 
                id="editGroupForm" 
                data-edit-group-item-form 
                data-ajax-url="{$helper->url('CustomPage@getListItem',['templateName' => $template->getMainName()])}"
                data-assets-url="{$whmcsURL}/templates/{$themeName}/assets"
                data-load-icons-url="{$whmcsURL}/modules/addons/RSThemes/src/Api/clientApi.php?controller=Icon&method=renderTabs&items="
            >
                <div class="modal__body overflow-y-visible" data-edit-group-item-modal-body>
                    <div class="modal__section">
                        <div class="modal__section-content">   

                            {* 2.1. Product Group *}                        
                            <div class="form-group">
                                <label class="form-label">
                                    Choose Product Group
                                    {if $cms_tooltips->modal['item']['add_edit']['product_group']['group']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['product_group']['group']['url']) && $cms_tooltips->modal['item']['add_edit']['product_group']['group']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['product_group']['group']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right-top"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['product_group']['group']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </label>
                                <select
                                    class="form-control"
                                    name="item[group_id]"
                                    data-lang="{$language}"
                                    data-ajax-url="{$helper->url('CustomPage@getGroupData',['templateName' => $template->getMainName(), 'language' => $language])}"
                                    required
                                    data-change-product-group
                                    data-edit-group-id
                                >
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
                        </div>
                    </div>        

                    {* 2.2. Group Info *}
                    <div class="modal__section is-hidden" data-product-group-info>
                        <div class="modal__section-content">         

                            {* 2.2.1. Title *}
                            <div class="form-group">
                                <div class="d-flex">
                                    <label class="form-label flex-grow-1">
                                        Title
                                        {if $cms_tooltips->modal['item']['add_edit']['product_group']['title']['content']}
                                            {if isset($cms_tooltips->modal['item']['add_edit']['product_group']['title']['url']) && $cms_tooltips->modal['item']['add_edit']['product_group']['title']['url'] != ""}
                                                {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['product_group']['title']['url']}' target='_blank'>Learn More</a>"}
                                            {else}
                                                {assign var="popoverFooter" value=false}
                                            {/if}
                                            {include 
                                                file="adminarea/includes/helpers/popover.tpl" 
                                                popoverClasses="notification__popover popover__right"
                                                popoverBody="{$cms_tooltips->modal['item']['add_edit']['product_group']['title']['content']}"
                                                popoverFooter="{$popoverFooter}"
                                            }
                                        {/if}
                                    </label>
                                    <a
                                        href="#"
                                        target="_blank"
                                        data-product-group-link
                                        data-default-url="{$whmcsURL}/{$adminPath}/configproducts.php?action=editgroup&ids="
                                    >
                                        <span class="form-label">Edit</span>
                                    </a>
                                </div>
                                <input
                                    class="form-control is-disabled"
                                    type="text"
                                    name="item[title]"
                                    value=""
                                    data-product-group-title
                                    data-edit-title
                                />
                            </div>

                            {* 2.2.2. Description *}
                            <div class="form-group">
                                <div class="d-flex">
                                    <label class="form-label flex-grow-1">
                                        Description
                                        {if $cms_tooltips->modal['item']['add_edit']['product_group']['description']['content']}
                                            {if isset($cms_tooltips->modal['item']['add_edit']['product_group']['description']['url']) && $cms_tooltips->modal['item']['add_edit']['product_group']['description']['url'] != ""}
                                                {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['product_group']['description']['url']}' target='_blank'>Learn More</a>"}
                                            {else}
                                                {assign var="popoverFooter" value=false}
                                            {/if}
                                            {include 
                                                file="adminarea/includes/helpers/popover.tpl" 
                                                popoverClasses="notification__popover popover__right"
                                                popoverBody="{$cms_tooltips->modal['item']['add_edit']['product_group']['description']['content']}"
                                                popoverFooter="{$popoverFooter}"
                                            }
                                        {/if}
                                    </label>
                                    <a
                                        href="#"
                                        target="_blank"
                                        data-product-group-link
                                        data-default-url="{$whmcsURL}/{$adminPath}/configproducts.php?action=editgroup&ids"
                                    >
                                        <span class="form-label">Edit</span>
                                    </a>
                                </div>
                                <textarea
                                    class="form-control is-disabled"
                                    rows="2"
                                    name="item[description]"
                                    data-product-group-description
                                    data-edit-description
                                    >
                                </textarea>
                            </div>

                            {* 2.2.3. Linked Page *}
                            <div class="form-group">
                                <label class="form-label">
                                    Linked Page
                                    {if $cms_tooltips->modal['item']['add_edit']['product_group']['linked_page']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['product_group']['linked_page']['url']) && $cms_tooltips->modal['item']['add_edit']['product_group']['linked_page']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['product_group']['linked_page']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['product_group']['linked_page']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </label>
                                <input type="hidden" name="item[link_type]" value="whmcs-page">
                                <select class="form-control" name="item[whmcs_page]" data-product-group-page data-edit-page>
                                    {foreach $pages as $page}
                                        <option value="{$page['name']}">{$page['label']}</option>
                                    {/foreach}
                                </select>
                            </div>

                            {* 2.2.4. Show Graphic Switcher *}
                            <div class="form-group is-hidden" data-product-icon>
                                <label class="form-label is-pointer m-w-360 m-b-0x m-t-2x" data-toggle="lu-collapse" data-target="#group-edit-modal-tabs">
                                    <span class="form-text d-flex align-items-center">
                                        Show graphic for this item
                                        {if $cms_tooltips->modal['item']['add_edit']['product_group']['show_graphic']['content']}
                                            {if isset($cms_tooltips->modal['item']['add_edit']['product_group']['show_graphic']['url']) && $cms_tooltips->modal['item']['add_edit']['product_group']['show_graphic']['url'] != ""}
                                                {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['product_group']['show_graphic']['url']}' target='_blank'>Learn More</a>"}
                                            {else}
                                                {assign var="popoverFooter" value=false}
                                            {/if}
                                            {include 
                                                file="adminarea/includes/helpers/popover.tpl" 
                                                popoverClasses="notification__popover popover__right"
                                                popoverBody="{$cms_tooltips->modal['item']['add_edit']['product_group']['show_graphic']['content']}"
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

                            {* 2.2.5. Graphic Container *}
                            <div class="collapse" id="group-edit-modal-tabs" data-product-tabs data-icons-tabs>
                                {include file="adminarea/pages/includes/modal/tabs.tpl" type='group-edit'}
                            </div>
                        </div>

                        {* 2.3. Advanced Settings *}                    
                        <div 
                            class="modal__section-header top collapsed m-t-3x" 
                            data-toggle="lu-collapse" 
                            data-target="#productGroupEdit-advanced-settings" 
                            data-product-advanced-settings-toogle
                        >
                            <span class="top__title p-md">Advanced Settings</span>
                            <button type="button" class="top__toolbar btn btn--link">
                                <span class="btn__text">Expand</span>
                                <span class="btn__text">Hide</span>
                                <i class="btn__icon ls ls-down"></i>
                            </button>
                        </div>
                        <div class="modal__section-content collapse" id="productGroupEdit-advanced-settings" data-product-advanced-settings>
                            
                            {* 2.4.1 Apply Promocode *}
                            <div class="form-group">
                                <label class="form-label is-pointer m-w-360 m-b-0x m-t-2x" data-toggle="lu-collapse" data-target="#product-edit-modal-promocode">
                                    <span class="form-text d-flex align-items-center">
                                        Apply promotion code to this product group
                                        {if $cms_tooltips->modal['item']['add_edit']['product_group']['apply_promocode']['content']}
                                            {if isset($cms_tooltips->modal['item']['add_edit']['product_group']['apply_promocode']['url']) && $cms_tooltips->modal['item']['add_edit']['product_group']['apply_promocode']['url'] != ""}
                                                {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['product_group']['apply_promocode']['url']}' target='_blank'>Learn More</a>"}
                                            {else}
                                                {assign var="popoverFooter" value=false}
                                            {/if}
                                            {include 
                                                file="adminarea/includes/helpers/popover.tpl" 
                                                popoverClasses="notification__popover popover__right"
                                                popoverBody="{$cms_tooltips->modal['item']['add_edit']['product_group']['apply_promocode']['content']}"
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
                            
                            {* 2.3.2. Promocode Select *}
                            <div class="collapse" id="product-edit-modal-promocode" data-product-promocode>
                                <div class="form-group">
                                    <select class="form-control" name="item[promocode]">
                                        {foreach $promoCodes as $promoCode}
                                            <option value="{$promoCode.id}">{$promoCode.code}</option>
                                        {/foreach}
                                    </select>
                                    <div class="form-feedback form-feedback-md form-feedback-danger form-feedback--icon text-danger-lighter">
                                        Selected promotional code for this product group will overwrite the code that was selected for the entire section
                                    </div>
                                </div>
                            </div>
                    
                            {* 2.3.3. Custom Package Class *}
                            <div class="form-group  m-t-2x">
                                <label class="form-label">
                                    Custom package class
                                    {if $cms_tooltips->modal['item']['add_edit']['product_group']['custom_class']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['product_group']['custom_class']['url']) && $cms_tooltips->modal['item']['add_edit']['product_group']['custom_class']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['product_group']['custom_class']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['product_group']['custom_class']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </label>
                                <input class="form-control" type="text" name="item[custom_classes]" data-edit-custom-classes value=""/>
                            </div>
                        </div>
                    </div>

                    {* 2.4. Hidden Inputs *}
                    <input type="hidden" name="item[list_name]" data-edit-list-name id="groupListName" value=""/>
                    <input type="hidden" name="item[key]" id="groupKey" data-edit-key value=""/>
                    <input type="hidden" name="item[position]" id="groupPosition" data-edit-position value=""/>
                    <input type="hidden" name="item[section]" data-edit-section-index value=""/>
                    <input type="hidden" name="item[group]" data-edit-group-index value=""/>
                    <input type="hidden" name="item[hide_modal_icon]" data-list-modal-icon value=""/>
                </div>

                {* 2.5. Modal Actions *}
                <div class="modal__actions">
                    <button class="btn btn--primary" data-edit-group-item-btn type="submit" form="editGroupForm">
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