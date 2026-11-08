{************************************************* 

RSThemes - Website Builder - Add New Promotion Manager Item Modal

1. Modal Top
2. Modal Form 
    2.1. Item
        2.1.1. Promotion
        2.1.2  Slide Name
        2.1.3. Slide Name
        2.1.4. Show Item Link
        2.1.5. Item Link Text
        2.1.6. Item Link Type
        2.1.7. Custom Url
        2.1.8. Linked Page
        2.1.9. Open Url In New Window
        2.1.10. Show Graphic Switcher
        2.1.11. Graphic Container
    2.2. Hidden Inputs
    2.3. Modal Actions

*************************************************}

<div 
    class="modal modal--lg modal--media modal--media-scroll" 
    id="addNewPromotionManagerItemModal" 
    data-add-new-promo-manager-item-modal
>
    <div class="modal__dialog">
        <div class="modal__content">
            {* 1. Modal Top *}
            <div class="modal__top top">
                <h4 class="top__title h6">Select Promotion Slides {include file="adminarea/includes/helpers/docs.tpl" link=$cms_docs->modal['item']['add_edit']['promotion_manager']}</h4>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link cancel__item" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>

            {* 2. Modal Form *}
            <form 
                id="addNewPromotionManagerItemForm" 
                data-add-new-promo-manager-item-form 
                data-ajax-url="{$helper->url('CustomPage@getListItem',['templateName' => $template->getMainName()])}"
                data-assets-url="{$whmcsURL}/templates/{$themeName}/assets"
                data-load-icons-url="{$whmcsURL}/modules/addons/RSThemes/src/Api/clientApi.php?controller=Icon&method=renderTabs&items="
            >
                <div class="modal__body overflow-y-visible">
                    {* 2.1. Item *}
                    <div class="modal__section">
                        {* 2.1.1. Promotion *}
                        <div class="form-group">
                            <label class="form-label form-label--basic">
                                Promotion Slides
                                {if $cms_tooltips->modal['item']['add_edit']['promotion_manager']['promotion']['content']}
                                    {if isset($cms_tooltips->modal['item']['add_edit']['promotion_manager']['promotion']['url']) && $cms_tooltips->modal['item']['add_edit']['promotion_manager']['promotion']['url'] != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['promotion_manager']['promotion']['url']}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include 
                                        file="adminarea/includes/helpers/popover.tpl" 
                                        popoverClasses="notification__popover popover__right"
                                        popoverBody="{$cms_tooltips->modal['item']['add_edit']['promotion_manager']['promotion']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                            </label>
                            <select 
                                class="form-control" 
                                name="item[slide_id]" 
                                data-promotion-manager-slide
                                data-ajax-url="{$helper->url('CustomPage@getPromotionManagerSlide',['templateName' => $template->getMainName(), 'language' => $language])}"
                                data-default-select-value="all"
                            >
                                <option value="all" selected>All published promotion slides</option>
                                {foreach $promotionManagerSlides as $slide}
                                    <option value="{$slide->id}">{$slide->getField('slide_name')}</option> 
                                {/foreach}
                            </select>
                        </div>

                        <div class="collapse" id="promotion-manager-add-modal-promotion" data-promotion-manager-slide-items>

                            {* 2.1.2 Slide Name *}
                            <input class="is-hidden" type="hidden" name="item[title]" value="" data-promotion-manager-slide-title/>

                            {* 2.1.3. Slide Title *}
                            <div class="form-group" >
                                <div class="d-flex align-items-center m-b-1x">
                                    <label class="form-label flex-grow-1 m-b-0x">
                                        Slide Title
                                        {if $cms_tooltips->modal['item']['add_edit']['promotion_manager']['slide_title']['content']}
                                            {if isset($cms_tooltips->modal['item']['add_edit']['promotion_manager']['slide_title']['url']) && $cms_tooltips->modal['item']['add_edit']['promotion_manager']['slide_title']['url'] != ""}
                                                {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['promotion_manager']['slide_title']['url']}' target='_blank'>Learn More</a>"}
                                            {else}
                                                {assign var="popoverFooter" value=false}
                                            {/if}
                                            {include 
                                                file="adminarea/includes/helpers/popover.tpl" 
                                                popoverClasses="notification__popover popover__right"
                                                popoverBody="{$cms_tooltips->modal['item']['add_edit']['promotion_manager']['slide_title']['content']}"
                                                popoverFooter="{$popoverFooter}"
                                            }
                                        {/if}
                                    </label>
                                    <a
                                        href="#"
                                        target="_blank"
                                        data-slide-link
                                        data-default-url="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>'PromoBanners','exaction'=>'edit'])}&slide_id="
                                    >
                                        <span class="form-label m-b-0x">Edit</span>
                                    </a>
                                </div>    
                                <input class="form-control is-disabled" type="text" name="item[description]" value="" data-promotion-manager-slide-description/>
                            </div>

                            <div class="row">
                                {* 2.1.4. Start Date *}
                                <div class="form-group col-md-6">
                                    <div class="d-flex align-items-center m-b-1x">
                                        <label class="form-label flex-grow-1 m-b-0x">
                                            Start Date
                                            {if $cms_tooltips->modal['item']['add_edit']['promotion_manager']['start_date']['content']}
                                                {if isset($cms_tooltips->modal['item']['add_edit']['promotion_manager']['start_date']['url']) && $cms_tooltips->modal['item']['add_edit']['promotion_manager']['start_date']['url'] != ""}
                                                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['promotion_manager']['start_date']['url']}' target='_blank'>Learn More</a>"}
                                                {else}
                                                    {assign var="popoverFooter" value=false}
                                                {/if}
                                                {include 
                                                    file="adminarea/includes/helpers/popover.tpl" 
                                                    popoverClasses="notification__popover popover__right"
                                                    popoverBody="{$cms_tooltips->modal['item']['add_edit']['promotion_manager']['start_date']['content']}"
                                                    popoverFooter="{$popoverFooter}"
                                                }
                                            {/if}
                                        </label>
                                        <a
                                            href="#"
                                            target="_blank"
                                            data-slide-link
                                            data-default-url="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>'PromoBanners','exaction'=>'edit'])}&slide_id="
                                        >
                                            <span class="form-label m-b-0x">Edit</span>
                                        </a>
                                    </div>    
                                    <div class="input-group is-disabled">
                                        <i class="input-group__icon lm lm-calendar"></i>
                                        <input class="form-control " type="text" name="item[start_date]" value="" data-promotion-manager-slide-start-date/>
                                    </div>
                                </div>

                                {* 2.1.5. End Date *}
                                <div class="form-group col-md-6">
                                    <div class="d-flex align-items-center m-b-1x">
                                        <label class="form-label flex-grow-1 m-b-0x">
                                            End Date
                                            {if $cms_tooltips->modal['item']['add_edit']['promotion_manager']['end_date']['content']}
                                                {if isset($cms_tooltips->modal['item']['add_edit']['promotion_manager']['end_date']['url']) && $cms_tooltips->modal['item']['add_edit']['promotion_manager']['end_date']['url'] != ""}
                                                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['promotion_manager']['end_date']['url']}' target='_blank'>Learn More</a>"}
                                                {else}
                                                    {assign var="popoverFooter" value=false}
                                                {/if}
                                                {include 
                                                    file="adminarea/includes/helpers/popover.tpl" 
                                                    popoverClasses="notification__popover popover__right"
                                                    popoverBody="{$cms_tooltips->modal['item']['add_edit']['promotion_manager']['end_date']['content']}"
                                                    popoverFooter="{$popoverFooter}"
                                                }
                                            {/if}
                                        </label>
                                        <a
                                            href="#"
                                            target="_blank"
                                            data-slide-link
                                            data-default-url="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>'PromoBanners','exaction'=>'edit'])}&slide_id="
                                        >
                                            <span class="form-label m-b-0x">Edit</span>
                                        </a>
                                    </div>    
                                    <div class="input-group is-disabled">
                                        <i class="input-group__icon lm lm-calendar"></i>
                                        <input class="form-control" type="text" name="item[end_date]" value="" data-promotion-manager-slide-end-date/>
                                    </div>
                                </div>
                            </div> 
                        </div>     
                    </div>

                    {* 2.2. Hidden Inputs *}
                    <input type="hidden" name="item[list_name]" data-list-name value=""/>
                    <input type="hidden" name="item[new_index]" data-list-new-index value=""/>
                    <input type="hidden" name="item[new_position]" data-list-new-position value=""/>
                    <input type="hidden" name="item[section]" data-list-section-index value=""/>
                    <input type="hidden" name="item[group]" data-list-group-index value=""/>
                </div>

                {* 2.3. Modal Actions *}
                <div class="modal__actions">
                    <button class="btn btn--primary" data-add-new-promo-manager-btn  type="submit" form="addNewPromotionManagerItemForm">
                        <span class="btn__text">Add</span>
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