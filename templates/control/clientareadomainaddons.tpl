<form method="post" action="{$smarty.server.PHP_SELF}?action=domainaddons" class="form-horizontal">
	<input type="hidden" name="{$action}" value="{$addon}">
	<input type="hidden" name="id" value="{$domainid}">
	<input type="hidden" name="confirm" value="1">
	<input type="hidden" name="token" value="{$token}">
	{if $action eq "buy"}
		<input type="hidden" name="buy" value="{$addon}">
		{if $addon eq "dnsmanagement"}
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">{$LANG.domainaddonsdnsmanagement}: {$domain}</h3>
						</div>
						<div class="panel-body">
							<p>{$LANG.domainaddonsdnsmanagementinfo}</p>
						</div>
						<div class="panel-footer">
							<input type="submit" name="enable" value="{$LANG.domainaddonsbuynow} {$addonspricing.dnsmanagement}{$LANG.domainaddonsperyear}" class="res-100 btn btn-success btn-3d" />
							<a href="clientarea.php?action=domaindetails&id={$domainid}" class="btn btn-default pull-right res-100 res-left">{$LANG.clientareabacklink}</a>
						</div>
					</div>
				</div>
			</div>
		{elseif $addon eq "emailfwd"}
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">{$LANG.domainemailforwarding}: {$domain}</h3>
						</div>
						<div class="panel-body">
							<p>{$LANG.domainaddonsemailforwardinginfo}</p>
						</div>
						<div class="panel-footer">
							<input type="submit" name="enable" value="{$LANG.domainaddonsbuynow} {$addonspricing.emailforwarding}{$LANG.domainaddonsperyear}" class="res-100 btn btn-success btn-3d" />
							<a href="clientarea.php?action=domaindetails&id={$domainid}" class="btn btn-default pull-right res-100 res-left">{$LANG.clientareabacklink}</a>
						</div>
					</div>
				</div>
			</div>
		{elseif $addon eq "idprotect"}
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">{$LANG.domainidprotection}: {$domain}</h3>
						</div>
						<div class="panel-body">
							<p>{$LANG.domainaddonsidprotectioninfo}</p>
						</div>
						<div class="panel-footer">
							<input type="submit" name="enable" value="{$LANG.domainaddonsbuynow} {$addonspricing.idprotection}{$LANG.domainaddonsperyear}" class="res-100 btn btn-3d btn-success" />
							<a href="clientarea.php?action=domaindetails&id={$domainid}" class="btn btn-default pull-right res-100 res-left">{$LANG.clientareabacklink}</a>
						</div>
					</div>
				</div>
			</div>
		{/if}
	{elseif $action eq "disable"}
		<input type="hidden" name="disable" value="{$addon}">
		{if $addon eq "dnsmanagement"}
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">{$LANG.domainaddonsdnsmanagement}: {$domain}</h3>
						</div>
						{if $success}
							<div class="panel-body">
								<div class="alert alert-success">
									<p class="textcenter bold">{$LANG.domainaddonscancelsuccess}</p>
								</div>
							</div>
							<div class="panel-footer">
								<a href="clientarea.php?action=domaindetails&id={$domainid}" class="btn btn-default res-100">{$LANG.clientareabacklink}</a>
							</div>
						{elseif $error}
							<div class="panel-body">
								<div class="alert alert-danger">
									<p class="bold">{$LANG.domainaddonscancelfailed}</p>
								</div>
							</div>
							<div class="panel-footer">
								<a href="clientarea.php?action=domaindetails&id={$domainid}" class="btn btn-default res-100">{$LANG.clientareabacklink}</a>
							</div>
						{else}
							<div class="panel-body">
								<p>{$LANG.domainaddonscancelareyousure}</p>
							</div>
							<div class="panel-footer">
								<input type="submit" name="enable" value="{$LANG.domainaddonsconfirm}" class="btn btn-danger res-100 btn-3d" />
								<a href="clientarea.php?action=domaindetails&id={$domainid}" class="btn btn-default pull-right res-100 res-left">{$LANG.clientareabacklink}</a>
							</div>
						{/if}
					</div>
				</div>
			</div>
		{elseif $addon eq "emailfwd"}
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">{$LANG.domainemailforwarding}: {$domain}</h3>
						</div>
						{if $success}
							<div class="panel-body">
								<div class="alert alert-success">
									<p class="textcenter bold">{$LANG.domainaddonscancelsuccess}</p>
								</div>
							</div>
							<div class="panel-footer">
								<a href="clientarea.php?action=domaindetails&id={$domainid}" class="btn btn-default res-100">{$LANG.clientareabacklink}</a>
							</div>
						{elseif $error}
							<div class="panel-body">
								<div class="alert alert-danger">
									<p class="bold">{$LANG.domainaddonscancelfailed}</p>
								</div>
							</div>
							<div class="panel-footer">
								<a href="clientarea.php?action=domaindetails&id={$domainid}" class="btn btn-default  res-100">{$LANG.clientareabacklink}</a>
							</div>
						{else}
							<div class="panel-body">
								<p>{$LANG.domainaddonscancelareyousure}</p>
							</div>
							<div class="panel-footer">
								<input type="submit" name="enable" value="{$LANG.domainaddonsconfirm}" class="btn btn-danger res-100 btn-3d" />
								<a href="clientarea.php?action=domaindetails&id={$domainid}" class="btn btn-default pull-right res-100 res-left">{$LANG.clientareabacklink}</a>
							</div>
						{/if}
					</div>
				</div>
			</div>
		{elseif $addon eq "idprotect"}
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">{$LANG.domainidprotection}: {$domain}</h3>
						</div>
						{if $success}
							<div class="panel-body">
								<div class="alert alert-success">
									<p class="textcenter bold">{$LANG.domainaddonscancelsuccess}</p>
								</div>
							</div>
							<div class="panel-footer">
								<a href="clientarea.php?action=domaindetails&id={$domainid}" class="btn btn-default res-100">{$LANG.clientareabacklink}</a>
							</div>
						{elseif $error}
							<div class="panel-body">
								<div class="alert alert-danger">
									<p class="bold">{$LANG.domainaddonscancelfailed}</p>
								</div>
							</div>
							<div class="panel-footer">
								<a href="clientarea.php?action=domaindetails&id={$domainid}" class="btn btn-default res-100">{$LANG.clientareabacklink}</a>
							</div>
						{else}
							<div class="panel-body">
								<p>{$LANG.domainaddonscancelareyousure}</p>
							</div>
							<div class="panel-footer">
								<input type="submit" name="enable" value="{$LANG.domainaddonsconfirm}" class="btn btn-danger res-100" />
								<a href="clientarea.php?action=domaindetails&id={$domainid}" class="btn btn-default pull-right res-100 res-left">{$LANG.clientareabacklink}</a>
							</div>
						{/if}
					</div>
				</div>
			</div>
		{/if}
	{/if}
</form>