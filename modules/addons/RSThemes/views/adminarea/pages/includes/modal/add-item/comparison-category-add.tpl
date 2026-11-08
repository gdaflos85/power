{************************************************* 

RSThemes - Website Builder - Add New Comparison Category Modal

1. Modal Top
2. Modal Form 
    2.1. Category title
    2.2. Show Graphic Switcher
    2.3. Graphic Container
    2.4. Advanced Settings    
        2.4.1. Custom Class 
    2.5. Hidden Inputs
    2.6. Modal Actions

*************************************************}

<div 
    class="modal modal--lg modal--media modal--media-scroll" 
    id="addNewComparisonTableCategoryModal"
    data-add-new-comparison-table-category-modal
>
    <div class="modal__dialog">
        <div class="modal__content">
            {* 1. Modal Top *}
            <div class="modal__top top">
                <h4 class="top__title h6">
                    <span data-add-new-comparison-table-category-modal-title-add>Add New Category</span>
                    <span class="is-hidden" data-add-new-comparison-table-category-modal-title-copy>Copy Category</span>
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
                id="addNewComparisonTableCategoryForm"
                data-add-new-comparison-table-category-form
                data-ajax-url="{$helper->url('CustomPage@getComparisonCategoryItem',['templateName' => $template->getMainName()])}"
                data-assets-url="{$whmcsURL}/templates/{$themeName}/assets"
                data-load-icons-url="{$whmcsURL}/modules/addons/RSThemes/src/Api/clientApi.php?controller=Icon&method=renderTabs&items="
            >
                <div class="modal__body has-scroll">
                    <div class="modal__section">
                        <div class="modal__section-content">                        
                            {* 2.1. Category title *}
                            <div class="form-group">
                                <label class="form-label">
                                    Category Title
                                    {if $cms_tooltips->modal['item']['add_edit']['comparison']['category']['title']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['comparison']['category']['title']['url']) && $cms_tooltips->modal['item']['add_edit']['comparison']['category']['title']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['comparison']['category']['title']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right-top"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['comparison']['category']['title']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </label>
                                <input
                                    class="form-control"
                                    type="text"
                                    name="item[category_title]"
                                    value=""
                                />
                            </div>  

                            {* 2.2. Show Graphic Switcher *}
                            <div class="form-group">
                                <label 
                                    class="form-label is-pointer m-b-0x m-t-2x"
                                    data-toggle="lu-collapse"
                                    data-target="#collapse-category-add-modal-tabs"
                                >
                                    <span class="form-text d-flex align-items-center">
                                        Show graphic for this item
                                        {if $cms_tooltips->modal['item']['add_edit']['comparison']['category']['show_graphic']['content']}
                                            {if isset($cms_tooltips->modal['item']['add_edit']['comparison']['category']['show_graphic']['url']) && $cms_tooltips->modal['item']['add_edit']['comparison']['category']['show_graphic']['url'] != ""}
                                                {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['comparison']['category']['show_graphic']['url']}' target='_blank'>Learn More</a>"}
                                            {else}
                                                {assign var="popoverFooter" value=false}
                                            {/if}
                                            {include 
                                                file="adminarea/includes/helpers/popover.tpl" 
                                                popoverClasses="notification__popover popover__right"
                                                popoverBody="{$cms_tooltips->modal['item']['add_edit']['comparison']['category']['show_graphic']['content']}"
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

                            {* 2.3. Graphic Container *}
                            <div class="collapse" id="collapse-category-add-modal-tabs" data-product-tabs data-icons-tabs>
                                {include file="adminarea/pages/includes/modal/other/icon-tabs.tpl" type='category-add'}
                            </div>
                        </div>
                        {* 2.4. Advanced Settings *}
                        <div 
                            class="modal__section-header top collapsed m-t-3x" 
                            data-toggle="lu-collapse" 
                            data-target="#addNewComparisonCategory-advanced-settings" 
                            data-product-advanced-settings-toogle
                        >
                            <span class="top__title p-md">Advanced Settings</span>
                            <button type="button" class="top__toolbar btn btn--link">
                                <span class="btn__text">Expand</span>
                                <span class="btn__text">Hide</span>
                                <i class="btn__icon ls ls-down"></i>
                            </button>
                        </div>
                        <div class="modal__section-content collapse" id="addNewComparisonCategory-advanced-settings" data-product-advanced-settings>
                            {* 2.4.1. Custom Class *}
                            <div class="form-group m-t-2x">
                                <label class="form-label">
                                    Custom category class
                                    {if $cms_tooltips->modal['item']['add_edit']['comparison']['category']['custom_class']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['comparison']['category']['custom_class']['url']) && $cms_tooltips->modal['item']['add_edit']['comparison']['category']['custom_class']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['comparison']['category']['custom_class']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['comparison']['category']['custom_class']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </label>
                                <input class="form-control" type="text" name="item[custom_classes]" value=""/>
                            </div>
                        </div>    
                    </div>

                    {* 2.5. Hidden Inputs *}
                    <input type="hidden" name="item[list_name]" data-list-name value=""/>
                    <input type="hidden" name="item[new_index]" data-list-new-index value=""/>
                    <input type="hidden" name="item[new_position]" data-list-new-position value=""/>
                    <input type="hidden" name="item[section]" data-list-section-index value=""/>
                    <input type="hidden" name="item[group]" data-list-group-index value=""/>
                </div>

                {* 2.6. Modal Actions *}
                <div class="modal__actions">
                    <button class="btn btn--primary" data-add-new-comparison-table-category-btn type="submit" form="addNewComparisonTableCategoryForm">
                        <span class="btn__text">
                            <span data-add-new-comparison-table-category-btn-add>Add</span>
                            <span class="is-hidden" data-add-new-comparison-table-category-btn-copy>Copy</span>
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