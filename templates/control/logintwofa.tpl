{if $newbackupcode}
	{include file="$template/includes/alert.tpl" type="success" msg=$LANG.twofabackupcodereset textcenter=true}
{elseif $incorrect}
	{include file="$template/includes/alert.tpl" type="error" msg=$LANG.twofa2ndfactorincorrect textcenter=true}
{elseif $error}
	{include file="$template/includes/alert.tpl" type="error" msg=$error textcenter=true}
{else}
	{include file="$template/includes/alert.tpl" type="warning" msg=$LANG.twofa2ndfactorreq textcenter=true}
{/if}
<form method="post" action="{$systemsslurl}dologin.php" class="form-stacked" id="frmlogin">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.twofactorauth}</h3>
				</div>
				<div class="panel-body">
					
					{if $newbackupcode}
						<input type="hidden" name="newbackupcode" value="1" />
						<p><strong>{$LANG.twofanewbackupcodeis}</strong></p>
						<div class="alert alert-info">
							<p>{$newbackupcode}</p>
						</div>
						<p>{$LANG.twofabackupcodeexpl}</p>
						<br />
						<p align="center"><input type="submit" value="{$LANG.continue} &raquo;" class="btn res-100 btn-primary btn-3d" /></p>
					{elseif $backupcode}
						<input type="hidden" name="backupcode" value="1" />
						<div class="form-group">
							<input type="text" name="code" class="form-control" />
						</div>
						<p align="center"><input type="submit" value="{$LANG.loginbutton} &raquo;" class="btn btn-primary res-100 btn-3d" /></p>
					{else}
						<div class="margin-bottom">
							{$challenge}
						</div>
						<p><strong>{$LANG.twofacantaccess2ndfactor}</strong></p>
						<a href="clientarea.php?backupcode=1" class="btn btn-primary res-100 btn-3d">{$LANG.twofaloginusingbackupcode}</a>
					{/if}
				</div>
			</div>
		</div>
	</div>
</form>