<div class="panel panel--collapse" data-footer-supported-payment-gateways>
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.layout.footer_supported_payment_gateways.title}
            {if isset($tooltips.settings.layout.footer_supported_payment_gateways.footer_supported_payment_gateways.title)}
                {if isset($tooltips.settings.layout.footer_supported_payment_gateways.footer_supported_payment_gateways.url) && $tooltips.settings.layout.footer_supported_payment_gateways.footer_supported_payment_gateways.url != ""}
                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.layout.footer_supported_payment_gateways.footer_supported_payment_gateways.url}' target='_blank'>Learn More</a>"}
                {else}
                    {assign var="popoverFooter" value=false}
                {/if}
                {include 
                    file="adminarea/includes/helpers/popover.tpl" 
                    popoverClasses="notification__popover"
                    popoverBody="{$tooltips.settings.layout.footer_supported_payment_gateways.footer_supported_payment_gateways.title}"
                    popoverFooter="{$popoverFooter}"
                }
            {/if}
        </h6>
        <label>
            <div class="switch" data-toggle="lu-collapse" data-target="#footer-supported-payment-gateways-config" aria-expanded="true">
                <input type="hidden" name="settings[show_footer_supported_payment_gateways]" value="hidden"/>
                <input class="switch__checkbox"
                        name="settings[show_footer_supported_payment_gateways]" value="displayed"
                        type="checkbox" {if $settings['show_footer_supported_payment_gateways'] == "displayed"} checked="checked" {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div>
    <div class="collapse {if $settings['show_footer_supported_payment_gateways'] == "displayed"} show {/if}" id="footer-supported-payment-gateways-config">
        <div class="form-group m-b-0x p-3x">
            <label class="form-label text-default">
                {$lang.settings.section.layout.footer_supported_payment_gateways.label_section_location}
                {if isset($tooltips.settings.layout.footer_supported_payment_gateways.section_location.title)}
                    {if isset($tooltips.settings.layout.footer_supported_payment_gateways.section_location.url) && $tooltips.settings.layout.footer_supported_payment_gateways.section_location.url != ""}
                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.layout.footer_supported_payment_gateways.section_location.url}' target='_blank'>Learn More</a>"}
                    {else}
                        {assign var="popoverFooter" value=false}
                    {/if}
                    {include 
                        file="adminarea/includes/helpers/popover.tpl" 
                        popoverClasses="notification__popover"
                        popoverBody="{$tooltips.settings.layout.footer_supported_payment_gateways.section_location.title}"
                        popoverFooter="{$popoverFooter}"
                    }
                {/if}
            </label>
            <select class="form-control selectized opacity-1" name="settings[footer_supported_payment_gateways_location]" tabindex="-1">
                <option value="default" {if $settings['footer_supported_payment_gateways_location'] == 'default'} selected {/if}>{$lang.settings.section.layout.footer_supported_payment_gateways.location.default}</option>
                <option value="bottom" {if $settings['footer_supported_payment_gateways_location'] == 'bottom'} selected {/if}>{$lang.settings.section.layout.footer_supported_payment_gateways.location.bottom}</option>
            </select>
        </div>
        <div class="form-group m-b-0x p-l-3x p-r-3x p-b-3x p-t-0x" >
            <label class="form-label">
                {$lang.settings.section.layout.footer_supported_payment_gateways.label_header}
                {if isset($tooltips.settings.layout.footer_supported_payment_gateways.header.title)}
                    {if isset($tooltips.settings.layout.footer_supported_payment_gateways.header.url) && $tooltips.settings.layout.footer_supported_payment_gateways.header.url != ""}
                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.layout.footer_supported_payment_gateways.header.url}' target='_blank'>Learn More</a>"}
                    {else}
                        {assign var="popoverFooter" value=false}
                    {/if}
                    {include 
                        file="adminarea/includes/helpers/popover.tpl" 
                        popoverClasses="notification__popover"
                        popoverBody="{$tooltips.settings.layout.footer_supported_payment_gateways.header.title}"
                        popoverFooter="{$popoverFooter}"
                    }
                {/if}
                <a href="#footerSupportedPaymentGatewaysModal" data-toggle="lu-modal" class="form-label__translate">
                    <span>{$lang.general.translate}</span>
                </a>
            </label>
            <input 
                id="footer_supported_payment_gateways_message_input" 
                class="form-control" 
                type="text" 
                data-footer-supported-payment-gateways-input
                data-footer-supported-payment-gateways-system-language="{$systemLanguage}"
                data-form-counter-input
                value="{$footer_supported_payment_gateway_settings[$systemLanguage]}"
            >
            <input 
                id="footer_supported_payment_gateways_message_json" 
                type="hidden" 
                name="settings[footer_supported_payment_gateways_message]" 
                value='{json_encode($footer_supported_payment_gateway_settings)|escape:"html"}'
                data-footer-supported-payment-gateways-json
            >
        </div>
        <div class="row p-l-3x p-r-3x p-b-3x p-t-0x" data-footer-supported-payment-gateways-icons-container>
            {if isset($footer_supported_payment_gateways_icons) && is_array($footer_supported_payment_gateways_icons) && !empty($footer_supported_payment_gateways_icons)}
                {foreach $footer_supported_payment_gateways_icons as $footerGatewayIcon}
                    <div class="col-lg-3 col-md-4 col-sm-6" data-footer-supported-payment-gateways-icon-item>
                        <div class="widget widget--media-manager media-overlay">
                            <a 
                                class="widget__media" 
                                href="#footerSupportedPaymentGatewayIcons" 
                                data-footer-supported-payment-gateways-icon-edit 
                                data-toggle="lu-modal" 
                                data-index="{$footerGatewayIcon.index}" 
                                data-icon-name="{$footerGatewayIcon.iconName}" 
                                data-icon-type="{$footerGatewayIcon.iconType}"
                            >          
                                <div class="widget__img">
                                    {if $footerGatewayIcon.iconType == 'gateways'}
                                        {assign var="ilustrationPath" value="./../../../../../../../templates/{$themeName}/assets/svg-gateways"}
                                        {include file="`$ilustrationPath`/`$footerGatewayIcon.iconName`"}
                                    {else}
                                        {assign var="imgPath" value="./../../../../../../../templates/{$themeName}/assets/img/page-manager"}
                                        <img src="{$imgPath}/{$footerGatewayIcon.iconName}"/>
                                    {/if}
                                </div>
                                <div class="widget__overlay">
                                    <div class="widget__content">
                                        <div class="msg">
                                            <div class="msg__icon i-circled  bg-primary">
                                                <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M17.85 16.44L14.31 12.9C15.37 11.54 16 9.85 16 8C16 3.59 12.41 0 8 0C3.59 0 0 3.59 0 8C0 12.41 3.59 16 8 16C9.85 16 11.54 15.37 12.9 14.31L16.44 17.85C16.54 17.95 16.67 18 16.79 18C16.91 18 17.05 17.95 17.14 17.85L17.85 17.14C18.05 16.95 18.05 16.63 17.85 16.44ZM6.5 9H4V7H6.5C6.78 7 7 6.78 7 6.5V4H9V6.5C9 6.78 9.22 7 9.5 7H12V9H9.5C9.22 9 9 9.22 9 9.5V12H7V9.5C7 9.22 6.78 9 6.5 9Z" fill="white"></path>
                                                </svg>
                                            </div>
                                            <div class="msg__body">
                                                <div class="p-d">Change Icon</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a 
                                class="btn btn--icon btn--link btn--xs delete-image" 
                                href="#footerSupportedPaymentGatewayIconsRemove" 
                                data-toggle="lu-modal" 
                                data-backdrop="static" 
                                data-index="{$footerGatewayIcon.index}" 
                                data-footer-supported-payment-gateways-icon-remove
                            >
                                <i class="btn__icon lm lm-trash"></i>
                            </a>
                        </div>
                    </div>
                {/foreach}
            {/if}
            <div class="col-lg-3 col-md-4 col-sm-6">
                <a href="#footerSupportedPaymentGatewayIcons" data-toggle="lu-modal" class="widget widget__media-add" data-footer-supported-payment-gateways-icon-new>
                    <div class="widget__main-icon">
                        <i class="lm lm-upload"></i>
                    </div>
                    <div class="widget__desc">Upload Image</div>
                    <div class="widget__extensions text-center">Allowed extensions .PNG, .JPG, <br>.SVG, .GIF. Max size 256M.</div>
                </a>
            </div>
        </div>
        <input 
            id="footer_supported_payment_gateways_icon_json" 
            type="hidden" 
            name="settings[footer_supported_payment_gateways_icons]" 
            value='{json_encode($footer_supported_payment_gateways_icons)|escape:"html"}'
            data-footer-supported-payment-gateways-icons-json
        >
        
    </div>
</div>