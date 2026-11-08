<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">{$LANG.clientareanavsupporttickets}</h3>
			</div>
			<div class="panel-body">
				{include file="$template/includes/tablelist.tpl" tableName="TicketsList" filterColumn="2"}
				<script type="text/javascript">
					jQuery(document).ready( function ()
					{
						var table = $('#tableTicketsList').DataTable();
						{if $orderby == 'did' || $orderby == 'dept'}
							table.order(1, '{$sort}');
						{elseif $orderby == 'subject' || $orderby == 'title'}
							table.order(0, '{$sort}');
						{elseif $orderby == 'status'}
							table.order(2, '{$sort}');
						{elseif $orderby == 'lastreply'}
							table.order(3, '{$sort}');
						{/if}
						table.draw();
					});
				</script>
				<div class="table-container clearfix">
					<table id="tableTicketsList" class="table table-bordered table-hover table-list" width="100%">
						<thead>
							<tr>
								<th>{$LANG.supportticketssubject}</th>
								<th>{$LANG.supportticketsdepartment}</th>
								<th>{$LANG.supportticketsstatus}</th>
								<th>{$LANG.supportticketsticketlastupdated}</th>
							</tr>
						</thead>
						<tbody>
							{foreach from=$tickets item=ticket}
								<tr>
									<td><a href="viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}">{if $ticket.unread}<strong>{/if}#{$ticket.tid} - {$ticket.subject}{if $ticket.unread}</strong>{/if}</a></td>
									<td>{$ticket.department}</td>
									<td><span class="label status {if is_null($ticket.statusColor)}status-{$ticket.statusClass}"{else}status-custom" style="border-color: {$ticket.statusColor}; color: {$ticket.statusColor}"{/if}>{$ticket.status|strip_tags}</span></td>
									<td><span class="hidden">{$ticket.normalisedLastReply}</span>{$ticket.lastreply}</td>
								</tr>
							{/foreach}
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>