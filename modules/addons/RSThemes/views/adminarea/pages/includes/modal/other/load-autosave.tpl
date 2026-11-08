<div class="modal" id="loadAutosave" data-load-autosave-modal>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <div class="top__title text-danger"></i>Load Page from Autosave</div>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-load-autosave-modal-cancel data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body">
                <p>Unsaved changes detected. Do you want to load them ?</p>
                <p>NOTE: Autosave will be automatically deleted after Save Page Changes</p>
            </div>
            <div class="modal__actions">
                <a
                    {if isset($autosave_type) && $autosave_type == "predefined"}
                        href="{$helper->url('Section@edit',['templateName'=>$template->getMainName(), 'sectionId' => $sectionId, 'autosave' => true])}"
                    {else}
                        href="{$helper->url('CustomPage@show',['templateName'=>$template->getMainName(), 'pageId' => $customPage->id, 'autosave' => true])}"
                    {/if}
                    class="btn btn--primary"
                    data-load-autosave-modal-submit
                >
                    <span class="btn__text">Load</span>
                </a>
                <button data-load-autosave-modal-cancel data-dismiss="lu-modal" aria-label="Close" type="button" class="btn btn--default btn--outline"><span class="btn__text">Cancel</span></button>
            </div>
        </div>
    </div>
</div>