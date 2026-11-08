<?php

return [
    'display_name' => 'Default',
    'preview'      => 'thumb.png',
    'variables' => [

    ],
    'settings'     => [
        'addonsColumns' => [
            'type' => 'select',
            'name' => 'addonsColumns',
            'label' => 'Addons Columns',
            'options' => '1,2',
            'default' => '2',
            'tooltip' => "Select amount of columns for addon boxes"    
        ],
        'removeProductGroupName' => [
            'type' => 'checkbox',
            'name' => 'removeProductGroupName',
            'label' => 'Hide Product Group Name From Order Summary',
            'tooltip' => "Upon activation, the product group name will be omitted from the product name in the order summary sidebar.",
        ],
        'saveLabelAttached' => [
            'type' => 'select',
            'name' => 'saveLabelAttached',
            'options' => 'Default - Save label inside billing cycle box,Style 2 - Floating save label',
            'label' => 'Billing Cycle Box Style',
            'tooltip' => "Choose whether the \"Save\" label should appear next to the product pricing or be attached to the product box on your product configuration page.",
        ],
    ]
];