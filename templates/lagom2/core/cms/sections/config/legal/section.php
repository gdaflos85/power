<?php

return [
    'default_type' => true,
    'name' => 'Legal',
    'slug' => 'legal',
    'thumb' => 'thumb.png',
    'fields' => [
        [
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Section Description',
            'collapse' => false
        ],
        [
            'type' => 'text-editor',
            'name' => 'main_content',
            'label' => 'Section Content',
            'tooltip' => 'Create required section content using the advanced "text editor". Use its build in tools to format the code, or write your own HTML code.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-legal/#section-description'
        ],
        [
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Section Sidebar',
            'collapse' => false
        ],
        [
            'type' => 'list',
            'name' => 'sidebar',
            'label' => 'Sidebar Items',
            'icons' => true,
            'sidebar' => true,
            'tooltip' => 'The section sidebar is presented on the left-hand side of the legal pages, providing the ability to incorporate links leading to various other legal pages',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-legal/#section-sidebar'
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
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-common-settings/#section-anchor'
        ],
        [
            'type' => 'text',
            'name' => 'custom_class',
            'label' => 'Section custom class',
            'placeholder' => 'Enter class...',
            'tooltip' => 'This setting allows you to assign custom classes to the section container. You can input your own CSS class here and then apply the necessary styling in the <b>theme-custom.css</b> file.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-common-settings/#section-custom-class'
        ]
    ]
];
