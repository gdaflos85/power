<div class="modal modal--lg" id="footerSupportedPaymentGatewayIcons" data-supported-payment-gateways-icons-modal>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <div class="top__title h6">Supported Payment Gateways Icon</div>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link cancel__item" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <form 
                data-supported-payment-gateways-icons-form 
                data-ajax-url="{$helper->url('Page@seoImage',['templateName' => $template->getMainName()])}" 
                data-assets-url="{$whmcsURL}/templates/{$themeName}/assets"
                data-load-icons-url="{$whmcsURL}/modules/addons/RSThemes/src/Api/clientApi.php?controller=Icon&method=renderTabs&items="
            >
                <input type="hidden" data-type>
                <input type="hidden" data-index>
                <div class="modal__body">
                <ul class="nav nav--h nav--tabs m-b-2x">
                    <li class="nav__item is-active">
                        <a class="nav__link" data-toggle="lu-tab" href="#supported-payment-gateways-predefined-icons" data-media-predefined data-media-load>
                            <span>Payment Methods</span>
                        </a>
                    </li>
                    
                    <li class="nav__item {if empty($media)}is-hidden{/if}">
                        <a class="nav__link" data-toggle="lu-tab" href="#supported-payment-gateways-media-library" data-media-upload data-media-load>
                            <span>Library</span>
                        </a>
                    </li>
                    <li class="nav__item">
                        <a class="nav__link" data-toggle="lu-tab" href="#supported-payment-gateways-media-upload" data-media-custom-graphic>
                            <span>Upload</span>
                        </a>
                    </li>
                </ul>
                
                <div class="tab-content">                
                    
                    <div class="tab-pane tab-pane--predefined-icons is-active" id="supported-payment-gateways-predefined-icons" data-media-container>
                        <div class="media__search input-group">
                            <i class="input-group__addon lm lm-search"></i>
                            <input type="text" class="form-control" placeholder="Search" data-media-search>
                        </div>
                        <div class="media">
                            <div class="media__list has-scroll" data-media-list data-media-insert="gateways">
            
                            </div>
                            <div class="media__preloader preloader is-hidden" data-media-preloader>
                            </div>
                        </div>
                    </div>
                    
                    <div class="tab-pane tab-pane--media" id="supported-payment-gateways-media-library" data-media-container>
                        <div class="media__search input-group">
                            <i class="input-group__addon lm lm-search"></i>
                            <input type="text" class="form-control" placeholder="Search" data-media-search>
                        </div>
                        <div class="media">
                            <div class="media__list has-scroll" data-media-list data-media-manager data-media-insert="media">
                            </div>
                            <div class="media__preloader preloader is-hidden" data-media-preloader>
                            </div>
                        </div>
                    </div>
                
                    <div class="tab-pane tab-pane--media-custom" id="supported-payment-gateways-media-upload">
                        <div class="media media--custom" data-media-custom>
                            <div class="media__wrapper" data-media-custom-btn>
                                <i class="media__icon ls ls-upload"></i>
                                <strong class="media__title p-md">Click to Upload</strong>
                                <span class="media__desc p-xs">Allowed extensions .PNG, .JPG, .SVG, .GIF. Max size {$max_upload_size['max_size_formated']}.</span>
                            </div>
                            <input type="file" multiple name="customIcon" data-media-custom-input accept="image/*" data-max-file-size={$max_upload_size['max_size_bytes']} data-ajax-url="{$helper->url('Page@seoImage',['templateName' => $template->getMainName()])}" data-assets-url="{$whmcsURL}/templates/{$themeName}/assets"/>            
                            <div class="media__list row w-100 is-hidden" data-media-image-container>
                                <div class="media__item media__item--lg col-md-12">
                                    <div class="media__item-content">
                                        <div class="media__item-icon" data-media-icon>
                                            <img class="media__image" data-media-image data-graphic src="" alt=""/>
                                        </div>
                                        <span class="media__item-border"></span>
                                        <span class="media__item-label"></span>
                                        <div class="media__item-footer">
                                            <span class="media__item-filename" data-media-image-filename></span>
                                            {*<a href="#" class="btn btn--icon btn--sm media__item-delete" data-media-image-delete data-toggle="lu-tooltip" data-title="{$lang.general.remove}"><i class="btn__icon lm lm-trash"></i></a>*}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                <div class="modal__actions">
                    <button class="btn btn--primary" type="submit" data-btn-loader>
                        <span class="btn__preloader preloader preloader--light"></span>
                        <span class="btn__text">Add Selected</span>
                    </button>
                    <a class="btn btn--default btn--outline cancel__item" data-dismiss="lu-modal">
                        <span class="btn__text">Cancel</span>
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>