<?php

return [
    'default_type' => true,
    'name' => 'Gallery',
    'slug' => 'screen-slider',
    'comingsoon' => true,
    'thumb' => 'thumb.png',
    'fields' => [
        [
            'type' => 'text',
            'name' => 'title',
            'label' => 'Title'
        ],
        [
            'type' => 'textarea',
            'name' => 'subtitle',
            'label' => 'Subtitle'
        ],
        [
            'type' => 'list', //list of items with title description and icon
            'name' => 'slides',
            'label' => 'slides',
        ],
        [
            'type' => 'number',
            'name' => 'slide_width',
            'label' => 'Slide Witdh in px (type 0 for auto)',
            'range' => [
                'start' => 520,
                'min' => 0,
                'max' => 9999,
            ],
            'container_class' => 'col-sm-6'
        ],
        [
            'type' => 'number',
            'name' => 'slide_height',
            'label' => 'Slide Height in px (type 0 for auto)',
            'range' => [
                'start' => 360,
                'min' => 0,
                'max' => 9999,
            ],
            'container_class' => 'col-sm-6'
        ],
        [
            'type' => 'text',
            'name' => 'slides_custom_classes',
            'label' => 'Slides Custom Class'
        ],
        [
            'type' => 'buttons',
            'name' => 'buttons',
            'label' => 'Section Actions'
        ],
        [   // Section anchor
            'type' => 'text',
            'name' => 'section_anchor',
            'label' => 'Section anchor',
            'placeholder' => 'Enter anchor...',
            'tooltip' => 'Lorem Ipsum <a href="#">Learn More</a>'
        ],
        [
            'type' => 'text',
            'name' => 'custom_class',
            'label' => 'Section Custom Class'
        ]
    ]
];
