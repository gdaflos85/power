{if $error}
	{include file="$template/includes/alert.tpl" type="error" msg=$error}
{/if}
{if $external}
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.domainemailforwarding}: {$domain}</h3>
				</div>
				<div class="panel-body">
					<p>{$LANG.domainemailforwardingdesc}</p>
					<br /><br />
					<div class="textcenter">
						{$code}
					</div>
					<br/><br/>
				</div>
			</div>
		</div>
	</div>
{else}
	<form method="post" action="{$smarty.server.PHP_SELF}?action=domainemailforwarding">
		<input type="hidden" name="sub" value="save" />
		<input type="hidden" name="domainid" value="{$domainid}" />
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$LANG.domainemailforwarding}: {$domain}</h3>
					</div>
					<div class="panel-body">
						<p>{$LANG.domainemailforwardingdesc}</p>
						<div class="table-responsive">
							<table class="table table-striped table-framed">
								<thead>
									<tr>
										<th>{$LANG.domainemailforwardingprefix}</th>
										<th></th>
										<th>{$LANG.domainemailforwardingforwardto}</th>
									</tr>
								</thead>
								<tbody>
									{foreach key=num item=emailforwarder from=$emailforwarders}
										<tr>
											<td><input type="text" name="emailforwarderprefix[{$num}]" value="{$emailforwarder.prefix}" class="form-control" /></td>
											<td class="text-center">@{$domain} => </td>
											<td><input type="text" name="emailforwarderforwardto[{$num}]" value="{$emailforwarder.forwardto}" class="form-control" /></td>
										</tr>
									{/foreach}
									<tr>
										<td><input type="text" name="emailforwarderprefixnew" class="form-control" /></td>
										<td class="text-center">@{$domain} => </td>
										<td><input type="text" name="emailforwarderforwardtonew" class="form-control" /></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="panel-footer">
						<input type="submit" value="{$LANG.clientareasavechanges}" class="btn res-100 btn-primary btn-3d" />
					</div>
				</div>
			</div>
		</div>
	</form>
{/if}