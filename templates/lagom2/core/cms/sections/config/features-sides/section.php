<?php

return [
    'default_type' => true,
    'name' => 'Features Sides',
    'slug' => 'features-sides',
    
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
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-features-sides/#section-description'
        ],
        [
            'type' => 'text',
            'name' => 'title',
            'label' => 'Title',
            'placeholder' => 'Enter title...',
            'tooltip' => 'Elevate page clarity and visual hierarchy using section titles. Optionally skip for not displaying this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-features-sides/#section-description'
        ],
        [
            'type' => 'text',
            'name' => 'subtitle',
            'label' => 'Subtitle',
            'placeholder' => 'Enter subtitle...',
            'tooltip' => 'Add concise text to clarify section content, enhancing context and user understanding. You can skip this if you don`t wish to display this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-features-sides/#section-description'
        ],
        [
            'type' => 'select',
            'name' => 'title_position',
            'label' => 'Title and subtitle position',
            'options' => [
                [
                    'name' => 'Above description',
                    'value' => 'inside'
                ],
                [
                    'name' => 'Above section content (centered)',
                    'value' => 'above'
                ]
            ],
            'tooltip' => 'Choose placement of section title and subtitle. By default these elements are placed together with section description, but you can change this by selecting different option.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-features-sides/#section-description'
        ],
        [
            'type' => 'text-editor',
            'name' => 'desc',
            'label' => 'Description',
            'placeholder' => 'Enter description...',
            'tooltip' => 'Section description, where content can be customized using text editor.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-features-sides/c/#section-description'
        ],
        [
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Features List',
            'collapse' => false
        ],
        [
            'type' => 'list', //list of items with title description and icon
            'name' => 'features',
            'label' => 'Features',
            'tooltip' => 'Present the list of generated features that will appear on the edited website page. This list offers the convenience to arrange items by dragging and dropping, allowing you to adjust their sequence.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-features-sides/#features-list'
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
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-features-sides/#feature-size'
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
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-features-sides/#feature-icon-position'
        ],
        [
            'type' => 'select',
            'name' => 'features_position',
            'label' => 'Features position',
            'container_class' => 'col-sm-3',
            'options' =>  [
                [
                    'name' => 'Right',
                    'value' => 'right'
                ],
                [
                    'name' => 'Left',
                    'value' => 'left'
                ]
            ],
            'tooltip' => 'Choose on which side, feature items should be shown in this sections. You have two options to choose from: "Left" or "Right" placement for the "Feature" items.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-features-sides/#feature-position'
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
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-features/#sgroup-section'
        ],
        [
            'type' => 'select',
            'name' => 'cols_desktop',
            'label' => 'Columns on desktop',
            'container_class' => 'col-sm-3',
            'options' =>  [
                [
                    'name' => '1',
                    'value' => '1',
                    'default' => true
                ],
                [
                    'name' => '2',
                    'value' => '2'
                ]
            ],
            'tooltip' => 'efine the number of columns for features displayed on screens wider than 1320px.',
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
                    'value' => '1',
                    'default' => true
                ],
                [
                    'name' => '2',
                    'value' => '2'
                ]
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
                    'value' => '1',
                    'default' => true
                ],
                [
                    'name' => '2',
                    'value' => '2'
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
                    'value' => '1',
                    'default' => true
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
            'collapse' => false
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
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/website-builder/section-features-sides/#section-actions'
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
