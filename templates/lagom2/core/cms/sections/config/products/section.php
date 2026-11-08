<?php

return [
    'default_type' => true,
    'name' => 'Products',
    'slug' => 'products',
    
    'thumb' => 'thumb.png',
    'cache' => ['product', 'product_price_refresh'],
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
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#section-description'
        ],
        [   // Title
            'type' => 'text',
            'name' => 'title',
            'label' => 'Title',
            'placeholder' => 'Enter title...',
            'tooltip' => 'Elevate page clarity and visual hierarchy using section titles. Optionally skip for not displaying this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#section-description'
        ],
        [   // Subtitle
            'type' => 'text-editor',
            'name' => 'subtitle',
            'label' => 'Subtitle',
            'placeholder' => 'Enter subtitle...',
            'tooltip' => 'Add concise text to clarify section content, enhancing context and user understanding. You can skip this if you don`t wish to display this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#section-description'
        ],
        [   // Subsection - Packages List
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Product List',
            'collapse' => false
        ],
        [   // Group Packages
            'type' => 'group-input',
            'name' => 'products_group',
            'label' => 'Group products in multiple tabs',
            'grouped' => false, 
            'group_forced' => false, 
            'fields' => [
                [   // Packages
                    'type' => 'product',
                    'name' => 'products_list',
                    'label' => 'Products',
                    'tooltip' => 'Shows a list of products added to this section for display on the website. You can easily arrange them by dragging and dropping, adjusting their order as you like.',
                    'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#products'
                ],
            ],
            'tooltip' => 'This option enables you to generate multiple product groups, which will subsequently appear on the frontend as distinct tabs.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#group-products'
        ],
        [   // Package Settings
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Product Settings',
            'collapse' => true
        ],
        [   // Package Type
            'type' => 'select',
            'name' => 'type',
            'label' => 'Product type',
            'container_class' => 'col-sm-6',
            'options' =>  [
                [
                    'name' => 'Type 1 - Vertical aligned products',
                    'value' => 'default'
                ],
                [
                    'name' => 'Type 2 - Vertical aligned small products',
                    'value' => 'condensed'
                ],
                [
                    'name' => 'Type 3 - Horizontal aligned products',
                    'value' => 'horizontal'
                ],
                [
                    'name' => 'Type 4 - Graphic product, without description',
                    'value' => 'graphic'
                ]
            ],
            'tooltip' => 'Choose the appearance of the product boxes on your generated website page by selecting one of the predefined types from the provided list.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#product-type'
        ],
        [   // Package Style
            'type' => 'select',
            'name' => 'style',
            'label' => 'Product style',
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
        [   // Display Package Slider
            'type' => 'checkbox',
            'name' => 'display_package_slider',
            'label' => 'Display product slider on selected resolutions',
            'label_attributes' => [
                [
                    'name' => 'toggle',
                    'value' => 'lu-collapse'
                ],
                [
                    'name' => 'target',
                    'value' => '#display_package_slider'
                ],
            ],
            'tooltip' => 'Decide when the product packages will appear as a sliding display on different screen sizes. This is useful when you have many products to show and want to avoid making the page too long..',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#product-slider'
        ],
        [   // Package Slider
            'type' => 'multiselect',
            'name' => 'package_slider',
            'container_id' => 'display_package_slider',
            'container_collapse' => true,
            'container_collapse_target' => 'display_package_slider',
            'attributes' => [
                [
                    'name' => 'selectize-all'
                ]
            ],
            'options' => [
                [
                    'name' => 'All',
                    'value' => 'all',
                    'default' => true
                ],
                [
                    'name' => 'Desktop',
                    'value' => 'desktop'
                ],
                [
                    'name' => 'Tablet Horizontal',
                    'value' => 'tab-h'
                ],
                [
                    'name' => 'Tablet Vertical',
                    'value' => 'tab-v'
                ],
                [
                    'name' => 'Mobile',
                    'value' => 'mob'
                ]
            ]
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
        [   // Hide Starting From Text
            'type' => 'checkbox',
            'name' => 'hide_starting_from',
            'label' => 'Hide starting form text',
            'tooltip' => 'When this option is enabled, product will not show "Starting from" text above the pricing. This text is shown by WHMCS system, where product has configurable options assigned.',            
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#hide-starting-from'
        ],
        [   // Enable stock control
            'type' => 'checkbox',
            'name' => 'enable_stock_control',
            'label' => 'Enable stock control',
            'tooltip' => 'Automatically detects whether the Stock Control option is enabled in the Product Details section in WHMCS. If enabled, it displays the available quantity of the product on the product description page.',            
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#enable-stock-control'
        ],
        [   // Columns on desktop
            'type' => 'select',
            'name' => 'cols_desktop',
            'label' => 'Columns on desktop',
            'container_class' => 'col-sm-3',
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
                ],
                [
                    'name' => '5',
                    'value' => '5'
                ],
                [
                    'name' => '6',
                    'value' => '6'
                ],
            ],
            'tooltip' => 'efine the number of columns for features displayed on screens wider than 1320px.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#products-columns'
        ],
        [   // Columns on tablet horizontal
            'type' => 'select',
            'name' => 'cols_tab_h',
            'label' => 'Columns on tablet horizontal',
            'container_class' => 'col-sm-3',
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
                ],
                [
                    'name' => '5',
                    'value' => '5'
                ],
                [
                    'name' => '6',
                    'value' => '6'
                ],
            ],
            'tooltip' => 'Specify the number of columns for features displayed on screens with widths ranging from 992px to 1319px.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#products-columns'          
        ],
        [   // Columns on tablet vertical
            'type' => 'select',
            'name' => 'cols_tab_v',
            'label' => 'Columns on tablet vertical',
            'container_class' => 'col-sm-3',
            'options' =>  [
                [
                    'name' => '1',
                    'value' => '1'
                ],
                [
                    'name' => '2',
                    'value' => '2',
                    'default' => true
                ],
                [
                    'name' => '3',
                    'value' => '3',
                ],
                [
                    'name' => '4',
                    'value' => '4'
                ]
            ],
            'tooltip' => 'Choose the number of columns for features displayed on screens with widths ranging from 768px to 991px.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#products-columns' 
        ],
        [   // Columns on mobile
            'type' => 'select',
            'name' => 'cols_mob',
            'label' => 'Columns on mobile',
            'container_class' => 'col-sm-3',
            'options' =>  [
                [
                    'name' => '1',
                    'value' => '1'
                ],
                [
                    'name' => '2',
                    'value' => '2'
                ]
            ],
            'tooltip' => 'Set amount of columns with features, shown on screens with width smaller than 767px.',
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
        
        [   // Package apply promotion code
            'type' => 'checkbox',
            'name' => 'apply_promocode',
            'label' => 'Apply promotion code to all section products',
            'label_attributes' => [
                [
                    'name' => 'toggle',
                    'value' => 'lu-collapse'
                ],
                [
                    'name' => 'target',
                    'value' => '#apply_promocode'
                ],
            ],
            'tooltip' => 'Select the WHMCS promotion code you want to add to all the section\'s products. For more information on promotion codes, click the link below.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-common-settings/#promotion-codes',
        ],
        [   // Promo Codes
            'type' => 'select',
            'name' => 'promocode',
            'container_id' => 'apply_promocode',
            'container_collapse' => true,
            'container_collapse_target' => 'apply_promocode'
        ],
        [   // Additional product information
            'type' => 'text-editor',
            'name' => 'additional_product_info',
            'label' => 'Additional information below product boxes',
            'placeholder' => 'Enter information...',
            'tooltip' => 'This option allows you to implement extra information about your products, such as discounts, VAT inclusion, or payment terms, displayed below your product packages to make your offers more transparent and informative.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-products/#advanced-settings'
        ],
        [   // Package custom class
            'type' => 'text',
            'name' => 'package_custom_classes',
            'label' => 'Product custom class',
            'placeholder' => 'Enter class...',
            'tooltip' => 'Assign custom class to all product items generated in this section.'
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
        ]
    ]
];
