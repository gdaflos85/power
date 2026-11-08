<?php

return [
    'default_type' => true,
    'name' => 'Features',
    'slug' => 'features',
    
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
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-features/#section-description'
        ],
        [
            'type' => 'text',
            'name' => 'title',
            'label' => 'Title',
            'placeholder' => 'Enter title...',
            'tooltip' => 'Elevate page clarity and visual hierarchy using section titles. Optionally skip for not displaying this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-features/#section-description'
        ],
        [
            'type' => 'text-editor',
            'name' => 'subtitle',
            'label' => 'Subtitle',
            'placeholder' => 'Enter subtitle...',
            'tooltip' => 'Add concise text to clarify section content, enhancing context and user understanding. You can skip this if you don`t wish to display this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-features/#section-description'
        ],
        [
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Features List',
            'collapse' => false
        ],
        [   // Group Features
            'type' => 'group-input',
            'name' => 'features_group',
            'label' => 'Group features in multiple tabs',
            'grouped' => false, 
            'group_forced' => false, 
            'fields' => [
                [
                    'type' => 'list', //list of items with title description and icon
                    'name' => 'features',
                    'label' => 'Features',
                    'tooltip' => 'Present the list of generated features that will appear on the edited website page. This list offers the convenience to arrange items by dragging and dropping, allowing you to adjust their sequence.',
                    'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-features/#features'
                ],
            ],
            'tooltip' => 'This option enables you to generate multiple feature groups, which will subsequently appear on the frontend as distinct tabs',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-features/#group-section'
        ],
        [
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Features Settings',
            'collapse' => true
        ],
        [
            'type' => 'select',
            'name' => 'features_size',
            'label' => 'Feature size',
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
                    'name' => 'Large',
                    'value' => 'large'
                ]
            ],
            'tooltip' => 'Select the size at which the created "features" should be displayed on your website. Choose from a list of predefined sizes.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-features/#feature-size'
        ],
        [
            'type' => 'select',
            'name' => 'features_icon_position',
            'label' => 'Feature icon position',
            'container_class' => 'col-sm-3',
            'options' =>  [
                [
                    'name' => 'Top - Center',
                    'value' => 'top-center'
                ],
                [
                    'name' => 'Top - Left',
                    'value' => 'top-left'
                ],
                [
                    'name' => 'Left',
                    'value' => 'left'
                ],
                [
                    'name' => 'Right',
                    'value' => 'right'
                ],
            ],
            'tooltip' => 'Select the position of the graphic within the "feature" item. This choice will also influence the layout of the "feature" item content.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-features/#feature-icon-position'
        ],
        [
            'type' => 'select',
            'name' => 'features_style',
            'label' => 'Feature style',
            'container_class' => 'col-sm-3',
            
            'options' =>  [
                [
                    'name' => 'Default',
                    'value' => 'default'
                ],
                [
                    'name' => 'Boxed',
                    'value' => 'boxed'
                ],
                [
                    'name' => 'Bordered',
                    'value' => 'bordered'
                ],
            ],
            'tooltip' => 'This option enables you to generate multiple feature groups, which will subsequently appear on the frontend as distinct tabs',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-features/#group-section'
        ],
        [
            'type' => 'checkbox',
            'name' => 'display_features_slider',
            'label' => 'Display features as slider',
            'label_attributes' => [
                [
                    'name' => 'toggle',
                    'value' => 'lu-collapse'
                ],
                [
                    'name' => 'target',
                    'value' => '#display_features_slider'
                ],
            ],
            'tooltip' => 'Determine the style you want to apply to the created "feature" items. Choose a style that maintains consistency with other section types on this page.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-features/#feature-style'
        ],
        [
            'type' => 'select',
            'name' => 'features_slider_type',
            'container_id' => 'display_features_slider',
            'container_collapse' => true,
            'container_collapse_target' => 'display_features_slider',
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
            'tooltip' => 'This option enables you to display feature items as slider, once enabled additonal field will be shown, so you`d be able to choose different slider types.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-features/#feature-slider'
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
            'tooltip' => 'Define the number of columns for features displayed on screens wider than 1320px.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-features/#feature-columns'
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
            'tooltip' => 'Specify the number of columns for features displayed on screens with widths ranging from 992px to 1319px.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-features/#feature-columns'            
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
            'tooltip' => 'Choose the number of columns for features displayed on screens with widths ranging from 768px to 991px.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-features/#feature-columns'            
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
            'tooltip' => 'Set amount of columns with features, shown on screens with width smaller than 767px.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-features/#feature-columns'
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
            'type' => 'checkbox',
            'name' => 'show_product_pricing',
            'label' => 'Display starting price of selected product/product group',
            'label_attributes' => [
                [
                    'name' => 'toggle',
                    'value' => 'lu-collapse'
                ],
                [
                    'name' => 'target',
                    'value' => '#show_product_pricing'
                ],
            ],
            'tooltip' => 'When "Display starting price of selected product group" is activated, additional field with product groups will be shown. This field displays "starting price" from the selected product group.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/website-builder/section-graphic/#section-actions'
        ],
        [
            'type' => 'select',
            'name' => 'product_group_pricing',
            'container_id' => 'show_product_pricing',
            'container_collapse' => true,
            'container_collapse_target' => 'show_product_pricing'
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
        [
            'type' => 'text',
            'name' => 'features_custom_classes',
            'label' => 'Features custom class',
            'placeholder' => 'Enter class...',
            'tooltip' => 'Assign custom class to all feature items generated in this section.'
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
