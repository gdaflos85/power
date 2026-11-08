<?php
 
use WHMCS\View\Menu\Item as MenuItem;

add_hook('ClientAreaPrimaryNavbar', 1, function (MenuItem $primaryNavbar)
{
    if (!is_null($primaryNavbar->getChild('Domains'))) {
        $primaryNavbar->getChild('Domains')->addChild('Manage DNS', array(
        'label' => 'Manage DNS',
        'uri' => 'index.php?m=DNSManager2',
        'order' => 30,
    ));
    }
});