<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">{$LANG.domainregisterns}: {$domain}</h3>
			</div>
			<div class="panel-body">
				<p>{$LANG.domainregisternsexplanation}</p>
				{if $result}
					<div class="alert alert-warning">
						<p class="bold">{$result}</p>
					</div>
				{/if}
			</div>
		</div>
	</div>
</div>
<form method="post" class="form-horizontal" action="{$smarty.server.PHP_SELF}?action=domainregisterns">
	<input type="hidden" name="sub" value="register" />
	<input type="hidden" name="domainid" value="{$domainid}" />
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.domainregisternsreg}</h3>
				</div>
				<div class="panel-body">
					<fieldset>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="ns1">{$LANG.domainregisternsns}</label>
							<div class="col-sm-6">
								<div class="input-group">
									<input type="text" name="ns" id="ns1" class="form-control" />
									<div class="input-group-addon">
										. {$domain}
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="ip1">{$LANG.domainregisternsip}</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="ipaddress" id="ip1" />
							</div>
						</div>
					</fieldset>
				</div>
				<div class="panel-footer">
					<input type="submit" value="{$LANG.clientareasavechanges}" class="btn res-100 btn-primary btn-3d" />
				</div>
			</div>
		</div>
	</div>
</form>
<form method="post" class="form-horizontal" action="{$smarty.server.PHP_SELF}?action=domainregisterns">
	<input type="hidden" name="sub" value="modify" />
	<input type="hidden" name="domainid" value="{$domainid}" />
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.domainregisternsmod}</h3>
				</div>
				<div class="panel-body">
					<fieldset>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="ns2">{$LANG.domainregisternsns}</label>
							<div class="col-sm-6">
								<div class="input-group">
									<input type="text" name="ns" id="ns2" class="form-control" />
									<div class="input-group-addon">
										. {$domain}
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="ip2">{$LANG.domainregisternscurrentip}</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="currentipaddress" id="ip2" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="ip3">{$LANG.domainregisternsnewip}</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="newipaddress" id="ip3" />
							</div>
						</div>
					</fieldset>
				</div>
				<div class="panel-footer">
					<input type="submit" value="{$LANG.clientareasavechanges}" class="btn res-100 btn-primary btn-3d" />
				</div>
			</div>
		</div>
	</div>
</form>
<form method="post" class="form-horizontal" action="{$smarty.server.PHP_SELF}?action=domainregisterns">
	<input type="hidden" name="sub" value="delete" />
	<input type="hidden" name="domainid" value="{$domainid}" />
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.domainregisternsdel}</h3>
				</div>
				<div class="panel-body">
					<fieldset class="onecol">
						<div class="form-group">
							<label class="col-sm-3 control-label" for="ns3">{$LANG.domainregisternsns}</label>
							<div class="col-sm-6">
								<div class="input-group">
									<input type="text" name="ns" id="ns3" class="form-control" />
									<div class="input-group-addon">
										. {$domain}
									</div>
								</div>
							</div>
						</div>
					</fieldset>
				</div>
				<div class="panel-footer">
					<input type="submit" value="{$LANG.clientareasavechanges}" class="btn res-100 btn-primary btn-3d" />
				</div>
			</div>
		</div>
	</div>
</form>
