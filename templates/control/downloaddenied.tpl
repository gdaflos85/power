{if $reason eq "supportandupdates"}
	<form action="{$systemsslurl}cart.php?a=add" method="post">
		<input type="hidden" name="productid" value="{$serviceid}" />
		<input type="hidden" name="aid" value="{$addonid}" />
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-danger">
					<div class="panel-heading">
						<h3 class="panel-title">{$LANG.supportAndUpdatesExpired}</h3>
					</div>
					<div class="panel-body">
						<p>{$LANG.supportAndUpdatesExpiredLicense}{if $licensekey}: {$licensekey}{else}.{/if}</p>
					</div>
					<div class="panel-footer">
						<input type="submit" value="{$LANG.supportAndUpdatesClickHereToRenew}" class="btn res-100 btn-primary btn-3d" />
					</div>
				</div>
			</div>
		</div>
	</form>
{else}
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<div class="panel panel-danger">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.accessdenied}</h3>
				</div>
				<div class="panel-body">
					<p>{$LANG.downloadproductrequired}</p>
					{if $prodname}
						{include file="$template/includes/alert.tpl" type="info" msg=$prodname textcenter=true}
					{else}
						{include file="$template/includes/alert.tpl" type="info" msg=$addonname textcenter=true}
					{/if}
				</div>
				<div class="panel-footer">
					{if $pid || $aid}
						<form action="{$systemsslurl}cart.php" method="post">
							{if $pid}
								<input type="hidden" name="a" value="add" />
								<input type="hidden" name="pid" value="{$pid}" />
							{elseif $aid}
								<input type="hidden" name="gid" value="addons" />
							{/if}
							<input type="submit" value="{$LANG.ordernowbutton} &raquo;" class="btn res-100 btn-primary btn-3d" />
						</form>
					{/if}
				</div>
			</div>
		</div>
	</div>
{/if}