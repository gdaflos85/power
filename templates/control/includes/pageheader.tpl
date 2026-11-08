{if $templatefile neq 'homepage' and $templatefile neq 'clientareahome'}
	<div class="row">
		<div class="col-md-12">
			<!--breadcrumbs start -->
			{include file="$template/includes/breadcrumb.tpl"}
			<!--breadcrumbs end -->
			<h1 class="h1">{$displayTitle}</h1>
			{if $tagline}<small class="res-left pull-right" style="margin: 12px 12px 20px 12px;">{$tagline}</small>{/if}
		</div>
	</div>
{/if}