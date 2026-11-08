{include file="$template/includes/flashmessage.tpl"}

{include file="$template/includes/alert.tpl" type="info" msg=$LANG.userManagement.settings}

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

{if $securityQuestions->count() > 0}
    <form class="form-horizontal" method="post" action="{routePath('user-security-question')}">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">{$LANG.clientareanavsecurityquestions}</h3>
                    </div>
                    <div class="panel-body">
                        {if $user->hasSecurityQuestion()}
                            <div class="form-group">
                                <label for="inputCurrentAns" class="col-sm-3 control-label">{$user->getSecurityQuestion()}</label>
                                <div class="col-sm-6">
                                    <input type="password" name="currentsecurityqans" id="inputCurrentAns" class="form-control" autocomplete="off" />
                                </div>
                            </div>
                        {/if}
                        <div class="form-group">
                            <label for="inputSecurityQid" class="col-sm-3 control-label">{$LANG.clientareasecurityquestion}</label>
                            <div class="col-sm-6">
                                <select name="securityqid" id="inputSecurityQid" class="form-control">
                                    {foreach $securityQuestions as $question}
                                        <option value="{$question->id}">
                                            {$question->question}
                                        </option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputSecurityAns1" class="col-sm-3 control-label">{$LANG.clientareasecurityanswer}</label>
                            <div class="col-sm-6">
                                <input type="password" name="securityqans" id="inputSecurityAns1" class="form-control" autocomplete="off" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputSecurityAns2" class="col-sm-3 control-label">{$LANG.clientareasecurityconfanswer}</label>
                            <div class="col-sm-6">
                                <input type="password" name="securityqans2" id="inputSecurityAns2" class="form-control" autocomplete="off" />
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <input class="btn res-100 btn-3d btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}" />
						<input class="btn res-100 btn-default pull-right res-left" type="reset" value="{$LANG.cancel}" />
                    </div>
                </div>
            </div>
        </div>
    </form>
{/if}

{if $twoFactorAuthAvailable}
  <div class="row">
    <div class="col-md-12">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title">{$LANG.twofactorauth}</h3>
        </div>
        <div class="panel-body">
          <p class="twofa-config-link disable{if !$twoFactorAuthEnabled} hidden{/if}">
              {$LANG.twofacurrently} <strong>{$LANG.enabled|strtolower}</strong>
          </p>
          <p class="twofa-config-link enable{if $twoFactorAuthEnabled} hidden{/if}">
              {$LANG.twofacurrently} <strong>{$LANG.disabled|strtolower}</strong>
          </p>
          {include file="$template/includes/alert.tpl" type="warning" msg="{lang key="clientAreaSecurityTwoFactorAuthRecommendation"}"}
        </div>
        <div class="panel-footer">
          <a href="{routePath('account-security-two-factor-disable')}" class="btn btn-3d res-100 btn-danger open-modal twofa-config-link disable{if !$twoFactorAuthEnabled} hidden{/if}" data-modal-title="{$LANG.twofadisable}" data-modal-class="twofa-setup" data-btn-submit-label="{lang key='twofadisable'}" data-btn-submit-color="danger" data-btn-submit-id="btnDisable2FA">
            {$LANG.twofadisableclickhere}
          </a>
          <a href="{routePath('account-security-two-factor-enable')}" class="btn btn-3d res-100 btn-success open-modal twofa-config-link enable{if $twoFactorAuthEnabled} hidden{/if}" data-modal-title="{$LANG.twofaenable}" data-modal-class="twofa-setup" data-btn-submit-id="btnEnable2FA">
            {$LANG.twofaenableclickhere}
          </a>
        </div>
      </div>
    </div>
  </div>
{/if}
