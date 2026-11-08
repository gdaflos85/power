<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.layout.acccount_details_sidebar_box.title}
            {if isset($tooltips.settings.layout.acccount_details_sidebar_box.title)}
                {if isset($tooltips.settings.layout.acccount_details_sidebar_box.url) && $tooltips.settings.layout.acccount_details_sidebar_box.url != ""}
                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.layout.acccount_details_sidebar_box.url}' target='_blank'>Learn More</a>"}
                {else}
                    {assign var="popoverFooter" value=false}
                {/if}
                {include 
                    file="adminarea/includes/helpers/popover.tpl" 
                    popoverClasses="notification__popover"
                    popoverBody="{$tooltips.settings.layout.acccount_details_sidebar_box.title}"
                    popoverFooter="{$popoverFooter}"
                }
            {/if}
        </h6>
        <label>
            <div class="switch" data-toggle="lu-collapse" data-target="#acccount_details_sidebar_box">
                <input type="hidden"  name="settings[show_account_details_sidebar_box]" value="hidden"/>
                <input class="switch__checkbox"
                        name="settings[show_account_details_sidebar_box]" value="enabled"
                        type="checkbox" {if $settings['show_account_details_sidebar_box'] == "enabled"} checked="checked" {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div>
    <div class="collapse {if $settings['show_account_details_sidebar_box'] == "enabled"} show {/if}" id="acccount_details_sidebar_box">
        <div class="form-group m-b-0x p-3x">
            <label class="form-label">
                {$lang.settings.section.layout.acccount_details_sidebar_box.label}
            </label>
            {$selectedAccountDetailsBoxPages = json_decode($settings['acccount_details_sidebar_box'])}
            <select class="form-control multiselect form-control--basic form-control--account-icons" name="settings[acccount_details_sidebar_box][]" multiple data-select-all>
                <option value="all" {if (is_array($selectedAccountDetailsBoxPages) && in_array("all", $selectedAccountDetailsBoxPages)) || $selectedAccountDetailsBoxPages == NULL} selected {/if}>{$lang.settings.section.layout.acccount_details_sidebar_box.options.all}</option>
                <option value="rs_selectize_divider">divider</option>
                <option value="clientareadetails" {if is_array($selectedAccountDetailsBoxPages) && in_array("clientareadetails", $selectedAccountDetailsBoxPages)} selected {/if}>{$lang.settings.section.layout.acccount_details_sidebar_box.options.clientareadetails}</option>
                <option value="account-user-management" {if is_array($selectedAccountDetailsBoxPages) && in_array("account-user-management", $selectedAccountDetailsBoxPages)} selected {/if}>{$lang.settings.section.layout.acccount_details_sidebar_box.options['account-user-management']}</option>
                <option value="account-paymentmethods" {if is_array($selectedAccountDetailsBoxPages) && in_array("account-paymentmethods", $selectedAccountDetailsBoxPages)} selected {/if}>{$lang.settings.section.layout.acccount_details_sidebar_box.options['account-paymentmethods']}</option>
                <option value="account-contacts-manage" {if is_array($selectedAccountDetailsBoxPages) && in_array("account-contacts-manage", $selectedAccountDetailsBoxPages)} selected {/if}>{$lang.settings.section.layout.acccount_details_sidebar_box.options['account-contacts-manage']}</option>
                <option value="clientareasecurity" {if is_array($selectedAccountDetailsBoxPages) && in_array("clientareasecurity", $selectedAccountDetailsBoxPages)} selected {/if}>{$lang.settings.section.layout.acccount_details_sidebar_box.options.clientareasecurity}</option>
                <option value="clientareaemails" {if is_array($selectedAccountDetailsBoxPages) && in_array("clientareaemails", $selectedAccountDetailsBoxPages)} selected {/if}>{$lang.settings.section.layout.acccount_details_sidebar_box.options.clientareaemails}</option>
                <option value="user-profile" {if is_array($selectedAccountDetailsBoxPages) && in_array("user-profile", $selectedAccountDetailsBoxPages)} selected {/if}>{$lang.settings.section.layout.acccount_details_sidebar_box.options['user-profile']}</option>
                <option value="user-switch-account" {if is_array($selectedAccountDetailsBoxPages) && in_array("user-switch-account", $selectedAccountDetailsBoxPages)} selected {/if}>{$lang.settings.section.layout.acccount_details_sidebar_box.options['user-switch-account']}</option>
                <option value="user-password" {if is_array($selectedAccountDetailsBoxPages) && in_array("user-password", $selectedAccountDetailsBoxPages)} selected {/if}>{$lang.settings.section.layout.acccount_details_sidebar_box.options['user-password']}</option>
                <option value="user-security" {if is_array($selectedAccountDetailsBoxPages) && in_array("user-security", $selectedAccountDetailsBoxPages)} selected {/if}>{$lang.settings.section.layout.acccount_details_sidebar_box.options['user-security']}</option>
            </select>
        </div>
    </div>
</div>