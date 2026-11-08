<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.general.show_status_icon.title}
            {if isset($tooltips.settings.general.display_status_icon.title)}
                {if isset($tooltips.settings.general.display_status_icon.url) && $tooltips.settings.general.display_status_icon.url != ""}
                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.general.display_status_icon.url}' target='_blank'>Learn More</a>"}
                {else}
                    {assign var="popoverFooter" value=false}
                {/if}
                {include 
                    file="adminarea/includes/helpers/popover.tpl" 
                    popoverClasses="notification__popover"
                    popoverBody="{$tooltips.settings.general.display_status_icon.title}"
                    popoverFooter="{$popoverFooter}"
                }
            {/if}
        </h6>
        <label>
            <div class="switch">
                <input type="hidden" name="settings[show_status_icon]" value="hidden"/>
                <input class="switch__checkbox"
                        name="settings[show_status_icon]" value="displayed"
                        type="checkbox" {if isset($settings['show_status_icon']) && $settings['show_status_icon'] == "displayed"} checked="checked" {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div> 
</div>