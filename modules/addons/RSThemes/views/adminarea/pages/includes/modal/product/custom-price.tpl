<div class="form-group m-b-0x is-hidden">
        {* Custom Price Simple *}
        <div class="row" data-product-simple-custom-price>
            <div class="col-md-4">
                <div class="form-group">
                    <div class="d-flex">
                        <label class="form-label flex-grow-1">
                            Price Before
                            {if $cms_tooltips->modal['item']['add_edit']['product']['custom_price_before']['content']}
                                {if isset($cms_tooltips->modal['item']['add_edit']['product']['custom_price_before']['url']) && $cms_tooltips->modal['item']['add_edit']['product']['custom_price_before']['url'] != ""}
                                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['product']['custom_price_before']['url']}' target='_blank'>Learn More</a>"}
                                {else}
                                    {assign var="popoverFooter" value=false}
                                {/if}
                                {include 
                                    file="adminarea/includes/helpers/popover.tpl" 
                                    popoverClasses="notification__popover popover__right"
                                    popoverBody="{$cms_tooltips->modal['item']['add_edit']['product']['custom_price_before']['content']}"
                                    popoverFooter="{$popoverFooter}"
                                }
                            {/if}
                        </label>
                    </div>
                    <input
                        class="form-control"
                        type="text"
                        name="item[custom_price_before]"
                        value=""
                        data-product-custom-price-before
                    />
                </div>
            </div>    
            <div class="col-md-4">
                <div class="form-group">
                    <div class="d-flex">
                        <label class="form-label flex-grow-1">
                            Price After
                            {if $cms_tooltips->modal['item']['add_edit']['product']['custom_price_after']['content']}
                                {if isset($cms_tooltips->modal['item']['add_edit']['product']['custom_price_after']['url']) && $cms_tooltips->modal['item']['add_edit']['product']['custom_price_after']['url'] != ""}
                                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['product']['custom_price_after']['url']}' target='_blank'>Learn More</a>"}
                                {else}
                                    {assign var="popoverFooter" value=false}
                                {/if}
                                {include 
                                    file="adminarea/includes/helpers/popover.tpl" 
                                    popoverClasses="notification__popover"
                                    popoverBody="{$cms_tooltips->modal['item']['add_edit']['product']['custom_price_after']['content']}"
                                    popoverFooter="{$popoverFooter}"
                                }
                            {/if}
                        </label>
                    </div>
                    <input
                        class="form-control"
                        type="text"
                        name="item[custom_price_after]"
                        value=""
                        data-product-custom-price-after
                    />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <div class="d-flex">
                        <label class="form-label flex-grow-1">
                            Discount Label
                            {if $cms_tooltips->modal['item']['add_edit']['product']['custom_discount_label']['content']}
                                {if isset($cms_tooltips->modal['item']['add_edit']['product']['custom_discount_label']['url']) && $cms_tooltips->modal['item']['add_edit']['product']['custom_discount_label']['url'] != ""}
                                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['product']['custom_discount_label']['url']}' target='_blank'>Learn More</a>"}
                                {else}
                                    {assign var="popoverFooter" value=false}
                                {/if}
                                {include 
                                    file="adminarea/includes/helpers/popover.tpl" 
                                    popoverClasses="notification__popover"
                                    popoverBody="{$cms_tooltips->modal['item']['add_edit']['product']['custom_discount_label']['content']}"
                                    popoverFooter="{$popoverFooter}"
                                }
                            {/if}
                        </label>
                    </div>
                    <input
                        class="form-control"
                        type="text"
                        name="item[custom_price_label]"
                        value=""
                        data-product-custom-price-label
                    />
                </div>
            </div>
        </div>

        {* Multi custom price - Monthly *}
        <div class="row is-hidden" data-product-multi-custom-price-header>
            <div class="col-md-2">&nbsp;</div>
            <div class="col">
                <label class="form-label flex-grow-1">
                    Price Before
                    {if $cms_tooltips->modal['item']['add_edit']['product']['custom_price_before']['content']}
                        {if isset($cms_tooltips->modal['item']['add_edit']['product']['custom_price_before']['url']) && $cms_tooltips->modal['item']['add_edit']['product']['custom_price_before']['url'] != ""}
                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['product']['custom_price_before']['url']}' target='_blank'>Learn More</a>"}
                        {else}
                            {assign var="popoverFooter" value=false}
                        {/if}
                        {include 
                            file="adminarea/includes/helpers/popover.tpl" 
                            popoverClasses="notification__popover popover__right"
                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['product']['custom_price_before']['content']}"
                            popoverFooter="{$popoverFooter}"
                        }
                    {/if}
                </label>
            </div>
            <div class="col">
                <label class="form-label flex-grow-1">
                    Price After
                    {if $cms_tooltips->modal['item']['add_edit']['product']['custom_price_after']['content']}
                        {if isset($cms_tooltips->modal['item']['add_edit']['product']['custom_price_after']['url']) && $cms_tooltips->modal['item']['add_edit']['product']['custom_price_after']['url'] != ""}
                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['product']['custom_price_after']['url']}' target='_blank'>Learn More</a>"}
                        {else}
                            {assign var="popoverFooter" value=false}
                        {/if}
                        {include 
                            file="adminarea/includes/helpers/popover.tpl" 
                            popoverClasses="notification__popover"
                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['product']['custom_price_after']['content']}"
                            popoverFooter="{$popoverFooter}"
                        }
                    {/if}
                </label>
            </div>
            <div class="col">
                <label class="form-label flex-grow-1">
                    Discount Label
                    {if $cms_tooltips->modal['item']['add_edit']['product']['custom_discount_label']['content']}
                        {if isset($cms_tooltips->modal['item']['add_edit']['product']['custom_discount_label']['url']) && $cms_tooltips->modal['item']['add_edit']['product']['custom_discount_label']['url'] != ""}
                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$cms_tooltips->modal['item']['add_edit']['product']['custom_discount_label']['url']}' target='_blank'>Learn More</a>"}
                        {else}
                            {assign var="popoverFooter" value=false}
                        {/if}
                        {include 
                            file="adminarea/includes/helpers/popover.tpl" 
                            popoverClasses="notification__popover"
                            popoverBody="{$cms_tooltips->modal['item']['add_edit']['product']['custom_discount_label']['content']}"
                            popoverFooter="{$popoverFooter}"
                        }
                    {/if}
                </label>
            </div>
        </div>
        <div class="row is-hidden" data-product-multi-custom-price="monthly">
            <div class="col-md-2 d-flex align-items-center m-b-2x">
                Monthly
            </div>
            <div class="col">
                <div class="form-group">
                    <input
                        class="form-control"
                        type="text"
                        name="item[custom_multi_price][monthly][before]"
                        value=""
                        disabled
                    />
                </div>
            </div>    
            <div class="col">
                <div class="form-group">
                    <input
                        class="form-control"
                        type="text"
                        name="item[custom_multi_price][monthly][after]"
                        value=""
                        disabled
                    />
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <input
                        class="form-control"
                        type="text"
                        name="item[custom_multi_price][monthly][label]"
                        value=""
                        disabled
                    />
                </div>
            </div>
        </div>
        
        {* Multi custom price - Quarterly *}
        <div class="row is-hidden" data-product-multi-custom-price="quarterly">
            <div class="col-md-2 d-flex align-items-center m-b-2x">
                Quarterly
            </div>
            <div class="col">
                <div class="form-group">                   
                    <input
                        class="form-control"
                        type="text"
                        name="item[custom_multi_price][quarterly][before]"
                        value=""
                        disabled
                    />
                </div>
            </div>    
            <div class="col">
                <div class="form-group">                   
                    <input
                        class="form-control"
                        type="text"
                        name="item[custom_multi_price][quarterly][after]"
                        value=""
                        
                    />
                </div>
            </div>
            <div class="col">
                <div class="form-group">                    
                    <input
                        class="form-control"
                        type="text"
                        name="item[custom_multi_price][quarterly][label]"
                        value=""
                        disabled
                    />
                </div>
            </div>
        </div>

        {* Multi custom price - Semi-Annually *}
        <div class="row is-hidden" data-product-multi-custom-price="semiannually">
            <div class="col-md-2 d-flex align-items-center m-b-2x">
                Semi-Annually
            </div>
            <div class="col">
                <div class="form-group">                   
                    <input
                        class="form-control"
                        type="text"
                        name="item[custom_multi_price][semiannually][before]"
                        value=""
                        disabled
                    />
                </div>
            </div>    
            <div class="col">
                <div class="form-group">                   
                    <input
                        class="form-control"
                        type="text"
                        name="item[custom_multi_price][semiannually][after]"
                        value=""
                        disabled
                    />
                </div>
            </div>
            <div class="col">
                <div class="form-group">                   
                    <input
                        class="form-control"
                        type="text"
                        name="item[custom_multi_price][semiannually][label]"
                        value=""
                        disabled
                    />
                </div>
            </div>
        </div>

        {* Multi custom price - Annually *}
        <div class="row is-hidden" data-product-multi-custom-price="annually">
            <div class="col-md-2 d-flex align-items-center m-b-2x">
                Annually
            </div>
            <div class="col">
                <div class="form-group">                   
                    <input
                        class="form-control"
                        type="text"
                        name="item[custom_multi_price][annually][before]"
                        value=""
                        disabled
                    />
                </div>
            </div>    
            <div class="col">
                <div class="form-group">                   
                    <input
                        class="form-control"
                        type="text"
                        name="item[custom_multi_price][annually][after]"
                        value=""
                        disabled
                    />
                </div>
            </div>
            <div class="col">
                <div class="form-group">                   
                    <input
                        class="form-control"
                        type="text"
                        name="item[custom_multi_price][annually][label]"
                        value=""
                        disabled
                    />
                </div>
            </div>
        </div>

        {* Multi custom price - Biennially *}
        <div class="row is-hidden" data-product-multi-custom-price="biennially">
            <div class="col-md-2 d-flex align-items-center m-b-2x">
                Biennially
            </div>
            <div class="col">
                <div class="form-group">                   
                    <input
                        class="form-control"
                        type="text"
                        name="item[custom_multi_price][biennially][before]"
                        value=""
                        disabled
                    />
                </div>
            </div>    
            <div class="col">
                <div class="form-group">                   
                    <input
                        class="form-control"
                        type="text"
                        name="item[custom_multi_price][biennially][after]"
                        value=""
                        disabled
                    />
                </div>
            </div>
            <div class="col">
                <div class="form-group">                   
                    <input
                        class="form-control"
                        type="text"
                        name="item[custom_multi_price][biennially][label]"
                        value=""
                        disabled
                    />
                </div>
            </div>
        </div>

        {* Multi custom price - Triennially *}
        <div class="row is-hidden" data-product-multi-custom-price="triennially">
            <div class="col-md-2 d-flex align-items-center m-b-2x">
                Triennially
            </div>
            <div class="col">
                <div class="form-group">                   
                    <input
                        class="form-control"
                        type="text"
                        name="item[custom_multi_price][triennially][before]"
                        value=""
                        disabled
                    />
                </div>
            </div>    
            <div class="col">
                <div class="form-group">                  
                    <input
                        class="form-control"
                        type="text"
                        name="item[custom_multi_price][triennially][after]"
                        value=""
                        disabled
                    />
                </div>
            </div>
            <div class="col">
                <div class="form-group">                    
                    <input
                        class="form-control"
                        type="text"
                        name="item[custom_multi_price][triennially][label]"
                        value=""
                        disabled
                    />
                </div>
            </div>
        </div>
      
</div>