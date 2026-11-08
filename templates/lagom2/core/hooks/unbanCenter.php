<?php

add_hook('ClientAreaSidebars', 1, function($vars) {
    $primarySidebar = Menu::primarySidebar();

    if ($primarySidebar && !is_null($primarySidebar->getChild('Service Details Actions'))) {
        $unbunSidebar = $primarySidebar->getChild('Service Details Actions');
        if (!is_null($unbunSidebar->getChild('mg-unbanCenter'))){
            $unbunSidebar->getChild('mg-unbanCenter')->setIcon('fa-ticket ls ls-denial');
        }
    }
});