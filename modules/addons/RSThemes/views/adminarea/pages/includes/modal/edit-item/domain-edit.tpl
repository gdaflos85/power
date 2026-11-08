{************************************************* 

RSThemes - Website Builder - Edit TLD Modal

1. Modal Top
2. Modal Form 
    2.1. TLD
        2.1.1. Choose TLD
    2.2. Hidden Inputs
    2.3. Modal Actions

*************************************************}

<div class="modal" id="editDomainItemModal" data-edit-domain-item-modal>
    <div class="modal__dialog">
        <div class="modal__content">
            {* 1. Modal Top *}
            <div class="modal__top top">
                <h4 class="top__title h6">Edit "TLD" item {include file="adminarea/includes/helpers/docs.tpl" link=$cms_docs->modal['item']['add_edit']['domain']}</h4>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link cancel__item" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>

            {* 2. Modal Form *}
            <form 
                id="editDomainForm" 
                data-edit-domain-item-form
                data-ajax-url="{$helper->url('CustomPage@getListItem',['templateName' => $template->getMainName()])}"
            >
                <div class="modal__body overflow-y-visible">
                    {* 2.1. TLD *}
                    <div class="modal__section">
                        <div class="modal__section-content">         
                            {* 2.1.1. Choose TLD *}
                            <div class="form-group">
                                <label class="form-label">
                                    Choose TLD
                                    {if $cms_tooltips->modal['item']['add_edit']['domain']['choose_tld']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['domain']['choose_tld']['url']) && $cms_tooltips->modal['item']['add_edit']['domain']['choose_tld']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['domain']['choose_tld']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right-top"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['domain']['choose_tld']['content']}"
                                            popoverFooter="{$popoverFooter}"
                                        }
                                    {/if}
                                </label>
                                <select class="form-control" name="item[domain]" required data-select-domain>                            
                                    {foreach $domains as $domain}
                                        <option value="{$domain->id}">{$domain->extension}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                    </div>   

                    {* 2.4. Advanced Settings *}
                    <div 
                        class="modal__section-header top collapsed m-t-3x" 
                        data-toggle="lu-collapse" 
                        data-target="#editDomain-advanced-settings" 
                        data-product-advanced-settings-toogle
                    >
                        <span class="top__title p-md">Advanced Settings</span>
                        <button type="button" class="top__toolbar btn btn--link">
                            <span class="btn__text">Expand</span>
                            <span class="btn__text">Hide</span>
                            <i class="btn__icon ls ls-down"></i>
                        </button>
                    </div>
                    <div class="modal__section-content collapse" id="editDomain-advanced-settings" data-product-advanced-settings>
                        
                        {* 2.4.1 Apply Promocode *}
                        <div class="form-group m-t-2x">
                            <label class="form-label is-pointer m-w-360 m-b-0x m-t-2x" data-toggle="lu-collapse" data-target="#domain-edit-modal-promocode">
                                <span class="form-text d-flex align-items-center">
                                    Apply promotion code to this TLD
                                    {if $cms_tooltips->modal['item']['add_edit']['domain']['apply_promocode']['content']}
                                        {if isset($cms_tooltips->modal['item']['add_edit']['domain']['apply_promocode']['url']) && $cms_tooltips->modal['item']['add_edit']['domain']['apply_promocode']['url'] != ""}
                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['domain']['apply_promocode']['url']}' target='_blank'>Learn More</a>"}
                                        {else}
                                            {assign var="popoverFooter" value=false}
                                        {/if}
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover popover__right"
                                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['domain']['apply_promocode']['content']}"
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
                        <div class="collapse" id="domain-edit-modal-promocode" data-product-promocode>
                            <div class="form-group">
                                <select class="form-control" name="item[promocode]">
                                    {foreach $promoCodes as $promoCode}
                                        <option value="{$promoCode.id}">{$promoCode.code}</option>
                                    {/foreach}
                                </select>
                                <div class="form-feedback form-feedback-md form-feedback-danger form-feedback--icon text-danger-lighter">
                                    Selected promotional code for this TLD will overwrite the code that was selected for the entire section
                                </div>
                            </div>
                        </div>
                    </div>        

                    {* 2.2. Hidden Inputs *}
                    <input type="hidden" name="item[list_name]" id="itemListName" data-edit-list-name value=""/>
                    <input type="hidden" name="item[key]" id="itemKey" data-edit-key value=""/>
                    <input type="hidden" name="item[position]" id="itemPosition" data-edit-position value=""/>
                    <input type="hidden" name="item[section]" data-edit-section-index value=""/>
                    <input type="hidden" name="item[group]" data-edit-group-index value=""/>
                </div>

                {* 2.3. Modal Actions *}
                <div class="modal__actions">
                    <button class="btn btn--primary" type="submit" form="editDomainForm" data-edit-domain-item-btn>
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