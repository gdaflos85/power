<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.general.custom_language_list.title}
            {if isset($tooltips.settings.general.custom_language_list.title)}
                {if isset($tooltips.settings.general.custom_language_list.url) && $tooltips.settings.general.custom_language_list.url != ""}
                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.general.custom_language_list.url}' target='_blank'>Learn More</a>"}
                {else}
                    {assign var="popoverFooter" value=false}
                {/if}
                {include 
                    file="adminarea/includes/helpers/popover.tpl" 
                    popoverClasses="notification__popover"
                    popoverBody="{$tooltips.settings.general.custom_language_list.title}"
                    popoverFooter="{$popoverFooter}"
                }
            {/if}
        </h6>
        <label>
            <div class="switch" data-toggle="lu-collapse" data-target="#custom-language-list">
                <input type="hidden"  name="settings[custom_language_list]" value="hidden"/>
                <input class="switch__checkbox"
                        name="settings[custom_language_list]" value="enabled"
                        type="checkbox" {if $settings['custom_language_list'] == "enabled"} checked="checked" {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div>
    <div class="collapse {if $settings['custom_language_list'] == "enabled"} show {/if}" id="custom-language-list">
        <div class="form-group form-group--language m-b-0x p-3x">
            <label class="form-label text-default">
                {$lang.settings.section.general.custom_language_list.label}
            </label>
            {$selectedLanguage = json_decode($settings['custom_available_languages'])}
            <select class="form-control multiselect form-control--basic" name="settings[custom_available_languages][]" multiple data-select-all>
                <option value="all" {if (is_array($selectedLanguage) && in_array("all", $selectedLanguage)) || $selectedLanguage == NULL}selected{/if}>All</option>
                <option value="rs_selectize_divider">divider</option>
                {foreach $locales as $locale}
                    <option value="{$locale.language}" {if (is_array($selectedLanguage) && in_array($locale.language, $selectedLanguage))}selected{/if}>{$locale.localisedName}</option>
                {/foreach}
            </select>
        </div>
    </div>
</div>