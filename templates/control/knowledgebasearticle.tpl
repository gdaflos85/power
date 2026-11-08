{if $kbarticle.voted}
    {include file="$template/includes/alert.tpl" type="success" msg="{lang key="knowledgebaseArticleRatingThanks"}" textcenter=true}
{/if}
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					{$kbarticle.title}
					<a href="#" class="btn btn-default pull-right btn-xs" onclick="window.print();return false"><i class="fas fa-print">&nbsp;</i>{$LANG.knowledgebaseprint}</a>
                    {if $kbarticle.editLink}
                        <a href="{$kbarticle.editLink}" class="btn btn-default pull-right btn-xs hidden-print" style="margin-right: 10px;">
                            <i class="fas fa-pencil-alt fa-fw"></i>
                            {$LANG.edit}
                        </a>
                    {/if}
				</h3>
			</div>
			<div class="panel-body">
				{$kbarticle.text}
			</div>
            {if $kbarticle.tags}
                <div class="panel-footer">
                    <i class="fas fa-tags"></i> {$kbarticle.tags}
                </div>
            {/if}
		</div>
		<div class="hidden-print">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						{if $kbarticle.voted}{$LANG.knowledgebaserating}{else}{$LANG.knowledgebasehelpful}{/if}
					</h3>
				</div>
				<div class="panel-body">
					{if $kbarticle.voted}
						{$kbarticle.useful} {$LANG.knowledgebaseratingtext} ({$kbarticle.votes} {$LANG.knowledgebasevotes})
					{else}
						<form action="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}" method="post">
							<input type="hidden" name="useful" value="vote">
							<button type="submit" name="vote" value="yes" class="btn btn-success"><i class="fas fa-thumbs-up"></i> {$LANG.knowledgebaseyes}</button>
							<button type="submit" name="vote" value="no" class="btn btn-default"><i class="fas fa-thumbs-down"></i> {$LANG.knowledgebaseno}</button>
						</form>
					{/if}
				</div>
			</div>
		</div>
	</div>
</div>
{if $kbarticles}
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.knowledgebaserelated}</h3>
				</div>
				<div class="list-group">
					{foreach key=num item=kbarticle from=$kbarticles}
						<div class="list-group-item">
							<a href="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}">
								<i class="fas fa-file-alt"></i>
								<strong>
									{$kbarticle.title}
								</strong>
							</a>
							<br />
							{$kbarticle.article|truncate:100:"..."}
						</div>
			        {/foreach}
				</div>
			</div>
		</div>
	</div>
{/if}