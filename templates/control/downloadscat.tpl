<form role="form" method="post" action="{routePath('download-search')}">
    <div class="input-group margin-bottom">
        <input type="text" name="search" class="input-group form-control" placeholder="{$LANG.downloadssearch}" value="{$search}" />
        <span class="input-group-btn">
            <input type="submit" class="btn btn-primary btn-input-padded-responsive" value="{$LANG.search}" />
        </span>
    </div>
</form>
{if $dlcats}
	<div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fas fa-folder-open"></i>&nbsp;{$LANG.downloadscategories}</h3>
                </div>
                <div class="list-group">
                    {foreach from=$dlcats item=dlcat}
                        <span class="list-group-item">
                            <a href="{routePath('download-by-cat', $dlcat.id, $dlcat.urlfriendlyname)}"><i class="fas fa-folder"></i>&nbsp;<strong>{$dlcat.name}</strong></a> <span class="badge badge-primary">{$dlcat.numarticles}</span><br />
                            {$dlcat.description}
                        </span>
                    {/foreach}
                </div>
            </div>
        </div>
	</div>
{/if}
<div class="row">
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fas fa-download"></i>&nbsp;{$LANG.downloadsfiles}</h3>
            </div>
            <div class="list-group">
                {if $downloads}
                    {foreach from=$downloads item=download}
                        <div class="list-group-item">
                            <a href="{$download.link}">
                                <i class="fas fa-file-download"></i>
                                <strong>
                                    {$download.title}
                                    {if $download.clientsonly}
                                        <i class="fas fa-lock"></i>
                                    {/if}
                                </strong>
                            </a><br />
                            {$download.description}
                        <div><span class="text-muted">{$LANG.downloadsfilesize}: {$download.filesize}</span></div>
                        </div>
                    {/foreach}
                {else}
                    <div class="list-group-item">
						<p class="text-center">{$LANG.downloadsnone}</p>
					</div>
                {/if}
            </div>
        </div>
    </div>
</div>