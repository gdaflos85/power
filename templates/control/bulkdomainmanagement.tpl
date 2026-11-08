<form method="post" action="{$smarty.server.PHP_SELF}?action=bulkdomain" class="form-horizontal">
	<input type="hidden" name="update" value="{$update}">
	<input type="hidden" name="save" value="1">
	{foreach from=$domainids item=domainid}
		<input type="hidden" name="domids[]" value="{$domainid}" />
	{/foreach}
	{if $update eq "nameservers"}
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$LANG.domainmanagens}</h3>
					</div>
					<div class="panel-body">
						{if $save}
							{if $errors}
								<div class="alert alert-danger">
									<p><strong>{$LANG.clientareaerrors}</strong></p>
									<ul>
										{foreach from=$errors item=error}
										<li>{$error}</li>
									{/foreach}
									</ul>
								</div>
							{else}
								<div class="alert alert-success">
									<p>{$LANG.changessavedsuccessfully}</p>
								</div>
							{/if}
						{/if}
						<p>{$LANG.domainbulkmanagementchangesaffect}</p>
						<br />
						<blockquote>
							{foreach from=$domains item=domain}
								<small>{$domain}</small>
							{/foreach}
						</blockquote>
						<p>
							<label class="radio-inline">
								<input type="radio" class="icheck" name="nschoice" value="default" onclick="disableFields('domnsinputs',true)" checked /> {$LANG.nschoicedefault}
							</label>
						</p>
						<p>
							<label class="radio-inline">
								<input type="radio" class="icheck" name="nschoice" value="custom" onclick="disableFields('domnsinputs','')" checked /> {$LANG.nschoicecustom}
							</label>
						</p>
						<br />
						<hr />
						<br />
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ns1">{$LANG.domainnameserver1}</label>
							<div class="col-sm-8">
								<input class="form-control domnsinputs" id="ns1" name="ns1" type="text" value="{$ns1}" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ns2">{$LANG.domainnameserver2}</label>
							<div class="col-sm-8">
								<input class="form-control domnsinputs" id="ns2" name="ns2" type="text" value="{$ns2}" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ns3">{$LANG.domainnameserver3}</label>
							<div class="col-sm-8">
								<input class="form-control domnsinputs" id="ns3" name="ns3" type="text" value="{$ns3}" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ns4">{$LANG.domainnameserver4}</label>
							<div class="col-sm-8">
								<input class="form-control domnsinputs" id="ns4" name="ns4" type="text" value="{$ns4}" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="ns5">{$LANG.domainnameserver5}</label>
							<div class="col-sm-8">
								<input class="form-control domnsinputs" id="ns5" name="ns5" type="text" value="{$ns5}" />
							</div>
						</div>
					</div>
					<div class="panel-footer">
						<input type="submit" class="res-100 btn btn-3d btn-primary" value="{$LANG.changenameservers}" />
						<input type="button" class="res-left res-100 pull-right btn btn-default" value="{$LANG.clientareabacklink}" onclick="window.location='clientarea.php?action=domains'" />
					</div>
				</div>
			</div>
		</div>
	{elseif $update eq "autorenew"}
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$LANG.domainautorenewstatus}</h3>
					</div>
					<div class="panel-body">
						{if $save}
							<div class="alert alert-success">
								<p>{$LANG.changessavedsuccessfully}</p>
							</div>
						{/if}
						<p>{$LANG.domainautorenewinfo}</p>
						<br />
						<p>{$LANG.domainautorenewrecommend}</p>
						<br />
						<p>{$LANG.domainbulkmanagementchangeaffect}</p>
						<br />
						<blockquote>
							{foreach from=$domains item=domain}
								<small>{$domain}</small>
							{/foreach}
						</blockquote>
						<br />
					</div>
					<div class="panel-footer">
						<input type="submit" name="enable" value="{$LANG.domainsautorenewenable}" class="btn btn-3d btn-success res-100" /> &nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" name="disable" value="{$LANG.domainsautorenewdisable}" class="btn btn-3d btn-danger res-100" />
						<input type="button" class="pull-right btn btn-default res-left res-100" value="{$LANG.clientareabacklink}" onclick="window.location='clientarea.php?action=domains'" />
					</div>
				</div>
			</div>
		</div>
	{elseif $update eq "reglock"}
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$LANG.domainreglockstatus}</h3>
					</div>
					<div class="panel-body">
						{if $save}
							{if $errors}
								<div class="alert alert-danger">
									<p class="bold">{$LANG.clientareaerrors}</p>
									<ul>
									{foreach from=$errors item=error}
										<li>{$error}</li>
									{/foreach}
									</ul>
								</div>
							{else}
								<div class="alert alert-success">
									<p>{$LANG.changessavedsuccessfully}</p>
								</div>
							{/if}
						{/if}
						<p>{$LANG.domainreglockinfo}</p>
						<br />
						<p>{$LANG.domainreglockrecommend}</p>
						<br />
						<p>{$LANG.domainbulkmanagementchangeaffect}</p>
						<br />
						<blockquote>
							{foreach from=$domains item=domain}
								<small>{$domain}</small>
							{/foreach}
						</blockquote>
						<br />
					</div>
					<div class="panel-footer">
						<input type="submit" name="enable" value="{$LANG.domainreglockenable}" class="btn btn-3d btn-success res-100" /> &nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" name="disable" value="{$LANG.domainreglockdisable}" class="btn btn-3d btn-danger res-100" />
						<input type="button" class="pull-right btn btn-default res-left res-100" value="{$LANG.clientareabacklink}" onclick="window.location='clientarea.php?action=domains'" />
					</div>
				</div>
			</div>
		</div>
	{elseif $update eq "contactinfo"}
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$LANG.domaincontactinfoedit}</h3>
					</div>
					<div class="panel-body">
						{if $save}
							{if $errors}
								<div class="alert alert-danger">
									<p class="bold">{$LANG.clientareaerrors}</p>
									<ul>
										{foreach from=$errors item=error}
										<li>{$error}</li>
									{/foreach}
									</ul>
								</div>
							{else}
								<div class="alert alert-success">
									<p>{$LANG.changessavedsuccessfully}</p>
								</div>
							{/if}
						{/if}
						{literal}
							<script language="javascript">
								function usedefaultwhois(id) {
									jQuery("."+id.substr(0,id.length-1)+"customwhois").attr("disabled", true);
									jQuery("."+id.substr(0,id.length-1)+"defaultwhois").attr("disabled", false);
									jQuery('#'+id.substr(0,id.length-1)+'1').attr("checked", "checked");
								}
								function usecustomwhois(id) {
									jQuery("."+id.substr(0,id.length-1)+"customwhois").attr("disabled", false);
									jQuery("."+id.substr(0,id.length-1)+"defaultwhois").attr("disabled", true);
									jQuery('#'+id.substr(0,id.length-1)+'2').attr("checked", "checked");
								}
							</script>
						{/literal}
						<p>{$LANG.domainbulkmanagementchangesaffect}</p>
						<br />
						<blockquote>
							{foreach from=$domains item=domain}
								<small>{$domain}</small>
							{/foreach}
						</blockquote>
						<br />
						{foreach from=$contactdetails name=contactdetails key=contactdetail item=values}
							<h4><a name="{$contactdetail}"></a><strong>{$contactdetail}</strong>{if $smarty.foreach.contactdetails.first}{foreach from=$contactdetails name=contactsx key=contactdetailx item=valuesx}{if !$smarty.foreach.contactsx.first} - <a href="clientarea.php?action=bulkdomain#{$contactdetailx}">{$LANG.jumpto} {$contactdetailx}</a>{/if}{/foreach}{else} - <a href="clientarea.php?action=bulkdomain#">{$LANG.top}</a>{/if}</h4>
							<br />
							<p>
								<label class="radio-inline">
									<input type="radio" class="icheck" name="wc[{$contactdetail}]" id="{$contactdetail}1" value="contact" onclick="usedefaultwhois(id)" /> {$LANG.domaincontactusexisting}
								</label>
							</p>
							<br />
							<div class="form-group" id="{$contactdetail}defaultwhois">
								<label class="col-sm-2 control-label" for="{$contactdetail}3">{$LANG.domaincontactchoose}</label>
								<div class="col-sm-8">
									<select class="form-control {$contactdetail}defaultwhois" name="sel[{$contactdetail}]" id="{$contactdetail}3" onclick="usedefaultwhois(id)">
										<option value="u{$clientsdetails.userid}">{$LANG.domaincontactprimary}</option>
										{foreach key=num item=contact from=$contacts}
											<option value="c{$contact.id}">{$contact.name}</option>
										{/foreach}
									  </select>
								</div>
							</div>
							<br />
							<p>
								<label class="radio-inline">
									<input type="radio" class="icheck" name="wc[{$contactdetail}]" id="{$contactdetail}2" value="custom" onclick="usecustomwhois(id)" checked /> {$LANG.domaincontactusecustom}
								</label>
							</p>
							<br />
							<fieldset id="{$contactdetail}defaultwhois">
								{foreach key=name item=value from=$values}
									<div class="form-group">
										<label class="col-sm-2 control-label" for="{$contactdetail}3">{$name}</label>
										<div class="col-sm-8">
											<input class="form-control {$contactdetail}customwhois" name="contactdetails[{$contactdetail}][{$name}]" type="text" value="{$value}" />
										</div>
									</div>
								{/foreach}
							</fieldset>
						{foreachelse}
							<div class="alert alert-danger">
								<p>{$LANG.domainbulkmanagementnotpossible}</p>
							</div>
						{/foreach}
					</div>
					<div class="panel-footer">
						<input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-3d btn-primary res-100" />
						<input type="button" class="pull-right btn btn-default res-left res-100" value="{$LANG.clientareabacklink}" onclick="window.location='clientarea.php?action=domains'" />
					</div>
				</div>
			</div>
		</div>
	{/if}
</form>