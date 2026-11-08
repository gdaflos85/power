
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-body">
                    <div>
                        <i class="fas fa-calendar fa-fw"></i>
                        {$carbon->createFromTimestamp($timestamp)->format('j M Y')}
                        {if $editLink}
                            <a href="{$editLink}" class="admin-inline-edit pull-right">
                                <i class="fas fa-pencil-alt fa-fw"></i>
                                {$LANG.edit}
                            </a>
                        {/if}
                    </div>
                    <br />
					{$text}
					{if $twittertweet}
						<br /><br />
						<div class="tweetbutton">
							<a href="https://twitter.com/share" class="twitter-share-button" data-count="vertical" data-via="{$twitterusername}">Tweet</a><script type="text/javascript" src="//platform.twitter.com/widgets.js"></script>
						</div>
					{/if}
					{if $facebookrecommend}
						<br /><br />
						{literal}
						<div id="fb-root"></div>
						<script>(function(d, s, id) {
						  var js, fjs = d.getElementsByTagName(s)[0];
						  if (d.getElementById(id)) {return;}
						  js = d.createElement(s); js.id = id;
						  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
						  fjs.parentNode.insertBefore(js, fjs);
						}(document, 'script', 'facebook-jssdk'));</script>
						{/literal}
						<div class="fb-like" data-href="{fqdnRoutePath('announcement-view', $id, $urlfriendlytitle)}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
					{/if}
					{if $facebookcomments}
						<br /><br />
						{literal}
						<div id="fb-root"></div>
						<script>(function(d, s, id) {
						  var js, fjs = d.getElementsByTagName(s)[0];
						  if (d.getElementById(id)) {return;}
						  js = d.createElement(s); js.id = id;
						  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
						  fjs.parentNode.insertBefore(js, fjs);
						}(document, 'script', 'facebook-jssdk'));</script>
						{/literal}
						<fb:comments href="{fqdnRoutePath('announcement-view', $id, $urlfriendlytitle)}" num_posts="5" width="100%"></fb:comments>
					{/if}
				</div>
				<div class="panel-footer">
					<a class="btn btn-default res-100" href="{routePath('announcement-index')}">{$LANG.clientareabacklink}</a>
				</div>
			</div>
		</div>
	</div>
