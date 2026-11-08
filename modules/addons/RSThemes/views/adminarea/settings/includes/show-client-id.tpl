<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.general.show_client_id.title}
            {if isset($tooltips.settings.general.show_client_id.title)}
                {if isset($tooltips.settings.general.show_client_id.url) && $tooltips.settings.general.show_client_id.url != ""}
                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.general.show_client_id.url}' target='_blank'>Learn More</a>"}
                {else}
                    {assign var="popoverFooter" value=false}
                {/if}
                {include 
                    file="adminarea/includes/helpers/popover.tpl" 
                    popoverClasses="notification__popover"
                    popoverBody="{$tooltips.settings.general.show_client_id.title}"
                    popoverFooter="{$popoverFooter}"
                }
            {/if}
        </h6>
        <label>
            <div class="switch">
                <input type="hidden" name="settings[show_client_id]" value="hidden"/>
                <input class="switch__checkbox"
                        name="settings[show_client_id]" value="displayed"
                        type="checkbox" {if isset($settings['show_client_id']) && $settings['show_client_id'] == "displayed"} checked="checked" {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div> 
</div>