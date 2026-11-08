<?php

return [
    'default_type' => true,
    'name' => 'Product Comparison',
    'slug' => 'compare-packages',
    'thumb' => 'thumb.png',
    'fields' => [
        [   // Subsection - Section Desctiption
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Section Description',
            'collapse' => false
        ],
        [   // Caption
            'type' => 'text',
            'name' => 'caption',
            'label' => 'Caption',
            'placeholder' => 'Enter caption...',
            'tooltip' => 'Provide a brief section caption to appear above the main title in a smaller font. You can skip this if you don`t wish to display this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-banner-default/#banner-description'
        ],
        [   // Title
            'type' => 'text',
            'name' => 'title',
            'label' => 'Title',
            'placeholder' => 'Enter title...',
            'tooltip' => 'Elevate page clarity and visual hierarchy using section titles. Optionally skip for not displaying this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-banner-default/#banner-description'
        ],
        [   // Subtitle
            'type' => 'text-editor',
            'name' => 'subtitle',
            'label' => 'Subtitle',
            'placeholder' => 'Enter subtitle...',
            'tooltip' => 'Add concise text to clarify section content, enhancing context and user understanding. You can skip this if you don`t wish to display this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-banner-default/#banner-description'
        ],
        [   // Subsection - Table Content
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Table Content',
            'collapse' => false
        ],
        [   // Group Table Content
            'type' => 'group-input',
            'name' => 'products_group',
            'label' => 'Group table content in multiple tabs',
            'grouped' => false, 
            'group_forced' => false, 
            'fields' => [
                [   //graphic
                    'type' => 'graphic',
                    'name' => 'graphic',
                    'label' => 'Graphic for this group',
                    'graphic_types' => 'icons',
                    'grouped_only_visible' => true,
                    'tooltip' => 'Choose a graphic to display on the group tab.',
                    'tooltip_url' => 'https://lagom-staging.rsstudio.net/docs/website-builder/section-product-comparison/#add-group'
                ],
                [   // Packages
                    'type' => 'product',
                    'name' => 'products_list',
                    'label' => 'Products',
                    'tooltip' => 'Shows a list of products added to this section for display on the website. You can easily arrange them by dragging and dropping, adjusting their order as you like.',
                    'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#products'
                ],
                [
                    // Comparison Table
                    'type' => 'comparison-table',
                    'name' => 'comparison_table',
                    'label' => 'Features',
                    'tooltip' => 'Shows a list of products added to this section for display on the website. You can easily arrange them by dragging and dropping, adjusting their order as you like.',
                    'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#products'
                ]

            ],
            'tooltip' => 'This option enables you to generate multiple product groups, which will subsequently appear on the frontend as distinct tabs.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#group-products'
        ],
        [   // Subsection -  Package Settings
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Table Settings',
            'collapse' => true
        ],
        [   // Table Style
            'type' => 'select',
            'name' => 'style',
            'label' => 'Table Style',
            'container_class' => 'col-sm-6',
            'options' =>  [
                [
                    'name' => 'Bordered',
                    'value' => 'bordered'
                ],
                [
                    'name' => 'Boxed',
                    'value' => 'boxed'
                ]
            ],
            'tooltip' => 'Choose the style for the created packages to determine how you want them to be displayed on the generated website page.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#product-style'
        ],
        [   // Table Type
            'type' => 'select',
            'name' => 'type',
            'label' => 'Table Type',
            'container_class' => 'col-sm-6',
            'options' =>  [
                [
                    'name' => 'Type 1 - Collapsible Groups',
                    'value' => 'collapsible'
                ],
                [
                    'name' => 'Type 2 - Expanded Groups',
                    'value' => 'expanded'
                ]
            ],
            'tooltip' => 'Choose the style for the created packages to determine how you want them to be displayed on the generated website page.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#product-style'
        ],
        [   // Hide Starting From Text
            'type' => 'checkbox',
            'name' => 'hide_starting_from',
            'label' => 'Hide starting form text',
            'tooltip' => 'When this option is enabled, product will not show "Starting from" text above the pricing. This text is shown by WHMCS system, where product has configurable options assigned.',            
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#hide-starting-from'
        ],
        [   // Disable Sticky Header
            'type' => 'checkbox',
            'name' => 'disable_sticky_header',
            'label' => 'Disable sticky header',
            'tooltip' => 'Sticky headers keep the header and feature categories visible at the top as you scroll, which is helpful for navigating long comparison tables. Enabling "Disable sticky header" turns off this behavior, allowing the entire page to scroll normally for a cleaner view.',            
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#hide-starting-from'
        ],
        [   // Show Billing Cycle
            'type' => 'checkbox',
            'name' => 'display_billing_cycle',
            'label' => 'Display billing cycle switcher with selected cycles',
            'label_attributes' => [
                [
                    'name' => 'toggle',
                    'value' => 'lu-collapse'
                ],
                [
                    'name' => 'target',
                    'value' => '#display_billing_cycle'
                ],
            ],
            'attributes' => [
                [
                    'name' => 'billing-cycle-switcher'
                ]
            ],
            'tooltip' => 'This option enables you to display multiple billing cycle options for "Product" packages, so your customers can compare the pricing between different billing cycles',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#product-billing-switcher'
        ],
        [   // Billing Cycle
            'type' => 'multiselect',
            'name' => 'billing_cycle',
            'container_id' => 'display_billing_cycle',
            'container_collapse' => true,
            'container_collapse_target' => 'display_billing_cycle',
            'attributes' => [
                [
                    'name' => 'billing-cycle-select'
                ],
                [
                    'name' => 'selectize-all'
                ]
            ],
            'options' =>  [
                [
                    'name' => 'All',
                    'value' => 'all',
                    'default' => true
                ],
                [
                    'name' => 'Monthly',
                    'value' => 'monthly'
                ],
                [
                    'name' => 'Quarterly',
                    'value' => 'quarterly'
                ],
                [
                    'name' => 'Semiannually',
                    'value' => 'semiannually'
                ],
                [
                    'name' => 'Annually',
                    'value' => 'annually'
                ],
                [
                    'name' => 'Biennially',
                    'value' => 'biennially'
                ],
                [
                    'name' => 'Triennially',
                    'value' => 'triennially'
                ]
            ],
        ],
        [   // Reverse Billing Cycle order
            'type' => 'checkbox',
            'name' => 'reverse_billing_cycle_order',
            'label' => 'Reverse billing cycle order',
            'tooltip' => 'When this option is enabled, billing cycles will be displayed from shortest cycle to longest.',            
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#reverse-billing-cycle-order'
        ],
        [   // Columns on desktop
            'type' => 'select',
            'name' => 'cols_desktop',
            // 'type' => 'hidden',
            'label' => 'Columns on desktop',
            'container_class' => 'col-sm-4',
            'options' =>  [
                [
                    'name' => '1',
                    'value' => '1'
                ],
                [
                    'name' => '2',
                    'value' => '2'
                ],
                [
                    'name' => '3',
                    'value' => '3'
                ],
                [
                    'name' => '4',
                    'value' => '4',
                    'default' => true
                ]
            ],
            'tooltip' => 'efine the number of columns for features displayed on screens wider than 1320px.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#products-columns'
        ],
        [   // Columns on tablet horizontal
            'type' => 'select',
            'name' => 'cols_tab_h',
            // 'type' => 'hidden',
            'label' => 'Columns on tablet horizontal',
            'container_class' => 'col-sm-4',
            'options' =>  [
                [
                    'name' => '1',
                    'value' => '1'
                ],
                [
                    'name' => '2',
                    'value' => '2',
                ],
                [
                    'name' => '3',
                    'value' => '3',
                ],
                [
                    'name' => '4',
                    'value' => '4',
                    'default' => true
                ]
            ],
            'tooltip' => 'Specify the number of columns for features displayed on screens with widths ranging from 992px to 1319px.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#products-columns'          
        ],
        [   // Columns on tablet vertical
            'type' => 'select',
            'name' => 'cols_tab_v',
            // 'type' => 'hidden',
            'label' => 'Columns on tablet vertical',
            'container_class' => 'col-sm-4',
            'options' =>  [
                [
                    'name' => '1',
                    'value' => '1'
                ],
                [
                    'name' => '2',
                    'value' => '2',
                    'default' => true
                ]
            ],
            'tooltip' => 'Choose the number of columns for features displayed on screens with widths ranging from 768px to 991px.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#products-columns' 
        ],
        [   // Subsection - Section Actions
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Section Actions',
            'collapse' => true
        ],
        [   // Buttons
            'type' => 'buttons',
            'name' => 'buttons',
            'label' => 'Buttons',
            'tooltip' => 'Create and assign custom buttons to this section with ease. Boost user engagement and enhance website conversion with effective call-to-action buttons.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-common-settings/#button-manager'
        ],
        [   // Subsection - Advanced Section Settings
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
        [   // Section custom class
            'type' => 'text',
            'name' => 'custom_class',
            'label' => 'Section custom class',
            'placeholder' => 'Enter class...',
            'tooltip' => 'This setting allows you to assign custom classes to the section container. You can input your own CSS class here and then apply the necessary styling in the <b>theme-custom.css</b> file.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-common-settings/#section-custom-class'
        ],
        [   // Tabs Form
            'type' => 'select',
            'name' => 'tabs_style',
            'label' => 'Tabs Style',
            'container_class' => 'col-sm-12',
            'options' => [
                [
                    'name' => 'Default',
                    'value' => 'default'
                ],
                [
                    'name' => 'Boxed',
                    'value' => 'boxed'
                ]
            ],
            'tooltip' => 'Choose the style for the created tabs to determine how you want them to be displayed on the generated website page. This option works only when `Group table content` option is enabled',
            'tooltip_url' => ''
        ]
    ]
];
