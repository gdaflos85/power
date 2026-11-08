{if $errormessage}
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.sslconfsslcertificate}</h3>
				</div>
				<div class="panel-body">
					<div class="alert alert-danger">
						<p class="bold">{$LANG.clientareaerrors}</p>
						<ul>
							{$errormessage}
						</ul>
					</div>
				</div>
				<div class="panel-footer">
					<input type="button" value="{$LANG.clientareabacklink}" class="btn res-100 btn-primary btn-3d" onclick="history.go(-1)" />
				</div>
			</div>
		</div>
	</div>
{else}
	<form method="post" action="clientarea.php?action=productdetails">
		<input type="hidden" name="id" value="{$serviceid}" />
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$LANG.sslconfigcomplete}</h3>
					</div>
					<div class="panel-body">
						<p>{$LANG.sslconfigcompletedetails}</p>
					</div>
					<div class="panel-footer">
						<input type="submit" value="{$LANG.invoicesbacktoclientarea}" class="btn res-100 btn-primary btn-3d"/>
					</div>
				</div>
			</div>
		</div>
	</form>
{/if}