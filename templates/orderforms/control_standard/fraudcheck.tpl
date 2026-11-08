<!--main content start-->
<section id="main-content" class="cart">
	<!-- Display page title -->
	<div class="row">
		<div class="col-md-12">
			<!--breadcrumbs start -->
			{include file="$template/includes/breadcrumb.tpl"}
			<!--breadcrumbs end -->
			<h1 class="h1">{$LANG.cartfraudcheck}</h1>
		</div>
	</div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-danger">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        {$errortitle}
                    </h3>
                </div>
				{if !$userValidation.submittedAt && $userValidation.token eq true}
	                <div class="panel-body">
	                    <p>{lang key='fraud.furtherVal'}</p>
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
	                </div>
					<div class="panel-footer">
						<a href="#" class="btn btn-default" data-url="{$userValidationUrl}" onclick="openValidationSubmitModal(this);return false;">
							{lang key='fraud.submitDocs'}
							&nbsp;<i class="fas fa-arrow-right"></i>
						</a>
					</div>
				{else}
					<div class="panel-body">
						<p>{$error}</p>
					</div>
					<div class="panel-footer">
	                    <a href="submitticket.php" class="btn btn-default">
	                        {$LANG.orderForm.submitTicket}
	                        &nbsp;<i class="fas fa-arrow-right"></i>
	                    </a>
	                </div>
				{/if}
            </div>
        </div>
    </div>
</section>
