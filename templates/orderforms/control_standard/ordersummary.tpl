{if $producttotals}
    <table class="table order-summary">
        <tbody>
            <tr class="no-border">
                <td>
                    <span class="item-title">
                        {if $producttotals.allowqty && $producttotals.qty > 1}{$producttotals.qty} x {/if}
                        <strong>{$producttotals.productinfo.name}</strong> 
                    </span>
                    ({$producttotals.productinfo.groupname})
                </td>
                <td class="text-right">
                    <span>{$producttotals.pricing.baseprice}</span>
                </td>
            </tr>
            {foreach $producttotals.configoptions as $configoption}
                {if $configoption}
                    <tr class="no-border">
                        <td>
                            <span>&nbsp;&raquo; {$configoption.name}: {$configoption.optionname}</span>
                        </td>
                        <td class="text-right">
                            <span>{$configoption.recurring}{if $configoption.setup} + {$configoption.setup} {$LANG.ordersetupfee}{/if}</span>
                        </td>
                    </tr>
                {/if}
            {/foreach}
            {foreach $producttotals.addons as $addon}
                <tr class="dashed">
                    <td>
                        <span>+ {$addon.name}</span>
                    </td>
                    <td class="text-right">
                        <span>{$addon.recurring}</span>
                    </td>
                </tr>
            {/foreach}
            {if $producttotals.pricing.setup || $producttotals.pricing.addons}
                {if $producttotals.pricing.setup}
                    <tr>
                        <td>
                            <span>{$LANG.cartsetupfees}</span>
                        </td>
                        <td class="text-right">
                            <span>{$producttotals.pricing.setup}</span>
                        </td>
                    </tr>
                {/if}

                {if $producttotals.pricing.tax1}
                    <tr>
                        <td>
                            <span>{$carttotals.taxname} @ {$carttotals.taxrate}%</span>
                        </td>
                        <td class="text-right">
                            <span>{$producttotals.pricing.tax1}</span>
                        </td>
                    </tr>
                {/if}
                {if $producttotals.pricing.tax2}
                    <tr>
                        <td>
                            <span>{$carttotals.taxname2} @ {$carttotals.taxrate2}%</span>
                        </td>
                        <td class="text-right">
                            <span>{$producttotals.pricing.tax2}</span>
                        </td>
                    </tr>
                {/if}
            {/if}
            <tr class="totals">
                <td>
                    <span><strong>{$LANG.ordertotalduetoday}</strong></span>
                </td>
                <td class="text-right">
                    <span><strong>{$producttotals.pricing.totaltoday}</strong></span>
                </td>
            </tr>
            {if $producttotals.pricing.recurring}											
                {foreach from=$producttotals.pricing.recurring key=cycle item=recurring}
                    <tr>
                        <td>
                            <span>{$cycle} {$LANG.cartrecurringcharges}</span>
                        </td>
                        <td class="text-right">
                            <span>{$recurring}</span>
                        </td>
                    </tr>
                {/foreach}
            {/if}	
        </tbody>
    </table>
{elseif $renewals}
    <table class="table order-summary">
        <tbody>
            {if $carttotals.renewals}
                <tr class="no-border">
                    <td colspan="3">
                        <span class="item-title">
                            <strong>{lang key='domainrenewals'}</strong> 
                        </span>
                    </td>
                </tr>
                {foreach $carttotals.renewals as $domainId => $renewal}
                    <tr id="cartDomainRenewal{$domainId}">
                        <td>
                            <span>{$renewal.domain} - {$renewal.regperiod} {if $renewal.regperiod == 1}{lang key='orderForm.year'}{else}{lang key='orderForm.years'}{/if}</span>
                        </td>
                        <td>
                            <a onclick="removeItem('r','{$domainId}'); return false;" href="#" id="linkCartRemoveDomainRenewal{$domainId}">
                                <i class="fas fa-times"></i>
                            </a>
                        </td>
                        <td class="text-right">
                            <span>{$renewal.priceBeforeTax}</span>
                        </td>
                    </tr>
                    {if $renewal.dnsmanagement}
                        <tr class="no-border">
                            <td colspan="3">
                                <span>+ {lang key='domaindnsmanagement'}</span>
                            </td>
                        </tr>
                    {/if}
                    {if $renewal.emailforwarding}
                        <tr class="no-border">
                            <td colspan="3">
                                <span>+ {lang key='domainemailforwarding'}</span>
                            </td>
                        </tr>
                    {/if}
                    {if $renewal.idprotection}
                        <tr class="no-border">
                            <td colspan="3">
                                <span>+ {lang key='domainidprotection'}</span>
                            </td>
                        </tr>
                    {/if}
                    {if $renewal.hasGracePeriodFee}
                        <tr class="no-border">
                            <td colspan="3">
                                <span>+ {lang key='domainRenewal.graceFee'}</span>
                            </td>
                        </tr>
                    {/if}
                    {if $renewal.hasRedemptionGracePeriodFee}
                        <tr class="no-border">
                            <td colspan="3">
                                <span>+ {lang key='domainRenewal.redemptionFee'}</span>
                            </td>
                        </tr>
                    {/if}
                {/foreach}
            {/if}
            {if $carttotals.taxrate || $carttotals.taxrate2}
                <tr>
                    <td colspan="2">
                        <span><strong>{lang key='ordersubtotal'}</strong></span>
                    </td>
                    <td class="text-right">
                        <span><strong>{$carttotals.subtotal}</strong></span>
                    </td>
                </tr>
                {if $carttotals.taxrate}
                    <tr>
                        <td colspan="2">
                            <span>{$carttotals.taxname} @ {$carttotals.taxrate}%</span>
                        </td>
                        <td class="text-right">
                            <span>{$carttotals.taxtotal}</span>
                        </td>
                    </tr>
                {/if}
                {if $carttotals.taxrate2}
                    <tr>
                        <td colspan="2">
                            <span>{$carttotals.taxname2} @ {$carttotals.taxrate2}%</span>
                        </td>
                        <td class="text-right">
                            <span>{$carttotals.taxtotal2}</span>
                        </td>
                    </tr>
                {/if}
            {/if}
            <tr class="totals">
                <td colspan="2">
                    <span><strong>{lang key='ordertotalduetoday'}</strong></span>
                </td>
                <td class="text-right">
                    <span><strong>{$carttotals.total}</strong></span>
                </td>
            </tr>
        </tbody>
    </table>
{/if}