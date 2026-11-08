<!DOCTYPE html>
<!-- Load theme options -->
{include file="$template/includes/theme-options.tpl"}
<!-- Load theme functions -->
{include file="$template/includes/theme-functions.tpl"}
{if $itTextDirectionRTL eq "enabled"}
	<html dir="rtl">
{else}
	<html>
{/if}
  <head>
    <meta charset="{$charset}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{$requestedAction} - {$companyname}</title>
	<!-- Head includes -->
	{include file="$template/includes/head.tpl"}
	{if $itCSSMin eq "enabled"}
		<link href="{assetPath file='oauth.min.css'}?v={$itResourceRef}" rel="stylesheet">
	{else}
		<link href="{assetPath file='oauth.css'}?v={$itResourceRef}" rel="stylesheet">
	{/if}
  </head>
  <body>

    <section id="header">
        <div class="container">
            <img src="{$logo}" />
            <div class="pull-right text-right">
                {if $loggedin}
                    <form method="post" action="{$issuerurl}oauth/authorize.php" id="frmLogout">
                        <input type="hidden" name="logout" value="1"/>
                        <input type="hidden" name="request_hash" value="{$request_hash}"/>
                        <p>
                            {lang key='oauth.currentlyLoggedInAs' firstName=$userInfo.firstName lastName=$userInfo.lastName}{if $userInfo.clientName} ({$userInfo.clientName}){/if}.
                            <a href="#" onclick="jQuery('#frmLogout').submit()">{lang key='oauth.notYou'}</a>
                        </p>
                    </form>
                {/if}
                <form method="post" action="{$issuerurl}oauth/authorize.php" id="frmCancelLogin">
                    <input type="hidden" name="return_to_app" value="1"/>
                    <input type="hidden" name="request_hash" value="{$request_hash}"/>
                    <button type="submit" class="btn btn-oauth">
                        {lang key='oauth.returnToApp' appName=$appName}
                    </button>
                </form>
            </div>
        </div>
    </section>

    <section id="content">
        {$content}
    </section>

    <section id="footer">
        {lang key='oauth.copyrightFooter' dateYear=$date_year companyName=$companyname}
    </section>

  </body>
</html>
