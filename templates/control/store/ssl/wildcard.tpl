{if $itCSSMin eq "enabled"}
    <link href="{assetPath file='store.min.css'}" rel="stylesheet">
{else}
    <link href="{assetPath file='store.css'}" rel="stylesheet">
{/if}

<div class="panel panel-default store-wrapper">
    <div class="panel-body">
        <div class="landing-page ssl">
            <div class="hero">
                <h2>{lang key="store.ssl.wildcard.title"}</h2>
                <h3>{lang key="store.ssl.wildcard.tagline"}</h3>
            </div>
            {include file="$template/store/ssl/shared/nav.tpl" current="wildcard"}
            <div class="content-block standout">
                <div class="row row-margin">
                    <div class="col-sm-4 col-md-3 col-sm-push-8 col-md-push-9 text-right hidden-xs">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/ssl-subs.png">
                    </div>
                    <div class="col-sm-8 col-md-9 col-sm-pull-4 col-md-pull-3">
                        <h3>{lang key="store.ssl.wildcard.descriptionTitle"}</h3>
                        <div class="text-center visible-xs">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/ssl-subs.png">
                            <br><br>
                        </div>
                        {lang key="store.ssl.wildcard.descriptionContent"}
                    </div>
                </div>
            </div>
            {include file="$template/store/ssl/shared/certificate-pricing.tpl" type="wildcard"}
            {include file="$template/store/ssl/shared/features.tpl" type="wildcard"}
            {include file="$template/store/ssl/shared/logos.tpl"}
        </div>
    </div>
</div>
