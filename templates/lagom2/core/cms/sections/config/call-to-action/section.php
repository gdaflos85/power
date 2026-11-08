<?php

return [
    'default_type' => true,
    'name' => 'CTA',
    'slug' => 'call-to-action',
    
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
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-cta/#section-description'
        ],
        [
            'type' => 'text',
            'name' => 'title',
            'label' => 'Title',
            'placeholder' => 'Enter title...',
            'tooltip' => 'Elevate page clarity and visual hierarchy using section titles. Optionally skip for not displaying this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-cta/#section-description'
        ],
        [
            'type' => 'text-editor',
            'name' => 'subtitle',
            'label' => 'Subtitle',
            'placeholder' => 'Enter subtitle...',
            'tooltip' => 'Add concise text to clarify section content, enhancing context and user understanding. You can skip this if you don`t wish to display this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-cta/#section-description'
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
            'label' => 'CTA Settings',
            'collapse' => false
        ],
        [
            'type' => 'select',
            'name' => 'type',
            'label' => 'CTA type',
            'container_class' => 'col-sm-6',
            'options' =>  [
                [
                    'name' => 'Type 1 - Vertical aligned elements',
                    'value' => 'vertical'
                ],
                [
                    'name' => 'Type 2 - Horizontal aligned elements',
                    'value' => 'horizontal'
                ]
            ],
            'tooltip' => 'Choose the layout style for displaying your Call-to-Action (CTA) section.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-cta/#cta-settings'
        ],
        [
            'type' => 'select',
            'name' => 'style',
            'label' => 'CTA style',
            'container_class' => 'col-sm-6',
            'options' =>  [
                [
                    'name' => 'Default',
                    'value' => 'default'
                ],
                [
                    'name' => 'Boxed',
                    'value' => 'boxed'
                ]
            ],
            'tooltip' => 'Choose the style for displaying your Call-to-Action (CTA) section.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-cta/#cta-settings'
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
