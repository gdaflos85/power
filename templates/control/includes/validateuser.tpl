{if $showUserValidationBanner}
    <div class="verification-banner user-validation alert alert-warning">
        <i class="fas fa-passport"></i>
        {lang key='fraud.furtherValShort'}
        <div class="pull-right res-left-991">
            <a href="#" class="btn btn-warning btn-xs  btn-action" data-url="{$userValidationUrl}" onclick="openValidationSubmitModal(this);return false;">
                {lang key='fraud.submitDocs'}
            </a>
        </div>
    </div>
    <div id="validationSubmitModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-body top-margin-10">
                    <iframe id="validationContent" allow="camera {$userValidationHost}" width="100%" height="700" frameborder="0" src=""></iframe>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">{lang key='close'}</button>
                </div>
            </div>
        </div>
    </div>
{/if}
