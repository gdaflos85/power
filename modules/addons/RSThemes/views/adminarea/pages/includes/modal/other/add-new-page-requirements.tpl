<div class="modal modal--hero" id="pagePermissionsModal" data-page-permissions-modal>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <div class="top__title type-4 text-danger"><i class="ls ls-exclamation-circle m-r-2x text-danger"></i>Page Creation Issue</div>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body" 
                data-page-permissions-ajax-url="{$helper->url('CustomPage@customPageVerify', ['templateName'=>$template->getMainName()])}"
                data-page-permissions-href="{$helper->url('CustomPage@new',['templateName'=>$template->getMainName()])}"
            >
                <ul class="list list--lg">
                    <li data-page-permissions-custompage class="list__item is-hidden">
                        <b>Missing file:</b> The required <code>custom_page_template.php</code> file is missing.
                        <div class="alert alert--info alert--faded m-t-1x m-b-0x">
                            <b>How to fix:</b> Go to your WHMCS installation folder and ensure this file is present. If it is missing, re-upload it from the Lagom WHMCS Website Builder package to the main WHMCS directory.
                        </div>
                    </li>
                    <li data-page-permissions-template class="list__item is-hidden">
                        Permission issue: The <code>/templates/lagom2</code> directory may not be writable.
                        <div class="alert alert--info alert--faded m-t-1x m-b-0x">
                            <b>How to fix:</b> <div>Set the folder permissions to allow writing. You can change the permissions using an FTP client like or through your hosting panel's File Manager. The recommended permission setting for folders is <b>755</b>.</div>
                        </div>
                    </li>
                    <li data-page-permissions-htaccess class="list__item is-hidden">
                        <b>htaccess file issue:</b> The <code>.htaccess</code> file is either missing or not writable.
                        <div class="alert alert--info alert--faded m-t-1x m-b-0x">
                            <b>How to fix:</b> Check if the .htaccess file exists in the main directory of your WHMCS installation. If it exists, try setting its permissions to 644. If it is missing, please follow the link below for more information.
                        </div>    
                    </li>
                </ul>
            </div>
            <div class="modal__actions">
                <button type="button" class="btn btn--primary" data-page-permissions-check>
                    <span class="btn__text">Check Again</span>
                </button>
                <button data-dismiss="lu-modal" aria-label="Close" type="button" class="btn btn--default btn--outline"><span class="btn__text">{$lang.general.cancel}</span></button>
                <a class="btn btn--link m-l-a" href="https://lagom.rsstudio.net/docs/website-builder/common-problems/#page-creation-issue" target="_blank">
                    <span class="btn__text">Learn More</span>
                    <i class="btn__icon ls ls-new-window"></i>
                </a>
            </div>
        </div>
    </div>
</div>