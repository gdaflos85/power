{if $stillopen}
    {include file="$template/includes/alert.tpl" type="warning" msg=$LANG.feedbackclosed textcenter=true}
    <p class="text-center">
        <a href="{$WEB_ROOT}/clientarea.php" class="btn btn-3d btn-primary">{$LANG.returnclient}</a>
    </p>
{elseif $feedbackdone}
    {include file="$template/includes/alert.tpl" type="success" msg=$LANG.feedbackprovided textcenter=true}
    <p class="text-center">{$LANG.feedbackthankyou}</p>
    <p class="text-center">
        <a href="{$WEB_ROOT}/clientarea.php" class="btn btn-3d btn-primary">{$LANG.returnclient}</a>
    </p>
{elseif $success}
    {include file="$template/includes/alert.tpl" type="success" msg=$LANG.feedbackreceived textcenter=true}
    <p class="text-center">{$LANG.feedbackthankyou}</p>
    <p class="text-center">
        <a href="{$WEB_ROOT}/clientarea.php" class="btn btn-3d btn-primary">{$LANG.returnclient}</a>
    </p>
{else}
    {if $errormessage}
        {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
    {/if}
	<div class="row">
		<div class="col-md-12">
			<form method="post" action="{$smarty.server.PHP_SELF}?tid={$tid}&c={$c}&feedback=1">
				<input type="hidden" name="validate" value="true" />
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$LANG.ticketfeedbacktitle|cat:' #'|cat:$tid}</h3>
					</div>
					<div class="panel-body">
						<p>{$LANG.feedbackdesc}</p>
						<br />
						<div class="alert alert-warning">
							<p class="textcenter">[ <a class="alert-link" target="_blank" href="viewticket.php?tid={$tid}&c={$c}">{$LANG.feedbackclickreview}</a> ]</p>
						</div>
						<div class="pull-left"><strong>{$LANG.feedbackopenedat}</strong></div>
						<div class="res-left pull-right" style="padding: 0; margin: 0;">{$opened}</div>
						<div style="clear: both;"></div>
						<hr />
						<div class="pull-left"><strong>{$LANG.feedbacklastreplied}</strong></div>
						<div class="res-left pull-right" style="padding: 0; margin: 0;">{$lastreply}</div>
						<div style="clear: both;"></div>
						<hr />
						<div class="pull-left"><strong>{$LANG.feedbackstaffinvolved}</strong></div>
						<div class="res-left pull-right" style="padding: 0; margin: 0;">{if $staffinvolvedtext}{$staffinvolvedtext}{else}{$LANG.none}{/if}</div>
						<div style="clear: both;"></div>
						<hr />
						<div class="pull-left"><strong>{$LANG.feedbacktotalduration}</strong></div>
						<div class="res-left pull-right" style="padding: 0; margin: 0;">{$duration}</div>
						<div style="clear: both;"></div>
						{foreach from=$staffinvolved key=staffid item=staff}
							<hr />
							<p>{$LANG.feedbackpleaserate1} <strong>{$staff}</strong> {$LANG.feedbackhandled}:</p>
							<br />
							<div class="pull-left"><strong>{$LANG.feedbackworst}</strong></div>
							<div class="pull-right" style="padding: 0; margin: 0;"><strong>{$LANG.feedbackbest}</strong></div>
							<div style="clear: both;"></div>
							<div class="ticketfeedbackrating">
							<br />
								{foreach from=$ratings item=rating}
									<div class="rate">{$rating}<br /><input type="radio" name="rate[{$staffid}]" value="{$rating}"{if $rate.$staffid eq $rating} checked{/if} /><br /></div>
								{/foreach}
							</div>
							<div style="clear: both;"></div>
							<br />
							<hr />
							<p>{$LANG.feedbackpleasecomment1} <strong>{$staff}</strong> {$LANG.feedbackhandled}.</p>
							<fieldset>
								<div class="form-group">
									<div class="col-sm-12">
										<textarea name="comments[{$staffid}]" rows="4" class="form-control">{$comments.$staffid}</textarea>
									</div>
								</div>
							</fieldset>
							<br />
						{/foreach}
						<hr />
						<p>{$LANG.feedbackimprove}</p>
						<fieldset>
							<div class="form-group">
								<div class="col-sm-12">
									<textarea name="comments[generic]" rows="4" class="form-control">{$comments.generic}</textarea>
								</div>
							</div>
						</fieldset>
					</div>
					<div class="panel-footer">
						<input class="btn btn-3d btn-primary res-100" type="submit" name="save" value="{$LANG.clientareasavechanges}" />
						<input class="btn btn-default pull-right res-left res-100" type="reset" value="{$LANG.cancel}" />
					</div>
				</div>
			</form>
		</div>
	</div>
	{literal}
		<style>
			.ticketfeedbackrating {
				padding-left: 5px;
				width: auto;
				margin: auto;
				text-align: center;
			}
			.ticketfeedbackrating .rate {
				display: inline-block;
				padding: 0 10px;
				min-width: 40px;
				text-align: center;
			}
			@media only screen and (max-width: 660px) {
				.ticketfeedbackrating .rate {

					min-width: 0px;
					padding: 0 5px 0 0;
				}
			}
		</style>
	{/literal}
{/if}
