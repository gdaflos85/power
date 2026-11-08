{if $linkableProviders }
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">{lang key='remoteAuthn.titleLinkedAccounts'}</h3>
                </div>
                <div class="panel-body">
                    <div id="twofaactivation">
                        {include file="$template/includes/linkedaccounts.tpl" linkContext="clientsecurity" }
                        <br/>
                        {include file="$template/includes/linkedaccounts.tpl" linkContext="linktable" }
                    </div>
                </div>
            </div>
        </div>
    </div>
{/if}

{if $showSsoSetting}
	<form id="frmSingleSignOn">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">{$LANG.sso.title}</h3>
					</div>
					<div class="panel-body">
						{include file="$template/includes/alert.tpl" type="success" msg=$LANG.sso.summary}
						<input type="hidden" name="token" value="{$token}" />
						<input type="hidden" name="action" value="security" />
						<input type="hidden" name="toggle_sso" value="1" />
						<div class="margin-10">
							<input type="checkbox" name="allow_sso" class="toggle-switch-success" id="inputAllowSso"{if $isSsoEnabled} checked{/if}>
							&nbsp;
							<span id="ssoStatusTextEnabled"{if !$isSsoEnabled} class="hidden"{/if}>
									{$LANG.sso.enabled}
							</span>
							<span id="ssoStatusTextDisabled"{if $isSsoEnabled} class="hidden"{/if}>
									{$LANG.sso.disabled}
							</span>
						</div>
						<p>{$LANG.sso.disablenotice}</p>
					</div>
				</div>
			</div>
		</div>
  </form>
	<link href="{$BASE_PATH_CSS}/bootstrap-switch.min.css" rel="stylesheet">
	<script src="{$BASE_PATH_JS}/bootstrap-switch.min.js"></script>
{/if}
