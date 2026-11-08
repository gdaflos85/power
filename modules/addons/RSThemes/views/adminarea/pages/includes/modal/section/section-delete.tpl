<div class="modal modal--hero" id="modalRemoveSection" data-modal-delete-section>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <div class="top__title type-4 text-danger"><i class="ls ls-exclamation-circle m-r-2x text-danger"></i>{$lang.page.page_sections.modal.remove_section.title}</div>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body">
                <p>Are you sure that you want to remove this section?</p>
                <p><b>This action can NOT be undone!</b> Please make sure to select correct action!</p>
            </div>
            <div class="modal__actions">
                <a class="btn btn--danger" data-modal-delete-section-submit data-section-id="" data-position="">
                    <span class="btn__text">{$lang.general.confirm}</span>
                </a>
                <button data-dismiss="lu-modal" aria-label="Close" type="button" class="btn btn--default btn--outline"><span class="btn__text">{$lang.general.cancel}</span></button>
            </div>
        </div>
    </div>
</div>