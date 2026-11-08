<?php

return [
    'default_type' => true,
    'name' => 'Featured TLDs',
    'slug' => 'featured-tlds',
    'cache' => ['domain_price_refresh'],
    'thumb' => 'thumb.png',
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
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-featured-tlds/#section-description'
        ],
        [
            'type' => 'text',
            'name' => 'title',
            'label' => 'Title',
            'placeholder' => 'Enter title...',
            'tooltip' => 'Elevate page clarity and visual hierarchy using section titles. Optionally skip for not displaying this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-featured-tlds/#section-description'
        ],
        [
            'type' => 'text-editor',
            'name' => 'subtitle',
            'label' => 'Subtitle',
            'placeholder' => 'Enter subtitle...',
            'tooltip' => 'Add concise text to clarify section content, enhancing context and user understanding. You can skip this if you don`t wish to display this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-featured-tlds/#section-description'
        ],
        [
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'TLD List',
            'collapse' => false
        ],
        [
            'type' => 'tld-list',
            'name' => 'tld_list',
            'label' => 'TLD\'s',
            'tooltip' => 'This section showcases the TLDs that have been added to the list, and these items will be visible on the front end of the page',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-featured-tlds/#tld-list'
        ],
        [
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'TLD Settings',
            'collapse' => true
        ],
        [
            'type' => 'select',
            'name' => 'tld_list_layout',
            'label' => 'TLD list layout',
            'container_class' => 'col-sm-3',
            'options' =>  [
                [
                    'name' => 'Center',
                    'value' => 'center'
                ],
                [
                    'name' => 'Left',
                    'value' => 'left'
                ],
                [
                    'name' => 'Inline',
                    'value' => 'inline'
                ]
            ],
            'tooltip' => 'Provides a selection of diverse content layouts for TLD boxes, allowing you to choose the optimal style that complements your website.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-featured-tlds/#tld-list-layout'
        ],
        [
            'type' => 'select',
            'name' => 'tld_list_style',
            'label' => 'TLD list style',
            'container_class' => 'col-sm-3',
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
                ]
            ],
            'tooltip' => 'Select from a variety of styles designed for TLD boxes, ensuring alignment with your website`s aesthetics and brand identity.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-featured-tlds/#tld-list-style'
        ],
        [
            'type' => 'select',
            'name' => 'tld_list_size',
            'label' => 'TLD list size',
            'container_class' => 'col-sm-3',
            'options' =>  [
                [
                    'name' => 'Default',
                    'value' => 'default'
                ],
                [
                    'name' => 'Small',
                    'value' => 'small'
                ],
                [
                    'name' => 'Extra Small',
                    'value' => 'extra-small'
                ]
            ],
            'tooltip' => 'Specify the desired size for TLD boxes to be displayed on your website page. Select from a list of predefined sizes.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-featured-tlds/#tld-list-size'
        ],
        [
            'type' => 'select',
            'name' => 'tld_list_pricing',
            'label' => 'TLD list pricnig',
            'container_class' => 'col-sm-3',
            'options' =>  [
                [
                    'name' => 'Register',
                    'value' => 'register'
                ],
                [
                    'name' => 'Register + Renewal',
                    'value' => 'register_renewal'
                ],
                [
                    'name' => 'Transfer',
                    'value' => 'transfer'
                ],
                [
                    'name' => 'Transfer + Renewal',
                    'value' => 'transfer_renewal'
                ],
                [
                    'name' => 'Renewal',
                    'value' => 'renewal'
                ]
            ],
            'tooltip' => 'Select the type of domain pricing to display in the TLD boxes. This setting will be applied across all TLD boxes. We use pricing configured in WHMCS domain pricing settings.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-featured-tlds/#tld-list-pricing'
        ],
        [
            'type' => 'checkbox',
            'name' => 'display_tlds_slider',
            'label' => 'Display TLDs as slider',
            'label_attributes' => [
                [
                    'name' => 'toggle',
                    'value' => 'lu-collapse'
                ],
                [
                    'name' => 'target',
                    'value' => '#display_tlds_slider'
                ],
            ],
            'tooltip' => 'When this option is activated, TLD boxes will be presented as an infinite slider on the frontend of your website.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-featured-tlds/#display-tlds-as-slider'
        ],
        [
            'type' => 'select',
            'name' => 'tlds_slider_type',
            'container_id' => 'display_tlds_slider',
            'container_collapse' => true,
            'container_collapse_target' => 'display_tlds_slider',
            'container_class' => 'col-6',
            'options' =>  [
                [
                    'name' => 'Full browser width slider',
                    'value' => 'screen-slider'
                ],
                [
                    'name' => 'Slider with left and right arrows',
                    'value' => 'content-slider'
                ]
            ],
            'tooltip' => 'This section showcases the TLDs that have been added to the list, and these items will be visible on the front end of the page',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-featured-tlds/#tld-list'
        ],
        [
            'type' => 'select',
            'name' => 'link_to_page',
            'label' => 'Linked page',
            'tooltip' => 'TLD boxes are utilized in the "Domain" pages within our predefined templates. Clicking on a specific TLD navigates the customer to the domain search field with the selected TLD pre-filled. See our Demo "Domain" page. If you opt to use this section on other pages, you can determine the destination page for all TLD box links. This selection includes all CMS and WHMCS pages.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-featured-tlds/#linked-page'
        ],
        [
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
                    'value' => '3',
                    'default' => true
                ],
                [
                    'name' => '4',
                    'value' => '4'
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
            'tooltip' => 'Define the number of columns for features displayed on screens wider than 1320px',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-featured-tlds/#columns'
        ],
        [
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
                    'default' => true
                ],
                [
                    'name' => '4',
                    'value' => '4'
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
            'tooltip' => 'Specify the number of columns for features displayed on screens with widths ranging from 992px to 1319px',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-featured-tlds/#columns'
            
        ],
        [
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
            'tooltip' => 'Choose the number of columns for features displayed on screens with widths ranging from 768px to 991px',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-featured-tlds/#columns'
            
        ],
        [
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
            'tooltip' => 'Set amount of columns with features, shown on screens with width smaller than 767px',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-featured-tlds/#columns'
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
        [   // Package apply promotion code
            'type' => 'checkbox',
            'name' => 'apply_promocode',
            'label' => 'Apply promotion code to all section TLDs',
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
            'tooltip' => 'Select the WHMCS promotion code you want to add to all the section\'s TLDs. For more information on promotion codes, click the link below.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-common-settings/#promotion-codes',
        ],
        [   // Promo Codes
            'type' => 'select',
            'name' => 'promocode',
            'container_id' => 'apply_promocode',
            'container_collapse' => true,
            'container_collapse_target' => 'apply_promocode'
        ],
        [
            'type' => 'text',
            'name' => 'tlds_custom_classes',
            'label' => 'TLD custom class',
            'placeholder' => 'Enter class...',
            'tooltip' => 'Lets you assign custom CSS class to all TLD boxes generated by this section.',
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
            'tooltip' => 'Assign special names to section anchors. This makes it easy to guide people to specific parts of the page when you share links',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-common-settings/#overlay-sections'
        ]
    ]
];