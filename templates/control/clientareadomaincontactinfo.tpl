{include file="$template/includes/alert.tpl" type="info" msg=$LANG.whoisContactWarning}
{if $successful}
	{include file="$template/includes/alert.tpl" type="success" msg=$LANG.changessavedsuccessfully textcenter=true}
{/if}
{if $pending}
    {include file="$template/includes/alert.tpl" type="info" msg=$pendingMessage textcenter=true}
{/if}
{if $domainInformation && !$pending && $domainInformation->getIsIrtpEnabled() && $domainInformation->isContactChangePending()}
    {if $domainInformation->getPendingSuspension()}
        {include file="$template/includes/alert.tpl" type="warning" msg="<strong>{$LANG.domains.verificationRequired}</strong><br>{$LANG.domains.newRegistration}" textcenter=true}
    {else}
        {include file="$template/includes/alert.tpl" type="info" msg="<strong>{$LANG.domains.contactChangePending}</strong><br>{$LANG.domains.contactsChanged}" textcenter=true}
    {/if}
{/if}
{if $error}
	{include file="$template/includes/alert.tpl" type="error" msg=$error textcenter=true}
{/if}
<form method="post" action="{$smarty.server.PHP_SELF}?action=domaincontacts" class="form-horizontal" id="frmDomainContactModification">
	<input type="hidden" name="sub" value="save" />
	<input type="hidden" name="domainid" value="{$domainid}" />
	{foreach from=$contactdetails name=contactdetails key=contactdetail item=values}
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$contactdetail} {$LANG.supportticketscontact}</h3>
					</div>
					<div class="panel-body">
						<p>
							<label class="radio-inline">
								<input type="radio" class="icheck" name="wc[{$contactdetail}]" id="{$contactdetail}1" value="contact" onclick="useDefaultWhois(this.id)" /> {$LANG.domaincontactusexisting}
							</label>
						</p>
						<fieldset id="{$contactdetail}defaultwhois">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="{$contactdetail}3">{$LANG.domaincontactchoose}</label>
								<div class="col-sm-6">
                                     <input type="hidden" name="sel[{$contactdetail}]" value="">
									<select class="form-control {$contactdetail}defaultwhois" name="sel[{$contactdetail}]" id="{$contactdetail}3" disabled>
										<option value="u{$clientsdetails.userid}">{$LANG.domaincontactprimary}</option>
										{foreach key=num item=contact from=$contacts}
											<option value="c{$contact.id}">{$contact.name}</option>
										{/foreach}
									</select>
								</div>
							</div>
						</fieldset>
						<p>
							<label class="radio-inline">
								<input type="radio" class="icheck" name="wc[{$contactdetail}]" id="{$contactdetail}2" value="custom" onclick="useCustomWhois(this.id)" checked /> {$LANG.domaincontactusecustom}
							</label>
						</p>
						<fieldset id="{$contactdetail}customwhois">
							{foreach key=name item=value from=$values}
								<div class="form-group">
									<label class="col-sm-3 control-label">{$contactdetailstranslations[$name]}</label>
									<div class="col-sm-6">
										<input type="text" name="contactdetails[{$contactdetail}][{$name}]" value="{$value}" data-original-value="{$value}" class="form-control {$contactdetail}customwhois{if array_key_exists($contactdetail, $irtpFields) && in_array($name, $irtpFields[$contactdetail])} irtp-field{/if}" />
									</div>
								</div>
							{/foreach}
						</fieldset>
					</div>
				</div>
			</div>
		</div>
	{/foreach}
	<div class="row">
		<div class="col-md-12">
            {if $domainInformation && $irtpFields}
                <input id="irtpOptOut" type="hidden" name="irtpOptOut" value="0">
                <input id="irtpOptOutReason" type="hidden" name="irtpOptOutReason" value="">
            {/if}
			<input type="submit" value="{$LANG.clientareasavechanges}" class="res-100 btn btn-primary btn-3d" />
			<a href="clientarea.php?action=domaindetails&id={$domainid}" class="res-100 res-left pull-right btn btn-default">{$LANG.clientareabacklink}</a>
		</div>
	</div>
</form>
{if $domainInformation && $irtpFields}
    <script type="text/javascript">
        var allowSubmit = 0;
    </script>
    <div class="modal fade" id="modalIRTPConfirmation" role="dialog" aria-labelledby="IRTPConfirmationLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content panel panel-primary">
                <div id="modalIRTPConfirmationHeading" class="modal-header panel-heading">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only">{lang key='orderForm.close'}</span>
                    </button>
                    <h4 class="modal-title" id="IRTPConfirmationLabel">{lang key='domains.importantReminder'}</h4>
                </div>
                <div id="modalIRTPConfirmationBody" class="modal-body panel-body text-center">
                    <div class="row">
                        <div class="col-sm-10 col-sm-offset-1">
                            {lang key='domains.irtpNotice'}
                        </div>
                        <div class="col-sm-12">
                            <div class="checkbox-inline">
                                <label for="modalIrtpOptOut">
                                    <input id="modalIrtpOptOut" class="checkbox" type="checkbox" value="1">
                                    {lang key='domains.optOut'}
                                </label>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-sm-12 text-left">
                                    <label for="modalReason">{lang key='domains.optOutReason'}</label>:
                                </div>
                                <div class="col-sm-12">
                                    <input id="modalReason" type="text" class="form-control input-600" autocomplete="off">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="modalIRTPConfirmationFooter" class="modal-footer panel-footer">
                    <button type="button" id="IRTPConfirmation-Submit" class="btn btn-primary" onclick="irtpSubmit();return false;">
                        {lang key='supportticketsticketsubmit'}
                    </button>
                    <button type="button" id="IRTPConfirmation-Cancel" class="btn btn-default" data-dismiss="modal">
                        {lang key='cancel'}
                    </button>
                </div>
            </div>
        </div>
    </div>
{/if}
