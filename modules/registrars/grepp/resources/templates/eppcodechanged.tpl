{if $vars.success}
	<div class="alert alert-success text-center" role="alert">
		{$LANG.grepp.eppcodechange.success|sprintf:$vars.eppcode}
	</div>
{else}
	<div class="alert alert-danger text-center" role="alert">
		{$vars.error}
	</div>
{/if}