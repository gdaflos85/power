<h3>Verify Your Email</h3>

{if $successmessage}<div class="alert alert-success" style="display:block;">{$successmessage|replace:'<li>':' &nbsp;#&nbsp; '} &nbsp;&nbsp; </div>{/if}
{if $errormessage}<div class="alert alert-error alert-danger" style="display:block;">{$errormessage|replace:'<li>':' &nbsp;#&nbsp; '} &nbsp;&nbsp; </div>{/if}
<div><br/>
	<p>For the following contact information a verification is required:</p>
	<table>
		<tbody>
			<tr>
				<td><b>Current Status:</b></td>
				<td rowspan="2" width="10px"></td>
				<td><span class="label label-warning">{$currentstatus}</span></td>
				<td rowspan="2" width="50px"></td>
				<td rowspan="2">
					<form method="post" action="">
						<input type="hidden" name="id" value="{$domainid}" />
						<input type="hidden" name="domain" value="{$domain}" />
						<input type="hidden" name="do" value="send" />
						<p><input type="submit" class="btn btn-default" value="Resend email"></p>
					</form>
				</td>
			</tr>
			<tr>
				<td><b>Email:</b></td>
				<td>{$email}</td>
			</tr>
		</tbody>
	</table>
</div><br/>
<form method="post" action="clientarea.php">
	<input type="hidden" name="id" value="{$domainid}" />
	<input type="hidden" name="action" value="domaindetails" />
	<p><input type="submit" class="btn" value="« Back"></p>
</form>

