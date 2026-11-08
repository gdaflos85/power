<?php

return [
    'display_name' => 'Default',
    'preview'      => 'thumb.png',
    'settings'     => [
        'hideSidebar' => [
            'type' => 'checkbox',
            'name' => 'hideSidebar',
            'label' => 'Hide Sidebar',
            'tooltip' => "Choose whether you would like to show or hide the content sidebar available on this page.",
        ],
	    'showManageButton' => [
            'type' => 'checkbox',
            'name' => 'showManageButton',
            'label' => "Show 'Manage' Button",
            'tooltip' => "Choose whether you would like to show or hide the 'Manage' button.",
        ],
        'defaultStatusFilter' => [
            'type' => 'select',
            'name' => 'defaultTicketFilterStatus',
            'label' => 'Default Status Filter ',
            'options' => 'All',
            'default' => 'All',
            'tooltip' => "Choose which ticket statuses will be displayed by default to your customers.",    
        ],
    ]
];