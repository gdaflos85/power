<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.order_process.enable_pw_strength.title}
            {if isset($tooltips.settings.order_process.enable_pw_strength.title)}
                {if isset($tooltips.settings.order_process.enable_pw_strength.url) && $tooltips.settings.order_process.enable_pw_strength.url != ""}
                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.order_process.enable_pw_strength.url}' target='_blank'>Learn More</a>"}
                {else}
                    {assign var="popoverFooter" value=false}
                {/if}
                {include 
                    file="adminarea/includes/helpers/popover.tpl" 
                    popoverClasses="notification__popover"
                    popoverBody="{$tooltips.settings.order_process.enable_pw_strength.title}"
                    popoverFooter="{$popoverFooter}"
                }
            {/if}
        </h6>
        <label>
            <div class="switch">
                <input type="hidden" name="settings[enable_pw_strength]" value="hidden"/>
                <input class="switch__checkbox"
                        name="settings[enable_pw_strength]" value="enabled"
                        type="checkbox" {if isset($settings['enable_pw_strength']) && $settings['enable_pw_strength'] == "enabled"} checked="checked" {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div> 
</div>