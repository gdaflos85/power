<div class="modal modal-results modal-lg fade" id="modalTestResults" data-cms-modal-container="body" tabindex="-1" role="dialog"
    aria-labelledby="modalTestResultsTitle" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <i class="fas fa-globe-asia"></i>
                <h5 class="modal-title" id="modalTestResultsTitle">
                    {$LANG['store']['threesixtymonitoring']['modal']['subtitle']}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="{$LANG['close']}">
                    <i class="lm lm-close"></i>
                </button>
            </div>
            <div class="modal-body">
                <div class="text-center">
                    <div class="text-center  modal-body-header">
                        <h5 class="modal-url"><span class="weight-300">{$rslang->trans('threesixty.url')}: </span><span
                                class="modal-url-value"></span></h5>
                        <h5 class="modal-location"><span class="weight-300">{$rslang->trans('threesixty.location')}:
                            </span><span class="modal-location-value"></span></h5>
                    </div>
                    <div class="modal-results">
                        <div class="row result-values">
                            <div class="col-lg-3 col-md-6 col-sm-12">
                                <div class="modal-results-box modal-results-box--positive">
                                    <span>{$LANG['store']['threesixtymonitoring']['modal']['currentStatus']}</span>
                                    <div class="metric-icon">
                                        <img src="{$WEB_ROOT}/templates/{$template}/assets/img/check-positive.svg"
                                            alt="default" />
                                        <i aria-hidden="true" class="ls ls-info-circle"
                                            title="{$LANG['store']['threesixtymonitoring']['modal']['concern']}"></i>
                                        <i aria-hidden="true" class="ls ls-exclamation-circle pulse-text"
                                            title="{$LANG['store']['threesixtymonitoring']['modal']['negative']}"></i>     
                                        <h3 class="metric-value" data-metric="host_status" data-metric-type="label">
                                            Online</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12">
                                <div class="modal-results-box modal-results-box--positive">
                                    <span>{$LANG['store']['threesixtymonitoring']['modal']['resolvingTime']}</span>
                                    <div class="metric-icon">
                                        <img src="{$WEB_ROOT}/templates/{$template}/assets/img/check-positive.svg"
                                            alt="default" />
                                        <i aria-hidden="true" class="ls ls-info-circle"
                                            title="{$LANG['store']['threesixtymonitoring']['modal']['concern']}"></i>
                                        <i aria-hidden="true" class="ls ls-exclamation-circle pulse-text"
                                            title="{$LANG['store']['threesixtymonitoring']['modal']['negative']}"></i>     
                                        <h3 class="metric-value" data-metric="time_dns" data-metric-type="time">0.009 s
                                        </h3>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12">
                                <div class="modal-results-box modal-results-box--info">
                                    <span>{$LANG['store']['threesixtymonitoring']['modal']['connectionTime']}</span>
                                    <div class="metric-icon">
                                        <img src="{$WEB_ROOT}/templates/{$template}/assets/img/check-positive.svg"
                                            alt="default" />
                                        <i aria-hidden="true" class="ls ls-info-circle"
                                            title="{$LANG['store']['threesixtymonitoring']['modal']['concern']}"></i>
                                        <i aria-hidden="true" class="ls ls-exclamation-circle pulse-text"
                                            title="{$LANG['store']['threesixtymonitoring']['modal']['negative']}"></i>     
                                        <h3 class="metric-value" data-metric="time_connect" data-metric-type="time">
                                            0.013 s</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12">
                                <div class="modal-results-box modal-results-box--negative">
                                    <span
                                        class="">{$LANG['store']['threesixtymonitoring']['modal']['totalTime']}</span>
                                    <div class="metric-icon ">
                                        <img src="{$WEB_ROOT}/templates/{$template}/assets/img/check-positive.svg"
                                            alt="default" />
                                        <i aria-hidden="true" class="ls ls-info-circle"
                                            title="{$LANG['store']['threesixtymonitoring']['modal']['concern']}"></i>
                                        <i aria-hidden="true" class="ls ls-exclamation-circle pulse-text"
                                            title="{$LANG['store']['threesixtymonitoring']['modal']['negative']}"></i>     
                                        <h3 class="metric-value" data-metric="time_total" data-metric-type="time">1.257
                                            s</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-actions">
                        <a href="#pricing"
                            class="btn btn-lg btn-primary btn-pricing-scroll btn-modal-get-started">{$LANG['store']['threesixtymonitoring']['button']['startMonitoringLong']}
                            <i class="lm lm-arrow-fat-right"></i></a>
                    </div>
                    <div class="div-cloneable-results d-none">
                        <div class="metric-icon result-positive">
                            <i aria-hidden="true" class="fas fa-circle"
                                title="{$LANG['store']['threesixtymonitoring']['modal']['positive']}"></i>
                            <span class="sr-only">{$LANG['store']['threesixtymonitoring']['modal']['positive']}</span>
                        </div>
                        <div class="metric-icon result-concern">
                            <i aria-hidden="true" class="fas fa-circle"
                                title="{$LANG['store']['threesixtymonitoring']['modal']['concern']}"></i>
                            <span class="sr-only">{$LANG['store']['threesixtymonitoring']['modal']['concern']}</span>
                        </div>
                        <div class="metric-icon result-negative">
                            <i aria-hidden="true" class="fas fa-circle"
                                title="{$LANG['store']['threesixtymonitoring']['modal']['negative']}"></i>
                            <span class="sr-only">{$LANG['store']['threesixtymonitoring']['modal']['negative']}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

