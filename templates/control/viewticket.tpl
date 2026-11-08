{if $invalidTicketId}
    {include file="$template/includes/alert.tpl" type="danger" title=$LANG.thereisaproblem msg=$LANG.supportticketinvalid textcenter=true}
{else}
    {if $closedticket}
        {include file="$template/includes/alert.tpl" type="warning" msg=$LANG.supportticketclosedmsg textcenter=true}
    {/if}
    {if $errormessage}
        {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
    {/if}
{/if}
{if !$invalidTicketId}
	<form method="post" action="{$smarty.server.PHP_SELF}?tid={$tid}&amp;c={$c}&amp;postreply=true" enctype="multipart/form-data" role="form" id="frmReply" class="form-horizontal">
		<div id="replyform" class="panel panel-info panel-collapsable{if !$postingreply} panel-collapsed{/if} hidden-print">
			<div class="panel-heading" id="ticketReply">
				<div class="collapse-icon pull-right">
					<i class="fas fa-{if !$postingreply}plus{else}minus{/if}"></i>
				</div>
				<h3 class="panel-title">
					<i class="fas fa-pencil-alt"></i> &nbsp; {$LANG.supportticketsreply}
				</h3>
			</div>
			<div id="replybody" class="panel-body{if !$postingreply} panel-body-collapsed{/if}">
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<label for="inputName" class="col-sm-3 control-label">{$LANG.supportticketsclientname}</label>
							<div class="col-sm-6">
								<input class="form-control" type="text" name="replyname" id="inputName" value="{$replyname}"{if $loggedin} disabled="disabled"{/if}>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail" class="col-sm-3 control-label">{$LANG.supportticketsclientemail}</label>
							<div class="col-sm-6">
								<input class="form-control" type="text" name="replyemail" id="inputEmail" value="{$replyemail}"{if $loggedin} disabled="disabled"{/if}>
							</div>
						</div>
						<div class="form-group">
							<label for="inputMessage" class="col-sm-3 control-label">{$LANG.contactmessage}</label>
							<div class="col-sm-6">
								<textarea name="replymessage" id="inputMessage" rows="12" class="form-control markdown-editor" data-auto-save-name="ctr{$tid}">{$replymessage}</textarea>
							</div>
						</div>
						<hr />
						<div class="form-group">
							<label for="inputAttachments" class="col-sm-3 control-label">{$LANG.supportticketsticketattachments}</label>
							<div class="col-sm-6">
								<input type="file" name="attachments[]" id="inputAttachments" class="form-control" />
								<div id="fileUploadsContainer"></div>
								<p class="help-block">{$LANG.supportticketsallowedextensions}: {$allowedfiletypes} ({lang key="maxFileSize" fileSize="$uploadMaxFileSize"})
							</div>
							<div class="col-sm-3">
								<button type="button" class="btn btn-default btn-sm " onclick="extraTicketAttachment()">
									<i class="fas fa-plus"></i> {$LANG.addmore}
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="replyfooter" class="panel-footer" {if !$postingreply}style="display:none;"{/if}>
					<input class="btn btn-primary btn-3d res-100" type="submit" name="save" value="{$LANG.supportticketsticketsubmit}" />
					<input class="btn btn-default pull-right res-100 res-left" type="reset" value="{$LANG.cancel}" onclick="jQuery('#ticketReply').click()" />
			</div>
		</div>
	</form>
	<div class="panel panel-info visible-print-block">
		<div class="panel-heading">
				<h3 class="panel-title">
						{$LANG.ticketinfo}
				</h3>
		</div>
		<div class="panel-body container-fluid">
				<div class="row">
						<div class="col-md-2 col-xs-6">
								<b>{$LANG.supportticketsticketid}</b><br />{$tid}
						</div>
						<div class="col-md-4 col-xs-6">
								<b>{$LANG.supportticketsticketsubject}</b><br />{$subject}
						</div>
						<div class="col-md-2 col-xs-6">
								<b>{$LANG.supportticketspriority}</b><br />{$urgency}
						</div>
						<div class="col-md-4 col-xs-6">
								<b>{$LANG.supportticketsdepartment}</b><br />{$department}
						</div>
				</div>
		</div>
	</div>
	{foreach $descreplies as $reply}
		<div class="panel {if $reply.admin}panel-success{else}panel-default{/if} ticket-reply markdown-content">
			<div class="panel-heading">
				<h3 class="panel-title">
                    <div class="date pull-right hidden-xs">
						{$reply.date}
					</div>
					<i class="fas fa-user"></i> &nbsp;
                    {$reply.requestor.name}
                    <span class="label requestor-type-{$reply.requestor.type_normalised}">
                        {if $reply.requestor.type_normalised eq 'operator'}
                            {lang key='support.requestor.operator'}
                        {elseif $reply.requestor.type_normalised eq 'owner'}
                            {lang key='support.requestor.owner'}
                        {elseif $reply.requestor.type_normalised eq 'authorizeduser'}
                            {lang key='support.requestor.authorizeduser'}
                        {elseif $reply.requestor.type_normalised eq 'externaluser'}
                            {lang key='support.requestor.externaluser'}
                        {elseif $reply.requestor.type_normalised eq 'registereduser'}
                            {lang key='support.requestor.registereduser'}
                        {elseif $reply.requestor.type_normalised eq 'subaccount'}
                            {lang key='support.requestor.subaccount'}
                        {elseif $reply.requestor.type_normalised eq 'guest'}
                            {lang key='support.requestor.guest'}
                        {/if}
                    </span>
                    <span class="type">
                        {if $reply.admin}
                            {$LANG.supportticketsstaff}
                        {else}
                            {$reply.requestor.email}
                        {/if}
                    </span>
                    <div class="date date-xs visible-xs">
						{$reply.date}
					</div>
				</h3>
			</div>
			<div class="panel-body message">
				{$reply.message}
                {if $reply.ipaddress}
                    <hr>
                    {lang key='support.ipAddress'}: {$reply.ipaddress}
                {/if}
			</div>
			{if $reply.id && $reply.admin && $ratingenabled}
				<div class="panel-footer">
					<div class="clearfix">
						{if $reply.rating}
							<span class="rating-question">{$LANG.ticketreatinggiven}:</span>
							<div class="rating-done">
								{for $rating=1 to 5}
									<span class="star{if (5 - $reply.rating) < $rating} active{/if}"></span>
								{/for}
							</div>
						{else}
							<span class="rating-question">{$LANG.ticketratingquestion}</span>
							<div class="rating" ticketid="{$tid}" ticketkey="{$c}" ticketreplyid="{$reply.id}">
								<span class="star" rate="5"></span>
								<span class="star" rate="4"></span>
								<span class="star" rate="3"></span>
								<span class="star" rate="2"></span>
								<span class="star" rate="1"></span>
							</div>
						{/if}
					</div>
				</div>
			{/if}
			{if $reply.attachments}
				<div class="panel-footer">
					<strong>{$LANG.supportticketsticketattachments} ({$reply.attachments|count})</strong>
                    {if $reply.attachments_removed}({lang key='support.attachmentsRemoved'}){/if}
					{foreach $reply.attachments as $num => $attachment}
                        {if $reply.attachments_removed}
        					<br /><i class="fas fa-file-minus"></i> {$attachment}
                        {else}
        					<br /><i class="fas fa-file"></i> <a href="dl.php?type={if $reply.id}ar&id={$reply.id}{else}a&id={$id}{/if}&i={$num}">{$attachment}</a>
                        {/if}
					{/foreach}
				</div>
			{/if}
		</div>
	{/foreach}
{/if}
