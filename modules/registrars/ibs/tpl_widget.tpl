{* Account Balance Widget *}

{if $widgetStatus eq -1}
    <div class="widget-content-padded widget-billing">
        <div class="color-pink">
            Please install or upgrade to the latest {$widgetTitle} Registrar Module.
            <span data-toggle="tooltip"
                  title="The {$widgetTitleWithCompany} Registrar Module is regularly maintained, download and documentation available at github."
                  class="glyphicon glyphicon-question-sign"></span><br />
            <a href="{$repoLink}" style="margin-top:15px;">
                <img src="{$logo}?ts={$currentVersion}" class="ibs-widget-logo" />
            </a>
        </div>
    </div>
{else}
    <div class="widget-billing">
        {if $widgetStatus eq 0}
            <div class="row account-widget">
                <div class="col-sm-12">
                    <div class="item">
                        <div class="note">
                            {$widgetDisableMessage}
                        </div>
                    </div>
                </div>
            </div>
        {elseif $widgetStatus eq 1}
            <div class="row account-widget-ibs">
                <div class="item col-sm-6 bordered-right" style="padding:13px">
                    {$balanceHTML}
                </div>
                <div class="item col-sm-6">
                    <div class="text-center" style="padding:15px;">
                        <img src="{$logo}?ts={$currentVersion}" class="ibs-widget-logo">
                    </div>
                </div>
            </div>
            <div class="widget-footer-outer">
                <span class="text-muted current-version-inner">
                    <i class="fas fa-exclamation-circle"></i>
                    Current version {$currentVersion}.
                </span>
            </div>
        {/if}
    </div>
    <script type="text/javascript">
        const {$moduleName} = new BalanceWidget(
            `{$widgetId}`,
            `{$widgetTTL}`,
            `{$widgetExpires}`,
            `{$widgetStatus}`,
            `{$widgetStatusIcon}`,
            `#{$widgetId}BalanceExpires`
        );
        {$moduleName}.mainWidget();
        {if $widgetStatus eq 1 && $refreshRequest eq ""}
            {$moduleName}.ibsStartCounter();
        {/if}
    </script>
{/if}