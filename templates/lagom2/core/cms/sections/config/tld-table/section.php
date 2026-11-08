<?php


return [
    'default_type' => true,
    'name' => 'TLD Table',
    'slug' => 'tld-table',
    'thumb' => 'thumb.png',
    'cache' => ['domain_price_refresh'],
    //'comingsoon' => true,
    'fields' => [
        [
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Section Description',
            'collapse' => false
        ],
        [
            'type' => 'text',
            'name' => 'caption',
            'label' => 'Caption',
            'placeholder' => 'Enter caption...',
            'tooltip' => 'Provide a brief section caption to appear above the main title in a smaller font. You can skip this if you don`t wish to display this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-tld-table/#section-description'
        ],
        [
            'type' => 'text',
            'name' => 'title',
            'label' => 'Title',
            'placeholder' => 'Enter title...',
            'tooltip' => 'Elevate page clarity and visual hierarchy using section titles. Optionally skip for not displaying this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-tld-table/#section-description'
        ],
        [
            'type' => 'text-editor',
            'name' => 'subtitle',
            'label' => 'Subtitle',
            'placeholder' => 'Enter subtitle...',
            'tooltip' => 'Add concise text to clarify section content, enhancing context and user understanding. You can skip this if you don`t wish to display this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-tld-table/#section-description'
        ],
        [
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'TLD Table Settings',
            'collapse' => true
        ],
        [
            'type' => 'select',
            'name' => 'tld_table_style',
            'label' => 'Table Style',
            'tooltip' => 'Select the style for the TLDs table container from three available options.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-tld-table/#table-style',
            'options' =>  [
                [
                    'name' => 'Default',
                    'value' => 'default'
                ],
                [
                    'name' => 'Bordered',
                    'value' => 'bordered'
                ],
                [
                    'name' => 'Boxed',
                    'value' => 'boxed'
                ],
            ],
        ],
        [
            'type' => 'checkbox',
            'name' => 'show_register_column',
            'label' => 'Show Register Column',
            'tooltip' => 'Decide if you`d like to display TLD "Registration" price column in the table. This pricing can be configured in WHMCS settings.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-tld-table/#how-columns'
        ],
        [
            'type' => 'checkbox',
            'name' => 'show_renewal_column',
            'label' => 'Show Renewal Column',
            'tooltip' => 'Decide if you`d like to display TLD "Renewal" price column in the table. This pricing can be configured in WHMCS settings.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-tld-table/#how-columns'
        ],
        [
            'type' => 'checkbox',
            'name' => 'show_transfer_column',
            'label' => 'Show Transfer Column',
            'tooltip' => 'Decide if you`d like to display TLD "Transfer" price column in the table. This pricing can be configured in WHMCS settings.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-tld-table/#how-columns'
        ],
        [
            'type' => 'checkbox',
            'name' => 'show_dns_management_column',
            'label' => 'Show DNS Management Column',
            'tooltip' => 'Decide if you`d like to display TLD "DNS Management" price column in the table. This pricing can be configured in WHMCS settings.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-tld-table/#how-columns'
        ],
        [
            'type' => 'checkbox',
            'name' => 'show_email_forwarding_column',
            'label' => 'Show Email Forwarding Column',
            'tooltip' => 'Decide if you`d like to display TLD "Email Forwarding" price column in the table. This pricing can be configured in WHMCS settings.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-tld-table/#how-columns'
        ],
        [
            'type' => 'checkbox',
            'name' => 'show_id_protection_column',
            'label' => 'Show ID Protection Column',
            'tooltip' => 'Decide if you`d like to display TLD "ID Protection" price column in the table. This pricing can be configured in WHMCS settings.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-tld-table/#how-columns'
        ],
        [
            'type' => 'select',
            'name' => 'domains_per_page',
            'options' =>  [
                [
                    'name' => '10',
                    'value' => '10'
                ],
                [
                    'name' => '25',
                    'value' => '25'
                ],
                [
                    'name' => '50',
                    'value' => '50'
                ],
                [
                    'name' => '100',
                    'value' => '100'
                ],
                [
                    'name' => '200',
                    'value' => '200'
                ],
                [
                    'name' => '500',
                    'value' => '500'
                ],
                [
                    'name' => '1000',
                    'value' => '1000'
                ],
                [
                    'name' => 'All',
                    'value' => 'All'
                ],
            ],
            'label' => 'Domains per page',
            'tooltip' => 'Select what number of rows would you like to display in single page of TLD table'
        ],
        [
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Section Actions',
            'collapse' => true
        ],
        [
            'type' => 'buttons',
            'name' => 'buttons',
            'label' => 'Buttons',
            'tooltip' => 'Create and assign custom buttons to this section with ease. Boost user engagement and enhance website conversion with effective call-to-action buttons.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-common-settings/#button-manager'
        ],
        [
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Advanced Section Settings',
            'collapse' => true
        ],
        [
            'type' => 'checkbox',
            'name' => 'combined',
            'label' => 'Combine this section with section below',
            'attributes' => [
                [
                    'name' => 'uncheck-switcher',
                    'value' => [
                        'overlay'
                    ]
                ]
            ],
            'tooltip' => 'Eliminate bottom padding and borders from this section, allowing the fusion of these two sections. It`s recommended to apply identical "Section Style" in the "Section Panel" for seamless integration.',            
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-common-settings/#combine-sections'
        ],
        [
            'type' => 'checkbox',
            'name' => 'overlay',
            'label' => 'Overlay section below on this section',
            'attributes' => [
                [
                    'name' => 'uncheck-switcher',
                    'value' => [
                        'combined'
                    ]
                ]
            ],
            'tooltip' => 'This configuration pulls the section below over the currently managed section while adding an extra 200px padding at the bottom. You can adjust the pixel value by customizing the <b>--cms-section-overlay-margin</b> CSS variable through custom CSS rules.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-common-settings/#overlay-sections'
        ],
        [   // Section anchor
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
