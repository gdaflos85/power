{************************************************* 

RSThemes - Website Builder - Edit Comparison Modal

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
        2.4.1. Custom Description
        2.4.2. Custom Price
        2.4.3. Custom Package Class 
    2.5. Hidden Inputs
    2.6. Modal Actions

*************************************************}

<div 
    class="modal modal--lg modal--media modal--media-scroll" 
    id="editComparisonTableItemModal"
    data-edit-comparison-table-item-modal
>
    <div class="modal__dialog">
        <div class="modal__content">
            {* 1. Modal Top *}
            <div class="modal__top top">
                <h4 class="top__title h6">
                    Edit Feature
                    {include file="adminarea/includes/helpers/docs.tpl" link=$cms_docs->modal['item']['add_edit']['comparison_table']}
                </h4>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link cancel__item" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>

            {* 2. Modal Form *}
            <form
                id="editComparisonTableItemForm"
                data-edit-comparison-table-item-form
                data-ajax-url="{$helper->url('CustomPage@getComparisonItem',['templateName' => $template->getMainName()])}"
                data-assets-url="{$whmcsURL}/templates/{$themeName}/assets"
                data-load-icons-url="{$whmcsURL}/modules/addons/RSThemes/src/Api/clientApi.php?controller=Icon&method=renderTabs&items="
            >
                <div class="modal__body overflow-y-visible">
                    <div class="modal__section">
                        <div class="modal__section-content">                        
                            {* 2.1. Product Group *}
                            <div class="modal__section-header top">
                                <span class="top__title p-md">Feature Details</span>
                            </div>
                            <div class="form-group m-t-2x">
                                <label class="form-label">
                                    Feature Name
                                    {if $cms_tooltips->modal['item']['add_edit']['comparison']['item']['name']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['comparison']['item']['name']['url']) && $cms_tooltips->modal['item']['add_edit']['comparison']['item']['name']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['comparison']['item']['name']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right-top"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['comparison']['item']['name']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </label>
                                <input
                                    class="form-control"
                                    type="text"
                                    name="item[feature_name]"
                                    data-edit-comparison-feature-name
                                    value=""
                                />
                            </div>
                            <div class="form-group" data-toggle-comparison-hint>
                                <label 
                                    class="form-label is-pointer m-b-0x m-t-2x"
                                    data-toggle="lu-collapse"
                                    data-target="#comparison-edit-modal-hint"
                                >
                                    <span class="form-text d-flex align-items-center">
                                        Show hint for this feature
                                        {if $cms_tooltips->modal['item']['add_edit']['comparison']['item']['show_hint']['content']}
                                            {if isset($cms_tooltips->modal['item']['add_edit']['comparison']['item']['show_hint']['url']) && $cms_tooltips->modal['item']['add_edit']['comparison']['item']['show_hint']['url'] != ""}
                                                {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['comparison']['item']['show_hint']['url']}' target='_blank'>Learn More</a>"}
                                            {else}
                                                {assign var="popoverFooter" value=false}
                                            {/if}
                                            {include 
                                                file="adminarea/includes/helpers/popover.tpl" 
                                                popoverClasses="notification__popover popover__right"
                                                popoverBody="{$cms_tooltips->modal['item']['add_edit']['comparison']['item']['show_hint']['content']}"
                                                popoverFooter="{$popoverFooter}"
                                            }
                                        {/if}
                                    </span>
                                    <div class="switch switch--success m-l-0x">
                                        <input type="hidden" name="item[show_hint]" value="0" />
                                        <input class="switch__checkbox" name="item[show_hint]" value="1" type="checkbox"  data-show-feature-hint>
                                        <span class="switch__container">
                                            <span class="switch__handle"></span>
                                        </span>
                                    </div>
                                </label>
                            </div>
                            <div class="collapse" id="comparison-edit-modal-hint" data-comparison-hint>
                                <div class="form-group m-b-0x">
                                    <label class="form-label">
                                        Hint Description
                                        {if $cms_tooltips->modal['item']['add_edit']['comparison']['item']['hint']['content']}
                                            {if isset($cms_tooltips->modal['item']['add_edit']['comparison']['item']['hint']['url']) && $cms_tooltips->modal['item']['add_edit']['comparison']['item']['hint']['url'] != ""}
                                                {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['comparison']['item']['hint']['url']}' target='_blank'>Learn More</a>"}
                                            {else}
                                                {assign var="popoverFooter" value=false}
                                            {/if}
                                            {include 
                                                file="adminarea/includes/helpers/popover.tpl" 
                                                popoverClasses="notification__popover popover__right"
                                                popoverBody="{$cms_tooltips->modal['item']['add_edit']['comparison']['item']['hint']['content']}"
                                                popoverFooter="{$popoverFooter}"
                                            }
                                        {/if}
                                    </label>
                                    <textarea class="form-control" type="text" name="item[hint]" value="" data-edit-comparison-hint></textarea>
                                </div>
                            </div>    
                        </div>
                    </div>
                    <div class="modal__section">
                        <div class="modal__section-content">
                            <div class="modal__section-header top">
                                <span class="top__title p-md">Products Value</span>
                            </div>
                            <div class="m-t-2x" data-edit-comparison-table-products>
                            
                            </div>
                        </div>
                        {* 2.4. Advanced Settings *}
                        <div 
                            class="modal__section-header top collapsed m-t-3x" 
                            data-toggle="lu-collapse" 
                            data-target="#editComparisonTableItem-advanced-settings" 
                            data-product-advanced-settings-toogle
                        >
                            <span class="top__title p-md">Advanced Settings</span>
                            <button type="button" class="top__toolbar btn btn--link">
                                <span class="btn__text">Expand</span>
                                <span class="btn__text">Hide</span>
                                <i class="btn__icon ls ls-down"></i>
                            </button>
                        </div>
                        <div class="modal__section-content collapse" id="editComparisonTableItem-advanced-settings" data-product-advanced-settings>
                            {* 2.4.1. Custom Class *}
                            <div class="form-group m-t-2x">
                                <label class="form-label">
                                    Custom feature class
                                    {if $cms_tooltips->modal['item']['add_edit']['comparison']['item']['custom_class']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['comparison']['item']['custom_class']['url']) && $cms_tooltips->modal['item']['add_edit']['comparison']['item']['custom_class']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['comparison']['item']['custom_class']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['comparison']['item']['custom_class']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </label>
                                <input class="form-control" type="text" name="item[custom_classes]" data-edit-custom-classes value=""/>
                            </div>
                        </div>  
                    </div>    


                    {* 2.5. Hidden Inputs *}
                    <input type="hidden" name="item[list_name]" id="itemListName" data-edit-list-name value=""/>
                    <input type="hidden" name="item[key]" id="itemKey" data-edit-key value=""/>
                    <input type="hidden" name="item[position]" id="itemPosition" data-edit-position value=""/>
                    <input type="hidden" name="item[section]" data-edit-section-index value=""/>
                    <input type="hidden" name="item[group]" data-edit-group-index value=""/>
                    <input type="hidden" name="item[hide_item]" data-edit-list-hide-item value=""/>
                </div>

                {* 2.6. Modal Actions *}
                <div class="modal__actions">
                    <button class="btn btn--primary" data-edit-comparison-table-item-btn type="submit" form="editComparisonTableItemForm">
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