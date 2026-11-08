{if empty($kbcats) }
	{include file="$template/includes/alert.tpl" type="info" msg=$LANG.knowledgebasenoarticles textcenter=true}
{else}
	<form role="form" method="post" action="{routePath('knowledgebase-search')}">
		<div class="input-group">
			<input type="text" id="inputKnowledgebaseSearch" name="search" class="form-control input-group" placeholder="{$LANG.clientHomeSearchKb}" />
			<span class="input-group-btn">
				<input type="submit" id="btnKnowledgebaseSearch" class="btn btn-primary btn-input-padded-responsive" value="{$LANG.search}" />
			</span>
		</div>
	</form>
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fas fa-folder-open"></i> {$LANG.knowledgebasecategories}</h3>
				</div>
				<div class="list-group">
					{foreach from=$kbcats name=kbcats item=kbcat}
						<span class="list-group-item">
							<a href="{routePath('knowledgebase-category-view', {$kbcat.id}, {$kbcat.urlfriendlyname})}">
								<i class="fas fa-folder"></i>
								<strong>{$kbcat.name}</strong>
							</a>
							<span class="badge badge-primary">{$kbcat.numarticles}</span>
                            {if $kbcat.editLink}
                                <span class="btn btn-xs btn-default btn-edit pull-right" onclick="javascript:window.location.href='{$kbcat.editLink}'; return false;"><i class="fas fa-pencil-alt fa-fw"></i> {$LANG.edit}</span>
                            {/if}
							<br />
							{$kbcat.description}
						</span>
					{foreachelse}
						<span class="list-group-item">
							<p class="text-center fontsize3">{$LANG.knowledgebasenoarticles}</p>
						</span>
					{/foreach}
				</div>
			</div>
		</div>
	</div>
{/if}
{if $kbmostviews}
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fas fa-star"></i> {$LANG.knowledgebasepopular}</h3>
				</div>
				<div class="list-group">
					{foreach from=$kbmostviews item=kbarticle}
						<div class="list-group-item">
							<a href="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}">
								<i class="fas fa-file-alt"></i>
								<strong>{$kbarticle.title}</strong>
							</a>
                            {if $kbarticle.editLink}
                                <span class="btn btn-xs btn-default btn-edit pull-right" onclick="javascript:window.location.href='{$kbarticle.editLink}'; return false;"><i class="fas fa-pencil-alt fa-fw"></i> {$LANG.edit}</span>
                            {/if}
                            <br />
							{$kbarticle.article|truncate:100:"..."}
						</div>
					{/foreach}
				</div>
			</div>
		</div>
	</div>
{/if}