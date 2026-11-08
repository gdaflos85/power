{if $warnings}
	{include file="$template/includes/alert.tpl" type="warning" msg=$warnings}
{/if}
<div class="tab-content">
	<!-- Tab 1: My Domains List -->
    <div class="tab-pane fade in active" id="tabOverview">
		<div class="row">
			<div class="col-md-12">
				{if $itSSLStatusClientareadomains neq "disabled"}
					{include file="$template/includes/tablelist.tpl" tableName="DomainsList" noSortColumns="0, 6, 7" startOrderCol="2" filterColumn="5"}
				{else}
					{include file="$template/includes/tablelist.tpl" tableName="DomainsList" noSortColumns="0, 6" startOrderCol="2" filterColumn="5"}
				{/if}
				<script type="text/javascript">
					jQuery(document).ready( function ()
					{
						var table = jQuery('#tableDomainsList').DataTable();
						{if $orderby == 'domain'}
                            table.order(1, '{$sort}');
                        {elseif $orderby == 'regdate' || $orderby == 'registrationdate'}
                            table.order(2, '{$sort}');
                        {elseif $orderby == 'nextduedate'}
                            table.order(3, '{$sort}');
                        {elseif $orderby == 'autorenew'}
                            table.order(4, '{$sort}');
                        {elseif $orderby == 'status'}
                            table.order(5, '{$sort}');
                        {/if}
						table.draw();
					});
				</script>
				<form id="domainForm" method="post" action="clientarea.php?action=bulkdomain">
					<input id="bulkaction" name="update" type="hidden" />
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">{$LANG.clientareanavdomains}</h3>
						</div>
						<div class="panel-body">
							<div class="table-container clearfix">
								<table id="tableDomainsList" class="table table-bordered table-hover table-list" width="100%">
									<thead>
										<tr>
											<th></th>
											<th>{$LANG.orderdomain}</th>
											<th>{$LANG.regdate}</th>
											<th>{$LANG.nextdue}</th>
											<th>{$LANG.domainsautorenew}</th>
											<th>{$LANG.domainstatus}</th>
											{if $itSSLStatusClientareadomains neq "disabled"}
                                            	<th>{$LANG.sslState.sslStatus}</th>
											{/if}
											<th>&nbsp;</th>
										</tr>
									</thead>
									<tbody>
									{foreach key=num item=domain from=$domains}
										<tr>
											<td class="text-right">
												<input type="checkbox" name="domids[]" class="domids stopEventBubble" value="{$domain.id}" />
											</td>
											<td><a href="clientarea.php?action=domaindetails&id={$domain.id}">{$domain.domain}</a></td>
											<td><span class="hidden">{$domain.normalisedRegistrationDate}</span>{$domain.registrationdate}</td>
											<td><span class="hidden">{$domain.normalisedNextDueDate}</span>{$domain.nextduedate}</td>
											<td>
												{if $domain.autorenew}
													<span class="label label-success">{$LANG.domainsautorenewenabled}</span>
												{else}
													<span class="label label-danger">{$LANG.domainsautorenewdisabled}</span>
												{/if}
											</td>
											<td>
												<span class="label status status-{$domain.statusClass}">{$domain.statustext}</span>
												<span class="hidden">
													{if $domain.expiringSoon}<span>{lang key="domainsExpiringSoon"}</span>{/if}
												</span>
											</td>
											{if $itSSLStatusClientareadomains neq "disabled"}
	                                            <td class="text-center ssl-info" data-element-id="{$domain.id}" data-type="domain" data-domain="{$domain.domain}">
	                                                {if $domain.sslStatus}
	                                                    <img src="{$domain.sslStatus->getImagePath()}" data-toggle="tooltip" title="{$domain.sslStatus->getTooltipContent()}" class="{$domain.sslStatus->getClass()}"/>
	                                                {elseif !$domain.isActive}
	                                                    <img src="{$BASE_PATH_IMG}/ssl/ssl-inactive-domain.png" data-toggle="tooltip" title="{lang key='sslState.sslInactiveDomain'}" class="ssl-state"/>
	                                                {/if}
	                                            </td>
											{/if}
											<td>
												<a href="clientarea.php?action=domaindetails&id={$domain.id}" class="btn btn-primary btn-3d btn-sm btn-block"><i class="fas fa-cog"></i> {$LANG.manage}</a>
											</td>
										</tr>
									{/foreach}
									</tbody>
								</table>
							</div>
						</div>
						<div class="panel-footer">
							<div class="btn-group margin-bottom">
								<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
									<span class="fas fa-cog"></span> &nbsp; {$LANG.withselected} <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#" id="nameservers" class="setBulkAction"><i class="glyphicon glyphicon-globe"></i> {$LANG.domainmanagens}</a></li>
									<li><a href="#" id="autorenew" class="setBulkAction"><i class="glyphicon glyphicon-refresh"></i> {$LANG.domainautorenewstatus}</a></li>
									<li><a href="#" id="reglock" class="setBulkAction"><i class="glyphicon glyphicon-lock"></i> {$LANG.domainreglockstatus}</a></li>
									<li><a href="#" id="contactinfo" class="setBulkAction"><i class="glyphicon glyphicon-user"></i> {$LANG.domaincontactinfoedit}</a></li>
                                    {if $allowrenew}
                                        <li><a href="#" id="renewDomains" class="setBulkAction"><i class="glyphicon glyphicon-refresh"></i> {lang key='domainmassrenew'}</a></li>
                                    {/if}
								</ul>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	jQuery(document).ready(function() {
		$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
			var target = $(e.target).attr("href");
			if ((target == 'clientarea.php?action=domains#tabOverview')) {
				$('#tableDomainsList').DataTable()
				.columns.adjust()
				.responsive.recalc();
			}
		});
	});
</script>
{if $itSSLCustomPurchaseUrl}
	<script>
		jQuery(document).ready(function() {ldelim}
			jQuery(document).on('click', '.ssl-state.ssl-inactive', function(e) {ldelim}
				e.preventDefault();
				window.location.href = "{$itSSLCustomPurchaseUrl}";
			{rdelim});
		{rdelim});
	</script>
{/if}
