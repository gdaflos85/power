  <div class="modal" id="deleteImgModal" data-media-remove-modal>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <div class="top__title text-danger">Delete media image</div>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link cancel__item" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body">
                <p>Are you sure you want to delete this item?</p>
                <div class="form-group">
                    <input type="hidden" name="filename" id="media-filename" value="">
                </div>
            </div>
            <div class="modal__actions">
                <button class="btn btn--danger" type="button" data-media-remove data-ajax-url="{$helper->apiUrl("MediaApi@deleteMediaImage", ["templateName"=>$template->getMainName()])}">
                    <span class="btn__text">Delete</span>
                </button>
                <a class="btn btn--default btn--outline cancel__item" data-dismiss="lu-modal">
                    <span class="btn__text">Cancel</span>
                </a>
            </div>
        </div>
    </div>
</div>