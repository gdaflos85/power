<div 
    class="modal" 
    id="modalLagomMassActions" 
    data-lagom-mass-actions-modal
    data-ajax-url="{$whmcsURL}/modules/addons/RSThemes/src/Api/adminApi.php?controller=PagesApi&method=massAction"
>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <div class="top__title">
                    <span class="is-hidden" data-lagom-mass-actions-modal-title="seoon">Allow Indexing on Selected Pages</span>
                    <span class="is-hidden" data-lagom-mass-actions-modal-title="seooff">Disallow Indexing on Selected Pages</span>
                </div>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-lagom-mass-actions-modal-cancel data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body">
                <p class="is-hidden" data-lagom-mass-actions-modal-desc="info">Do you want perform this action ?</p>
                <div class="is-hidden" data-lagom-mass-actions-modal-desc="done">
                    <ul class="list list--md m-b-2x" data-lagom-mass-actions-modal-response></ul>
                    <b class="p-lg">The page will now refresh.</b>
                </div>
            </div>
            <div class="modal__actions">
                <input type="hidden" name="massActionsModalType" data-lagom-mass-actions-modal-type value>
                <input type="hidden" name="massActionsModalPages" data-lagom-mass-actions-modal-pages value>
                <button
                    type="button"
                    class="btn"
                    data-lagom-mass-actions-modal-submit
                    data-btn-loader
                >
                    <span class="btn__text">{$lang.general.confirm}</span>
                    <span class="btn__preloader preloader preloader--light"></span>
                </button>
                <button data-lagom-mass-actions-modal-cancel data-dismiss="lu-modal" aria-label="Close" type="button" class="btn btn--default btn--outline"><span class="btn__text">{$lang.general.cancel}</span></button>
            </div>
        </div>
    </div>
</div>