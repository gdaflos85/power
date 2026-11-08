<?php

return [
    'default_type' => true,
    'name' => 'Banner Form',
    'slug' => 'banner-form',
    'thumb' => 'thumb.png',
    'fields' => [
        [
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Banner  Description',
            'collapse' => false
        ],
        [
            'type' => 'text',
            'name' => 'caption',
            'label' => 'Caption',
            'placeholder' => 'Enter caption...',
            'tooltip' => 'Provide a brief section caption to appear above the main title in a smaller font. You can skip this if you don`t wish to display this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-banner-default/#banner-description'
        ],
        [
            'type' => 'text',
            'name' => 'title',
            'label' => 'Title',
            'placeholder' => 'Enter title...',
            'tooltip' => 'Elevate page clarity and visual hierarchy using section titles. Optionally skip for not displaying this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-banner-default/#banner-description'
        ],
        [
            'type' => 'text-editor',
            'name' => 'subtitle',
            'label' => 'Subtitle',
            'placeholder' => 'Enter subtitle...',
            'tooltip' => 'Add concise text to clarify section content, enhancing context and user understanding. You can skip this if you don`t wish to display this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-banner-default/#banner-description'
        ],
        [
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Banner Form',
            'collapse' => false
        ],
        [
            'type' => 'select',
            'name' => 'form_type',
            'label' => 'Form Type',
            'options' => [
                [
                    'name' => '360 Monitoring',
                    'value' => '360-monitoring'
                ],
                [
                    'name' => 'Knowledgebase Search',
                    'value' => 'knowledgebase-search'
                ]
            ],
            'tooltip' => 'Select from diverse form fields to be displayed on the main website banner of the generated webpage.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-banner-form/#banner-form'
        ],
        [
            'type' => 'hidden',
            'name' => 'captcha',
            'default' => true
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
            'label' => 'Banner Background',
            'collapse' => false
        ],
        [
            'type' => 'select',
            'name' => 'type',
            'label' => 'Background type',
            'options' => [
                [
                    'name' => 'Type 1 - Default Lagom banner with predefined illustration',
                    'value' => 'type-1'
                ],
                [
                    'name' => 'Type 2 - Left aligned text, with custom graphics on the right column',
                    'value' => 'type-2'
                ],
                [
                    'name' => 'Type 3 - Left aligned text, with custom graphics filling full background',
                    'value' => 'type-3'
                ],
                [
                    'name' => 'Type 4 - Center aligned text, with custom graphic filling full background',
                    'value' => 'type-4'
                ],
                [
                    'name' => 'Type 5 - Center aligned text, with custom graphic filling bottom background',
                    'value' => 'type-5'
                ],
                [
                    'name' => 'Type 6 - Center aligned text, with no graphic',
                    'value' => 'type-6'
                ]
            ],
            'tooltip' => 'Select a background type from the dropdown menu. This choice also influences the layout of banner content.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-banner-default/#banner-background'
        ],
        [
            'type' => 'graphic',
            'name' => 'graphic',
            'label' => 'Background graphic',
            'tooltip' => 'Personalize your banner by selecting the background graphics that will be prominently showcased.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-banner-default/#banner-background'
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
            'type' => 'text',
            'name' => 'section_anchor',
            'label' => 'Section anchor',
            'placeholder' => 'Enter section anchor...',
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
