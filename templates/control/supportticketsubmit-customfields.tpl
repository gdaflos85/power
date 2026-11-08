{foreach key=num item=customfield from=$customfields}
	<div class="form-group">
		<label class="col-sm-3 control-label" for="customfield{$customfield.id}">{$customfield.name}</label>
		<div class="col-sm-6">
			{$customfield.input}
			{if $customfield.description}
				<p class="help-block">{$customfield.description}</p>
			{/if}
		</div>
	</div>
{/foreach}