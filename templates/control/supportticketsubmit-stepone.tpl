<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">{$LANG.navopenticket}</h3>
			</div>
			<div class="panel-body">
				<p>{$LANG.supportticketsheader}</p>
				{foreach from=$departments key=num item=department}
					<hr />
					<p><strong><a href="{$smarty.server.PHP_SELF}?step=2&amp;deptid={$department.id}"><i class="fas fa-envelope"></i>&nbsp;&nbsp;{$department.name}</a></strong></p>
					{if $department.description}
						<p>{$department.description}</p>
					{/if}
				{foreachelse}
					<div class="alert alert-info">
						{$LANG.nosupportdepartments}
					</div>
				{/foreach}
			</div>
		</div>
	</div>
</div>