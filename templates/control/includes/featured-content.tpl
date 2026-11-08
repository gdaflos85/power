{*
		Impressive Themes
		http://www.impressivethemes.net
		-------------------------------

		Featured Content Output for Control Theme by Impressive Themes
		--------------------------------------------------------------

*}
{* 1.	clientareahome.tpl / clientarea.php *}
		{if $templatefile == 'clientareahome'}
			<!--tiles start-->
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<a href="clientarea.php?action=invoices">
						<div class="dashboard-tile detail tile-red">
							<div class="content">
								<h1 class="text-left timer" data-from="0" data-to="{$clientsstats.numunpaidinvoices}" data-speed="2500"> </h1>
								<p>{$LANG.invoicesdue}</p>
							</div>
							<div class="icon"><i class="fas fa-file-invoice fa-fw"></i>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-3 col-sm-6">
					<a href="clientarea.php?action=products">
						<div class="dashboard-tile detail tile-turquoise">
							<div class="content">
								<h1 class="text-left timer" data-from="0" data-to="{$clientsstats.productsnumactive}" data-speed="2500"> </h1>
								<p>{$LANG.navservices}</p>
							</div>
							<div class="icon"><i class="fas fa-cube"></i>
							</div>
						</div>
					</a>
				</div>
				{if $clientsstats.numdomains || $registerdomainenabled || $transferdomainenabled}
					<div class="col-md-3 col-sm-6">
						<a href="clientarea.php?action=domains">
							<div class="dashboard-tile detail tile-blue">
								<div class="content">
									<h1 class="text-left timer" data-from="0" data-to="{$clientsstats.numactivedomains}" data-speed="2500"> </h1>
									<p>{$LANG.navdomains}</p>
								</div>
								<div class="icon"><i class="fas fa-globe"></i>
								</div>
							</div>
						</a>
					</div>
				{elseif $condlinks.affiliates && $clientsstats.isAffiliate}
					<div class="col-md-3 col-sm-6">
						<a href="affiliates.php">
							<div class="dashboard-tile detail tile-blue">
								<div class="content">
									<h1 class="text-left timer" data-from="0" data-to="{$clientsstats.numaffiliatesignups}" data-speed="2500"> </h1>
									<p>{$LANG.affiliatessignups}</p>
								</div>
								<div class="icon"><i class="fas fa-shopping-cart"></i>
								</div>
							</div>
						</a>
					</div>
				{else}
					<div class="col-md-3 col-sm-6">
						<a href="clientarea.php?action=quotes">
							<div class="dashboard-tile detail tile-blue">
								<div class="content">
									<h1 class="text-left timer" data-from="0" data-to="{$clientsstats.numquotes}" data-speed="2500"> </h1>
									<p>{$LANG.quotes}</p>
								</div>
								<div class="icon"><i class="fas fa-file-invoice fa-fw"></i>
								</div>
							</div>
						</a>
					</div>
				{/if}
				<div class="col-md-3 col-sm-6">
					<a href="supporttickets.php">
						<div class="dashboard-tile detail tile-purple">
							<div class="content">
								<h1 class="text-left timer" data-to="{$clientsstats.numactivetickets}" data-speed="2500"> </h1>
								<p>{$LANG.supportticketspagetitle}</p>
							</div>
							<div class="icon"><i class="fas fa-comments"></i>
							</div>
						</div>
					</a>
				</div>
			</div>
			<!--tiles end-->
		{/if}
