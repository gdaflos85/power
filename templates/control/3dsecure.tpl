{include file="$template/includes/alert.tpl" type="info" msg=$LANG.creditcard3dsecure}
<div class="row">
	<div class="col-md-8 col-md-offset-2">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="text-center">
					<div id="frmThreeDAuth" class="hidden">
						{$code}
					</div>
					<iframe name="3dauth" height="500" scrolling="auto" src="about:blank" class="submit-3d" width="100%" frameborder="0"></iframe>
				</div>
				<script language="javascript">
					jQuery("#frmThreeDAuth").find("form:first").attr('target', '3dauth');
					setTimeout("autoSubmitFormByContainer('frmThreeDAuth')", 1000);
				</script>
			</div>
		</div>
	</div>
</div>






