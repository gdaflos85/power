{if $registerdomainenabled || $transferdomainenabled}
	<form method="post" action="domainchecker.php" id="frmDomainHomepage">
		<input type="hidden" name="transfer" />
		<div class="row">
			<div class="col-md-12">
				<div class="input-group input-group-lg input-group-box">
					<input type="text" class="form-control" placeholder="{$LANG.findyourdomain}" value="{$domain}" id="inputDomain" name="domain" {if $captcha}oninput="showCaptcha()" {/if} />
					<div class="input-group-btn">
                        {if $registerdomainenabled}
                        <button type="submit" id="btnDomainSearch" class="btn btn-primary domain-check-availability {$captcha->getButtonClass($captchaForm)}" value="{$LANG.search}"><i class="fas fa-search visible-xs"></i><span class="hidden-xs">{$LANG.search}</span></button>
                        {/if}
                        {if $transferdomainenabled}
                            <button type="submit" id="btnTransfer" class="btn btn-default {$captcha->getButtonClass($captchaForm)}" value="{$LANG.domainstransfer}"><i class="fas fa-exchange-alt visible-xs"></i><span class="hidden-xs">{$LANG.domainstransfer}</span></button>
                        {/if}
					</div>
				</div>
				{include file="$template/includes/captcha.tpl"}
				{if $registerdomainenabled}
					{if $itHomeSpotlightTLDs neq "disabled"}
						<div id="homepagetlds"></div>
						<script>
							jQuery(document).ready(function() {
								jQuery('#homepagetlds').load('cart.php?a=add&domain=register .featured-tlds-container');
							});
						</script>
					{/if}
				{/if}
			</div>
		</div>
	</form>
{/if}
<div class="row">
	<div class="col-md-6">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">{$LANG.navservicesorder}</h3>
			</div>
			<div class="panel-body">
				<p>{$LANG.clientareahomeorder}</p>
			</div>
			<div class="panel-footer">
				<form method="post" action="cart.php">
					<input type="submit" value="{$LANG.clientareahomeorderbtn}" class="btn res-100 btn-primary" />
				</form>
			</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">{$LANG.manageyouraccount}</h3>
			</div>
			<div class="panel-body">
				<p>{$LANG.clientareahomelogin}</p>
			</div>
			<div class="panel-footer">
				<form method="post" action="clientarea.php">
					<input type="submit" value="{$LANG.clientareahomeloginbtn}" class="btn res-100 btn-primary" />
				</form>
			</div>
		</div>
	</div>
</div>

<div class="row">

	{if $announcements}
		<div class="{if $twitterusername}col-md-8{else}col-md-12{/if}">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.latestannouncements}</h3>
				</div>
				<div class="panel-body">
					{foreach from=$announcements item=announcement}
						<a href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}"><h4>{$announcement.title} <small class="pull-right">{$carbon->translatePassedToFormat($announcement.rawDate, 'j M Y')}</small></h4></a>
						{if $announcement.text|strip_tags|strlen < 350}
							{$announcement.text}
						{else}
							{$announcement.summary}
							<a href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" class="btn btn-primary res-100 btn-sm">{$LANG.more} &raquo;</a>
						{/if}
						<hr />
					{/foreach}
				</div>
				<div class="panel-footer">
					<a href="announcements.php" class="btn res-100 btn-sm btn-default">{$LANG.more} {$LANG.announcementstitle}</a>
				<a href="announcementsrss.php" class="btn res-100 res-left btn-sm btn-default pull-right" title="">{$LANG.announcementsrss} <i class="fas fa-rss-square"></i></a>
				</div>
			</div>
		</div>
	{/if}

	{if $twitterusername}
		<div class="col-md-4">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.twitterlatesttweets}</h3>
				</div>
				<div class="panel-body-twitterfeed">
					<div id="twitterfeed">
						{if $itColorScheme eq "blue" or $itColorScheme eq "blue-solid" or $itColorScheme eq "blue-white"}
							<p class="text-center">
								<br><br>
								<img src="templates/{$template}/img/loading-blue.gif">
								<br><br>
							</p>
						{else}
							<p class="text-center">
								<br><br>
								<img src="templates/{$template}/img/loading.gif">
								<br><br>
							</p>
						{/if}

					</div>
					{literal}
						<script language="javascript">
							jQuery(document).ready(function(){
							  WHMCS.http.jqClient.post("index.php?rp=/announcements/twitterfeed",
								function(data){
								  jQuery("#twitterfeed").html(data);
								});
							});
						</script>
					{/literal}
				</div>
				<div class="panel-footer">
					<a href="https://twitter.com/{$twitterusername}" target="_blank"><img src="templates/{$template}/img/twitterfollow.png" alt="{$LANG.twitterfollow}" /></a>
				</div>
			</div>
		</div>
	{/if}
</div>
