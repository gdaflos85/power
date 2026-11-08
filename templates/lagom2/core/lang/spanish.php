<?php

return [
    'social' => [
        'social_network_acc'            => 'Ingresar con red social',
        'use_your_account'              => 'o usa tu cuenta',
        'not_member'                    => '¿No estás registrado?',
        'fill_form_below'               => 'o usa el siguiente formulario',
        'social_network_singnup'        => 'Usar red social (opcional)',
        "facebook"                      => 'Facebook',
        "twitter"                       => 'Twitter',
        "linkedin"                      => 'LinkedIn'
    ],

    'login' => [
        'already_registered'            => '¿Ya eres cliente?',
        'sign_in'                       => 'Ingresar',
        'reset_password'                => 'Reiniciar contraseña',
        'forgot'                        => '¿La olvidaste?',
        'at_least_pass'                 => 'mínimo 5 caracteres',
        'security_question'             => 'Pregunta de seguridad',
    ],
    'time' => [
        'days'                                      => 'Days',
        'hours'                                     => 'Hours',
        'minutes'                                   => 'Minutes',
        'seconds'                                   => 'Seconds',
        'hours_short'                               => 'Hrs',
        'minutes_short'                             => 'Min',
        'seconds_short'                             => 'Sec',
    ],

    'support' => [
        'available_departments'         => 'Sector',
        'select_file'                   => 'Subir archivo',
        'no_file_selected'              => 'No seleccionaste ningún archivo',
        'sensitive_data'                => 'Sensitive Data',
        'sensitive_data_ticket'         => 'Ticket Sensitive Data',
        'sensitive_data_ticket_desc'    => 'Use this field to post sensitive data like SFTP/FTP access, WHMCS admin area login details, etc. <strong> Data posted in this field will be securely stored and encrypted.</strong> You’ll be able to edit and remove this field in the ticket page.',
        'sensitive_data_tooltip'        => 'Sensitive Data assigned to this ticket'
    ],

    'billing' => [
        'view_quote'                    => 'Ver presupuesto',
        'subscribe'                     => 'Suscribir',
        'invoice' => [
            'bank_transfer_details'     => 'Bank Transfer Details',
        ],
    ],
        
    'darkmode' => [
        'enable'                        => 'Switch to Dark Mode',
        'disable'                       => 'Switch to Light Mode',
    ],

    'promocode' => [
        'header_label'                  =>'Promo code has been applied to your session!',
        'header_tooltip'                =>'The promo code has been added to your cart and will be applied to the eligible product at checkout.',
    ],

    'nodata' => [
        'no_recent_tickets'             => 'Sin solicitudes (tickets) recientes',
        'no_active_services'            => 'Sin servicios activos',
        'no_unpaid_invoices'            => 'Sin facturas impagas',
        'no_recent_news'                => 'No hay noticias recientes',
        'upgrade_not_available'         => 'Cambio de plan no disponible',
    ],

    'order' =>  [
        'period' => [
            'short' => [
                'monthly'               => 'mensual',
                'quarterly'             => 'trimestral',
                'semiannually'          => 'semestral',
                'annually'              => 'anual',
                'annually_multi'        => 'anuales',
                'biennially'            => 'bianual',
                'triennially'           => 'trianual',
                'period'                => 'período',
            ],   
        ],
        'price_save'                    => 'Guardar',
        'taxes'                         => 'Impuestos',
        'search_domain'                 => 'Buscar dominio',
        'try_again'                     => 'Try Again',
        'additional_services'           => 'Servicios adicionales',
        'start_shopping'                => 'Comenzar',
        'order_placed'                  => 'Pedido realizado',
        'featured'                      => 'Destacado',
        'change_domains_ipstag'         => 'Please ensure that you change your domains IPSTAG once you have placed this order and not before, the tag will be in your order confirmation email.',
        'domain_from_cart'              => 'Domain From Cart',
        'use_own_domain'                => 'Use Own Domain',
        'servername_example'            => 'servername.example.com',
        'product_selected'              => 'Selected Product',
        'assign_addons'                 => 'Assign Addons to the Domain',
        'renew_all'                     => 'Renew All',
        'renew_domains'                 => 'Renew Your Domains',
        'renew_all_success'             => 'All Domains Have Been Added to the Cart',
        'renew_all_desc'                => 'You have <b>%s domains up for renewal</b>. Renew them all at once to ensure continuous service and avoid interruptions. Click button to add them to the cart.</span>',
        'free_domain_terms' => [
            'title'                     => 'Free Domain Registration Details',
            'available_for_cycles'      => 'Available for selected product billing cycles',
            'one_type_product'          => 'Available only with the first product of this category in your order.'
        ]
    ],

    'market_connect' => [
        'order'                         => 'Ver mas',
    ],

    'generals' => [
        'my_dashboard'                  => 'Mi panel',
        'all_entries'                   => 'Todos',
        'contact_details'               => 'Detalles de contacto',
        'receive_emails'                => 'Recibir mails',
        'menu'                          => 'Menú',
        'enable'                        => 'Activar',
        'add_new'                       => 'Añadir nuevo',
        "what_new"                      => "Qué hay de nuevo",
        "currency"                      => "Moneda",
        "clear_filters"                 => "Clear Filters"
    ],

    'affiliates' => [
        'visitors' => [
            'title'                     => 'Analizamos las visitas',
            'desc'                      => "Realizamos un seguimiento de los visitantes que nos remite utilizando cookies, por lo que no tienen que comprar instantáneamente para que usted reciba su comisión.",
            'info'                      => 'Las cookies duran hasta 90 dias desde la primer visita.',
        ],
        'pay_commissions' => [
            'title'                     => 'Comisiones rápidas',
            'desc'                      => 'Pagamos comisiones por cada alta realizada desde tu enlace.',
            'info'                      => 'Si queres saber mas, por favor',
        ], 
    ],

    'domains' => [
        'domains_selected'              => 'dominio(s) seleccionado',
        'domains_hosting' => [
            'title'                     => 'Assign hosting package to start building your website with few simple steps!',
            'desc'                      => 'Domain name has <a href="/cart.php">no hosting assigned</a>, click below button to quickly assign hosting package.',
            'btn_text'                  => 'Add Hosting Package',
        ],
    ],

    'homepage' => [
        'find_domain'  => [
            'title'                     => 'Busque el Nombre de Dominio Perfecto',
            'example_domain'            => 'ej: ejemplo.com',
            'search'                    => 'Buscar',
        ],
        'products'  => [
            'title'                     => 'Productos Para Todos los Negocios',
            'product_btn'               => 'Empieza ahora'
        ],
        'latest_news'  => [
            'title'                     => 'Últimas Noticias',
            'subtitle'                  => '¡Consulta nuestras últimas novedades y ofertas!',
            'read_more'                 => 'Lee más',
        ],
        'testimonials'  => [
            'title'                     => 'Nuestros clientes dicen',
            'subtitle'                  => 'Descubra por qué más de 35.000 clientes en todo el mundo confían en nosotros',
        ],
        'features' => [
            'title'                     => 'Nuestras Garantías',
            'subtitle'                  => 'Descubra por qué más de 35.000 clientes en todo el mundo confían en nosotros',
            'feature-1' => [
                'title'                 => 'Soporte Experto',
                'desc'                  => 'Supervisa proactivamente y le alerta sobre cualquier malware que se detecte en su sitio web.'
            ],
            'feature-2' => [
                'title'                 => 'Rápido y confiable',
                'desc'                  => 'Si un análisis encuentra algo, SiteLock eliminará de forma segura cualquier malware conocido automáticamente.'
            ],
            'feature-3' => [
                'title'                 => 'Super fácil de usar',
                'desc'                  => 'Comprueba automáticamente sus aplicaciones para asegurarse de que estén actualizadas y protegidas contra vulnerabilidades conocidas.'
            ],
            'feature-4' => [
                'title'                 => '100% tiempo de actividad garantizado',
                'desc'                  => 'Obtenga protección contra las 10 principales fallas de seguridad de aplicaciones web reconocidas por OWASP, el Proyecto de seguridad de aplicaciones web abiertas.'
            ],
            'feature-5' => [
                'title'                 => 'Servidores Seguros',
                'desc'                  => 'El firewall de aplicaciones web TrueShield™ protege su sitio web contra piratas informáticos y ataques.'
            ],
            'feature-6' => [
                'title'                 => 'Garantía de devolución del dinero',
                'desc'                  => 'Los análisis diarios ayudan a detectar malware antes de que los motores de búsqueda tengan la oportunidad de encontrarlo y poner su sitio en la lista negra.',
            ],
            'feature-7' => [
                'title'                 => 'Alto Rendimiento',
                'desc'                  => 'La configuración instantánea y totalmente automatizada le brinda protección de inmediato sin necesidad de instalar nada.'
            ],
            'feature-8' => [
                'title'                 => 'Red de entrega de contenidos',
                'desc'                  => 'Acelere su sitio web distribuyéndolo globalmente y sirviéndolo a sus visitantes desde la ubicación más cercana para velocidades de carga de página más rápidas dondequiera que estén.'
            ],
        ],
        'get_started' => [
            'title'                     => '¡Empecemos!',
            'subtitle'                  => 'Mauris blandit arcu nec tellus lobortis, vitae aliquam lectus varius. Nunc sed magna ac nisi ultrices aliquam a ac turpis. Proin sagittis vel ipsum vitae luctus.',
            'btn_contact_text'          => 'Contáctenos'
        ]
    ],
    'sslCertificates' => [
        'packages' => [
            'dv' => [
                "description"           => 'Domain validation only. Issued in minutes. Ideal for blogs, social media & personal websites.',
            ],
            'ov' => [
                "description"           => 'Basic identity verification. Ideal for small business websites and pages accepting sensitive information.',
            ],
            'ev' => [
                "description"           => 'Full identity verification. Ideal for Business & Ecommerce sites looking to provide maximum visitor confidence.',
            ],
        ],
    ],
    'sitebuilder' => [
        'banner' => [
            'title'                     => 'Crear un sitio web profesional. ¡Es Rápido y Fácil!',
            'desc'                      => 'Herramientas sencillas para sus grandes ideas.',
            'desc_1'                    => 'Comience hoy mismo la prueba gratuita de su sitio web.',
            'btn_pricing_text'          => 'Ver planes y precios'
        ],
        'packages' => [
            "features_subtitle"         => 'Cada paquete incluye estas increíbles características:',
        ],
        'templates' => [
            "show_more"                 => 'Mostrar más plantillas',
        ]
    ],
    'cpanelseo' => [
        'banner' => [
            'desc'                      => 'Let us ensure that people are finding out what makes YOUR company great from their searches online using cPanel SEO.',
        ],
        'seo_features'              => 'cPanel SEO Features',
        'seo_who_can'              => 'Who Can Use cPanel SEO?',
        'easier_way'                => 'Luckily, there is an easier way:',
        'easier_way_2'              => 'let us ensure that people are finding out what makes YOUR company great from their searches online using cPanel SEO.',
        'btn_pricing_text'          => 'View Plans & Pricing'
    ],
    'wptoolkit' => [
        'smart_updates' => [
            "title"                     => 'Actualizaciones inteligentes para WordPress',
        ],
    ],
    'footer_extended' => [
        "products"                      => 'Productos',
        "privacy_policy"                => 'Política de privacidad',
        "footer_desc"                   => '¡Ponte en contacto con nosotros!',
        "back_to_top"                   => 'Volver arriba',
    ],
    'extensions' => [
        "operating_hours"                      => 'Operating Hours:',
    ],
    'hide_incactive_services' => [
        'services' => [
            'hide'                      => 'Hide <b>%s</b> inactive services',
            'hidden'                    => '<b>%s</b> inactive services has been hidden',
            'hidden_plural'             => '<b>%s</b> inactive services have been hidden'
        ]
    ],
    'restock_notifier' => [
        'be_notified'                   => "You'll be notified!",
        'on_restock'                    => 'Notify on restock!'
    ],
    'manage_ssl' => [
        'issued'                        => "Issued"
    ],
    'threesixty' => [
        'url'                           => "URL",
        'location'                      => 'Location'
    ],
    'services' => [
        'trial_ends'                    => 'Trial Ends at:',
    ],
    'ox' => [
        'per_user'                      => 'per user',
    ],
    'upgrade' => [
        'max_value'                     => 'Max Value:'
    ]
];