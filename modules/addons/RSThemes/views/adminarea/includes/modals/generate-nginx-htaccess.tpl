<div 
    class="modal" 
    id="generate-nginx-htaccess" 
    data-modal-generate-ngingx-htaccess
    data-ajax-url="{$helper->apiUrl('CmsApi@nginxHtaccessBuild', ['templateName'=>$template->getMainName()])}"
> 
    <div class="modal__dialog">
        <div class="modal__content"> 
            <div class="modal__top top">
                <div class="top__title">NGINX .htaccess Generator Tool</div>
                <div class="top__toolbar">
                    <button 
                        class="close btn btn--xs btn--icon btn--link" 
                        data-dismiss="lu-modal" 
                        aria-label="Close"
                        data-modal-generate-ngingx-htaccess-close
                    >
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body p-b-0x">
                <div data-modal-generate-ngingx-htaccess-info>
                    <p class="text-gray p-3">Please review the changes to be made to your NGINX .htaccess configuration. Ensure that you understand the updates and their impact on your website's operation.</p>
                    <div class="form-group m-t-3x m-b-4x">
                        <label class="checkbox m-t-0x align-items-start">
                            <input class="form-checkbox" type="checkbox" name="reimport-menu-confirm" data-modal-generate-ngingx-htaccess-confirm> 
                            <span class="form-indicator"></span>
                            <span class="form-text">Yes, I understood</span>
                        </label>
                    </div>
                </div>
                <div class="is-hidden" data-modal-generate-ngingx-htaccess-refresh>
                    <p class="text-gray p-3 m-b-4x">Your NGINX configuration is currently being updated. Please wait.</p>
                </div>
                <div class="is-hidden" data-modal-generate-ngingx-htaccess-error>
                    <p class="m-b-4x d-flex flex-column text-center p-3">
                        <span class="text-gray" data-modal-generate-ngingx-htaccess-error-msg></span>
                        <code class="code w-100 text-left m-t-2x is-hidden" data-modal-generate-ngingx-htaccess-error-code></code>
                    </p>
                </div>
                <div class="is-hidden" data-modal-generate-ngingx-htaccess-success>
                    <p class="m-b-4x text-center p-3">
                        <span class="text-gray" data-modal-generate-ngingx-htaccess-success-msg></span>
                    </p>
                </div>
            </div>
            <div class="modal__actions" data-modal-generate-ngingx-htaccess-actions>
                <button 
                    class="btn" 
                    disabled data-modal-generate-ngingx-htaccess-btn
                >
                    <span class="btn__text">
                        Confirm
                    </span>
                    <span class="btn__preloader preloader"></span>
                </button>
                <button 
                    data-dismiss="lu-modal" 
                    aria-label="Close" 
                    type="button" 
                    class="btn btn--default btn--outline"
                    data-modal-generate-ngingx-htaccess-close
                >
                    <span class="btn__text">
                        Cancel
                    </span>
                </button>
            </div>
        </div>
    </div>
</div>