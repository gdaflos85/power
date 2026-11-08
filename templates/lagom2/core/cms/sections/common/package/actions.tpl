{if file_exists("{$smarty.current_dir}/overwrites/actions.tpl")}
    {include file="{$smarty.current_dir}/overwrites/actions.tpl"}  
{else}
    {if (isset($product.show_link) && $product.show_link == 1 && $product.link_text != "") || !isset($product.show_link) || $product.show_link == 0}
    <div class="package-actions" {if $productStockControl}data-product-qty-container data-qty-id="{$product.product_id}"{/if}>
        {if $typePackage == "graphic"}
        <div
        {else}
        <a
        {/if}
            {if isset($product.show_link) && $product.show_link == 1 && ((($product.link_type == "custom-url" || $product.link_type == "homepage") && $product.custom_url != "") ||  ($product.link_type == "whmcs-page" && $product.whmcs_page != ""))}
                href="{if $product.link_type == "custom-url" ||  $product.link_type == "homepage"}{if $product.link_type == "homepage" || $product.custom_url|substr:0:1 == "/"}{$WEB_ROOT}{/if}{$product.custom_url}{elseif $product.link_type == "whmcs-page"}{$WEB_ROOT}{if $product.url|substr:0:1 != "/"}/{/if}{$product.url}{/if}" 
                data-href="{if $product.link_type == "custom-url" ||  $product.link_type == "homepage"}{if $product.link_type == "homepage" || $product.custom_url|substr:0:1 == "/"}{$WEB_ROOT}{/if}{$product.custom_url}{elseif $product.link_type == "whmcs-page"}{$WEB_ROOT}{if $product.url|substr:0:1 != "/"}/{/if}{$product.url}{/if}" 
            {else}
                {if $product.product.productType == "marketconnect"}
                    {$cartUrl = 'cart/order?'}
                {else}
                     {$cartUrl = 'cart.php?a=add&'}
                {/if}
                href="{$WEB_ROOT}/{$cartUrl}pid={$pid}{if isset($cycle) && $cycle}&billingcycle={$cycle}{/if}{if $promocodeValue}&promocode={$promocodeValue}{/if}" 
                data-href="{$WEB_ROOT}/{$cartUrl}pid={$pid}" 
                data-btn-loader
            {/if}
           
            {if isset($dataPeriod) && $dataPeriod}
                data-plan-link='[{foreach from=$dataPeriod|@array_reverse:true key=key item=$pricing}"&billingcycle={$key}"{if !$pricing@last},{/if}{/foreach}]'
                data-plan-promocode='[{foreach from=$dataPeriod|@array_reverse:true key=key item=$pricing}"{if $pricing.promocode}&promocode={$pricing.promocode}{else}{/if}"{if !$pricing@last},{/if}{/foreach}]' 
            {/if}
            {if $productStockControl}data-product-qty-btn{/if}
            class="btn btn-primary {if !$displayBestPrice && !$displayFirstAvailableCycle && $product.product.price.tabs[$firstAvailableCycle].price == "-1"} disabled{/if} {if $productStockControl}btn-out-of-stock{/if}"
            {if isset($product.show_link) && $product.show_link == 1 && isset($product.target_blank) && $product.target_blank} target="_blank"{/if}
        >
            <span class="btn-text" {if $productStockControl}data-product-qty-btn-text="{$LANG.outofstock}"{/if}>
                {if $product.link_text != ""}
                    {if isset($frontHelper)}{$frontHelper->langParse($product.link_text)}{else}{$product.link_text|unescape:'html'}{/if}
                {else}
                    {$LANG.ordernowbutton}
                {/if}
            </span>
            <span class="btn-text unavailable">{$LANG.unavailable}</span>
            <div class="loader loader-button hidden" >
                {include file="{$smarty.current_dir}/../../../../../includes/common/loader.tpl" classes="spinner-sm"}
            </div>
        {if $typePackage ==  "graphic"}
        </div>
        {else}
        </a>
        {/if}
        {if $productStockControl}
            <span class="package-qty">
                <span data-product-qty-control>-</span> {$LANG.orderavailable}
            </span>
        {/if}
    </div>
    {/if}
{/if}