{if $sent}
	{include file="$template/includes/alert.tpl" type="success" msg=$LANG.contactsent textcenter=true}
{/if}
{if $errormessage}
	{include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
{/if}
{if !$sent}
	<form method="post" action="contact.php" class="form-horizontal">
		<input type="hidden" name="action" value="send" />
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$LANG.contacttitle}</h3>
					</div>
					<div class="panel-body">
						<fieldset>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="name">{$LANG.supportticketsclientname}</label>
								<div class="col-sm-6">
									<input class="form-control" type="text" name="name" id="name" value="{$name}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="email">{$LANG.supportticketsclientemail}</label>
								<div class="col-sm-6">
									<input class="form-control" type="email" name="email" id="email" value="{$email}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="subject">{$LANG.supportticketsticketsubject}</label>
								<div class="col-sm-6">
									<input class="form-control" type="text" name="subject" id="subject" value="{$subject}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="message">{$LANG.contactmessage}</label>
								<div class="col-sm-6">
									<textarea name="message" id="message" rows="12" class="form-control">{$message}</textarea>
								</div>
							</div>
						</fieldset>
                        {if $captcha}
				            {include file="$template/includes/captcha.tpl"}
                        {/if}
					</div>
					<div class="panel-footer">
						<input type="submit" value="{$LANG.contactsend}" class="btn res-100 btn-3d btn-primary {$captcha->getButtonClass($captchaForm)}" />
					</div>
				</div>
			</div>
		</div>
	</form>
{/if}