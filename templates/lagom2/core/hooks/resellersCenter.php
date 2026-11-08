<?php

use RSThemes\Template\Template;

add_hook('ClientAreaNavbars', 99, function($vars) {
    
    $primaryNavbar = Menu::primaryNavbar();
    
    if ($primaryNavbar && !is_null($primaryNavbar->getChild('uniqueMenuItemName_ResellerCenter'))) {
        GLOBAL $smarty;
        $vars = $smarty->getTemplateVars();
        $template = new Template($vars['template']);
        if (isset($_SESSION['rsmenulayout'])){
            $activeLayout = $_SESSION['rsmenulayout'];
        }
        else{
            $activeLayout = $template->getActiveDisplay()->rules[1]->navigation_layout;
        }
        if ($activeLayout == "left-nav" || $activeLayout == "left-nav-wide"){
            $predefinedIcon = "sitebuilder.tpl";
            $iconPath = __DIR__ ."/../../assets/svg-icon/{$predefinedIcon}";

            if (file_exists($iconPath)) {
                $iconHtml = file_get_contents($iconPath);
                $primaryNavbar->getChild('uniqueMenuItemName_ResellerCenter')->setHeadingHtml($iconHtml);
            }
        }
    }
});

add_hook('ClientAreaPage', 999, function($vars) {
   
    if ($vars['templatefile'] == "store/order"){
        $secondarySidebar = Menu::secondarySidebar();
        if ($secondarySidebar && !is_null($secondarySidebar->getChild('Categories'))) {
            $secondarySidebar->removeChild('Categories');
        }
    }
});