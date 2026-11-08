<?php

return [
    'default_type' => true,
    'name' => 'Graphic',
    'slug' => 'graphic',
    
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
            'type' => 'text',
            'name' => 'subtitle',
            'label' => 'Subtitle',
            'placeholder' => 'Enter subtitle...',
            'tooltip' => 'Add concise text to clarify section content, enhancing context and user understanding. You can skip this if you don`t wish to display this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-graphic/#section-description'
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
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-graphic/#section-description'
        ],
        [
            'type' => 'text-editor',
            'name' => 'desc',
            'label' => 'Description',
            'placeholder' => 'Enter description...',
            'tooltip' => 'Section description, where content can be customized using text editor.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-graphic/#section-description'
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
            'label' => 'Section Graphic',
            'collapse' => false
        ],
        [
            'type' => 'select',
            'name' => 'graphic_type',
            'label' => 'Graphic type',
            'container_class' => 'col-sm-6',
            'dependence' => [
                'field' => 'graphic_position',
                'type' => 'toggle',
                'options' => [
                    'type-1' => [
                        'center' => 'hide',
                        'top-center' => 'show',
                        'bottom-center' => 'show'
                    ],
                    'type-2' => [
                        'center' => 'hide',
                        'top-center' => 'show',
                        'bottom-center' => 'show'
                    ],
                    'type-3' => [
                        'center' => 'show',
                        'top-center' => 'hide',
                        'bottom-center' => 'hide'
                    ]
                ]
            ],
            'options' => [
                [
                    'name' => 'Type 1 - Predefined Lagom illustration',
                    'value' => 'type-1'
                ],
                [
                    'name' => 'Type 2 - Custom graphics in predefined container',
                    'value' => 'type-2'
                ],
                [
                    'name' => 'Type 3 - Custom graphics filling full background',
                    'value' => 'type-3'
                ]
            ],
            'tooltip' => 'Select the graphic type to be used for showcasing the section`s visual element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-graphic/#section-graphic-2'
        ],
        [
            'type' => 'select',
            'name' => 'graphic_position',
            'label' => 'Graphic position',
            'container_class' => 'col-sm-6',
            'depending_on' => 'graphic_type',
            'options' => [
                [
                    'name' => 'Right',
                    'value' => 'right'
                ],
                [
                    'name' => 'Left',
                    'value' => 'left'
                ],
                [
                    'name' => 'Center',
                    'value' => 'center'
                ],
                [
                    'name' => 'Top - Center',
                    'value' => 'top-center'
                ],
                [
                    'name' => 'Bottom - Center',
                    'value' => 'bottom-center'
                ],
            ],
            'tooltip' => 'Select the placement of the section graphic. Choose from various predefined positions to ensure proper section flow on your website page.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-graphic/#section-graphic-2'
        ],
        [
            'type' => 'graphic',
            'name' => 'graphic',
            'label' => 'Graphic',
            'tooltip' => 'Assign graphic to your section content, to improve website apperance and catch the customer`s attention.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-common-settings/#section-actions'
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
            'type' => 'checkbox',
            'name' => 'disable_background_shape',
            'label' => 'Disable background shape for "Predefined Lagom Illustration"',
            'tooltip' => 'Eliminates the background shape from the predefined Lagom illustrations.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-common-settings/#overlay-sections'
        ],
        [
            'type' => 'checkbox',
            'name' => 'enable_timer',
            'label' => 'Enable Timer',
            'label_attributes' => [
                [
                    'name' => 'toggle',
                    'value' => 'lu-collapse'
                ],
                [
                    'name' => 'target',
                    'value' => '#enable_timer_style, #enable_timer_display, #enable_timer_startdate, #enable_timer_enddate, #enable_timer_type, #enable_timer_actionafter'
                ],
                [
                    'name' => 'overriding',
                    'value' => 'enable_timer'
                ]
            ],
            'tooltip' => '',            
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-banner-default/'
        ],
        [
            'type' => 'select',
            'name' => 'timer_style',
            'label' => 'Timer Style',
            'container_id' => 'enable_timer_style',
            'container_collapse' => true,
            'container_collapse_target' => 'enable_timer',
            'container_class' => 'col-sm-6',
            'options' => [
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
                [
                    'name' => 'Separated',
                    'value' => 'separated'
                ]
            ],
            'tooltip' => '',
            'tooltip_url' => ''
        ],
        [
            'type' => 'select',
            'name' => 'time_display',
            'label' => 'Time Display',
            'container_id' => 'enable_timer_display',
            'container_collapse' => true,
            'container_collapse_target' => 'enable_timer',
            'container_class' => 'col-sm-6',
            'options' => [
                [
                    'name' => 'Custom Settings',
                    'value' => 'custom'
                ],
                [
                    'name' => 'Synchronized with Promotion Display Time',
                    'value' => 'synchronized'
                ]
            ],
            'attributes' => [
                [
                    'name' => 'toggle',
                    'value' => 'select-collapse'
                ],
                [
                    'name' => 'overriding',
                    'value' => 'enable_timer'
                ],
                [
                    'name' => 'target',
                    'value' => '#enable_timer_startdate, #enable_timer_enddate, #enable_timer_type, #enable_timer_actionafter'
                ],
                [
                    'name' => 'show',
                    'value' => 'custom'
                ],
                [
                    'name' => 'hide',
                    'value' => 'synchronized'
                ],
            ],
            'tooltip' => '',
            'tooltip_url' => ''
        ],
        [
            'type' => 'date',
            'name' => 'start_date',
            'label' => 'Start Date',
            'container_id' => 'enable_timer_startdate',
            'container_collapse' => true,
            'container_collapse_target' => 'enable_timer',
            'container_class' => 'col-sm-3',
            'tooltip' => '',
            'tooltip_url' => ''
        ],
        [
            'type' => 'date',
            'name' => 'end_date',
            'label' => 'End Date',
            'container_id' => 'enable_timer_enddate',
            'container_collapse' => true,
            'container_collapse_target' => 'enable_timer',
            'container_class' => 'col-sm-3',
            'tooltip' => '',
            'tooltip_url' => ''
        ],
        [
            'type' => 'select',
            'name' => 'countdown_type',
            'label' => 'Countdown Type',
            'container_id' => 'enable_timer_type',
            'container_collapse' => true,
            'container_collapse_target' => 'enable_timer',
            'container_class' => 'col-sm-3',
            'options' => [
                [
                    'name' => 'Restart Every 24 Hours',
                    'value' => 'restart'
                ],
                [
                    'name' => 'Synchronized with End Date',
                    'value' => 'synchronized'
                ]
            ],
            'tooltip' => '',
            'tooltip_url' => ''
        ],
        [
            'type' => 'select',
            'name' => 'action_after',
            'label' => 'Action After End Date',
            'container_id' => 'enable_timer_actionafter',
            'container_collapse' => true,
            'container_collapse_target' => 'enable_timer',
            'container_class' => 'col-sm-3',
            'options' => [
                [
                    'name' => 'Hide Timer',
                    'value' => 'hide'
                ],
                [
                    'name' => 'Display 00:00:00:00',
                    'value' => 'display_zero'
                ]
            ],
            'tooltip' => '',
            'tooltip_url' => ''
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
