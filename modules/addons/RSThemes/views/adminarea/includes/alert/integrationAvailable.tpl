<div 
    class="alert alert--info alert--outline has-icon alert--border-left is-hidden"
    data-cookie-alert
    data-cookie-alert-exp="2147483647"
    data-cookie-alert-name="LagomCheckIntegration-{$template->getVersion()}"
>
    <div class="alert__body">
        {if $integrationType == "cms"}
            <h6>{$lang.alert.cms_integration_available.title}</h6>
            <p>{$lang.alert.cms_integration_available.desc}</p>
            <p class="m-t-1x">{$lang.alert.cms_integration_available.desc2}</p>
        {else}
            <h6>{$lang.alert.integration_available.title}</h6>
            <p>{$lang.alert.integration_available.desc}</p>
            <p class="m-t-1x">{$lang.alert.integration_available.desc2}</p>
        {/if}   
    </div>
    <div class="alert__actions">
        <form method="POST" action="{$helper->url('Template@loadSettings',['templateName'=>$template->getMainName()])}">
            <input type="hidden" name="integrationType" value="{$integrationType}"> 
            <button type="submit" class="btn btn--secondary btn--sm">{$lang.general.import}</button>
        </form>
        {if $integrationType == "cms"}
            <form method="POST" action="{$helper->url('Template@dissmissSettings',['templateName'=>$template->getMainName()])}" data-cms-integration-dismiss>
                <button data-cms-integration-dismiss-submit class="btn btn--default btn--outline btn--sm" type="submit">{$lang.general.dismiss}</button>
            </form>
        {else}
            <button data-dismiss="alert" aria-label="Close" class="btn btn--default btn--outline btn--sm">{$lang.general.dismiss}</button>    
        {/if}
    </div>
</div>