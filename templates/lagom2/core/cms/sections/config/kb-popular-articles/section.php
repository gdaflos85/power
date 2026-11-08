<?php

return [
    'default_type' => true,
    'name' => 'KB Articles',
    'slug' => 'kb-popular-articles',
    'comingsoon' => true,
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
            'tooltip' => 'Lorem Ipsum <a href="#">Learn More</a>',
            'tooltip_url' => 'https://lagomowycms.com'
        ],
        [
            'type' => 'text',
            'name' => 'title',
            'label' => 'Title',
            'placeholder' => 'Enter title...',
            'tooltip' => 'Lorem Ipsum <a href="#">Learn More</a>',
            'tooltip_url' => 'https://lagomowycms.com'
        ],
        [
            'type' => 'text-editor',
            'name' => 'subtitle',
            'label' => 'Subtitle',
            'placeholder' => 'Enter subtitle...',
            'tooltip' => 'Lorem Ipsum <a href="#">Learn More</a>',
        ],
        [
            'type' => 'hidden',
            'name' => 'kb_popular_articles',
            'default' => true
        ],
        [
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'List Settings',
            'collapse' => false
        ],
        [
            'type' => 'select',
            'name' => 'list_style',
            'label' => 'Item Style',
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
            'tooltip' => 'Lorem Ipsum <a href="#">Learn More</a>'
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
            'tooltip' => 'Lorem Ipsum <a href="#">Learn More</a>'
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
            'tooltip' => 'Lorem Ipsum <a href="#">Learn More</a>'
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
            'tooltip' => 'Lorem Ipsum <a href="#">Learn More</a>'
        ],
        [
            'type' => 'text',
            'name' => 'section_anchor',
            'label' => 'Section anchor',
            'placeholder' => 'Enter anchor...',
            'tooltip' => 'Lorem Ipsum <a href="#">Learn More</a>'
        ],
        [
            'type' => 'text',
            'name' => 'custom_class',
            'label' => 'Section custom class',
            'placeholder' => 'Enter class...',
            'tooltip' => 'Lorem Ipsum <a href="#">Learn More</a>'
        ]
    ]
];