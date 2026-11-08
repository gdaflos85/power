<?php

return [
    'display_name' => 'Default',
    'preview'      => 'thumb.png',
    'settings'     => [
        'displayProminentHosting' => [
            'type' => 'checkbox',
            'name' => 'displayProminentHosting',
            'label' => 'Display "No Hosting" Information More Prominent',
            'tooltip' => 'Choose wheter you would like to display "No Hosting" information more prominent on this page.'    
        ],
        'hideNameserversSection' => [
            'type' => 'checkbox',
            'name' => 'hideNameserversSection',
            'label' => 'Hide "Nameservers" Section',
            'tooltip' => 'Choose to hide the "Nameservers" field during domain purchase to provide a more straightforward checkout flow.'
        ],
        'displayExtendedVersion' => [
            'type' => 'checkbox',
            'name' => 'displayExtendedVersion',
            'label' => 'Display the Extended Version of Domain Addons',
            'tooltip' => 'Select whether you want to display the extended version of domain addons, which includes a detailed description and a button.'
        ],
        'disableHostingReminder' => [
            'type' => 'checkbox',
            'name' => 'disableHostingReminder',
            'default' => '0',
            'label' => 'Disable Hosting Reminder',
            'tooltip' => 'Turn off notifications suggesting to add hosting when registering or configuring domains.'
        ],
    ]
];