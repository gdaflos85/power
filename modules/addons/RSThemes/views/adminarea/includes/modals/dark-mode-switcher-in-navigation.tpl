<div class="modal modal--lg" id="darkModeSwitcherInNavigationModal" data-darkmodeswitcherinnavigation-modal>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <h6 class="top__title text-default">{$lang.modal.dark_mode_switcher_in_navigation.title}</h6>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body">
                <p>{$lang.modal.dark_mode_switcher_in_navigation.desc1}</p>
                <p>{$lang.modal.dark_mode_switcher_in_navigation.desc2}</p>   
                <p class="m-b-0x">1. <a href="https://lagom.rsstudio.net/docs/settings/#add-dark-mode-switcher-to-lagom-client-theme-navigations" target="_blank">{$lang.modal.dark_mode_switcher_in_navigation.link1}</a></p>
                <p>2. <a href="https://lagom.rsstudio.net/docs/settings/#add-dark-mode-switcher-to-lagom-website-builder-navigation" target="_blank">{$lang.modal.dark_mode_switcher_in_navigation.link2}</a></p>
            </div>
            <div class="modal__actions">
                <button class="btn btn--primary" type="button" data-dismiss="lu-modal" data-darkmodeswitcherinnavigation-modal-close>
                    <span class="btn__preloader preloader preloader--light"></span>
                    <span class="btn__text">Confirm & Close</span>
                </button>
                <div class="form-check m-b-0x m-l-a">
                    <label class="m-b-0x">
                    <input type="checkbox" name="notshow" data-dont-show class="form-checkbox">
                        <span class="form-indicator"></span>
                        <span class="form-text">Do not show again</span>
                    </label>
                </div>
            </div>
        </div>
    </div>
</div>