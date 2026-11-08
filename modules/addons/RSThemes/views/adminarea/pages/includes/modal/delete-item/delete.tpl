<div class="modal" id="deleteItemModal" data-delete-modal>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <div class="top__title text-danger"></i>Delete list item</div>{*<i class="zmdi zmdi-alert-circle-o m-r-2x">*}
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body">
                <p>Are you sure to delete this list item?</p>
            </div>
            <div class="modal__actions">
                <a class="btn btn--danger" data-delete-modal-submit data-index="" data-list-name="">
                    <span class="btn__text">Yes, delete</span>
                </a>
                <button data-dismiss="lu-modal" aria-label="Close" type="button" class="btn btn--default btn--outline"><span class="btn__text">No</span></button>
            </div>
        </div>
    </div>
</div>