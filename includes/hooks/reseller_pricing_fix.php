<?php
/**
 * WHMCS Hook: Reseller Hosting Pricing Display Fix
 * Power Hosting - Remove "Από" (Starting from) from Reseller Hosting packages
 */

if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}

add_hook('ClientAreaHeadOutput', 10, function($vars) {
    $uri = $_SERVER['REQUEST_URI'] ?? '';
    if (stripos($uri, 'reseller') !== false) {
        return '<style>
            .package .price-starting-from,
            .package-box .price-starting-from,
            .package-header .price-starting-from {
                display: none !important;
            }
        </style>';
    }
    return '';
});
