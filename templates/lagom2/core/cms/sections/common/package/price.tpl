{if file_exists("{$smarty.current_dir}/overwrites/price.tpl")}
    {include file="{$smarty.current_dir}/overwrites/price.tpl"}  
{else}
    <div class="package-price" data-pricing-container>
        
        {* Price Discount *}
        {if isset($discountPrice) && $discountPrice || isset($dataDiscountPrice) && $dataDiscountPrice}
            <div class="price-discount {if isset($discountHidden) && $discountHidden}hidden{/if}">
                <span class="price-discount-old">                                           
                    <span 
                        class="price-discount-ammount"
                        {if isset($dataDiscountPrice) && $dataDiscountPrice}
                            {if isset($montlyBreakdown) && $montlyBreakdown}
                                data-price-old='[{foreach from=$dataDiscountPrice|@array_reverse:true key=key item=$pricing}"{if $pricing.discount.applied}{$formattedDataDiscount = formatCurrency($pricing.discount.before)}{$formattedDataDiscount|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}{else}0{/if}"{if !$pricing@last},{/if}{/foreach}]'
                            {else}
                                data-price-old='[{foreach from=$dataDiscountPrice|@array_reverse:true key=key item=$pricing}"{if $pricing.discount.applied}{$formattedDataDiscount = formatCurrency($pricing.discount.real_before)}{$formattedDataDiscount|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}{else}0{/if}"{if !$pricing@last},{/if}{/foreach}]'
                            {/if}
                        {/if}
                    >
                        {$discountPrice|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}
                    </span>
                </span>
                <span class="price-discount-save label label-xs label-save">
                    {$rslang->trans('packages.save')}&nbsp;
                    <span
                        {if isset($dataDiscountPrice) && $dataDiscountPrice}
                            data-price-discount='[{foreach from=$dataDiscountPrice|@array_reverse:true key=key item=$pricing}"{$pricing.discount.percentage}"{if !$pricing@last},{/if}{/foreach}]'
                        {/if}
                    >
                        {$discountValue}
                    </span>%
                </span>
            </div>
        {/if}

        {* Price *}
        <span class="price {if $type != "default" && $type != "graphic"}price-sm{elseif $type == "graphic"}price-xs{/if}">
            {if isset($startingFrom) && $startingFrom}
                <span class="price-starting-from">{$LANG.startingfrom}</span>
            {/if}
            {* Price Ammount *}
            {if isset($priceValue) && $priceValue}
                <span 
                    class="price-ammount"
                    {if isset($dataPrice) && $dataPrice}
                        {if isset($montlyBreakdown) && $montlyBreakdown}
                            data-price='[{foreach from=$dataPrice|@array_reverse:true key=key item=$pricing}"{if $pricing.price != "-1" && $pricing.price != "Not Available"}{$formattedDataPrice = formatCurrency($pricing.price)}{$formattedDataPrice|replace:$WHMCSCurrency.suffix:" <sub>`$WHMCSCurrency.suffix`</sub>"}{else}-1{/if}"{if !$pricing@last},{/if}{/foreach}]'
                        {else}
                            data-price='[{foreach from=$dataPrice|@array_reverse:true key=key item=$pricing}"{if $pricing.real_price != "-1" && $pricing.real_price != "Not Available"}{$formattedDataPrice = formatCurrency($pricing.real_price)}{$formattedDataPrice|replace:$WHMCSCurrency.suffix:" <sub>`$WHMCSCurrency.suffix`</sub>"}{else}-1{/if}"{if !$pricing@last},{/if}{/foreach}]'
                        {/if}
                        data-unavailable-text="{$LANG.unavailable}"
                    {/if}    
                >
                    {$priceValue|replace:$WHMCSCurrency.suffix:" <sub>`$WHMCSCurrency.suffix`</sub>"}
                </span>
            {/if}   

            {* Price Period *}
            <span 
                class="price-cycle"
                {if isset($dataPeriod) && $dataPeriod}
                    data-pricing-period='[{foreach from=$dataPeriod|@array_reverse:true key=key item=$pricing}"{if $key eq "monthly"}{$LANG.orderpaymenttermmonthly}{elseif $key eq "quarterly"}{$LANG.orderpaymenttermquarterly}{elseif $key eq "semiannually"}{$LANG.orderpaymenttermsemiannually}{elseif $key eq "annually"}{$LANG.orderpaymenttermannually}{elseif $key eq "biennially"}{$LANG.orderpaymenttermbiennially}{elseif $key eq "triennially"}{$LANG.orderpaymenttermtriennially}{/if}"{if !$pricing@last},{/if}{/foreach}]'
                {/if}            
            >
                {if isset($montlyBreakdown) && $montlyBreakdown}
                    {$LANG.orderpaymenttermmonthly}
                {elseif isset($cycle) && $cycle}
                    {if $cycle eq "monthly"}
                        {$LANG.orderpaymenttermmonthly}
                    {elseif $cycle eq "quarterly"}
                        {$LANG.orderpaymenttermquarterly}
                    {elseif $cycle eq "semiannually"}
                        {$LANG.orderpaymenttermsemiannually}
                    {elseif $cycle eq "annually"}
                        {$LANG.orderpaymenttermannually}
                    {elseif $cycle eq "biennially"}
                        {$LANG.orderpaymenttermbiennially}
                    {elseif $cycle eq "triennially"}
                        {$LANG.orderpaymenttermtriennially}
                    {elseif $cycle == "onetime"}
                        {$LANG.orderpaymenttermonetime}    
                    {/if}
                {/if}
            </span>
        </span>
    </div>
{/if}