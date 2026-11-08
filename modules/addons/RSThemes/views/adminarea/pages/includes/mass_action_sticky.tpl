<div 
    class="sticky-panel panel m-b-0x is-hidden" 
    data-lagom-mass-actions-panel 
    data-fixed-actions 
    href="#bottom-action-anchor"
>
    <div class="sticky-panel__container container d-flex">
        <div class="sticky-panel__content">
            <div class="badge badge--lg badge--primary" data-lagom-mass-actions-panel-counter></div>
            <span class="p-md">Items selected</span>
            <span class="horizontal-line"></span>
            <label class="checkbox m-t-0x m-b-0x">
                <input class="form-checkbox" type="checkbox" name="panelMassActionSelectAll" data-lagom-mass-actions-panel-select-all> 
                <span class="form-indicator"></span>
                <span class="p-md">Select All</span>
            </label>
        </div>
        <div class="sticky-panel__actions">
            <div class="has-dropdown">
                <a 
                    class="btn btn--xs btn--default btn--outline" 
                    href="" 
                    data-toggle="lu-dropdown" 
                    data-placement="bottom right"
                    data-lagom-mass-actions-panel-dropdown
                >
                    <span class="btn__text">{$lang.general.actions}</span>
                    <span class="btn__icon btn__icon-arrow ls ls-caret is-hidden-mob-down" data-arrow-target></span>
                    <span class="btn__icon btn__icon-arrow ls ls-caret is-hidden-mob-up" data-arrow-target></span>
                </a>
                <div class="dropdown" data-dropdown-menu>
                    <div class="dropdown__arrow" data-arrow></div>
                    <div class="dropdown__menu dropdown__menu--sticky-actions">
                        <ul class="nav">
                            <li class="nav__item">
                                <a class="nav__link" href="#" data-lagom-mass-actions-panel-seoon>
                                    <span class="nav__link-icon lm lm-flag"></span>
                                    <span class="nav__link-text">Allow Indexing</span>
                                </a>
                            </li>
                            <li class="nav__item">
                                <a class="nav__link" href="#" data-lagom-mass-actions-panel-seooff>
                                    <span class="nav__link-icon lm lm-close"></span>
                                    <span class="nav__link-text">Disallow Indexing</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>