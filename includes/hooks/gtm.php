<?php
/**
 * WHMCS Hook: Google Tag Manager (GTM) Integration
 * Power Hosting - Container ID: GTM-5WDF7VG5
 * 
 * Works seamlessly with WHMCS and Lagom Theme without modifying any template files.
 */

if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}

/**
 * 1. Inject GTM script into the <head> of every client area / public page
 */
add_hook('ClientAreaHeadOutput', 1, function($vars) {
    $gtmId = 'GTM-5WDF7VG5';
    
    $headScript = <<<HTML
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','{$gtmId}');</script>
<!-- End Google Tag Manager -->
HTML;

    return $headScript;
});

/**
 * 2. Inject GTM noscript iframe right after the opening <body> tag
 */
add_hook('ClientAreaHeaderOutput', 1, function($vars) {
    $gtmId = 'GTM-5WDF7VG5';
    
    $bodyNoScript = <<<HTML
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id={$gtmId}"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
HTML;

    return $bodyNoScript;
});
