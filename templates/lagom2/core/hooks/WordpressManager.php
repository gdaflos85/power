<?php

use WHMCS\Database\Capsule;
use RSThemes\Service\WhmcsHelper;
use \RSThemes\Extensions\PromoBannersExtension as Banner;
use WHMCS\MarketConnect\Service;

add_hook('ClientAreaSidebars', 1, function($vars) {
    $primarySidebar = Menu::primarySidebar();

    if ($primarySidebar && !is_null($primarySidebar->getChild('Service Details Actions'))) {
        $dnsSidebar = $primarySidebar->getChild('Service Details Actions');
        if (!is_null($dnsSidebar->getChild('mg-wordpress-manager'))){
            $dnsSidebar->getChild('mg-wordpress-manager')->setIcon('fa-ticket ls ls-apps');
        }
    }
});


add_hook('ClientAreaPage', 999, function($vars) {
    if ($vars['templatefile'] == "/modules/addons/WordpressManager/templates/client/default/main.tpl"){
        return [
            'displayTitle' => $vars['mainName']
        ];
    }
});

add_hook('ClientAreaHeadOutput', 999, function($vars) {
    if ($vars['templatefile'] === 'clientareahome') {

        $scriptWPPath = '<script src="templates/lagom2/core/extensions/ModulesIntegration/WordpressManager/module-integration.js"></script>';

        return $scriptWPPath;
    }
});