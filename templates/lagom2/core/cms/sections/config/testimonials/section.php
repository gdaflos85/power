<?php

return [
    'default_type' => true,
    'name' => 'Testimonials',
    'slug' => 'testimonials',
    
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
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-testimonials/#section-description'
        ],
        [
            'type' => 'text',
            'name' => 'title',
            'label' => 'Title',
            'placeholder' => 'Enter title...',
            'tooltip' => 'Elevate page clarity and visual hierarchy using section titles. Optionally skip for not displaying this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-testimonials/#section-description'
        ],
        [
            'type' => 'text',
            'name' => 'subtitle',
            'label' => 'Subtitle',
            'placeholder' => 'Enter subtitle...',
            'tooltip' => 'Add concise text to clarify section content, enhancing context and user understanding. You can skip this if you don`t wish to display this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-testimonials/#section-description'
        ],
        [
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Testimonial List',
            'collapse' => false
        ],
        [
            'type' => 'testimonial',
            'name' => 'testimonials',
            'label' => 'Testimonial items',
            'tooltip' => 'Present the list of generated testimonials that will appear on the edited website page. This list offers the convenience to arrange items by dragging and dropping, allowing you to adjust their sequence.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-testimonials/#testimonials-list'
        ],
        [
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Testimonial Settings',
            'collapse' => false
        ],
        [
            'type' => 'select',
            'name' => 'type',
            'label' => 'Testimonial type',
            'container_class' => 'col-sm-6',
            'options' => [
                [
                    'name' => 'Type 1 - Full width infinite slider',
                    'value' => 'type-1'
                ],
                [
                    'name' => 'Type 2 - Infinite slider with left/right arrows',
                    'value' => 'type-2'
                ],
                [
                    'name' => 'Type 3 - Single testimonial slider with bottom navigation',
                    'value' => 'type-3'
                ],
                [
                    'name' => 'Type 4 - Grid layout',
                    'value' => 'type-4'
                ]
            ],
            'tooltip' => 'Select from a variety of "testimonial" formats, each presenting testimonial boxes in a distinct manner.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-testimonials/#testimonial-type'
        ],
        [
            'type' => 'select',
            'name' => 'style',
            'label' => 'Testimonial item style',
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
                ]
            ],
            'tooltip' => 'Select from a variety of "testimonial" styles, and opt for the one that best aligns with the aesthetic of your website.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-testimonials/#testimonial-style'
        ],
        [
            'type' => 'checkbox',
            'name' => 'testimonials_shuffle',
            'label' => 'Shuffle testimonials',
            'label_attributes' => [
                [
                    'name' => 'toggle',
                    'value' => 'lu-collapse'
                ],
                [
                    'name' => 'target',
                    'value' => '#shuffle_testimonials'
                ],
            ],
            'tooltip' => 'Upon activating system will autonomously select random testimonials from the list of created endorsements, ensuring a unique set of testimonials with each page refresh. The specified number should be lesser than the total count of generated "Testimonial" items.'
        ],
        [
            'type' => 'number',
            'name' => 'testimonials_shuffle_number',
            'label' => 'Number of testimonials shuffle',
            'container_id' => 'shuffle_testimonials',
            'container_collapse' => true,
            'container_collapse_target' => 'testimonials_shuffle',
            'range' => [
                'min' => 1,
            ],
            'tooltip' => 'Please input the desired number of testimonials to be displayed. Please ensure that the number provided is smaller than the total number of available testimonial items.'
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
        [   // Section anchor
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
