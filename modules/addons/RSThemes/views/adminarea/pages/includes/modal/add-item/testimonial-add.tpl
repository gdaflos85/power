{************************************************* 

RSThemes - Website Builder - Add New Testimonial Modal

1. Modal Top
2. Modal Form 
    2.1. Testimonial
        2.1.1. Title
        2.1.2. Description
        2.1.3. Author
        2.1.4. Domain/Position
        2.1.5. Domain/Position URL
        2.1.6. Date
        2.1.7. Show Graphic Switcher
        2.1.8. Graphic Container
    2.2. Hidden Inputs
    2.3. Modal Actions

*************************************************}

<div class="modal modal--lg modal--media modal--media-scroll" id="newTestimonialsItemModal" data-add-new-testimonial-item-modal>
    <div class="modal__dialog">
        <div class="modal__content">
            {* 1. Modal Top *}
            <div class="modal__top top">
                <h4 class="top__title h6">Add New Item {include file="adminarea/includes/helpers/docs.tpl" link=$cms_docs->modal['item']['add_edit']['testimonial']}</h4>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link cancel__item" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>

            {* 2. Modal Form *}
            <form id="addNewTestimonialsItem" 
                data-add-new-testimonial-item-form 
                data-ajax-url="{$helper->url('CustomPage@getListItem',['templateName' => $template->getMainName()])}"
                data-assets-url="{$whmcsURL}/templates/{$themeName}/assets"
                data-load-icons-url="{$whmcsURL}/modules/addons/RSThemes/src/Api/clientApi.php?controller=Icon&method=renderTabs&items="
            >
                <div class="modal__body has-scroll">
                    {* 2.1. Testimonial *}
                    <div class="modal__section">
                        {* 2.1.1. Title *}
                        <div class="form-group">
                            <label class="form-label">
                                Title
                                {if $cms_tooltips->modal['item']['add_edit']['testimonial']['title']['content']}
                                    {if isset($cms_tooltips->modal['item']['add_edit']['testimonial']['title']['url']) && $cms_tooltips->modal['item']['add_edit']['testimonial']['title']['url'] != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['testimonial']['title']['url']}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include 
                                        file="adminarea/includes/helpers/popover.tpl" 
                                        popoverClasses="notification__popover popover__right-top"
                                        popoverBody="{$cms_tooltips->modal['item']['add_edit']['testimonial']['title']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                            </label>
                            <input class="form-control" type="text" name="item[title]" value=""/>
                        </div>

                        {* 2.1.2. Description *}
                        <div class="form-group">
                            <label class="form-label">
                                Description
                                {if $cms_tooltips->modal['item']['add_edit']['testimonial']['description']['content']}
                                    {if isset($cms_tooltips->modal['item']['add_edit']['testimonial']['description']['url']) && $cms_tooltips->modal['item']['add_edit']['testimonial']['description']['url'] != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['testimonial']['description']['url']}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include 
                                        file="adminarea/includes/helpers/popover.tpl" 
                                        popoverClasses="notification__popover popover__right"
                                        popoverBody="{$cms_tooltips->modal['item']['add_edit']['testimonial']['description']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                            </label>
                            <textarea class="form-control" data-html-editor rows="2" name="item[description]"></textarea>
                        </div>

                        {* 2.1.3. Author *}
                        <div class="form-group">
                            <label class="form-label">
                                Author
                                {if $cms_tooltips->modal['item']['add_edit']['testimonial']['author']['content']}
                                    {if isset($cms_tooltips->modal['item']['add_edit']['testimonial']['author']['url']) && $cms_tooltips->modal['item']['add_edit']['testimonial']['author']['url'] != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['testimonial']['author']['url']}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include 
                                        file="adminarea/includes/helpers/popover.tpl" 
                                        popoverClasses="notification__popover popover__right"
                                        popoverBody="{$cms_tooltips->modal['item']['add_edit']['testimonial']['author']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                            </label>
                            <input class="form-control" type="text" name="item[author]" value=""/>
                        </div>

                        {* 2.1.4. Domain/Position *}
                        <div class="form-group">
                            <label class="form-label">
                                Domain/Position
                                {if $cms_tooltips->modal['item']['add_edit']['testimonial']['domain_position']['content']}
                                    {if isset($cms_tooltips->modal['item']['add_edit']['testimonial']['domain_position']['url']) && $cms_tooltips->modal['item']['add_edit']['testimonial']['domain_position']['url'] != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['testimonial']['domain_position']['url']}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include 
                                        file="adminarea/includes/helpers/popover.tpl" 
                                        popoverClasses="notification__popover popover__right"
                                        popoverBody="{$cms_tooltips->modal['item']['add_edit']['testimonial']['domain_position']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                            </label>
                            <input class="form-control" type="text" name="item[domain]" value=""/>
                        </div>

                        {* 2.1.5. Domain/Position URL *}
                        <div class="form-group">
                            <label class="form-label">
                                Domain/Position URL
                                {if $cms_tooltips->modal['item']['add_edit']['testimonial']['domain_position_url']['content']}
                                    {if isset($cms_tooltips->modal['item']['add_edit']['testimonial']['domain_position_url']['url']) && $cms_tooltips->modal['item']['add_edit']['testimonial']['domain_position_url']['url'] != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['testimonial']['domain_position_url']['url']}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include 
                                        file="adminarea/includes/helpers/popover.tpl" 
                                        popoverClasses="notification__popover popover__right"
                                        popoverBody="{$cms_tooltips->modal['item']['add_edit']['testimonial']['domain_position_url']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                            </label>
                            <input class="form-control" type="text" name="item[domain_url]" value=""/>
                        </div>

                        {* 2.1.6. Date *}
                        <div class="form-group">
                            <label class="form-label">
                                Date
                                {if $cms_tooltips->modal['item']['add_edit']['testimonial']['date']['content']}
                                    {if isset($cms_tooltips->modal['item']['add_edit']['testimonial']['date']['url']) && $cms_tooltips->modal['item']['add_edit']['testimonial']['date']['url'] != ""}
                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['testimonial']['date']['url']}' target='_blank'>Learn More</a>"}
                                    {else}
                                        {assign var="popoverFooter" value=false}
                                    {/if}
                                    {include 
                                        file="adminarea/includes/helpers/popover.tpl" 
                                        popoverClasses="notification__popover popover__right"
                                        popoverBody="{$cms_tooltips->modal['item']['add_edit']['testimonial']['date']['content']}"
                                        popoverFooter="{$popoverFooter}"
                                    }
                                {/if}
                            </label>
                            <input class="form-control" type="date" name="item[date]" value=""/>
                        </div>

                        {* 2.1.7. Show Graphic Switcher *}
                        <div class="form-group">
                            <label class="form-label is-pointer m-b-0x m-t-2x"
                                data-toggle="lu-collapse"
                                data-target="#testimonial-add-modal-tabs">
                                <span class="form-text d-flex align-items-center">
                                    Show graphic for this item
                                    {if $cms_tooltips->modal['item']['add_edit']['testimonial']['show_graphic']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['testimonial']['show_graphic']['url']) && $cms_tooltips->modal['item']['add_edit']['testimonial']['show_graphic']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['testimonial']['show_graphic']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['testimonial']['show_graphic']['content']}"
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

                        {* 2.1.8. Graphic Container *}
                        <div class="collapse" id="testimonial-add-modal-tabs" data-icons-tabs>
                            {include file="adminarea/pages/includes/modal/tabs.tpl" type='testimonial-add'}
                        </div>
                    </div>    

                    {* 2.2. Hidden Inputs *}
                    <input type="hidden" name="item[list_name]" data-list-name value=""/>
                    <input type="hidden" name="item[new_index]" data-list-new-index  value=""/>
                    <input type="hidden" name="item[new_position]" data-list-new-position  value=""/>
                    <input type="hidden" name="item[section]" data-list-section-index value=""/>
                    <input type="hidden" name="item[group]" data-list-group-index value=""/>
                    <input type="hidden" name="item[hide_modal_icon]" data-list-modal-icon value=""/>
                </div>

                {* 2.3. Modal Actions *}
                <div class="modal__actions">
                    <button id="addNewTestimonialItemButton" data-add-new-testimonial-item-btn class="btn btn--primary" type="submit" form="addNewTestimonialsItem">
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