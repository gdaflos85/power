{if $announcementsFbRecommend}
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s); js.id = id;
			js.src = "//connect.facebook.net/{$LANG.locale}/all.js#xfbml=1";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
{/if}
{foreach from=$announcements item=announcement}
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><a href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}">{$announcement.title}</a></h3>
				</div>
				<div class="panel-body">
					<div>
                        <i class="fas fa-calendar-alt fa-fw"></i>
                        {$carbon->createFromTimestamp($announcement.timestamp)->format('j M Y')}
                        {if $announcement.editLink}
                            <a href="{$announcement.editLink}" class="admin-inline-edit pull-right">
                                <i class="fas fa-pencil-alt fa-fw"></i>
                                {$LANG.edit}
                            </a>
                        {/if}
                    </div>
                    <br/>
					{if $announcement.text|strip_tags|strlen < 350}
						<p>{$announcement.text}</p>
					{else}
						<p>{$announcement.summary}</p>
						<br />
						<p><a class="btn btn-3d btn-primary" href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}">{$LANG.more} &raquo;</a></p>
					{/if}
					{if $facebookrecommend}
						<div class="fb-like" data-href="{fqdnRoutePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
					{/if}
				</div>
			</div>
		</div>
	</div>
{foreachelse}
	{include file="$template/includes/alert.tpl" type="warning" msg=$LANG.announcementsnone textcenter=true}
{/foreach}
<br />
{if $prevpage || $nextpage}
	<div class="row">
		<div class="col-md-12">
			<!-- pagination -->
			<div class="btn-group btn-group-justified hidden-xs">
				<div class="btn-group">
					<a class="btn btn-default" href="{if $prevpage}{routePath('announcement-index-paged', $prevpage, $view)}{else}javascript:return false;{/if}">{if $itTextDirectionRTL eq "enabled"}&rarr;{else}&larr;{/if} {$LANG.previouspage}</a>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-primary">{$LANG.page} {$pagenumber} {$LANG.pageof} {$totalpages}</button>
				</div>
				<div class="btn-group">
					<a class="btn btn-default" href="{if $nextpage}{routePath('announcement-index-paged', $nextpage, $view)}{else}javascript:return false;{/if}">{$LANG.nextpage} {if $itTextDirectionRTL eq "enabled"}&larr;{else}&rarr;{/if}</a>
				</div>
			</div>
			<!-- end pagination -->
			<!-- mobile pagination -->
			<div class="btn-group btn-group-justified visible-xs">
				<div class="btn-group">
					<a class="btn btn-default" href="{if $prevpage}{routePath('announcement-index-paged', $prevpage, $view)}{else}javascript:return false;{/if}">{$LANG.previouspage}</a>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-primary">{$pagenumber} {$LANG.pageof} {$totalpages}</button>
				</div>
				<div class="btn-group">
					<a class="btn btn-default" href="{if $nextpage}{routePath('announcement-index-paged', $nextpage, $view)}{else}javascript:return false;{/if}">{$LANG.nextpage}</a>
				</div>
			</div>
			<!-- end mobile pagination -->
		</div>
	</div>
{/if}
