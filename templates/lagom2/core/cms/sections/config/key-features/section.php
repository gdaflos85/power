<?php

return [
    'default_type' => true,
    'name' => 'Key Features',
    'slug' => 'key-features',
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
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-key-features/#section-description'
        ],
        [
            'type' => 'text',
            'name' => 'title',
            'label' => 'Title',
            'placeholder' => 'Enter title...',
            'tooltip' => 'Elevate page clarity and visual hierarchy using section titles. Optionally skip for not displaying this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-key-features/#section-description'
        ],
        [
            'type' => 'text-editor',
            'name' => 'subtitle',
            'label' => 'Subtitle',
            'placeholder' => 'Enter subtitle...',
            'tooltip' => 'Add concise text to clarify section content, enhancing context and user understanding. You can skip this if you don`t wish to display this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-key-features/#section-description'
        ],
        [
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Key Features List',
            'collapse' => false
        ],
        [
            'type' => 'group-input',
            'name' => 'key_features',
            'label' => 'Key Features',
            'grouped' => true, 
            'group_forced' => true,            
            'fields' => [ 
                [
                    'type' => 'text-editor',
                    'name' => 'list_desc',
                    'label' => 'Description',
                    'tooltip' => 'Enter item description, which will appear on the website below item title. This field display "text editor", which give you description configuration. If you wish to exclude this element, leave it blank.',
                    'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-key-features/#description'
                ],              
                [
                    'type' => 'buttons',
                    'name' => 'list_buttons',
                    'label' => 'Buttons',
                    'tooltip' => 'Generate call-to-action buttons that will appear beneath the description of each "Key Feature." Once "Add New" action will be clicked "Button Manager" modal will be opened, with advanced button management options .',
                    'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-key-features/#buttons'
                ],
                [
                    'type' => 'graphic',
                    'name' => 'graphic',
                    'label' => 'Graphic',
                    'tooltip' => 'Assign a graphic to the "Key Feature", click on "Add New" button so "Media Modal" will show up.',
                    'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-key-features/#graphic'
                ],
            ]
        ],
        [
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Features Settings',
            'collapse' => true
        ],
        [
            'type' => 'select',
            'name' => 'features_list_type',
            'label' => 'Features list type',
            'container_class' => 'col-sm-6',
            'options' =>  [
                [
                    'name' => 'Type 1 - Default List',
                    'value' => 'default'
                ],
                [
                    'name' => 'Type 2 - Accordion List',
                    'value' => 'accordion'
                ],
                [
                    'name' => 'Type 3 - Tabs displayed below section header',
                    'value' => 'tabs'
                ]
            ],
            'tooltip' => 'Select the preferred display style for the features on your generated website page; you have three different types to choose from.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-key-features/#features-list-type'
        ],
        [
            'type' => 'select',
            'name' => 'features_graphic_type',
            'label' => 'Feature graphic type',
            'container_class' => 'col-sm-6',
            'options' =>  [
                [
                    'name' => 'Type 1 - Predefined Lagom Illustration',
                    'value' => 'type-1'
                ],
                [
                    'name' => 'Type 2 - Custom graphic in predefined illustration',
                    'value' => 'type-2'
                ]
            ],
            'tooltip' => 'Select the type of graphic you intend to use for this section. You have two options to choose from.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-key-features/#features-graphic-type'
        ],
        [
            'type' => 'select',
            'name' => 'features_list_style',
            'label' => 'Features list style',
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
            'tooltip' => 'Select the preferred style for the features list, with three different options available. Please note that this setting applies exclusively to "Feature List Type 1-2."',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-key-features/#features-list-style'
        ],
        [
            'type' => 'select',
            'name' => 'features_graphic_position',
            'label' => 'Features graphic position',
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
            'tooltip' => 'Choose on which content side key feature graphic should be shown in the website section which you`re currently creating. You have two options to choose from.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-key-features/#features-graphic-position'
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
            'tooltip' => 'ICreate and assign custom buttons to this section with ease. Boost user engagement and enhance website conversion with effective call-to-action buttons.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-key-features/#section-actions'
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
