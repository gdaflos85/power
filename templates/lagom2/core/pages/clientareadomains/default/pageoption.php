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
        'hideInactiveServices' => [
            'type' => 'checkbox',
            'name' => 'hideInactiveServices',
            'label' => 'Hide Inactive Domains',
            'tooltip' => "Choose whether you would like to show or hide inactive domains on this page.",
            'customFormGroupClass' => 'm-b-0x',            
            'dataAttr' => 'data-inactive-services-show',  
        ],
        'hideInactiveServicesStatus' => [
            'type' => 'multiselect',
            'name' => 'servicesStatus',
            'label' => 'Choose Domain Statues Which Should Be Hidden:',
            'options' => 'Pending,Pending Registration,Pending Transfer,Grace,Redemption,Expired,Transferred Away,Cancelled,Fraud',
            'customFormGroupClass' => 'flex-column is-hidden m-b-0x m-t-2x', 
            'formGroupDataAttr' => 'data-inactive-services-status',           
            'dataAttr' => 'data-inactive-services-status-select',
        ],		
	    'showManageButton' => [
            'type' => 'checkbox',
            'name' => 'showManageButton',
            'label' => 'Show "Manage" Button',
            'tooltip' => "Choose whether you would like to show or hide the 'Manage' button.",
            'customFormGroupClass' => 'm-t-2x',
        ],
	    'showAutoRenewSwitcher' => [
            'type' => 'checkbox',
            'name' => 'showAutoRenewSwitcher',
            'label' => 'Show "Auto Renew" Switcher',
            'tooltip' => "Choose whether you would like to show or hide the 'Auto Renew' switcher.",
        ],
        'showDomainId' => [
            'type' => 'checkbox',
            'name' => 'showDomainId',
            'label' => 'Display Domain ID',
            'tooltip' => "Adds domain ID in the domain list table, next to its name.",
        ],
        'hideSslIcon' => [
            'type' => 'checkbox',
            'name' => 'hideSslIcon',
            'label' => 'Hide SSL Icon',
            'tooltip' => "Hide the icon with SSL status, shown in the table next to the domain name",
        ],
        'removeUrlFromDomainName' => [
            'type' => 'checkbox',
            'name' => 'removeUrlFromDomainName',
            'label' => 'Remove URL Anchor from Domain/Host Name',
            'tooltip' => "Remove the anchor link from the domain/host name for a cleaner display.",
        ],
        'defaultStatusFilter' => [
            'type' => 'select',
            'name' => 'defaultFilterStatus',
            'label' => 'Default Status Filter ',
            'options' => 'All,Active,Pending Registration,Pending Transfer,Grace,Redemption,Expired,Transferred Away,Cancelled,Fraud',
            'default' => 'All',
            'tooltip' => "Choose which domain statuses will be displayed by default to your customers.",    
        ],
    ]
];