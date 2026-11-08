                        <!-- If page isn't shopping cart, close main content layout and display secondary sidebar (if enabled and applicable) -->
                        {if !$inShoppingCart}
                            <!-- Display custom module wrapper if applicable -->
                            {if $itShowContentWrapper eq "yes"}
                                    </div>
                                </div>
                            {/if}
                            <!-- Close main content layout and display secondary sidebar (if enabled and applicable) -->
                            {if $itShowSidebarLayout eq "yes"}
                                    </div>
                                    {if $itShowSidebarSecondary eq "yes"}
                                        <div class="col-md-3 pull-md-right whmcs-sidebar sidebar-secondary">
                                            {include file="$template/includes/sidebar-secondary.tpl" sidebar=$secondarySidebar}
                                        </div>
                                    {/if}
                                </div>
                            {/if}
                            <div class="clearfix"></div>
                        </section>
                    {/if}
				</div>
				<!-- If theme debug is enabled, display function variables for test and debugging purposes -->
				{if $itThemeDebug eq "enabled"}
					{include file="$template/includes/theme-debug.tpl"}
				{/if}
				<div id="footer" class="panel panel-solid-default">
					<div class="panel-body">
						<div class="row">
							<div class="col-sm-7">
								<span class="footer-text">{lang key="copyrightFooterNotice" year=$date_year company=$companyname}</span>
							</div>
							<div class="col-sm-5">
								<div class="row">
									<div class="col-xs-10 text-right lang-ft">
										{if $itLanguageIconDisplayFooter eq "enabled" and $languagechangeenabled and count($locales) > 1}
											<a href="#bottom" data-toggle="popover" id="languageChooser3"><i class="fas fa-globe-americas"></i> {$activeLocale.localisedName}</a>
										{/if}
									</div>
									<div class="col-xs-2 text-right">
										<a href="#top"><i class="fas fa-angle-up fa-2x"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="languageChooserContent" class="hidden">
					<ul>
				        {foreach $locales as $locale}
                           <li><a href="{$currentpagelinkback}language={$locale.language}">{$locale.localisedName}</a></li>
                        {/foreach}
					</ul>
				</div>
			</section>
		</div>
		{literal}
			<script>
				jQuery(document).ready(function() {
					control_app.timer();
				});
				jQuery('a[href="#top"]').click(function(){
					jQuery('html, body').animate({scrollTop:0}, 'slow');
				});
			</script>
		{/literal}
        <div id="fullpage-overlay" class="hidden">
            <div class="outer-wrapper">
                <div class="inner-wrapper">
                    <img src="{$WEB_ROOT}/assets/img/overlay-spinner.svg">
                    <br>
                    <span class="msg"></span>
                </div>
            </div>
        </div>
		<div class="modal system-modal fade" id="modalAjax" tabindex="-1" role="dialog" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content panel-primary">
		            <div class="modal-header panel-heading">
		                <button type="button" class="close" data-dismiss="modal">
		                    <span aria-hidden="true">&times;</span>
		                    <span class="sr-only">{$LANG.close}</span>
		                </button>
		                <h4 class="modal-title"></h4>
		            </div>
		            <div class="modal-body panel-body">
		                {$LANG.loading}
		            </div>
		            <div class="modal-footer panel-footer">
		                <div class="pull-left loader">
		                    <i class="fas fa-circle-notch fa-spin"></i>
							{$LANG.loading}
		                </div>
		                <button type="button" class="btn btn-default" data-dismiss="modal">
		                    {$LANG.close}
		                </button>
		                <button type="button" class="btn btn-primary modal-submit">
		                    {$LANG.submit}
		                </button>
		            </div>
		        </div>
		    </div>
		</div>
		{include file="$template/includes/generate-password.tpl"}
		{$footeroutput}
	</body>
</html>
