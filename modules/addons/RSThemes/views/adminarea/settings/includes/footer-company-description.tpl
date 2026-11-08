<div class="panel panel--collapse" data-footer-company-description>
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.layout.footer_company_description.title}
            {if isset($tooltips.settings.layout.footer_company_description.title)}
                {if isset($tooltips.settings.layout.footer_company_description.url) && $tooltips.settings.layout.footer_company_description.url != ""}
                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.layout.footer_company_description.url}' target='_blank'>Learn More</a>"}
                {else}
                    {assign var="popoverFooter" value=false}
                {/if}
                {include 
                    file="adminarea/includes/helpers/popover.tpl" 
                    popoverClasses="notification__popover"
                    popoverBody="{$tooltips.settings.layout.footer_company_description.title}"
                    popoverFooter="{$popoverFooter}"
                }
            {/if}
        </h6>
        <label>
            <div class="switch" data-toggle="lu-collapse" data-target="#footer-company-config" aria-expanded="true">
                <input type="hidden" name="settings[show_footer_company_description]" value="hidden"/>
                <input class="switch__checkbox"
                        name="settings[show_footer_company_description]" value="displayed"
                        type="checkbox" {if $settings['show_footer_company_description'] == "displayed"} checked="checked" {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div>
    <div class="collapse {if $settings['show_footer_company_description'] == "displayed"} show {/if}" id="footer-company-config">
        <div class="form-group m-b-0x p-3x">
            <label class="form-label">
                {$lang.settings.section.layout.footer_company_description.label_message}
                <a href="#footerCompanyDescriptionModal" data-toggle="lu-modal" class="form-label__translate">
                    <span>{$lang.general.translate}</span>
                </a>
            </label>
            <textarea 
                id="footer_company_description_message_input" 
                class="form-control" 
                type="text" 
                data-footer-company-description-input
                data-footer-company-description-system-language="{$systemLanguage}"
                data-form-counter-input
                value="{$footer_company_description_settings[$systemLanguage]}"
            >{$footer_company_description_settings[$systemLanguage]}</textarea>
            <input 
                id="footer_company_description_message_json" 
                type="hidden" 
                name="settings[footer_company_description_message]" 
                value='{json_encode($footer_company_description_settings)|escape:"html"}'
                data-footer-company-description-json
            >
        </div>
    </div>
</div>