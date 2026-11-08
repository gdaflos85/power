<!-- Font Awesome -->
<link href="{$WEB_ROOT}/assets/css/fontawesome-all.min.css" rel="stylesheet">
<!-- Styling -->
<link rel="stylesheet" href="{assetPath file=$itMainCSSFile}?v={$itResourceRef}">
{if $itMainContentMaxWidth eq "enabled" and $itMainContentMaxWidthValue neq ""}
	<!-- Set maximum width for main content -->
	<style type="text/css">
		.main-content-wrapper {
		  text-align: center;
		}
		.main-content-wrapper #main-content {
		  text-align: left;
		  max-width: {$itMainContentMaxWidthValue};
		  margin: auto;
		}
	</style>
{/if}
{if $itTextDirectionRTL eq "enabled"}
	<!-- Load Bootstrap RTL theme -->
	{if $itCSSMin eq "enabled"}
		<link rel="stylesheet" href="{assetPath file='bootstrap-rtl.min.css'}">
	{else}
		<link rel="stylesheet" href="{assetPath file='bootstrap-rtl.css'}">
	{/if}
{/if}
{assetExists file="custom.css"}
	<!-- Custom Styling -->
	<link href="{$__assetPath__}" rel="stylesheet">
{/assetExists}
<!-- JS -->
<script type="text/javascript">
    var csrfToken = '{$token}',
        markdownGuide = '{lang|addslashes key="markdown.title"}',
        locale = '{if !empty($mdeLocale)}{$mdeLocale}{else}en{/if}',
		saved = '{lang|addslashes key="markdown.saved"}',
        saving = '{lang|addslashes key="markdown.saving"}',
        whmcsBaseUrl = "{\WHMCS\Utility\Environment\WebHelper::getBaseUrl()}",
        requiredText = '{lang|addslashes key="orderForm.required"}',
        recaptchaSiteKey = "{if $captcha}{$captcha->recaptcha->getSiteKey()}{/if}";
</script>
{if $itJSMin eq "enabled"}
	<script src="{assetPath file='scripts.min.js'}?v={$itResourceRef}"></script>
{else}
	<script src="{assetPath file='scripts.js'}?v={$itResourceRef}"></script>
{/if}
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="{assetPath file='html5shiv.min.js'}"></script>
  <script src="{assetPath file='respond.min.js'}"></script>
<![endif]-->

{if $templatefile == "viewticket" && !$loggedin}
	<meta name="robots" content="noindex" />
{/if}
