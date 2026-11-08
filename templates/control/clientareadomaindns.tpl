{if $error}
	{include file="$template/includes/alert.tpl" type="error" msg=$error}
{/if}
{if $external}
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.domaindnsmanagement}: {$domain}</h3>
				</div>
				<div class="panel-body">
					<p>{$LANG.domaindnsmanagementdesc}</p>
					<br /><br />
					<div class="textcenter">
						{$code}
					</div>
					<br /><br /><br /><br />
				</div>
			</div>
		</div>
	</div>
{else}
	<form class="form-horizontal" method="post" action="{$smarty.server.PHP_SELF}?action=domaindns">
		<input type="hidden" name="sub" value="save" />
		<input type="hidden" name="domainid" value="{$domainid}" />
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$LANG.domaindnsmanagement}: {$domain}</h3>
					</div>
					<div class="panel-body">
						<p>{$LANG.domaindnsmanagementdesc}</p>
						<div class="table-responsive">
							<table class="table table-striped table-framed">
								<thead>
									<tr>
										<th>{$LANG.domaindnshostname}</th>
										<th>{$LANG.domaindnsrecordtype}</th>
										<th>{$LANG.domaindnsaddress}</th>
										<th>{$LANG.domaindnspriority}</th>
									</tr>
								</thead>
								<tbody>
									{foreach from=$dnsrecords item=dnsrecord}
										<tr>
											<td><input type="hidden" name="dnsrecid[]" value="{$dnsrecord.recid}" /><input type="text" name="dnsrecordhost[]" value="{$dnsrecord.hostname}" size="10" class="input-small" /></td>
											<td>
												<select class="input-sm" name="dnsrecordtype[]">
													<option value="A"{if $dnsrecord.type eq "A"} selected="selected"{/if}>{lang key="domainDns.a"}</option>
													<option value="AAAA"{if $dnsrecord.type eq "AAAA"} selected="selected"{/if}>{lang key="domainDns.aaaa"}</option>
													<option value="MXE"{if $dnsrecord.type eq "MXE"} selected="selected"{/if}>{lang key="domainDns.mxe"}</option>
													<option value="MX"{if $dnsrecord.type eq "MX"} selected="selected"{/if}>{lang key="domainDns.mx"}</option>
													<option value="CNAME"{if $dnsrecord.type eq "CNAME"} selected="selected"{/if}>{lang key="domainDns.cname"}</option>
													<option value="TXT"{if $dnsrecord.type eq "TXT"} selected="selected"{/if}>{lang key="domainDns.txt"}</option>
													<option value="URL"{if $dnsrecord.type eq "URL"} selected="selected"{/if}>{lang key="domainDns.url"}</option>
													<option value="FRAME"{if $dnsrecord.type eq "FRAME"} selected="selected"{/if}>{lang key="domainDns.frame"}</option>
												</select>
											</td>
											<td><input type="text" name="dnsrecordaddress[]" value="{$dnsrecord.address}" size="40" /></td>
											<td>{if $dnsrecord.type eq "MX"}<input type="text" name="dnsrecordpriority[]" value="{$dnsrecord.priority}" size="2" class="input-small" />*{else}<input type="hidden" name="dnsrecordpriority[]" value="N/A" />{$LANG.domainregnotavailable}{/if}</td>
										</tr>
									{/foreach}
									<tr>
										<td><input type="text" name="dnsrecordhost[]" size="10" class="input-small" /></td>
										<td>
											<select class="input-sm" name="dnsrecordtype[]">
												<option value="A">{lang key="domainDns.a"}</option>
												<option value="AAAA">{lang key="domainDns.aaaa"}</option>
												<option value="MXE">{lang key="domainDns.mxe"}</option>
												<option value="MX">{lang key="domainDns.mx"}</option>
												<option value="CNAME">{lang key="domainDns.cname"}</option>
												<option value="TXT">{lang key="domainDns.txt"}</option>
												<option value="URL">{lang key="domainDns.url"}</option>
												<option value="FRAME">{lang key="domainDns.frame"}</option>
											</select>
										</td>
										<td><input type="text" name="dnsrecordaddress[]" size="40" /></td>
										<td><input type="text" name="dnsrecordpriority[]" size="2" class="input-small" />*</td>
									</tr>
								</tbody>
							</table>
						</div>
						<p align="center">* {$LANG.domaindnsmxonly}</p>
					</div>
					<div class="panel-footer">
						<input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-3d btn-primary res-100" />
					</div>
				</div>
			</div>
		</div>
	</form>
{/if}
