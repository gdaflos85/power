<div 
    class="modal" 
    id="modalMediaMassActions" 
    data-media-mass-actions-modal
    data-ajax-url="{$whmcsURL}/modules/addons/RSThemes/src/Api/adminApi.php?controller=MediaApi&method=deleteMultipleMediaImage"
>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <div class="top__title">
                    <span class="is-hidden text-danger" data-media-mass-actions-modal-title="delete">Delete Selected Media</span> 
                </div>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-media-mass-actions-modal-cancel data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body">
                <p class="is-hidden" data-media-mass-actions-modal-desc="delete">Are you sure that you want to remove selected media?</p>
                <p class="is-hidden" data-media-mass-actions-modal-desc="delete"><b>This action can NOT be undone!</b> Please make sure to select correct action!</p>
                <div class="is-hidden" data-media-mass-actions-modal-desc="done">
                    <ul class="list list--md m-b-2x" data-media-mass-actions-modal-response></ul>
                    <b class="p-lg">The page will now refresh.</b>
                </div>
            </div>
            <div class="modal__actions">
                <input type="hidden" name="mediaMassActionsModalType" data-media-mass-actions-modal-type value>
                <input type="hidden" name="mediaMassActionsModalPages" data-media-mass-actions-modal-media value>
                <button
                    type="button"
                    class="btn"
                    data-media-mass-actions-modal-submit
                    data-btn-loader
                >
                    <span class="btn__text">{$lang.general.confirm}</span>
                    <span class="btn__preloader preloader preloader--light"></span>
                </button>
                <button data-media-mass-actions-modal-cancel data-dismiss="lu-modal" aria-label="Close" type="button" class="btn btn--default btn--outline"><span class="btn__text">{$lang.general.cancel}</span></button>
            </div>
        </div>
    </div>
</div>