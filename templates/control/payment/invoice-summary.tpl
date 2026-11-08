<div id="invoiceIdSummary" class="invoice-summary panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">{$LANG.invoicenumber}{if $invoicenum}{$invoicenum}{else}{$invoiceid}{/if}</h3>
    </div>
    <table class="table table-padded">

        <tr>
            <td><strong>{$LANG.invoicesdescription}</strong></td>
            <td width="150" class="text-right"><strong>{$LANG.invoicesamount}</strong></td>
        </tr>
        {foreach $invoiceitems as $item}
            <tr>
                <td>{$item.description}</td>
                <td class="text-right">{$item.amount}</td>
            </tr>
        {/foreach}
        <tr>
            <td class="total-row text-right">{$LANG.invoicessubtotal}</td>
            <td class="total-row text-right">{$invoice.subtotal}</td>
        </tr>
        {if $invoice.taxrate}
            <tr>
                <td class="total-row text-right">{$invoice.taxrate}% {$invoice.taxname}</td>
                <td class="total-row text-right">{$invoice.tax}</td>
            </tr>
        {/if}
        {if $invoice.taxrate2}
            <tr>
                <td class="total-row text-right">{$invoice.taxrate2}% {$invoice.taxname2}</td>
                <td class="total-row text-right">{$invoice.tax2}</td>
            </tr>
        {/if}
        <tr>
            <td class="total-row text-right">{$LANG.invoicescredit}</td>
            <td class="total-row text-right">{$invoice.credit}</td>
        </tr>
        <tr>
            <td class="total-row text-right">{$LANG.invoicestotaldue}</td>
            <td class="total-row text-right">{$invoice.total}</td>
        </tr>
    </table>
    <table class="table table-padded">
        <tr>
            <td class="total-row text-right"><i>{$LANG.paymentstodate}</i></td>
            <td width="150" class="total-row text-right"><i>{$invoice.amountpaid}</i></td>
        </tr>
        <tr>
            <td class="total-row text-right"><strong>{$LANG.balancedue}</strong></td>
            <td class="total-row text-right"><strong>{$balance}</strong></td>
        </tr>
    </table>
</div>
