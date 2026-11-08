<form method="post" action="clientarea.php?action=masspay" class="form-horizontal">
	<input type="hidden" name="geninvoice" value="true" />
	<div class="row">
		<div class="col-md-8">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.masspaytitle}</h3>
				</div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>{$LANG.invoicesdescription}</th>
							<th>{$LANG.invoicesamount}</th>
						</tr>
					</thead>
					<tbody>
						{foreach from=$invoiceitems key=invid item=invoiceitem}
							<tr>
								<td colspan="2">
									<strong>{$LANG.invoicenumber} {if $invoiceitem.0.invoicenum}{$invoiceitem.0.invoicenum}{else}{$invid}{/if}</strong>
									<input type="hidden" name="invoiceids[]" value="{$invid}" />
								</td>
							</tr>
							{foreach from=$invoiceitem item=item}
								<tr>
									<td>{$item.description}</td>
									<td>{$item.amount}</td>
								</tr>
							{/foreach}
						{foreachelse}
							<tr>
								<td colspan="6" align="center">{$LANG.norecordsfound}</td>
							</tr>
						{/foreach}
						<tr class="subtotal">
							<td style="text-align:right;"><strong>{$LANG.invoicessubtotal}</strong></td>
							<td><strong>{$subtotal}</strong></td>
						</tr>
						{if $tax}<tr class="tax">
							<td style="text-align:right;">{$LANG.invoicestax}</td>
							<td>{$tax}</td>
						</tr>{/if}
						{if $tax2}<tr class="tax">
							<td style="text-align:right;">{$LANG.invoicestax} 2</td>
							<td>{$tax2}</td>
						</tr>{/if}
						{if $credit}<tr class="credit">
							<td style="text-align:right;">{$LANG.invoicescredit}</td>
							<td>{$credit}</td>
						</tr>{/if}
						{if $partialpayments}<tr class="credit">
							<td style="text-align:right;">{$LANG.invoicespartialpayments}</td>
							<td>{$partialpayments}</td>
						</tr>{/if}
						<tr class="total">
							<td style="text-align:right;"><strong>{$LANG.invoicestotaldue}</strong></td>
							<td><strong>{$total}</strong></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="col-md-4">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.orderpaymentmethod}</h3>
				</div>
				<div class="panel-body">
					{foreach from=$gateways key=num item=gateway}
						<p>
							<label class="radio-inline">
								<input type="radio" class="icheck" name="paymentmethod" value="{$gateway.sysname}"{if $gateway.sysname eq $defaultgateway} checked{/if} /> {$gateway.name}
							</label>
						</p>
					{/foreach}
				</div>
				<div class="panel-footer">
					<input type="submit" value="{$LANG.masspaymakepayment}" class="btn btn-3d res-100 btn-primary" id="btnMassPayMakePayment" />
				</div>
			</div>
		</div>
	</div>
</form>
