{*  Control WHMCS Theme from Impressive Themes | Serial: d5a29416d3a0b5751c2326b073669ce6  *}
{*  https://www.impressivethemes.net/whmcs-themes/control  *}

{if $inactive}
	{include file="$template/includes/alert.tpl" type="danger" msg=$LANG.affiliatesdisabled textcenter=true}
{else}
	{if $withdrawrequestsent}
		{include file="$template/includes/alert.tpl" type="success" msg=$LANG.affiliateswithdrawalrequestsuccessful textcenter=true}
	{/if}
	<!--tiles start-->
	<div class="row">
		<div class="col-md-4">
			<div class="dashboard-tile detail tile-blue">
				<div class="content">
					<h1 class="text-left timer" data-from="0" data-to="{$signups}" data-speed="2500"> </h1>
					<p>{$LANG.affiliatessignups}</p>
				</div>
				<div class="icon"><i class="fas fa-users"></i>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="dashboard-tile detail tile-turquoise">
				<div class="content">
					<h1 class="text-left">{$balance}</h1>
					<p>{$LANG.affiliatescommissionsavailable}</p>
				</div>
				<div class="icon"><i class="fas fa-dollar-sign"></i>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="dashboard-tile detail tile-yellow">
				<div class="content">
					<h1 class="text-left">{$pendingcommissions}</h1>
					<p>{$LANG.affiliatescommissionspending}</p>
				</div>
				<div class="icon"><i class="fas fa-dollar-sign"></i>
				</div>
			</div>
		</div>
	</div>
	<!--tiles end-->
	<!--account referal linl-->
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.affiliatesreferallink}</h3>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<div class="col-md-12">
							<input type="text" value="{$referrallink}" class="form-control" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- account referal link end-->
	<!-- withdrawal request-->
	{if $withdrawrequestsent}
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$LANG.affiliatesrequestwithdrawal}</h3>
					</div>
					<div class="panel-body">
						{include file="$template/includes/alert.tpl" type="success" msg=$LANG.affiliateswithdrawalrequestsuccessful textcenter=true}
					</div>
				</div>
			</div>
		</div>
	{else}
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$LANG.affiliatesrequestwithdrawal}</h3>
					</div>
					<div class="panel-body">
						<div class="label-affiliates">{$LANG.affiliatescommissionsavailable}</div>
						<button type="button" class="pull-right btn btn-primary btn-sm ttb">{$balance}</button>
						<div style="clear: both;"></div>
					</div>
					<div class="panel-footer">
						{if !$withdrawlevel}
							<p class="">{lang key="affiliateWithdrawalSummary" amountForWithdrawal=$affiliatePayoutMinimum}</p>
						{else}
							<a href="{$smarty.server.PHP_SELF}?action=withdrawrequest" class="btn btn-primary btn-3d"{if !$withdrawlevel} disabled="true"{/if}>{$LANG.affiliatesrequestwithdrawal}</a>
						{/if}
					</div>
				</div>
			</div>
		</div>
	{/if}
	<!-- withdrawal request end-->
	<!-- account overview-->
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.accountoverview}</h3>
				</div>
				<div class="panel-body">
					<div class="label-affiliates">{$LANG.affiliatesvisitorsreferred}</div>
					<span type="button" class="res-left pull-right btn btn-info btn-sm ttb">{$visitors}</span>
					<div style="clear: both;"></div>
					<hr />
					<div class="label-affiliates">{$LANG.affiliatessignups}</div>
					<span class="res-left pull-right btn btn-info btn-sm ttb">{$signups}</span>
					<div style="clear: both;"></div>
					<hr />
					<div class="label-affiliates">{$LANG.affiliatesconversionrate}</div>
					<span class="res-left pull-right btn btn-info btn-sm ttb">{$conversionrate}%</span>
					<div style="clear: both;"></div>
					<hr />
					<div class="label-affiliates">{$LANG.affiliatescommissionspending}</div>
					<span class="res-left pull-right btn btn-warning btn-sm ttb">{$pendingcommissions}</span>
					<div style="clear: both;"></div>
					<hr />
					<div class="label-affiliates">{$LANG.affiliatescommissionsavailable}</div>
					<span class="res-left pull-right btn btn-primary btn-sm ttb">{$balance}</span>
					<div style="clear: both;"></div>
					<hr />
					<div class="label-affiliates">{$LANG.affiliateswithdrawn}</div>
					<span class="res-left pull-right btn btn-default btn-sm ttb">{$withdrawn}</span>
					<div style="clear: both;"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- account overview end-->
	<!-- referals history-->
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.affiliatesreferals}</h3>
				</div>
				<div class="panel-body">
					{include file="$template/includes/tablelist.tpl" tableName="AffiliatesList"}
					<script type="text/javascript">
						jQuery(document).ready( function ()
						{
							var table = jQuery('#tableAffiliatesList').DataTable();
							{if $orderby == 'regdate'}
								table.order(0, '{$sort}');
							{elseif $orderby == 'product'}
								table.order(1, '{$sort}');
							{elseif $orderby == 'amount'}
								table.order(2, '{$sort}');
							{elseif $orderby == 'status'}
								table.order(4, '{$sort}');
							{/if}
							table.draw();
						});
					</script>
					<table id="tableAffiliatesList" class="table table-list table-bordered">
						<thead>
							<tr>
								<th>{$LANG.affiliatessignupdate}</th>
								<th>{$LANG.orderproduct}</th>
								<th>{$LANG.affiliatesamount}</th>
								<th>{$LANG.affiliatescommission}</th>
								<th>{$LANG.affiliatesstatus}</th>
							</tr>
						</thead>
						<tbody>
						{foreach from=$referrals item=referral}
							<tr class="text-center">
								<td><span class="hidden">{$referral.datets}</span>{$referral.date}</td>
								<td>{$referral.service}</td>
								<td data-order="{$referral.amountnum}">{$referral.amountdesc}</td>
								<td data-order="{$referral.commissionnum}">{$referral.commission}</td>
								<td><span class='label status status-{$referral.rawstatus|strtolower}'>{$referral.status}</span></td>
							</tr>
						{/foreach}
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- referals history end-->
	<!-- afiiliates links code-->
	{if $affiliatelinkscode}
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$LANG.affiliateslinktous}</h3>
					</div>
					<div class="panel-body">
						{$affiliatelinkscode}
					</div>
				</div>
			</div>
		</div>
	{/if}
	<!-- afiiliates links code end-->
{/if}