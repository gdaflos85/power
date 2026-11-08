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
            'label' => 'Hide Inactive Services',
            'tooltip' => "Choose whether you would like to show or hide inactive services on this page.",
            'customFormGroupClass' => 'm-b-0x',            
            'dataAttr' => 'data-inactive-services-show',  
        ],
        'hideInactiveServicesStatus' => [
            'type' => 'multiselect',
            'name' => 'servicesStatus',
            'label' => 'Choose Service Statuses Which Should Be Hidden:',
            'options' => 'Pending,Completed,Suspended,Terminated,Cancelled,Fraud',
            'customFormGroupClass' => 'flex-column is-hidden m-b-0x m-t-2x', 
            'formGroupDataAttr' => 'data-inactive-services-status',           
            'dataAttr' => 'data-inactive-services-status-select',
        ],
        'hideInactiveServicesTerminatedDays' => [
            'type' => 'number',
            'name' => 'terminatedDays',
            'label' => 'Hide Service After "X" Amount of Days From the "Terminated" Date',
            'default' => 0,
            'tooltip' => 'sample tooltip',
            'customFormGroupClass' => 'flex-column is-hidden m-b-0x m-t-2x',
            'formGroupDataAttr' => 'data-inactive-services-days="Terminated"',
            'dataAttr' => 'data-inactive-services-terminated-days-select',
        ],
        'hideInactiveServicesCancelledDays' => [
            'type' => 'number',
            'name' => 'cancelledDays',
            'label' => 'Hide Service After "X" Amount of Days From the "Cancelled" Date',
            'default' => 0,
            'tooltip' => 'sample tooltip',
            'customFormGroupClass' => 'flex-column is-hidden m-t-2x m-b-0x',
            'formGroupDataAttr' => 'data-inactive-services-days="Cancelled"',
            'dataAttr' => 'data-inactive-services-cancelled-days-select',
        ],
	    'showManageButton' => [
            'type' => 'checkbox',
            'name' => 'showManageButton',
            'label' => "Show 'Manage' Button",
            'customFormGroupClass' => 'm-t-2x',
            'tooltip' => "Choose whether you would like to show or hide the 'Manage' button.",
        ],
        'showIdProduct' => [
            'type' => 'checkbox',
            'name' => 'showIdProduct',
            'label' => 'Display Product ID',
            'tooltip' => "Adds product ID in product list table, next to its name.",
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
            'label' => 'Remove URL From the Domain/Host Name',
            'tooltip' => "Remove anchor link from the domain/host name.",
        ],
        'hideTabServiceGroup' => [
            'type' => 'checkbox',
            'name' => 'hideTabProductGroup',
            'label' => 'Hide Group Name',
            'tooltip' => "Choose whether you would like to show or hide the group name shown in the table.",
        ],
        'showEndOfTrialPeriod' => [
            'type' => 'checkbox',
            'name' => 'showEndOfTrialPeriod',
            'label' => 'Show End of Trial Period',
            'tooltip' => "Choose whether you would like to show `end of trial period` in the table. This option is working only when `Auto Terminate/Fixed Term` for product is enabled",
        ],
        'defaultStatusFilter' => [
            'type' => 'select',
            'name' => 'defaultFilterStatus',
            'label' => 'Default Status Filter ',
            'options' => 'All,Active,Pending,Completed,Suspended,Terminated,Cancelled,Fraud',
            'default' => 'All',
            'tooltip' => "Choose which service statuses will be displayed by default to your customers.",    
        ],
    ]
];