<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.general.whmcs_currency_update_enabled.title}
            {if isset($tooltips.settings.general.whmcs_currency_update_enabled.title)}
                {if isset($tooltips.settings.general.whmcs_currency_update_enabled.url) && $tooltips.settings.general.whmcs_currency_update_enabled.url != ""}
                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.general.whmcs_currency_update_enabled.url}' target='_blank'>Learn More</a>"}
                {else}
                    {assign var="popoverFooter" value=false}
                {/if}
                {include
                file="adminarea/includes/helpers/popover.tpl"
                popoverClasses="notification__popover"
                popoverBody="{$tooltips.settings.general.whmcs_currency_update_enabled.title}"
                popoverFooter="{$popoverFooter}"
                }
            {/if}
        </h6>
        <label>
            <div class="switch">
                <input type="hidden" name="settings[whmcs_currency_update_enabled]" value="disabled" />
                <input
                        class="switch__checkbox"
                        name="settings[whmcs_currency_update_enabled]"
                        value="true" type="checkbox"
                        {if isset($settings['whmcs_currency_update_enabled']) && $settings['whmcs_currency_update_enabled'] == "true"} checked="checked" {/if}
                >
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div>
</div>