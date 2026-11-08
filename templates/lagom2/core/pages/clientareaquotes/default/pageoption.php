<?php

return [
    'display_name' => 'Default',
    'preview'      => 'thumb.png',
    'settings'     => [
        'hideSidebar' => [
            'type' => 'checkbox',
            'name' => 'hideSidebar',
            'label' => 'Hide Sidebar',
            'tooltip' => "Choose whether you would like to show or hide the content sidebar available on this page."    
        ],
        'defaultStatusFilter' => [
            'type' => 'select',
            'name' => 'defaultFilterStatus',
            'label' => 'Default Status Filter ',
            'options' => 'All,Delivered,On Hold,Accepted,Expired',
            'default' => 'All',
            'tooltip' => "Choose which quote statuses will be displayed by default to your customers.",    
        ],
    ]
];