{if file_exists("{$smarty.current_dir}/overwrites/button.tpl")}
    {include file="{$smarty.current_dir}/overwrites/button.tpl"}
{elseif !is_string($button) && isset($button['link_type'])}
    {if $button['link_type'] == 'whmcs-page'}
        {assign var="url" value=$button['url']}
        {if $url|substr:0:1 != "/" && $url|strstr:"http" === false}
            {assign var="url" value="/`$url`"}
        {/if}
    {else}
        {assign var="url" value=$button['custom_url']}
        {if $url|substr:0:1 == "#"}
            {$smoothScroll = true}
        {/if}
      
    {/if}

    <a
        {if $button['link_type'] == "whmcs-product"}
            href="{$WEB_ROOT}/cart.php?a=add&pid={$button['whmcs_product']}{if isset($button.product_pricing.bestCycle)}&billingcycle={$button.product_pricing.bestCycle}{/if}"
        {elseif $url}href="{if $button['link_type'] == "homepage" || $url|substr:0:1 == "/"}{$WEB_ROOT}{/if}{$url}"{/if} {if $button['custom_classes']|strstr:'has-loader'}data-btn-loader{/if}
        {if $smoothScroll}
            data-scroll-to
        {/if}
        {if $keyFeaturesButton}
            onclick="handleClick(event)"
        {/if}
        class="btn{if $button['style'] !== 'link'} btn-{$button['type']}{/if}{if $button['style'] !== 'solid'} btn-{$button['style']}{/if}{if $button['size'] !== 'default'}{if $button['size'] == 'extra-large'} btn-xlg{/if}{if $button['size'] == 'large'} btn-lg{/if}{if $button['size'] == 'small'} btn-sm{/if}{if $button['size'] == 'extra-small'} btn-xs{/if}{/if} {$button['custom_classes']}" {if $button['target_blank']} target="_blank"{/if}>
        {if $button['show_icon'] && $button['font-icon'] && $button['font-icon'] != "undefined"}
            <div class="btn-icon">
                <i class="{$button['font-icon']}"></i>
            </div>
        {/if}
        <span class="btn-text">
            {if isset($frontHelper)}{$frontHelper->langParse($button['text'])}{else}{$button['text']}{/if}
        </span>
        {if $button['custom_classes']|strstr:'has-loader'}
            <div class="loader loader-button hidden" >
                {include file="{$smarty.current_dir}/../../../../includes/common/loader.tpl" classes="spinner-sm"}
            </div>
        {/if}
    </a>
{/if}