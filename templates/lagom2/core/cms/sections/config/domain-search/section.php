<?php

return [
    'default_type' => true,
    'name' => 'Domain Search',
    'slug' => 'domain-search',
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
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-domain-search/#section-description'
        ],
        [
            'type' => 'text',
            'name' => 'title',
            'label' => 'Title',
            'placeholder' => 'Enter title...',
            'tooltip' => 'Elevate page clarity and visual hierarchy using section titles. Optionally skip for not displaying this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-domain-search/#section-description'
        ],
        [
            'type' => 'text',
            'name' => 'subtitle',
            'label' => 'Subtitle',
            'placeholder' => 'Enter subtitle...',
            'tooltip' => 'Add concise text to clarify section content, enhancing context and user understanding. You can skip this if you don`t wish to display this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-domain-search/#section-description'
        ],
        [
            'type' => 'text-editor',
            'name' => 'desc',
            'label' => 'Description',
            'placeholder' => 'Enter description...',
            'tooltip' => 'Add concise text to clarify section content, enhancing context and user understanding. You can skip this if you don`t wish to display this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-domain-search/#section-description'
        ],
        [
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Section Domain Field',
            'collapse' => false
        ],
        [
            'type' => 'select',
            'name' => 'domain_type',
            'label' => 'Domain type',
            'options' => [
                [
                    'name' => 'Domain Search',
                    'value' => 'register'
                ],
                [
                    'name' => 'Domain Transfer',
                    'value' => 'transfer'
                ],
                [
                    'name' => 'Display both fields as tabs',
                    'value' => 'tabs'
                ],
            ],
            'tooltip' => 'Choose what type of domain field should be used in this section type',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-domain-search/#domain-type'
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
            'tooltip' => 'Incorporate buttons using the Button Manager modal. For instance, you can create a link button that directs your customers to a page featuring a TLD table, showcasing the pricing for all available TLDs in your WHMCS system.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-domain-search/#domain-actions'
        ],
        [
            'type' => 'checkbox',
            'name' => 'show_spotlight_tlds',
            'label' => 'Display domain spotlight TLDs',
            'tooltip' => 'When you enable "Display domain spotlight TLDs", highlighted domain TLDs will appear beneath the domain field. You can configure these TLDs on the WHMCS Domain Pricing page.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-domain-search/#domain-spotlights'
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
            'options' => [
                [
                    'name' => ' Type 1 - No graphic, center aligned content',
                    'value' => 'type-0'
                ],
                [
                    'name' => 'Type 2 - Predefined Lagom illustration',
                    'value' => 'type-1'
                ],
                [
                    'name' => 'Type 3 - Custom graphics in predefined container',
                    'value' => 'type-2'
                ],
                [
                    'name' => 'Type 4 - Custom graphics filling full background',
                    'value' => 'type-3'
                ],
            ],
            'tooltip' => 'Select a background type from the dropdown menu. This choice also influences the layout of banner content.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-domain-search/#section-graphic'
        ],
        [
            'type' => 'select',
            'name' => 'graphic_position',
            'label' => 'Graphic position',
            'container_class' => 'col-sm-6',
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
                    'name' => 'Top - Center',
                    'value' => 'top-center'
                ],
                [
                    'name' => 'Bottom - Center',
                    'value' => 'bottom-center'
                ],
            ],
            'tooltip' => 'Choose position of the graphic from the dropdown menu.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-domain-search/#section-graphic'
        ],
        [
            'type' => 'graphic',
            'name' => 'graphic',
            'label' => 'Graphic',
            'tooltip' => 'Personalize your banner by selecting the background graphics that will be prominently showcased.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-domain-search/#section-graphic'
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
