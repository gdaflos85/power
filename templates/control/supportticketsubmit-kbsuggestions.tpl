<hr />
<div class="form-group">
	<label class="col-sm-3 control-label">{$LANG.kbsuggestions}</label>
	<div class="col-sm-6" style="padding-top: 7px;">
		<p>{$LANG.kbsuggestionsexplanation}</p><br />
		{foreach from=$kbarticles item=kbarticle}
			<p><strong><a href="knowledgebase.php?action=displayarticle&id={$kbarticle.id}" target="_blank">{$kbarticle.title}</a></strong></p>
			<p>{$kbarticle.article}...</p><br />
		{/foreach}
	</div>
</div>