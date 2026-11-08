<form method="post" action="{routePath('account-users-permissions-save', $user->id)}">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">{lang key="userManagement.managePermissions"}: {$user->email}</h3>
        </div>
        <div class="panel-body">
            {foreach $permissions as $permission}
                <div class="icheck">
                    <label class="checkbox">
                        <input type="checkbox" class="icheck" name="perms[{$permission.key}]" value="1"{if $userPermissions->hasPermission($permission.key)} checked{/if}>
                        {$permission.title}
                        -
                        {$permission.description}
                    </label>
                </div>
            {/foreach}
        </div>
        <div class="panel-footer">
            <button type="submit" class="btn btn-primary res-100">
                {lang key="clientareasavechanges"}
            </button>
            <a href="{routePath('account-users')}" class="btn btn-default res-100 res-left pull-right">
                {lang key="clientareacancel"}
            </a>
        </div>
    </div>
</form>

{include file="$template/includes/icheck.tpl"}
