<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.layout.hover_triggered_submenu_expansion.title}
            {if isset($tooltips.settings.layout.hover_triggered_submenu_expansion.title)}
                {if isset($tooltips.settings.layout.hover_triggered_submenu_expansion.url) && $tooltips.settings.layout.hover_triggered_submenu_expansion.url != ""}
                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.layout.hover_triggered_submenu_expansion.url}' target='_blank'>Learn More</a>"}
                {else}
                    {assign var="popoverFooter" value=false}
                {/if}
                {include 
                    file="adminarea/includes/helpers/popover.tpl" 
                    popoverClasses="notification__popover"
                    popoverBody="{$tooltips.settings.layout.hover_triggered_submenu_expansion.title}"
                    popoverFooter="{$popoverFooter}"
                }
            {/if}
        </h6>
        <label>
            <div class="switch">
                <input type="hidden" name="settings[hover_triggered_submenu_expansion]" value="disabled"/>
                <input class="switch__checkbox"
                        name="settings[hover_triggered_submenu_expansion]" value="enabled"
                        type="checkbox" {if isset($settings['hover_triggered_submenu_expansion']) && $settings['hover_triggered_submenu_expansion'] == "enabled"} checked="checked" {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div> 
</div>