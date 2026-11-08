<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">{$LANG.newsletterunsubscribe}</h3>
			</div>
			<div class="panel-body">
				{if $successful}
					{include file="$template/includes/alert.tpl" type="danger" msg=$unsubscribesuccess textcenter=true}
					<p class="text-center">{$LANG.newsletterremoved}</p>
				{/if}
				{if $errormessage}
					{include file="$template/includes/alert.tpl" type="danger" msg=$errormessage textcenter=true}
				{/if}
				<p>{$LANG.newsletterresubscribe|sprintf2:'<a href="clientarea.php?action=details">':'</a>'}</p>
			</div>
			<div class="panel-footer">
				<a href="index.php" class="btn btn-default">
					<i class="fas fa-home"></i>
					{$LANG.returnhome}
				</a>
			</div>
		</div>
	</div>
</div>