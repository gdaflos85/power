<div class="list-group__item" {if $sidebarAlertHideableId}data-id="{$sidebarAlertHideableId}"{/if} {if $sidebarAlertHideable}data-app-sidebar-alert-hideable{/if}>
    <div class="list-group__item-title p-d">
        <i class="ls {$sidebarAlertIconClass}"></i>
        {$sidebarAlertTitle}
    </div>
    <div class="list-group__item-desc p-sm">
        {$sidebarAlertDesc}
    </div>
    <div class="list-group__item-action">
        {if $sidebarAlertActions == "newMenuVersionImport"}
            <form 
                data-new-version-menu-import method="POST" 
                action="{$helper->url('Menu@importChangedMenu',['templateName'=>$template->getMainName()])}"
            >
                <button type="submit" class="btn btn--secondary btn--notification">{$lang.general.import}</button>
            </form>
        {elseif $sidebarAlertActions == "newIntegrationImport"}    
            <form method="POST" action="{$helper->url('Template@loadSettings',['templateName'=>$template->getMainName()])}">
                <input type="hidden" name="integrationType" value="{$integrationType}"> 
                <button type="submit" class="btn btn--secondary btn--notification">{$lang.general.import}</button>
            </form>
        {else}
            {$sidebarAlertActions}
        {/if}
    </div>
</div>