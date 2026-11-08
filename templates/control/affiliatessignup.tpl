{if $affiliatesystemenabled}
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.affiliatesignuptitle}</h3>
				</div>
				<div class="panel-body">
					<p>{$LANG.affiliatesignupintro}</p>
					<ul>
						<li>{$LANG.affiliatesignupinfo1}</li>
						<li>{$LANG.affiliatesignupinfo2}</li>
						<li>{$LANG.affiliatesignupinfo3}</li>
					</ul>
					<form method="post" action="affiliates.php">
						<input type="hidden" name="activate" value="true" />
						<br />
						<p><input type="submit" value="{$LANG.affiliatesactivate}" class="res-100 btn btn-primary" /></p>
					</form>
				</div>
			</div>
		</div>
	</div>
{else}
	{include file="$template/includes/alert.tpl" type="warning" msg=$LANG.affiliatesdisabled textcenter=true}
{/if}