{if $error}<div class="alert alert-error alert-danger" style="display:block;">{$error|replace:'<li>':' &nbsp;#&nbsp; '} &nbsp;&nbsp; </div><br />{/if}
{if $success}<div class="alert alert-success" style="display:block;">{$success|replace:'<li>':' &nbsp;#&nbsp; '} &nbsp;&nbsp; </div><br />{/if}

<h3>Id Protection</h3>
<p>The public details for all contacts are completely replaced in the WHOIS data with Whois Privacy Corp. data in order to protect your identity and try to prevent spam from happening.</p>

<p>Service Status for Domain <b>{$domain}</b> is 
{if $status == "disabled"}
	<span class="label label-danger">{Lang::trans("disabled")}</span>
{elseif $status == "enabled"}
	<span class="label label-success">{Lang::trans("enabled")}</span>
{else}
	<span class="label label-danger">{Lang::trans($status)}</span>
{/if}</p>

{if $status === "disabled" || $status === "enabled"} 
				
<form method="post">
	<input type="hidden" name="status" value="{$status}"/>
	{if $status == "disabled"}
		<input type='submit' class='btn btn-success' value='Enable Id Protection'/>
	{else}
		<input type='submit' class='btn btn-danger' value='Disable Id Protection'/>
	{/if}
</form>
{/if}

<form method="post" action="clientarea.php?action=domaindetails">
			<input type="hidden" name="id" value="{$domainid}" />
	<p><input type="submit" class="btn" value="« Back"></p>
</form>
