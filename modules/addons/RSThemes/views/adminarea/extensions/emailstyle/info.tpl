{extends file="adminarea/includes/layout.tpl"} 

{block name="template-heading"}
    {include file="adminarea/extensions/emailstyle/includes/breadcrumb.tpl"}
{/block}

{block name="template-content"}
    {if $extension->checkLicense() == "Lagom update is required"}
        <div class="section__activate panel">
            <div class="activate__icon text-center">
                <svg width="48" height="48" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M14.3058 2.58579C14.6809 2.21071 15.1896 2 15.72 2H32.28C32.8104 2 33.3191 2.21071 33.6942 2.58579L45.4142 14.3058C45.7893 14.6809 46 15.1896 46 15.72V32.28C46 32.8104 45.7893 33.3191 45.4142 33.6942L33.6942 45.4142C33.3191 45.7893 32.8104 46 32.28 46H15.72C15.1896 46 14.6809 45.7893 14.3058 45.4142L2.58579 33.6942C2.21071 33.3191 2 32.8104 2 32.28V15.72C2 15.1896 2.21071 14.6809 2.58579 14.3058L14.3058 2.58579ZM16.5484 6L6 16.5484V31.4516L16.5484 42H31.4516L42 31.4516V16.5484L31.4516 6H16.5484Z" fill="#E02430"/>
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M22 32C22 30.8954 22.8954 30 24 30H24.02C25.1246 30 26.02 30.8954 26.02 32C26.02 33.1046 25.1246 34 24.02 34H24C22.8954 34 22 33.1046 22 32Z" fill="#E02430"/>
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M24 14C25.1046 14 26 14.8954 26 16V24C26 25.1046 25.1046 26 24 26C22.8954 26 22 25.1046 22 24V16C22 14.8954 22.8954 14 24 14Z" fill="#E02430"/>
                </svg>
            </div>
            <h5 class="activate__title">Incompatible Extension Version</h5>
            <p class="activate__desc text-center">Installed Extension version is not compatible with current version of Lagom Client Theme. If you’d like to activate this extension, you have to perfrom Lagom Client Theme version update, or install Extension version, which is compatible with installed version of Lagom Client Theme.</p>
            <div class="activate__actions">
                <a class="btn btn--danger" href="https://rsstudio.net/my-account/" target="blank">    
                    <span class="btn__text">
                        Update Lagom Client Theme
                    </span>
                </a>
                <a class="btn btn-default btn--outline" href="https://lagom.rsstudio.net/docs/update.html" target="blank">    
                    <span class="btn__text">
                        {$lang.general.learn_more}
                    </span>
                </a>
            </div>
        </div>
    {else}
        {if $extension->checkLicense() == "Extension license is required" && $extension->isLicenseDisabled()}
            <div class="alert alert--danger alert--outline has-icon alert--border-left m-b-4x">
                <div class="alert__body">
                    <h6 class="alert__title">Extension has been deactivated by the RS Themes addon</h6>
                    <p>This extension has been deactivated, because its not allowed to be used with {$template->license->licenseKey} license. This may be caused by change of the extension assignment to the specific license of Lagom WHMCS Client Theme. Visit our <a href="https://lagom.rsstudio.net/docs/extensions/licensing.html" target="_blank">documentation</a> to learn more how to manage license assignment of Lagom WHMCS Client Theme extensions. If you have not performed any changes with extension license assignment then please <a href="https://rsstudio.net/my-account/submitticket.php?step=2&deptid=7">contact our support</a>, to resolve this issue.</p>
                </div>
            </div>
        {elseif $extension->checkLicense() != "success"}
            <div class="alert alert--danger alert--outline has-icon alert--border-left m-b-4x">
                <div class="alert__body">
                    <h6 class="alert__title">Extension can’t be activated with this license key</h6>
                    <p>This extension is not allowed to be used with {$template->license->licenseKey} license. Visit our <a href="https://lagom.rsstudio.net/docs/extensions/licensing.html" target="_blank">documentation</a> to learn more how to manage license assignment of Lagom WHMCS Client Theme extensions. Assign extension to the correct license key in RS Studio Client portal and try again.</p>
                </div>
            </div>
        {/if}

        <div class="section__activate panel">
            <div class="activate__icon text-center">
                <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M12.3856 16.4751L27.0847 1.80041C29.4918 -0.600136 33.393 -0.600136 35.8001 1.80041L38.1943 4.19069C40.6017 6.59403 40.6017 10.492 38.1943 12.8928L23.425 27.6375C22.3476 28.7132 20.8866 29.3177 19.3628 29.3177H11.9949C11.1658 29.3177 10.4995 28.6359 10.5202 27.8084L10.7051 20.3855C10.7421 18.9155 11.3436 17.5154 12.3856 16.4751ZM36.1082 6.27339L33.7151 3.88424C32.4599 2.63246 30.425 2.63246 29.1704 3.88368L27.9611 5.09096L34.899 12.0173L36.1088 10.8095C37.3632 9.55845 37.3632 7.5263 36.1082 6.27339ZM32.8128 14.1L25.8749 7.17369L14.4719 18.5578C13.9651 19.0638 13.6726 19.7447 13.6545 20.4592L13.5059 26.3705L19.3629 26.3723C20.0113 26.3723 20.6365 26.1472 21.1339 25.7402L21.339 25.5548L32.8128 14.1ZM18.6696 0.0759835C19.4843 0.0759835 20.1448 0.735339 20.1448 1.54869C20.1448 2.29427 19.5898 2.91044 18.8698 3.00796L18.6696 3.0214H11.3155C6.35587 3.0214 3.14341 6.30596 2.95873 11.4067L2.95032 11.8753V28.2008C2.95032 33.4173 6.00656 36.8485 10.8685 37.0458L11.3155 37.0548H28.6712C33.6431 37.0548 36.8458 33.7773 37.0299 28.6701L37.0383 28.2008V20.2914C37.0383 19.478 37.6988 18.8187 38.5135 18.8187C39.2603 18.8187 39.8775 19.3727 39.9752 20.0916L39.9886 20.2914V28.2008C39.9886 34.9991 35.6752 39.779 29.1313 39.9927L28.6712 40.0002H11.3155C4.67062 40.0002 0.206456 35.3745 0.00697185 28.6718L0 28.2008V11.8753C0 5.08376 4.32451 0.297515 10.8562 0.0834665L11.3155 0.0759835H18.6696Z" fill="#1062FE"/>
                </svg>
            </div>
            <h5 class="activate__title">{$lang.extensions.activate_extension}</h5>
            <p class="activate__desc text-center">{$lang.extensions.please_activate}</p>
            <div class="activate__actions">
                <a class="btn btn--primary" href="{$extension->getLink('activate')}">    
                    <span class="btn__text">
                        {$lang.extensions.activate_extension}
                    </span>
                </a>
            </div>
        </div>
    {/if}
{/block}























