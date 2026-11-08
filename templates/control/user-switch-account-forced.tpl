<div class="row">
    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">{lang key="navSwitchAccount"}</h3>
            </div>
            <div class="panel-body">
                <div class="continue-container">
                    <p>{lang key="switchAccount.forcedSwitchRequest"}</p>
                    <p>
                        <strong>
                            {$requiredClient->fullName}
                            {if $requiredClient->companyName}
                                ({$requiredClient->companyName})
                            {/if}
                        </strong>
                        <br>
                        {$requiredClient->email}
                    </p>
                </div>
            </div>
            <div class="panel-footer">

                <form method="post" action="{routePath('user-accounts')}">
                    <input type="hidden" name="id" value="{$requiredClient->id}" >
                    <button type="submit" class="btn btn-primary btn-3d">
                        {lang key="continue"}
                        <i class="fas fa-arrow-right"></i>
                    </button>
                    <a href="{routePath('clientarea-home')}" class="btn btn-default pull-right">{lang key="switchAccount.cancelAndReturn"}</a>
                </form>

            </div>
        </div>
    </div>
</div>
