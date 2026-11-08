<div 
    class="modal" 
    id="modalMassActions" 
    data-cms-mass-actions-modal
    data-ajax-url="{$whmcsURL}/modules/addons/RSThemes/src/Api/adminApi.php?controller=CmsApi&method=massAction"
>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <div class="top__title">
                    <span class="is-hidden" data-cms-mass-actions-modal-title="duplicate">Duplicate Selected Pages</span>
                    <span class="is-hidden" data-cms-mass-actions-modal-title="publish">Publish Selected Pages</span>
                    <span class="is-hidden" data-cms-mass-actions-modal-title="seoon">Allow Indexing on Selected Pages</span>
                    <span class="is-hidden" data-cms-mass-actions-modal-title="unpublish">Unpublish Selected Pages</span>
                    <span class="is-hidden" data-cms-mass-actions-modal-title="seooff">Disallow Indexing on Selected Pages</span>
                    <span class="is-hidden text-danger" data-cms-mass-actions-modal-title="delete">Delete Selected Pages</span> 
                </div>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-cms-mass-actions-modal-cancel data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body">
                <p class="is-hidden" data-cms-mass-actions-modal-desc="info">Do you want perform this action ?</p>
                <p class="is-hidden" data-cms-mass-actions-modal-desc="delete">Are you sure that you want to remove this page?</p>
                <p class="is-hidden" data-cms-mass-actions-modal-desc="delete"><b>This action can NOT be undone!</b> Please make sure to select correct action!</p>
                <div class="is-hidden" data-cms-mass-actions-modal-desc="done">
                    <ul class="list list--md m-b-2x" data-cms-mass-actions-modal-response></ul>
                    <b class="p-lg">The page will now refresh.</b>
                </div>
            </div>
            <div class="modal__actions">
                <input type="hidden" name="cmsMassActionsModalType" data-cms-mass-actions-modal-type value>
                <input type="hidden" name="cmsMassActionsModalPages" data-cms-mass-actions-modal-pages value>
                <button
                    type="button"
                    class="btn"
                    data-cms-mass-actions-modal-submit
                    data-btn-loader
                >
                    <span class="btn__text">{$lang.general.confirm}</span>
                    <span class="btn__preloader preloader preloader--light"></span>
                </button>
                <button data-cms-mass-actions-modal-cancel data-dismiss="lu-modal" aria-label="Close" type="button" class="btn btn--default btn--outline"><span class="btn__text">{$lang.general.cancel}</span></button>
            </div>
        </div>
    </div>
</div>