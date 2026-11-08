<?php

return [
    'default_type' => true,
    'name' => 'Location List',
    'slug' => 'location-map',
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
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-graphic/#section-description'
        ],
        [
            'type' => 'text',
            'name' => 'title',
            'label' => 'Title',
            'placeholder' => 'Enter title...',
            'tooltip' => 'Elevate page clarity and visual hierarchy using section titles. Optionally skip for not displaying this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-graphic/#section-description'
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
            'label' => 'Location List',
            'collapse' => false
        ],
        [
            'type' => 'locations', //list of items with title description and icon
            'name' => 'locations',
            'label' => 'Locations',
            'tooltip' => 'Present the list of generated locations that will appear on the edited website page.',
            'tooltip_url' => ''
        ],
        [
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Location Settings',
            'collapse' => false
        ],
        [
            'type' => 'select',
            'name' => 'section_type',
            'label' => 'Location List Type',
            'attributes' => [
                [
                    'name' => 'toggle',
                    'value' => 'select-collapse'
                ],
                [
                    'name' => 'target',
                    'value' => '#pointer_style,#map_style'
                ],
                [
                    'name' => 'show',
                    'value' => 'map'
                ],
                [
                    'name' => 'hide',
                    'value' => 'boxes'
                ],
            ],
            'container_class' => 'col-sm-12',
            'options' => [
                [
                    'name' => 'Type 1 - Map',
                    'value' => 'map',
                ],
                [
                    'name' => 'Type 2 - Boxes',
                    'value' => 'boxes'
                ]
            ],
            'tooltip' => "Select the layout for presenting location information. The display will adjust based on the device's screen size.",
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-location-list/#section-type'
        ],
        [
            'type' => 'checkbox',
            'name' => 'display_map_bg',
            'label' => 'Display graphic map in background',
            'tooltip' => 'Adds a world map background behind the Boxed section type on your webpage.',            
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-location-list/#display-graphic-map-in-background'
        ],
        [
            'type' => 'select',
            'name' => 'map_style',
            'label' => 'Map style',
            'container_class' => 'col-sm-6',
            'container_id' => 'map_style',
            'container_collapse' => true,
            'container_collapse_target' => 'section_type',
            'options' => [
                [
                    'name' => 'Default',
                    'value' => 'default',
                ],
                [
                    'name' => 'Primary',
                    'value' => 'primary'
                ]
            ],
            'tooltip' => 'Defines the visual appearance of the map, allowing you to customize how the map background is presented on the webpage.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-location-list/#map-style'
        ],
        [
            'type' => 'select',
            'name' => 'pointer_style',
            'label' => 'Pointer style',
            'container_class' => 'col-sm-6',
            'container_id' => 'pointer_style',
            'container_collapse' => true,
            'container_collapse_target' => 'section_type',
            'options' => [
                [
                    'name' => 'Pin',
                    'value' => 'pin',
                ],
                [
                    'name' => 'Point',
                    'value' => 'point'
                ]
            ],
            'tooltip' => 'Sets the style of the location markers used on the map to represent different locations.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-location-list/#pointer-style'
        ],
        [
            'type' => 'select',
            'name' => 'box_size',
            'label' => 'Location box size',
            'container_class' => 'col-sm-4',
            'options' => [
                [
                    'name' => 'Default',
                    'value' => 'default',
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
            'tooltip' => 'Adjusts the size of the location box displayed on the page, allowing you to choose the most suitable dimensions.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-location-list/#location-boxes-settings'
        ],
        [
            'type' => 'select',
            'name' => 'box_style',
            'label' => 'Location box style',
            'container_class' => 'col-sm-4',
            'options' => [
                [
                    'name' => 'Default',
                    'value' => 'default',
                ],
                [
                    'name' => 'Boxed',
                    'value' => 'boxed'
                ],
                [
                    'name' => 'Bordered',
                    'value' => 'bordered'
                ]
            ],
            'tooltip' => 'Modifies the appearance of the location boxes to fit the design and layout of your website.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-location-list/#location-boxes-settings'
        ],
        [
            'type' => 'select',
            'name' => 'box_icon_position',
            'label' => 'Location box icon position',
            'container_class' => 'col-sm-4',
            'options' => [
                [
                    'name' => 'Left',
                    'value' => 'left',
                ],
                [
                    'name' => 'Right',
                    'value' => 'right'
                ],
                [
                    'name' => 'Top Center',
                    'value' => 'top-center'
                ]
            ],
            'tooltip' => 'Specifies where the flag icon will appear within the location box, providing options for different placements.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-location-list/#location-boxes-settings'
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
            'name' => 'boxes_custom_classes',
            'label' => 'Boxes custom class',
            'placeholder' => 'Enter class...',
            'tooltip' => 'Assign custom class to all box items generated in this section.'
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