{if $loggedin && $innerTemplate}
	{include file="$template/includes/alert.tpl" type="error" msg=$LANG.noPasswordResetWhenLoggedIn textcenter=true}
{else}
	{if $successMessage}
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$LANG.pwreset}</h3>
					</div>
					<div class="panel-body">
						{include file="$template/includes/alert.tpl" type="success" msg=$successTitle textcenter=true}
						<p>{$successMessage}</p>
					</div>
				</div>
			</div>
		</div>
	{else}
		{if $errorMessage}
			{include file="$template/includes/alert.tpl" type="error" msg=$errorMessage textcenter=true}
		{/if}

		{if $innerTemplate}
			{include file="$template/password-reset-$innerTemplate.tpl"}
		{/if}
	{/if}
{/if}