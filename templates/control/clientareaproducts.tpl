{if $itSSLStatusClientareaproducts neq "disabled"}
	{include file="$template/includes/tablelist.tpl" tableName="ServicesList" noSortColumns="4,5" filterColumn="3"}
{else}
	{include file="$template/includes/tablelist.tpl" tableName="ServicesList" noSortColumns="4" filterColumn="3"}
{/if}
<script type="text/javascript">
	jQuery(document).ready( function ()
	{
		var table = $('#tableServicesList').DataTable();
		{if $orderby == 'product'}
			table.order([0, '{$sort}'], [3, 'asc']);
		{elseif $orderby == 'amount' || $orderby == 'billingcycle'}
			table.order(1, '{$sort}');
		{elseif $orderby == 'nextduedate'}
			table.order(2, '{$sort}');
		{elseif $orderby == 'domainstatus'}
			table.order(3, '{$sort}');
		{/if}
		table.draw();
	});
</script>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">{$LANG.clientareaproducts}</h3>
			</div>
			<div class="panel-body">
				<div class="table-container clearfix">
					<table id="tableServicesList" class="table table-bordered table-hover table-list" width="100%">
						<thead>
							<tr>
								<th>{$LANG.orderproduct}</th>
								<th>{$LANG.clientareaaddonpricing}</th>
								<th>{$LANG.clientareahostingnextduedate}</th>
								<th>{$LANG.clientareastatus}</th>
								{if $itSSLStatusClientareaproducts neq "disabled"}
                                	<th>{$LANG.sslState.sslStatus}</th>
								{/if}
								<th>&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							{foreach key=num item=service from=$services}
								<tr>
									<td><a href="clientarea.php?action=productdetails&amp;id={$service.id}"><strong>{$service.product}</strong>{if $service.domain}<br />{$service.domain}{/if}</a></td>
									<td data-order="{$service.amountnum}">{$service.amount}<br />{$service.billingcycle}</td>
									<td><span class="hidden">{$service.normalisedNextDueDate}</span>{$service.nextduedate}</td>
									<td><span class="label status status-{$service.status|strtolower}">{$service.statustext}</span></td>
									{if $itSSLStatusClientareaproducts neq "disabled"}
	                                    <td class="text-center{if $service.sslStatus} ssl-info{/if}" data-element-id="{$service.id}" data-type="service"{if $service.domain} data-domain="{$service.domain}"{/if}>
	                                        {if $service.sslStatus}
	                                            <img src="{$service.sslStatus->getImagePath()}" data-toggle="tooltip" title="{$service.sslStatus->getTooltipContent()}" class="{$service.sslStatus->getClass()}"/>
	                                        {elseif !$service.isActive}
	                                            <img src="{$BASE_PATH_IMG}/ssl/ssl-inactive-domain.png" data-toggle="tooltip" title="{lang key='sslState.sslInactiveService'}" class="ssl-state"/>
	                                        {/if}
	                                    </td>
									{/if}
									<td class="responsive-edit-button">
										<a href="clientarea.php?action=productdetails&amp;id={$service.id}" class="btn btn-primary btn-3d btn-sm btn-block"><i class="fas fa-cog"></i> {$LANG.manage}</a>
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
{if $itSSLCustomPurchaseUrl}
	<script>
		jQuery(document).ready(function() {
			jQuery(document).on('click', '.ssl-state.ssl-inactive', function(e) {
				e.preventDefault();
				window.location.href = "{$itSSLCustomPurchaseUrl}";
			});
		});
	</script>
{/if}
