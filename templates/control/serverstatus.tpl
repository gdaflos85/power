<!--tiles start-->
<div class="row">
	<div class="col-md-4 col-sm-6">
		<a href="{$smarty.server.PHP_SELF}?view=open">
			<div class="dashboard-tile detail tile-red">
				<div class="content">
					<h1 class="text-left timer" data-from="0" data-to="{$opencount}" data-speed="2500"> </h1>
					<p>{$LANG.networkissuesstatusopen}</p>
				</div>
				<div class="icon"><i class="fas fa-exclamation-triangle"></i>
				</div>
			</div>
		</a>
	</div>
	<div class="col-md-4 col-sm-6">
		<a href="{$smarty.server.PHP_SELF}?view=scheduled">
			<div class="dashboard-tile detail tile-blue">
				<div class="content">
					<h1 class="text-left timer" data-from="0" data-to="{$scheduledcount}" data-speed="2500"> </h1>
					<p>{$LANG.networkissuesstatusscheduled}</p>
				</div>
				<div class="icon"><i class="fas fa-clock"></i>
				</div>
			</div>
		</a>
	</div>
	<div class="col-md-4 col-sm-6">
		<a href="{$smarty.server.PHP_SELF}?view=resolved">
			<div class="dashboard-tile detail tile-turquoise">
				<div class="content">
					<h1 class="text-left timer" data-from="0" data-to="{$resolvedcount}" data-speed="2500"> </h1>
					<p>{$LANG.networkissuesstatusresolved}</p>
				</div>
				<div class="icon"><i class="fas fa-check"></i>
				</div>
			</div>
		</a>
	</div>
</div>
<!--tiles end-->
<!--display network issues-->
{foreach from=$issues item=issue}
	<div class="row">
		<div class="col-md-12">
			{if $issue.clientaffected}
				<div class="panel panel-warning">
			{else}
				<div class="panel panel-default">
			{/if}
				<div class="panel-heading">
					<h3 class="panel-title">{$issue.title} ({$issue.status})</h3>
				</div>
				<div class="panel-body">
					<p><strong>{$LANG.networkissuesaffecting} {$issue.type}</strong> - {if $issue.type eq $LANG.networkissuestypeserver}{$issue.server}{else}{$issue.affecting}{/if} | <strong>{$LANG.networkissuespriority}</strong> - {$issue.priority}</span></p>
					<br />
					<blockquote>
						<p>{$issue.description}</p>
					</blockquote>
					<p><strong>{$LANG.networkissuesdate}</strong> - {$issue.startdate}{if $issue.enddate} - {$issue.enddate}{/if}</p>
					<p><strong>{$LANG.networkissueslastupdated}</strong> - {$issue.lastupdate}</p>
				</div>
			</div>
		</div>
	</div>
{foreachelse}
	<div class="alert alert-info">
		<p><strong>{$noissuesmsg}</strong></p>
	</div>
{/foreach}
<!--display network issues end-->
<!--pagination -->
<div class="row">
	<div class="col-md-12">
		<div class="btn-group btn-group-justified hidden-xs">
			<div class="btn-group">
				<a class="btn btn-default" href="{if $prevpage}{$smarty.server.PHP_SELF}?{if $view}view={$view}&amp;{/if}page={$prevpage}{else}javascript:return false;{/if}">{if $itTextDirectionRTL eq "enabled"}&rarr;{else}&larr;{/if} {$LANG.previouspage}</a>
			</div>
			<div class="btn-group">
				<button type="button" class="btn btn-primary">{$LANG.page} {$pagenumber} {$LANG.pageof} {$totalpages}</button>
			</div>
			<div class="btn-group">
				<a class="btn btn-default" href="{if $nextpage}{$smarty.server.PHP_SELF}?{if $view}view={$view}&amp;{/if}page={$nextpage}{else}javascript:return false;{/if}">{$LANG.nextpage} {if $itTextDirectionRTL eq "enabled"}&larr;{else}&rarr;{/if}</a>
			</div>
		</div>
	</div>
</div>
<!--pagination end-->
<!--mobile pagination -->
<div class="row">
	<div class="col-md-12">
		<div class="btn-group btn-group-justified visible-xs">
			<div class="btn-group">
				<a class="btn btn-default" href="{if $prevpage}{$smarty.server.PHP_SELF}?{if $view}view={$view}&amp;{/if}page={$prevpage}{else}javascript:return false;{/if}">{$LANG.previouspage}</a>
			</div>
			<div class="btn-group">
				<button type="button" class="btn btn-primary">{$pagenumber} {$LANG.pageof} {$totalpages}</button>
			</div>
			<div class="btn-group">
				<a class="btn btn-default" href="{if $nextpage}{$smarty.server.PHP_SELF}?{if $view}view={$view}&amp;{/if}page={$nextpage}{else}javascript:return false;{/if}">{$LANG.nextpage}</a>
			</div>
		</div>
	</div>
</div>
<!--mobile pagination end-->
<!--server status-->
{if $servers}
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.serverstatustitle}</h3>
				</div>
				<div class="panel-body">
					<p>{$LANG.serverstatusheadingtext}</p>
					<table class="table table-striped table-framed">
						<thead>
							<tr>
								<th>{$LANG.servername}</th>
								<th class="textcenter">HTTP</th>
								<th class="textcenter">FTP</th>
								<th class="textcenter">POP3</th>
								<th class="textcenter">{$LANG.serverstatusphpinfo}</th>
								<th class="textcenter">{$LANG.serverstatusserverload}</th>
								<th class="textcenter">{$LANG.serverstatusuptime}</th>
							</tr>
						</thead>
						<tbody>
							{foreach from=$servers key=num item=server}
								<tr>
									<td>{$server.name}</td>
									<td class="text-center" id="port80_{$num}">
										<span class="fas fa-spinner fa-spin"></span>
									</td>
									<td class="text-center" id="port21_{$num}">
										<span class="fas fa-spinner fa-spin"></span>
									</td>
									<td class="text-center" id="port110_{$num}">
										<span class="fas fa-spinner fa-spin"></span>
									</td>
									<td class="text-center"><a href="{$server.phpinfourl}" target="_blank">{$LANG.serverstatusphpinfo}</a></td>
									<td class="text-center" id="load{$num}">
										<span class="fas fa-spinner fa-spin"></span>
									</td>
									<td class="text-center" id="uptime{$num}">
										<span class="fas fa-spinner fa-spin"></span>
										<script>
										jQuery(document).ready(function() {
											checkPort({$num}, 80);
											checkPort({$num}, 21);
											checkPort({$num}, 110);
											getStats({$num});
										});
										</script>
									</td>
								</tr>
							{foreachelse}
								<tr>
									<td colspan="7">{$LANG.serverstatusnoservers}</td>
								</tr>
							{/foreach}
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
{/if}
<!--server status end-->
{if $loggedin}
	<br />
	<p style="text-align: center;">{$LANG.networkissuesaffectingyourservers}</p>
{/if}