<div 
    class="modal" 
    id="optimize-media-modal" 
    data-modal-optimize-media-quality
    data-ajax-url="{$whmcsURL}/modules/addons/RSThemes/src/Api/adminApi.php?controller=MediaApi&method=convertImages&startFrom="
>
    <div class="modal__dialog">
        <div class="modal__content"> 
            <div class="modal__top top">
                <div class="top__title">
                    <span data-content-optimization>Optimize Media Quality</span>
                    <span data-content-disable-optimization class="is-hidden">Disable Media Quality Optimization</div>
                <div class="top__toolbar">
                    <button 
                        class="close btn btn--xs btn--icon btn--link" 
                        data-dismiss="lu-modal" 
                        aria-label="Close"
                        data-modal-optimize-media-quality-close
                    >
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body p-b-0x">
                <div data-modal-optimize-media-quality-info>
                    <p class="text-gray p-3">
                        <span data-content-optimization>
                            Media quality optimization may take up to several minutes, do not close the modal or browser during this process.
                        </span>    
                        <span class="is-hidden" data-content-disable-optimization>
                            Are you sure to disable media optimization quality ? All images will be converted to 100% quality and may take up to several minutes, do not close the modal or browser during this process.
                        </span>
                    </p>
                    <div class="form-group m-t-3x m-b-4x">
                        <label class="checkbox m-t-0x align-items-start">
                            <input class="form-checkbox" type="checkbox" name="optimize-media-quality-confirm" data-modal-optimize-media-quality-confirm> 
                            <span class="form-indicator"></span>
                            <span class="form-text">Yes, I understood</span>
                        </label>
                    </div>
                </div>
                <div class="is-hidden" data-modal-optimize-media-quality-refresh>
                    <p class="text-gray p-3">
                        <span data-content-optimization>
                            Media quality optimization in progress, do not close your browser.
                        </span>
                        <span class="is-hidden" data-content-disable-optimization>
                            Disable media quality optimization in progress, do not close your browser.
                        </span>
                    </p>
                    <div class="progress m-t-3x m-b-2x">
                        <div class="progress__bar">
                            <div class="progress__fill" data-modal-optimize-media-quality-progress></div>
                        </div>
                    </div>
                    <div class="d-flex w-100 m-t-2x m-b-4x justify-content-center align-items-center p-3">
                        <span class="p-r-1x text-gray">Done</span> <div class="font-weight--medium" data-modal-optimize-media-quality-done>0</div>
                        <span class="p-h-1x text-gray">of</span> <div class="font-weight--medium" data-modal-optimize-media-quality-total>??</div>
                    </div>
                </div>
                <div class="is-hidden" data-modal-optimize-media-quality-success>
                    <p class="m-b-4x text-center p-3">
                        <span data-content-optimization>
                            <span class="text-gray">Media quality optimization</span> <b>completed successfully</b>.
                        </span>
                        <span data-content-disable-optimization class="is-hidden">
                            <span class="text-gray">Disable media quality optimization</span> <b>completed successfully</b>.
                        </span>    
                    </p>
                </div>
            </div>
            <div class="modal__actions" data-modal-optimize-media-quality-actions>
                <button 
                    class="btn" 
                    disabled data-modal-optimize-media-quality-btn
                >
                    <span class="btn__text">
                        Confirm
                    </span>
                    <span class="btn__preloader preloader"></span>
                </button>
                <button 
                    data-dismiss="lu-modal" 
                    aria-label="Close" 
                    type="button" 
                    class="btn btn--default btn--outline"
                    data-modal-optimize-media-quality-close
                >
                    <span class="btn__text">
                        Cancel
                    </span>
                </button>
            </div>
        </div>
    </div>
</div>
