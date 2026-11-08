<div class="row">
	<div class="col-md-8 col-md-offset-2">
		<div class="panel panel-default">
			<div class="panel-body">
				<p>{$message}</p>
				<p class="textcenter"><img src="templates/{$template}/img/loading.gif" style="display: block; margin: 10px auto;" /></p>
				<div id="frmPayment" align="center">
					<div align="center" class="textcenter">{$code}</div>
					<form method="post" action="{if $invoiceid}viewinvoice.php?id={$invoiceid}{else}clientarea.php{/if}">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script language="javascript">
    setTimeout("autoSubmitFormByContainer('frmPayment')", 5000);
</script>