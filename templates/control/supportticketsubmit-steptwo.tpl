{if $errormessage}
    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
{/if}
<form name="submitticket" method="post" action="{$smarty.server.PHP_SELF}?step=3" enctype="multipart/form-data" class="form-horizontal">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.navopenticket}</h3>
				</div>
				<div class="panel-body">
					<fieldset>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="inputName">{$LANG.supportticketsclientname}</label>
							<div class="col-sm-6">
								{if $loggedin}
									<input class="form-control disabled" type="text" name="name" id="inputName" value="{$name}" disabled="disabled" />
								{else}
									<input class="form-control" type="text" name="name" id="inputName" value="{$name}" />
								{/if}
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="inputEmail">{$LANG.supportticketsclientemail}</label>
							<div class="col-sm-6">
								{if $loggedin}
									<input class="form-control disabled" type="text" name="email" id="inputEmail" value="{$email}" disabled="disabled" />
								{else}
									<input class="form-control" type="text" name="email" id="inputEmail" value="{$email}" />
								{/if}
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="inputSubject">{$LANG.supportticketsticketsubject}</label>
							<div class="col-sm-6">
								<input class="form-control" type="text" name="subject" id="inputSubject" value="{$subject}" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="inputDepartment">{$LANG.supportticketsdepartment}</label>
							<div class="col-sm-6">
								<select name="deptid" id="inputDepartment" class="form-control" onchange="refreshCustomFields(this)">
									{foreach from=$departments item=department}
										<option value="{$department.id}"{if $department.id eq $deptid} selected="selected"{/if}>
											{$department.name}
										</option>
									{/foreach}
								</select>
							</div>
						</div>
						{if $relatedservices}
							<div class="form-group">
								<label class="col-sm-3 control-label" for="inputRelatedService">{$LANG.relatedservice}</label>
								<div class="col-sm-6">
									<select name="relatedservice" id="inputRelatedService" class="form-control">
										<option value="">{$LANG.none}</option>
										{foreach from=$relatedservices item=relatedservice}
											<option value="{$relatedservice.id}">
												{$relatedservice.name} ({$relatedservice.status})
											</option>
										{/foreach}
									</select>
								</div>
							</div>
						{/if}
						<div class="form-group">
							<label class="col-sm-3 control-label" for="inputPriority">{$LANG.supportticketspriority}</label>
							<div class="col-sm-6">
								<select name="urgency" id="inputPriority" class="form-control">
									<option value="High"{if $urgency eq "High"} selected="selected"{/if}>
										{$LANG.supportticketsticketurgencyhigh}
									</option>
									<option value="Medium"{if $urgency eq "Medium" || !$urgency} selected="selected"{/if}>
										{$LANG.supportticketsticketurgencymedium}
									</option>
									<option value="Low"{if $urgency eq "Low"} selected="selected"{/if}>
										{$LANG.supportticketsticketurgencylow}
									</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="inputMessage">{$LANG.contactmessage}</label>
							<div class="col-sm-6">
								<textarea name="message" id="inputMessage" rows="12" class="form-control markdown-editor" data-auto-save-name="client_ticket_open">{$message}</textarea>
							</div>
						</div>
						<div id="customFieldsContainer">
							{include file="$template/supportticketsubmit-customfields.tpl"}
						</div>
						<hr />
						<div class="form-group">
							<label class="col-sm-3 control-label" for="inputAttachments">{$LANG.supportticketsticketattachments}</label>
							<div class="col-sm-6">
								<input type="file" name="attachments[]" id="inputAttachments" class="form-control" />
								<div id="fileUploadsContainer"></div>
								<p class="help-block">{$LANG.supportticketsallowedextensions}: {$allowedfiletypes} ({lang key="maxFileSize" fileSize="$uploadMaxFileSize"})</p>
							</div>
							<div class="col-sm-3">
								<button type="button" class="btn btn-default btn-sm" onclick="extraTicketAttachment()">
									<i class="fas fa-plus"></i> {$LANG.addmore}
								</button>
							</div>
						</div>
					</fieldset>
					<div id="autoAnswerSuggestions" class="hidden"></div>
					{include file="$template/includes/captcha.tpl"}
				</div>
				<div class="panel-footer">
					<input type="submit" id="openTicketSubmit" value="{$LANG.supportticketsticketsubmit}" class="res-100 btn btn-primary btn-3d {$captcha->getButtonClass($captchaForm)}" />
			        <a href="supporttickets.php" class="btn btn-default pull-right res-100 res-left">{$LANG.cancel}</a>
				</div>
			</div>
		</div>
	</div>
</form>
{if $kbsuggestions}
    <script>
        jQuery(document).ready(function() {
            getTicketSuggestions();
        });
    </script>
{/if}
