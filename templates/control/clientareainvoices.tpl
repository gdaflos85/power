{if $itShowSidebarPrimary neq "yes"}
	{if $totalbalance}
		<div class="alert alert-danger">
			{$LANG.invoicesoutstandingbalance}: {$totalbalance} {if $masspay}&nbsp; <a href="clientarea.php?action=masspay&all=true" class="btn btn-success"><i class="icon-ok-circle icon-white"></i> {$LANG.masspayall}</a>{/if}
		</div>
	{/if}
{/if}
{include file="$template/includes/tablelist.tpl" tableName="InvoicesList" filterColumn="4" noSortColumns="5, 6"}
<script type="text/javascript">
	jQuery(document).ready( function ()
	{
		var table = $('#tableInvoicesList').DataTable();
		{if $orderby == 'default'}
			table.order([4, 'desc'], [2, 'asc']);
		{elseif $orderby == 'invoicenum'}
			table.order(0, '{$sort}');
		{elseif $orderby == 'date'}
			table.order(1, '{$sort}');
		{elseif $orderby == 'duedate'}
			table.order(2, '{$sort}');
		{elseif $orderby == 'total'}
			table.order(3, '{$sort}');
		{elseif $orderby == 'status'}
			table.order(4, '{$sort}');
		{/if}
		table.draw();
	});
</script>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">{$LANG.invoices}</h3>
			</div>
			<div class="panel-body">
				<div class="table-container clearfix">
					<table id="tableInvoicesList" class="table table-bordered table-hover table-list" width="100%">
						<thead>
							<tr>
								<th>{$LANG.invoicestitle}</th>
								<th>{$LANG.invoicesdatecreated}</th>
								<th>{$LANG.invoicesdatedue}</th>
								<th>{$LANG.invoicestotal}</th>
								<th>{$LANG.invoicesstatus}</th>
								<th>&nbsp;</th>
								<th>&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							{foreach key=num item=invoice from=$invoices}
								<tr onclick="clickableSafeRedirect(event, 'viewinvoice.php?id={$invoice.id}', false)">
									<td>{$invoice.invoicenum}</td>
									<td><span class="hidden">{$invoice.normalisedDateCreated}</span>{$invoice.datecreated}</td>
									<td><span class="hidden">{$invoice.normalisedDateDue}</span>{$invoice.datedue}</td>
									<td data-order="{$invoice.totalnum}">{$invoice.total}</td>
									<td><span class="label status status-{$invoice.statusClass}">{$invoice.status}</span></td>
									<td class="text-center">
										<a href="viewinvoice.php?id={$invoice.id}" class="btn btn-sm btn-primary btn-3d btn-block">
											<i class="fas fa-file-invoice"></i> {$LANG.invoicesview}
										</a>
									</td>
									<td class="text-center">
										<form method="submit" action="dl.php">
											<input type="hidden" name="type" value="i" />
											<input type="hidden" name="id" value="{$invoice.id}" />
											<button type="submit" class="btn btn-default btn-sm btn-3d btn-block"><i class="fas fa-file-download"></i> {$LANG.quotedownload}</button>
										</form>
									</td>
								</tr>
							{/foreach}
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>