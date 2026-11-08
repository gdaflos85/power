{if file_exists("{$smarty.current_dir}/overwrites/cycle-switcher-button.tpl")}
    {include file="{$smarty.current_dir}/overwrites/cycle-switcher-button.tpl"}  
{else}
    <button 
        type="button" 
        class="btn btn-sm cycle-change{if isset($cycle) && $cycle} {$cycle}{/if}{if isset($active) && $active} {$active}{/if}{if isset($class) && $class} {$class}{/if}" 
        {if isset($cycle) && $cycle}data-change-pricing="{$cycle}"{/if}
    > 
        {if isset($name) && $name}
            <span class="btn-text">
                {if $name eq "monthly"}
                    {$LANG.orderpaymenttermmonthly}
                {elseif $name eq "quarterly"}
                    {$LANG.orderpaymenttermquarterly}
                {elseif $name eq "semiannually"}
                    {$LANG.orderpaymenttermsemiannually}
                {elseif $name eq "annually"}
                    1-{$LANG.orderForm.year}
                {elseif $name eq "biennially"}
                    2-{$LANG.orderForm.years}
                {elseif $name eq "triennially"}
                    3-{$LANG.orderForm.years}
                {/if}
            </span>
        {/if}
        <label 
            class="label label-xs label-save {if isset($discount) && $discount}{else}hidden{/if}"
            {if isset($dataDiscount) && is_array($dataDiscount)}
                data-change-discount='[{foreach from=$dataDiscount key=key item=$d}"{if isset($d[$name]) && is_array($d[$name])}{min($d[$name])}{else}0{/if}"{if !$d@last},{/if}{/foreach}]'
            {/if}
        >
            {$rslang->trans('packages.save')}&nbsp;
            <span data-change-discount-value>
                {$discount}
            </span>%
        </label>
    </button>
{/if}