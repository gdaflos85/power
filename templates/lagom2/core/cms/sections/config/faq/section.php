<?php

return [
    'default_type' => true,
    'name' => 'FAQ',
    'slug' => 'faq',
    
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
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-faq/#section-description'
        ],
        [
            'type' => 'text',
            'name' => 'title',
            'label' => 'Title',
            'placeholder' => 'Enter title...',
            'tooltip' => 'Elevate page clarity and visual hierarchy using section titles. Optionally skip for not displaying this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-faq/#section-description'
        ],
        [
            'type' => 'text-editor',
            'name' => 'subtitle',
            'label' => 'Subtitle',
            'placeholder' => 'Enter subtitle...',
            'tooltip' => 'Add concise text to clarify section content, enhancing context and user understanding. You can skip this if you don`t wish to display this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-faq/#section-description'
        ],
        [
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'FAQ List',
            'collapse' => false
        ],
        [
            'type' => 'group-input',
            'name' => 'list_group',
            'label' => 'Group section content',
            'grouped' => false, // value which is used to setup init style of group input
            'group_forced' => false, // value which is used to show/hide group select
            'fields' => [ //list of inputs which are looped to the groups
                [
                    'type' => 'list',
                    'name' => 'list',
                    'label' => 'FAQ items',
                    'icons' => false,
                    'link' => false,
                    'tooltip' => 'Lorem Ipsum <a href="#">Learn More</a>',
                ],
            ],
            'tooltip' => 'The "Group section content" function enables you to create multiple item groups that will be displayed on the frontend as distinct tabs.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-faq/#group-section'
        ],
        [
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'FAQ Settings',
            'collapse' => false
        ],
        [
            'type' => 'select',
            'name' => 'list_type',
            'label' => 'FAQ Type',
            'container_class' => 'col-sm-6',
            'options' => [
                [
                    'name' => 'Type 1 - Accordion',
                    'value' => 'accordion'
                ],
                [
                    'name' => 'Type 2 - Expanded list with fully visible title and description',
                    'value' => 'expanded'
                ],
            ],
            'tooltip' => 'Select the display type for the list of FAQ items.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-faq/#faq-settings'
        ],
        [
            'type' => 'select',
            'name' => 'list_style',
            'label' => 'FAQ item style',
            'container_class' => 'col-sm-6',
            'options' => [
                [
                    'name' => 'Default',
                    'value' => 'default'
                ],
                [
                    'name' => 'Divided',
                    'value' => 'divided'
                ],
                [
                    'name' => 'Boxed',
                    'value' => 'boxed'
                ],
            ],
            'tooltip' => 'Select the display style for the list of FAQ items.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-faq/#faq-settings'
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
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-common-settings/#overlay-sections'
        ],
        [
            'type' => 'text',
            'name' => 'custom_class',
            'label' => 'Section custom class',
            'placeholder' => 'Enter class...',
            'tooltip' => 'This setting allows you to assign custom classes to the section container. You can input your own CSS class here and then apply the necessary styling in the <b>theme-custom.css</b> file.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-common-settings/#overlay-sections'
        ]
    ]
];
