{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/extensions/cms/includes/breadcrumbs.tpl"}
{/block}

{block name="template-content"}
    
     {if !$extension->isLagomTemplateActive()}
        <div class="section__activate panel">
            <div class="activate__icon text-center">
                <svg width="48" height="48" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M14.3058 2.58579C14.6809 2.21071 15.1896 2 15.72 2H32.28C32.8104 2 33.3191 2.21071 33.6942 2.58579L45.4142 14.3058C45.7893 14.6809 46 15.1896 46 15.72V32.28C46 32.8104 45.7893 33.3191 45.4142 33.6942L33.6942 45.4142C33.3191 45.7893 32.8104 46 32.28 46H15.72C15.1896 46 14.6809 45.7893 14.3058 45.4142L2.58579 33.6942C2.21071 33.3191 2 32.8104 2 32.28V15.72C2 15.1896 2.21071 14.6809 2.58579 14.3058L14.3058 2.58579ZM16.5484 6L6 16.5484V31.4516L16.5484 42H31.4516L42 31.4516V16.5484L31.4516 6H16.5484Z" fill="#E02430"/>
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M22 32C22 30.8954 22.8954 30 24 30H24.02C25.1246 30 26.02 30.8954 26.02 32C26.02 33.1046 25.1246 34 24.02 34H24C22.8954 34 22 33.1046 22 32Z" fill="#E02430"/>
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M24 14C25.1046 14 26 14.8954 26 16V24C26 25.1046 25.1046 26 24 26C22.8954 26 22 25.1046 22 24V16C22 14.8954 22.8954 14 24 14Z" fill="#E02430"/>
                </svg>
            </div>
            <h5 class="activate__title">Configuration Not Possible</h5>
            <p class="activate__desc text-center">To configure the Lagom WHMCS Website Builder extension, you must first activate the Lagom WHMCS Client Theme as your WHMCS system's default theme. Configuration of this extension cannot proceed if a different theme is active.</p>
            <div class="activate__actions">
                <a class="btn btn--primary" href="{$helper->url('Template@setActive',['templateName'=>$template->getMainName()])}">    
                    <span class="btn__text">
                        {$lang.breadcrumb.activate_theme}
                    </span>
                </a>
                {* <a class="btn btn--default btn--outline" href="#" target="blank">    
                    <span class="btn__text">
                        {$lang.general.learn_more}
                    </span>
                </a> *}
            </div>
        </div>
    {else if $extension->checkLicense() == "Lagom update is required"}
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
                <a class="btn btn--default btn--outline" href="https://lagom.rsstudio.net/docs/update.html" target="blank">    
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

        <div 
            class="section__activate section__activate--requirements panel" 
            data-extension-requirements 
            data-ajax-url="{$whmcsURL}/modules/addons/RSThemes/src/Api/adminApi.php?controller=ExtensionApi&method=validateRequirements&extension=CMS"
        >
            <h5 class="activate__title">{$lang.extensions.activate_extension}</h5>
            <p class="activate__desc">{$lang.extensions.please_activate}</p>
            <div class="requirements collapse" id="showRequirements">
                <div class="requirements__check">
                    <h6>{$lang.extensions.system_requirements}</h6>
                    <button class="btn btn--primary btn--refresh" type="button" data-extension-requirements-refresh>
                        <i class="btn-icon ls ls-refresh"></i>
                        Refresh
                    </button>
                </div>
                <div class="requirements__body panel" >
                    <ul class="requirements__list">
                        <li class="requirement requirement--loading" data-extension-requirements-ioncube>
                            <div class="requirement__body">
                                <i class="ls ls-close icon-requirement icon-requirement--danger"></i>
                                <i class="ls ls-check icon-requirement icon-requirement--success"></i>
                                <span class="requirements__name">IonCube Loader v14 and later.</span>
                            </div>
                            <span class="preloader preloader--sm"></span>
                            <label class="label label--success label--outline requirement__status requirement__status--passed">Passed</label>
                            <label class="label label--danger label--outline requirement__status requirement__status--failed">Failed</label>
                        </li>
                        <li class="requirement requirement--loading" data-extension-requirements-php>
                            <div class="requirement__body">
                                <i class="ls ls-close icon-requirement icon-requirement--danger"></i>
                                <i class="ls ls-check icon-requirement icon-requirement--success"></i>
                                <span class="requirements__name">PHP v8.1 and later.</span>
                            </div>
                            <span class="preloader preloader--sm"></span>
                            <label class="label label--success label--outline requirement__status requirement__status--passed">Passed</label>
                            <label class="label label--danger label--outline requirement__status requirement__status--failed">Failed</label>
                        </li>
                        <li class="requirement requirement--loading" data-extension-requirements-module="curl">
                            <div class="requirement__body">
                                <i class="ls ls-close icon-requirement icon-requirement--danger"></i>
                                <i class="ls ls-check icon-requirement icon-requirement--success"></i>
                                <span class="requirements__name">PHP-Curl</span>
                            </div>
                            <span class="preloader preloader--sm"></span>
                            <label class="label label--success label--outline requirement__status requirement__status--passed">Passed</label>
                            <label class="label label--danger label--outline requirement__status requirement__status--failed">Failed</label>
                        </li>
                        <li class="requirement requirement--loading" data-extension-requirements-module="mbstring">
                            <div class="requirement__body">
                                <i class="ls ls-close icon-requirement icon-requirement--danger"></i>
                                <i class="ls ls-check icon-requirement icon-requirement--success"></i>
                                <span class="requirements__name">PHP-mbstring</span>
                            </div>
                            <span class="preloader preloader--sm"></span>
                            <label class="label label--success label--outline requirement__status requirement__status--passed">Passed</label>
                            <label class="label label--danger label--outline requirement__status requirement__status--failed">Failed</label>
                        </li>
                        <li class="requirement requirement--loading" data-extension-requirements-module="dom">
                            <div class="requirement__body">
                                <i class="ls ls-close icon-requirement icon-requirement--danger"></i>
                                <i class="ls ls-check icon-requirement icon-requirement--success"></i>
                                <span class="requirements__name">PHP-dom</span>
                            </div>
                            <span class="preloader preloader--sm"></span>
                            <label class="label label--success label--outline requirement__status requirement__status--passed">Passed</label>
                            <label class="label label--danger label--outline requirement__status requirement__status--failed">Failed</label>
                        </li>
                        <li class="requirement requirement--loading" data-extension-requirements-module="gd">
                            <div class="requirement__body">
                                <i class="ls ls-close icon-requirement icon-requirement--danger"></i>
                                <i class="ls ls-check icon-requirement icon-requirement--success"></i>
                                <span class="requirements__name">PHP-gd</span>
                            </div>
                            <span class="preloader preloader--sm"></span>
                            <label class="label label--success label--outline requirement__status requirement__status--passed">Passed</label>
                            <label class="label label--danger label--outline requirement__status requirement__status--failed">Failed</label>
                        </li>
                        <li class="requirement requirement--loading" data-extension-requirements-module="zip">
                            <div class="requirement__body">
                                <i class="ls ls-close icon-requirement icon-requirement--danger"></i>
                                <i class="ls ls-check icon-requirement icon-requirement--success"></i>
                                <span class="requirements__name">PHP-zip</span>
                            </div>
                            <span class="preloader preloader--sm"></span>
                            <label class="label label--success label--outline requirement__status requirement__status--passed">Passed</label>
                            <label class="label label--danger label--outline requirement__status requirement__status--failed">Failed</label>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="activate__actions">
                <div class="alert alert-success text-left is-hidden" data-extension-requirements-passed>
                    <i class="ls ls-check icon-requirement icon-requirement--success"></i>
                    {$lang.extensions.requirements_met}
                    <a class="" data-toggle="collapse" href="#showRequirements" role="button" aria-expanded="false" aria-controls="showRequirements">
                        <span class="requirements-show">Show</span>
                        <span class="requirements-hide">Hide</span>
                    </a>
                </div>
                <div class="alert alert-danger text-left is-hidden" data-extension-requirements-failed>
                    <i class="ls ls-close icon-requirement icon-requirement--danger"></i>
                        {$lang.extensions.requirements_not_met}
                    <a class="" data-toggle="collapse" href="#showRequirements" role="button" aria-expanded="false" aria-controls="showRequirements">
                        <span class="requirements-show">Show</span>
                        <span class="requirements-hide">Hide</span>
                    </a>
                </div>
                <div class="alert alert-info text-left" data-extension-requirements-checking>
                    <span class="icon-requirement preloader preloader--sm"></span>
                        Checking requirements
                    <a class="" data-toggle="collapse" href="#showRequirements" role="button" aria-expanded="false" aria-controls="showRequirements">
                        <span class="requirements-show">Show</span>
                        <span class="requirements-hide">Hide</span>
                    </a>
                </div>
                <button class="btn btn--primary is-disabled" disabled data-extension-requirements-activate type="button" data-href="{$extension->getLink('activate')}">    
                    <span class="btn__text">
                        {$lang.extensions.activate_extension}
                    </span>
                    <span class="btn__preloader preloader preloader--light"></span>
                </button>
            </div>
        </div>
    {/if}
{/block}

{block name="template-scripts"}
    <script type="text/javascript" src="{$helper->script('extension-requirements.js')}"></script>
{/block}