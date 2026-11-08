{include file="$template/includes/flashmessage.tpl"}

<div class="row">
    <div class="col-md-6">
        <form method="post" action="{routePath('user-profile-save')}">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">{$LANG.userProfile.profile}</h3>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label for="inputFirstName" class="control-label">
                            {$LANG.clientareafirstname}
                        </label>
                        <input
                            type="text"
                            name="firstname"
                            id="inputFirstName"
                            value="{$user->firstName}"
                            class="form-control"
                            {if in_array('firstname', $uneditableFields)}disabled="disabled"{/if}
                        >
                    </div>
                    <div class="form-group">
                        <label for="inputLastName" class="control-label">
                            {$LANG.clientarealastname}
                        </label>
                        <input
                            type="text"
                            name="lastname"
                            id="inputLastName"
                            value="{$user->lastName}"
                            class="form-control"
                            {if in_array('lastname', $uneditableFields)}disabled="disabled"{/if}
                        >
                    </div>
                </div>
                <div class="panel-footer">
                    <input class="btn btn-primary btn-3d" type="submit" name="save" value="{$LANG.clientareasavechanges}" />
                    <input class="btn btn-default pull-right res-left" type="reset" value="{$LANG.cancel}" />
                </div>
            </div>
        </form>
    </div>
    <div class="col-md-6">
        <form method="post" action="{routePath('user-profile-email-save')}">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">{$LANG.userProfile.changeEmail}</h3>
                </div>
                <div class="panel-body">
                    {if $user->needsToCompleteEmailVerification()}
                        <div class="alert alert-warning">{$LANG.userProfile.notVerified}</div>
                    {elseif $user->emailVerified()}
                        <div class="alert alert-success">{$LANG.userProfile.verified}</div>
                    {/if}
                    <div class="form-group">
                        <label for="inputEmail" class="control-label">
                            {$LANG.clientareaemail}
                        </label>
                        <input
                            type="email"
                            name="email"
                            id="inputEmail"
                            value="{$user->email}"
                            class="form-control"
                            {if in_array('email', $uneditableFields)}disabled="disabled"{/if}
                        >
                    </div>
                </div>
                <div class="panel-footer">
                    <input class="btn btn-primary btn-3d" type="submit" name="save" value="{$LANG.clientareasavechanges}" />
                    <input class="btn btn-default pull-right res-left" type="reset" value="{$LANG.cancel}" />
                </div>
            </div>
        </form>
    </div>
</div>
