<?php
/**
 * WHMCS Hook: SEO Structured Data (Schema.org JSON-LD)
 * Power Hosting - Professional Services & Local Business
 */

if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}

add_hook('ClientAreaHeadOutput', 1, function($vars) {
    $uri = $_SERVER['REQUEST_URI'];
    
    // 1. Βασικό Schema Επιχείρησης (Organization & LocalBusiness)
    $schema = [
        '@context' => 'https://schema.org',
        '@type' => 'ProfessionalService',
        'name' => 'Power Hosting',
        'image' => 'https://www.powerhosting.gr/logo-powerhosting.png',
        'url' => 'https://www.powerhosting.gr',
        'telephone' => '+306937329543',
        'priceRange' => '€€',
        'address' => [
            '@type' => 'PostalAddress',
            'streetAddress' => 'Μακρή Χρήστου 28, Αμπελόκηποι',
            'addressLocality' => 'Ιωάννινα',
            'postalCode' => '45445',
            'addressCountry' => 'GR'
        ],
        'geo' => [
            '@type' => 'GeoCoordinates',
            'latitude' => 39.6650,
            'longitude' => 20.8537
        ],
        'openingHoursSpecification' => [
            '@type' => 'OpeningHoursSpecification',
            'dayOfWeek' => [
                'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
            ],
            'opens' => '00:00',
            'closes' => '23:59'
        ],
        'sameAs' => [
            'https://www.facebook.com/powerhosting.gr'
        ]
    ];

    $extraSchemas = [];

    // 2. Εξειδικευμένο Schema για τη σελίδα Κατασκευής Eshop
    if (strpos($uri, 'kataskevi-eshop') !== false) {
        $extraSchemas[] = [
            '@context' => 'https://schema.org',
            '@type' => 'Service',
            'name' => 'Κατασκευή Eshop',
            'serviceType' => 'E-commerce Development',
            'provider' => [
                '@type' => 'LocalBusiness',
                'name' => 'Power Hosting'
            ],
            'areaServed' => [
                '@type' => 'Country',
                'name' => 'Greece'
            ],
            'description' => 'Ολοκληρωμένη κατασκευή ηλεκτρονικών καταστημάτων (e-shop) σε OpenCart και WooCommerce με ταχύτητα, ασφάλεια και SEO.',
            'offers' => [
                '@type' => 'Offer',
                'price' => '900.00',
                'priceCurrency' => 'EUR',
                'availability' => 'https://schema.org/InStock'
            ]
        ];
    }

    // 3. Εξειδικευμένο Schema για την Πανελλαδική Σελίδα Κατασκευής Ιστοσελίδων
    if (strpos($uri, 'kataskevi-istoselidon') !== false) {
        $extraSchemas[] = [
            '@context' => 'https://schema.org',
            '@type' => 'Service',
            'name' => 'Κατασκευή Ιστοσελίδων',
            'serviceType' => 'Web Design & Development',
            'provider' => [
                '@type' => 'LocalBusiness',
                'name' => 'Power Hosting'
            ],
            'areaServed' => [
                '@type' => 'Country',
                'name' => 'Greece'
            ],
            'description' => 'Επαγγελματική σχεδίαση και κατασκευή ιστοσελίδων πανελλαδικά σε WordPress με μοναδικό design, ταχύτητα NVMe και πλήρη βελτιστοποίηση SEO.',
            'offers' => [
                '@type' => 'Offer',
                'price' => '500.00',
                'priceCurrency' => 'EUR',
                'availability' => 'https://schema.org/InStock'
            ]
        ];
    }

    // 4. Εξειδικευμένο Schema για Τοπικές Σελίδες Πόλεων (Local SEO)
    $localCities = [
        'ioannina' => [
            'name' => 'Ιωάννινα',
            'area' => 'Ιωάννινα, Ήπειρος, Ελλάδα',
            'desc' => 'Επαγγελματική σχεδίαση και κατασκευή ιστοσελίδων στα Ιωάννινα με WordPress, μοναδικό design, ταχύτητα NVMe και άμεση τοπική υποστήριξη.'
        ],
        'arta' => [
            'name' => 'Άρτα',
            'area' => 'Άρτα, Ήπειρος, Ελλάδα',
            'desc' => 'Επαγγελματική σχεδίαση και κατασκευή ιστοσελίδων στην Άρτα. Σύγχρονο web design, ταχύτατη φιλοξενία, SEO και τοπική υποστήριξη για επιχειρήσεις.'
        ],
        'preveza' => [
            'name' => 'Πρέβεζα',
            'area' => 'Πρέβεζα, Ήπειρος, Ελλάδα',
            'desc' => 'Κατασκευή ιστοσελίδων και eshop στην Πρέβεζα & Πάργα. Εξειδίκευση σε τουριστικές ιστοσελίδες (ξενοδοχεία, ενοικιαζόμενα δωμάτια, βίλες), εστίαση και επιχειρήσεις.'
        ],
        'thessaloniki' => [
            'name' => 'Θεσσαλονίκη',
            'area' => 'Θεσσαλονίκη, Κεντρική Μακεδονία, Ελλάδα',
            'desc' => 'Επαγγελματική κατασκευή ιστοσελίδων στη Θεσσαλονίκη από 500€. Σύγχρονος σχεδιασμός WordPress & WooCommerce, κορυφαία ταχύτητα NVMe και SEO.'
        ],
        'patra' => [
            'name' => 'Πάτρα',
            'area' => 'Πάτρα, Δυτική Ελλάδα, Ελλάδα',
            'desc' => 'Ολοκληρωμένη κατασκευή ιστοσελίδων και eshop στην Πάτρα. Υψηλή ταχύτητα, mobile-friendly design σε WordPress και στοχευμένη προώθηση SEO.'
        ],
        'larissa' => [
            'name' => 'Λάρισα',
            'area' => 'Λάρισα, Θεσσαλία, Ελλάδα',
            'desc' => 'Σχεδιασμός και κατασκευή ιστοσελίδων στη Λάρισα & Θεσσαλία. Επαγγελματικές λύσεις για εμπορικές και τοπικές επιχειρήσεις με ταχύτητα και SEO.'
        ],
        'kerkyra' => [
            'name' => 'Κέρκυρα',
            'area' => 'Κέρκυρα, Ιόνια Νησιά, Ελλάδα',
            'desc' => 'Κατασκευή ιστοσελίδων στην Κέρκυρα. Εξειδικευμένο web design για τουρισμό, βίλες, ξενοδοχεία, συστήματα κρατήσεων και τοπικές επιχειρήσεις.'
        ]
    ];

    if (strpos($uri, 'kataskevi-istoselidas-') !== false && strpos($uri, 'kataskevi-istoselidon') === false) {
        $matchedCity = null;
        foreach ($localCities as $cityKey => $cityData) {
            if (strpos($uri, 'kataskevi-istoselidas-' . $cityKey) !== false) {
                $matchedCity = $cityData;
                break;
            }
        }

        if (!$matchedCity) {
            $matchedCity = $localCities['ioannina'];
        }

        $extraSchemas[] = [
            '@context' => 'https://schema.org',
            '@type' => 'Service',
            'name' => 'Κατασκευή Ιστοσελίδων ' . $matchedCity['name'],
            'serviceType' => 'Web Design & Development',
            'provider' => [
                '@type' => 'LocalBusiness',
                'name' => 'Power Hosting',
                'url' => 'https://www.powerhosting.gr',
                'telephone' => '+306937329543'
            ],
            'areaServed' => [
                '@type' => 'AdministrativeArea',
                'name' => $matchedCity['area']
            ],
            'description' => $matchedCity['desc'],
            'offers' => [
                '@type' => 'Offer',
                'price' => '500.00',
                'priceCurrency' => 'EUR',
                'availability' => 'https://schema.org/InStock'
            ]
        ];
    }

    // 4. FAQ Schema for AI Search Engines & Google AI Overviews
    $faqSchema = [
        '@context' => 'https://schema.org',
        '@type' => 'FAQPage',
        'mainEntity' => [
            [
                '@type' => 'Question',
                'name' => 'Πόσο κοστίζει η κατασκευή eshop από την Power Hosting;',
                'acceptedAnswer' => [
                    '@type' => 'Answer',
                    'text' => 'Η κατασκευή ενός ολοκληρωμένου επαγγελματικού eshop από την Power Hosting ξεκινά από 900€ εφάπαξ, χωρίς συνδρομές, με πλήρη διασύνδεση τραπεζών, ERP και υποστήριξη.'
                ]
            ],
            [
                '@type' => 'Question',
                'name' => 'Τι είδους δίσκους και servers χρησιμοποιεί η Power Hosting;',
                'acceptedAnswer' => [
                    '@type' => 'Answer',
                    'text' => 'Η Power Hosting χρησιμοποιεί αποκλειστικά ταχύτατους δίσκους Enterprise NVMe SSD και LiteSpeed Web Server, παρέχοντας 99.9% uptime και κορυφαίες ταχύτητες.'
                ]
            ],
            [
                '@type' => 'Question',
                'name' => 'Ποια είναι τα στοιχεία επικοινωνίας και η έδρα της Power Hosting;',
                'acceptedAnswer' => [
                    '@type' => 'Answer',
                    'text' => 'Η Power Hosting εδρεύει στα Ιωάννινα (Μακρή Χρήστου 28, Αμπελόκηποι 45445) και παρέχει άμεση εξυπηρέτηση στο τηλέφωνο +30 693 732 9543 και στο email info@powerhosting.gr.'
                ]
            ]
        ]
    ];
    $extraSchemas[] = $faqSchema;

    // Παραγωγή του JSON-LD script & AI Discoverability Tags
    $output = "\n<!-- Power Hosting AI & SEO Optimization (Schema.org JSON-LD & llms.txt) -->\n";
    $output .= '<link rel="alternate" type="text/plain" href="https://www.powerhosting.gr/llms.txt" title="LLMs.txt" />' . "\n";
    $output .= '<link rel="alternate" type="text/plain" href="https://www.powerhosting.gr/llms-full.txt" title="LLMs-Full.txt" />' . "\n";
    $output .= '<script type="application/ld+json">' . json_encode($schema, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT) . "</script>\n";

    foreach ($extraSchemas as $extra) {
        $output .= '<script type="application/ld+json">' . json_encode($extra, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT) . "</script>\n";
    }

    return $output;
});
