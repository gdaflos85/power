<?php

return [
    'default_type' => true,
    'name' => 'Promotion Manager',
    'slug' => 'banner-promotion-manager',
    'thumb' => 'thumb.png',
    'extension' => 'PromoBanners',
    'fields' => [
        [   // Subsection - Packages List
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Promotion Slides',
            'collapse' => false
        ],
        [   // Packages
            'type' => 'promotion-manager',
            'name' => 'slides',
            'label' => 'Slides',
            'tooltip' => '',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/'
        ],
        [
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Advanced Section Settings',
            'collapse' => true
        ],
        [
            'type' => 'text',
            'name' => 'section_anchor',
            'label' => 'Section anchor',
            'placeholder' => 'Enter anchor...',
            'tooltip' => 'Assign special names to section anchors. This makes it easy to guide people to specific parts of the page when you share links',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-common-settings/#overlay-sections'
        ],
        [
            'type' => 'text',
            'name' => 'custom_class',
            'label' => 'Section custom class',
            'placeholder' => 'Enter class...',
            'tooltip' => 'This setting allows you to assign custom classes to the section container. You can input your own CSS class here and then apply the necessary styling in the <b>theme-custom.css</b> file.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-common-settings/#overlay-sections'
        ],
    ]
];
