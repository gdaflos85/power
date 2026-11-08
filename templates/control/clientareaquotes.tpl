{include file="$template/includes/tablelist.tpl" tableName="QuotesList" filterColumn="4" noSortColumns="5, 6"}
<script type="text/javascript">
    jQuery(document).ready( function ()
    {
        var table = $('#tableQuotesList').DataTable();
        {if $orderby == 'id'}
            table.order(0, '{$sort}');
        {elseif $orderby == 'date'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'validuntil'}
            table.order(3, '{$sort}');
        {elseif $orderby == 'stage'}
            table.order(4, '{$sort}');
        {/if}
        table.draw();
    });
</script>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">{$LANG.quotestitle}</h3>
			</div>
			<div class="panel-body">
				<div class="table-container clearfix">
					<table id="tableQuotesList" class="table table-bordered table-hover table-list" width="100%">
						<thead>
							<tr>
								<th>{$LANG.quotenumber}</th>
								<th>{$LANG.quotesubject}</th>
								<th>{$LANG.quotedatecreated}</th>
								<th>{$LANG.quotevaliduntil}</th>
								<th>{$LANG.quotestage}</th>
								<th>&nbsp;</th>
								<th>&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							{foreach from=$quotes item=quote}
								<tr>
									<td>{$quote.id}</td>
									<td>{$quote.subject}</td>
									<td><span class="hidden">{$quote.normalisedDateCreated}</span>{$quote.datecreated}</td>
									<td><span class="hidden">{$quote.normalisedValidUntil}</span>{$quote.validuntil}</td>
									<td><span class="label status status-{$quote.stageClass}">{$quote.stage}</span></td>
									<td class="text-center">
										<a href="viewquote.php?id={$quote.id}" class="btn btn-sm btn-primary btn-3d btn-block">
											<i class="fas fa-file-invoice"></i> {$LANG.quoteview} {$LANG.quote}
										</a>
									</td>
									<td class="text-center">
										<form method="submit" action="dl.php">
											<input type="hidden" name="type" value="q" />
											<input type="hidden" name="id" value="{$quote.id}" />
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