<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">{$LANG.domaingeteppcode}: {$domain}</h3>
			</div>
			<div class="panel-body">
				<p>{$LANG.domaingeteppcodeexplanation}</p>
				{if $error}
					<div class="alert alert-danger">
						{$LANG.domaingeteppcodefailure} {$error}
					</div>
				{else}
					{if $eppcode}
						<div class="alert alert-danger">
							{$LANG.domaingeteppcodeis} {$eppcode}
						</div>
					{else}
						<div class="alert alert-danger">
							{$LANG.domaingeteppcodeemailconfirmation}
						</div>
					{/if}
				{/if}
			</div>
		</div>
	</div>
</div>