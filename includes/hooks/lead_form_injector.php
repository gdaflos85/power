<?php
/**
 * WHMCS Hook: Automatic Lead Generation Form Injector
 * Power Hosting - Web Design & Eshop Landing Pages
 * 
 * Automatically injects the "Εκδήλωση Ενδιαφέροντος" form into:
 * - /kataskevi-istoselidas
 * - /kataskevi-eshop
 * - /kataskevi-istoselidas-arta
 * - /kataskevi-istoselidas-preveza
 * - /kataskevi-istoselidas-thessaloniki
 * - /kataskevi-istoselidas-patra
 * - /kataskevi-istoselidas-larissa
 * - /kataskevi-istoselidas-kerkyra
 * - /kataskevi-istoselidas-ioannina
 * and any other city landing page.
 */

if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}

add_hook('ClientAreaFooterOutput', 1, function($vars) {
    $uri = $_SERVER['REQUEST_URI'] ?? '';
    
    // Check if current page is any of the target landing pages
    $isTargetPage = false;
    $targetKeywords = [
        'kataskevi-istoselidas',
        'kataskevi-eshop',
        'kataskevi-istoselidon'
    ];
    
    foreach ($targetKeywords as $kw) {
        if (stripos($uri, $kw) !== false) {
            $isTargetPage = true;
            break;
        }
    }
    
    if (!$isTargetPage) {
        return '';
    }

    // Determine current city context from URL
    $cityMap = [
        'arta'         => 'Άρτα',
        'preveza'      => 'Πρέβεζα',
        'thessaloniki' => 'Θεσσαλονίκη',
        'patra'        => 'Πάτρα',
        'larissa'      => 'Λάρισα',
        'kerkyra'      => 'Κέρκυρα',
        'ioannina'     => 'Ιωάννινα'
    ];
    
    $currentCity = 'Πανελλαδικά / Κεντρική';
    foreach ($cityMap as $slug => $cityName) {
        if (stripos($uri, $slug) !== false) {
            $currentCity = $cityName;
            break;
        }
    }

    $currentUrl = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? 'https' : 'http') . '://' . ($_SERVER['HTTP_HOST'] ?? 'www.powerhosting.gr') . $uri;

    return <<<HTML
<!-- ======================================================================= -->
<!-- POWER HOSTING - LEAD GENERATION FORM (ΕΚΔΗΛΩΣΗ ΕΝΔΙΑΦΕΡΟΝΤΟΣ)           -->
<!-- ======================================================================= -->
<section id="lead-form" class="site-section ph-lead-section">
    <div class="ph-lead-container">
        
        <div class="ph-lead-header">
            <span class="ph-lead-badge">Άμεση Επικοινωνία &amp; Προσφορά</span>
            <h2 class="ph-lead-title">Εκδήλωση Ενδιαφέροντος</h2>
            <div class="ph-lead-divider"></div>
            <p class="ph-lead-subtitle">
                Παρακαλούμε συμπληρώστε τη φόρμα και ένας εξειδικευμένος σύμβουλος της <strong>Power Hosting</strong> θα επικοινωνήσει άμεσα μαζί σας για να σχεδιάσουμε την ιδανική λύση για την επιχείρησή σας!
            </p>
        </div>

        <div class="ph-lead-card">
            <!-- Success Message (Hidden by default) -->
            <div id="ph-lead-success" class="ph-lead-alert ph-lead-alert-success" style="display: none;">
                <div class="ph-alert-icon">
                    <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>
                </div>
                <div class="ph-alert-content">
                    <h4 id="ph-lead-success-title">Το αίτημά σας παραλήφθηκε με επιτυχία!</h4>
                    <p id="ph-lead-success-msg">Ευχαριστούμε για την εκδήλωση ενδιαφέροντος. Ένας εκπρόσωπός μας θα επικοινωνήσει μαζί σας πολύ σύντομα.</p>
                </div>
            </div>

            <!-- Error Message (Hidden by default) -->
            <div id="ph-lead-error" class="ph-lead-alert ph-lead-alert-error" style="display: none;">
                <div class="ph-alert-icon">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="8" x2="12" y2="12"></line><line x1="12" y1="16" x2="12.01" y2="16"></line></svg>
                </div>
                <div class="ph-alert-content">
                    <p id="ph-lead-error-msg">Παρακαλούμε συμπληρώστε όλα τα απαραίτητα πεδία.</p>
                </div>
            </div>

            <form id="phLeadForm" method="POST" action="/lead_handler.php" novalidate>
                <!-- Hidden Tracking & Honeypot -->
                <input type="hidden" name="source_url" value="{$currentUrl}">
                <input type="hidden" name="source_city" value="{$currentCity}">
                <input type="text" name="website_hp" style="display:none !important; visibility:hidden !important;" tabindex="-1" autocomplete="off">

                <div class="ph-form-grid">
                    
                    <!-- 1. Ονοματεπώνυμο -->
                    <div class="ph-form-group ph-col-6">
                        <label for="ph_name" class="ph-label">Το όνομά σας <span class="ph-req">*</span></label>
                        <div class="ph-input-wrap">
                            <input type="text" id="ph_name" name="name" class="ph-input" placeholder="π.χ. Γιώργος Παπαδόπουλος" required>
                        </div>
                    </div>

                    <!-- 2. Email -->
                    <div class="ph-form-group ph-col-6">
                        <label for="ph_email" class="ph-label">Το email σας <span class="ph-req">*</span></label>
                        <div class="ph-input-wrap">
                            <input type="email" id="ph_email" name="email" class="ph-input" placeholder="π.χ. info@mybusiness.gr" required>
                        </div>
                    </div>

                    <!-- 3. Τηλέφωνο -->
                    <div class="ph-form-group ph-col-6">
                        <label for="ph_phone" class="ph-label">Το τηλέφωνό σας <span class="ph-req">*</span></label>
                        <div class="ph-input-wrap">
                            <input type="tel" id="ph_phone" name="phone" class="ph-input" placeholder="π.χ. 690 123 4567" required>
                        </div>
                    </div>

                    <!-- 4. Υπηρεσία -->
                    <div class="ph-form-group ph-col-6">
                        <label for="ph_service" class="ph-label">Τι είδους υπηρεσία σας ενδιαφέρει; <span class="ph-req">*</span></label>
                        <div class="ph-select-wrap">
                            <select id="ph_service" name="service" class="ph-select" required>
                                <option value="Κατασκευή Ιστοσελίδας">Κατασκευή Ιστοσελίδας (WordPress / Custom)</option>
                                <option value="Κατασκευή E-shop">Κατασκευή E-shop (WooCommerce)</option>
                                <option value="Ανακατασκευή / Redesign">Ανακατασκευή / Redesign Υπάρχουσας Σελίδας</option>
                                <option value="Προώθηση SEO & Google Ads">Προώθηση Ιστοσελίδας (SEO / Google Ads)</option>
                                <option value="Φιλοξενία NVMe / Servers">Ταχύτατη Φιλοξενία NVMe / Cloud VPS</option>
                                <option value="Άλλη Υπηρεσία">Άλλη Υπηρεσία</option>
                            </select>
                        </div>
                    </div>

                    <!-- 5. Είδος Επιχείρησης / Προϊόντα -->
                    <div class="ph-form-group ph-col-12">
                        <label for="ph_business" class="ph-label">Τι είδους Επιχείρηση, υπηρεσίες ή προϊόντα έχετε;</label>
                        <input type="text" id="ph_business" name="business_type" class="ph-input" placeholder="π.χ. Ξενοδοχείο, Τεχνική Εταιρεία, Κατάστημα Ένδυσης, Ιατρείο κ.λπ.">
                    </div>

                    <!-- 6. Υπάρχον Domain -->
                    <div class="ph-form-group ph-col-6">
                        <label for="ph_domain" class="ph-label">Αν έχετε ήδη ιστοσελίδα παρακαλώ γράψτε το domain:</label>
                        <input type="text" id="ph_domain" name="existing_domain" class="ph-input" placeholder="π.χ. www.mycompany.gr">
                    </div>

                    <!-- 7. Σελίδες Παραδείγματα -->
                    <div class="ph-form-group ph-col-6">
                        <label for="ph_ref_sites" class="ph-label">Σελίδες που σας αρέσουν ως παράδειγμα (domains):</label>
                        <input type="text" id="ph_ref_sites" name="reference_sites" class="ph-input" placeholder="π.χ. example1.com, example2.gr">
                    </div>

                    <!-- 8. Τρόπος Επικοινωνίας -->
                    <div class="ph-form-group ph-col-12">
                        <label for="ph_contact_method" class="ph-label">Με ποιον τρόπο θέλετε να επικοινωνήσουμε μαζί σας;</label>
                        <div class="ph-select-wrap">
                            <select id="ph_contact_method" name="contact_method" class="ph-select">
                                <option value="Τηλεφωνικά">📞 Τηλεφωνικά</option>
                                <option value="Μέσω Email">✉️ Μέσω Email</option>
                                <option value="Μέσω Viber / WhatsApp">💬 Μέσω Viber / WhatsApp</option>
                            </select>
                        </div>
                    </div>

                    <!-- 9. Σχόλια -->
                    <div class="ph-form-group ph-col-12">
                        <label for="ph_comments" class="ph-label">Σχόλια / Επιπλέον πληροφορίες για το project σας:</label>
                        <textarea id="ph_comments" name="comments" class="ph-textarea" rows="4" placeholder="Περιγράψτε μας συνοπτικά τις ανάγκες σας ή ό,τι άλλο θα θέλατε να γνωρίζουμε..."></textarea>
                    </div>

                    <!-- Submit Button -->
                    <div class="ph-form-group ph-col-12 ph-submit-wrap">
                        <button type="submit" id="phSubmitBtn" class="ph-btn-submit">
                            <span class="ph-btn-text">Αποστολή Αιτήματος &amp; Λήψη Προσφοράς</span>
                            <span class="ph-btn-icon">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
                            </span>
                            <span class="ph-spinner" style="display: none;"></span>
                        </button>
                        <p class="ph-privacy-note">🔒 Τα στοιχεία σας είναι 100% ασφαλή και χρησιμοποιούνται αποκλειστικά για την εξυπηρέτηση του αιτήματός σας.</p>
                    </div>

                </div>
            </form>
        </div>

    </div>
</section>

<!-- ======================================================================= -->
<!-- STYLING (Lagom 2 Tailored Design System)                                -->
<!-- ======================================================================= -->
<style>
/* 0. Hide default "Ας ξεκινήσουμε" CTA section on target landing pages */
.site-section.section-cta,
.section-cta-boxed,
.section-cta {
    display: none !important;
}

.ph-lead-section {
    background: linear-gradient(180deg, #f8fafc 0%, #edf2f7 100%);
    padding: 70px 20px 90px 20px;
    position: relative;
    border-top: 1px solid #e2e8f0;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
}
.ph-lead-container {
    max-width: 900px;
    margin: 0 auto;
}
.ph-lead-header {
    text-align: center;
    margin-bottom: 35px;
}
.ph-lead-badge {
    display: inline-block;
    background-color: #e0f2fe;
    color: #0052cc;
    font-size: 13px;
    font-weight: 700;
    padding: 6px 16px;
    border-radius: 50px;
    margin-bottom: 14px;
    text-transform: uppercase;
    letter-spacing: 0.8px;
}
.ph-lead-title {
    color: #10243e;
    font-size: 32px;
    font-weight: 800;
    margin: 0 0 12px 0;
    line-height: 1.25;
}
.ph-lead-divider {
    width: 60px;
    height: 4px;
    background: #0052cc;
    margin: 0 auto 16px auto;
    border-radius: 2px;
}
.ph-lead-subtitle {
    color: #475569;
    font-size: 16px;
    line-height: 1.6;
    max-width: 700px;
    margin: 0 auto;
}
.ph-lead-card {
    background: #ffffff;
    border-radius: 16px;
    box-shadow: 0 10px 30px -5px rgba(16, 36, 62, 0.08), 0 0 0 1px rgba(16, 36, 62, 0.04);
    padding: 40px;
    transition: box-shadow 0.3s ease;
}
@media (max-width: 768px) {
    .ph-lead-card {
        padding: 24px 18px;
    }
    .ph-lead-title {
        font-size: 26px;
    }
}
.ph-form-grid {
    display: flex;
    flex-wrap: wrap;
    margin: -10px;
}
.ph-form-group {
    padding: 10px;
    box-sizing: border-box;
}
.ph-col-6 {
    width: 50%;
}
.ph-col-12 {
    width: 100%;
}
@media (max-width: 768px) {
    .ph-col-6 {
        width: 100%;
    }
}
.ph-label {
    display: block;
    color: #1e293b;
    font-size: 14px;
    font-weight: 600;
    margin-bottom: 7px;
}
.ph-req {
    color: #e11d48;
    font-weight: bold;
}
.ph-input, .ph-select, .ph-textarea {
    width: 100%;
    box-sizing: border-box;
    padding: 12px 16px;
    font-size: 15px;
    color: #0f172a;
    background-color: #f8fafc;
    border: 1.5px solid #cbd5e1;
    border-radius: 10px;
    transition: all 0.2s ease;
    font-family: inherit;
}
.ph-input:focus, .ph-select:focus, .ph-textarea:focus {
    background-color: #ffffff;
    border-color: #0052cc;
    box-shadow: 0 0 0 4px rgba(0, 82, 204, 0.12);
    outline: none;
}
.ph-select-wrap {
    position: relative;
}
.ph-select {
    appearance: none;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%23475569' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 14px center;
    background-size: 16px;
    padding-right: 40px;
    cursor: pointer;
}
.ph-textarea {
    resize: vertical;
    min-height: 100px;
}
.ph-submit-wrap {
    text-align: center;
    margin-top: 15px;
}
.ph-btn-submit {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    background-color: #0052cc;
    color: #ffffff;
    font-size: 17px;
    font-weight: 700;
    padding: 16px 36px;
    border-radius: 12px;
    border: none;
    cursor: pointer;
    box-shadow: 0 6px 20px rgba(0, 82, 204, 0.35);
    transition: all 0.25s ease;
    width: 100%;
    max-width: 440px;
}
.ph-btn-submit:hover {
    background-color: #0043a8;
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(0, 82, 204, 0.45);
}
.ph-btn-submit:active {
    transform: translateY(0);
}
.ph-btn-submit:disabled {
    opacity: 0.7;
    cursor: not-allowed;
    transform: none;
}
.ph-btn-icon {
    margin-left: 10px;
    display: flex;
    align-items: center;
    transition: transform 0.2s ease;
}
.ph-btn-submit:hover .ph-btn-icon {
    transform: translateX(4px);
}
.ph-privacy-note {
    font-size: 12px;
    color: #64748b;
    margin-top: 14px;
}
.ph-spinner {
    display: inline-block;
    width: 20px;
    height: 20px;
    margin-left: 10px;
    border: 3px solid rgba(255,255,255,0.3);
    border-radius: 50%;
    border-top-color: #ffffff;
    animation: ph-spin 0.8s linear infinite;
}
@keyframes ph-spin {
    to { transform: rotate(360deg); }
}
.ph-lead-alert {
    display: flex;
    align-items: flex-start;
    padding: 16px 20px;
    border-radius: 10px;
    margin-bottom: 25px;
}
.ph-lead-alert-success {
    background-color: #ecfdf5;
    border: 1.5px solid #10b981;
    color: #065f46;
}
.ph-lead-alert-error {
    background-color: #fef2f2;
    border: 1.5px solid #f43f5e;
    color: #9f1239;
}
.ph-alert-icon {
    margin-right: 14px;
    flex-shrink: 0;
    padding-top: 2px;
}
.ph-alert-content h4 {
    margin: 0 0 4px 0;
    font-size: 16px;
    font-weight: 700;
}
.ph-alert-content p {
    margin: 0;
    font-size: 14px;
    line-height: 1.4;
}
</style>

<!-- ======================================================================= -->
<!-- JAVASCRIPT (Interactive AJAX + Smooth Scroll + GTM Tracking)           -->
<!-- ======================================================================= -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    var leadSection = document.getElementById('lead-form');
    if (!leadSection) return;

    // 1. Move the Lead Section right in place of "Ας ξεκινήσουμε" (section-cta) and remove that section
    var ctaSection = document.querySelector('.site-section.section-cta') || 
                     document.querySelector('.section-cta') || 
                     document.querySelector('.section-cta-boxed') ||
                     Array.from(document.querySelectorAll('.site-section, .section-box')).find(function(el) {
                         return (el.textContent || '').indexOf('Ας ξεκινήσουμε') !== -1;
                     });

    if (ctaSection && ctaSection.parentNode) {
        ctaSection.parentNode.insertBefore(leadSection, ctaSection);
        ctaSection.remove();
    } else {
        var footer = document.querySelector('footer') || document.querySelector('.app-footer') || document.querySelector('#footer');
        if (footer && footer.parentNode) {
            footer.parentNode.insertBefore(leadSection, footer);
        }
    }

    // 2. Intercept any "Εκδήλωση Ενδιαφέροντος" buttons on the page to smooth scroll here
    var allLinks = document.querySelectorAll('a, button');
    allLinks.forEach(function(el) {
        var text = (el.textContent || '').trim();
        var href = el.getAttribute('href') || '';
        
        if (text.indexOf('Εκδήλωση Ενδιαφέροντος') !== -1 || href.indexOf('#lead-form') !== -1) {
            el.addEventListener('click', function(e) {
                e.preventDefault();
                leadSection.scrollIntoView({ behavior: 'smooth', block: 'start' });
                var firstInput = document.getElementById('ph_name');
                if (firstInput) {
                    setTimeout(function() { firstInput.focus(); }, 600);
                }
            });
        }
    });

    // 3. AJAX Submission Handling
    var form = document.getElementById('phLeadForm');
    var submitBtn = document.getElementById('phSubmitBtn');
    var btnText = submitBtn.querySelector('.ph-btn-text');
    var btnIcon = submitBtn.querySelector('.ph-btn-icon');
    var spinner = submitBtn.querySelector('.ph-spinner');
    var successBox = document.getElementById('ph-lead-success');
    var errorBox = document.getElementById('ph-lead-error');
    var errorMsg = document.getElementById('ph-lead-error-msg');

    if (!form) return;

    form.addEventListener('submit', function(e) {
        e.preventDefault();
        
        // Hide previous messages
        successBox.style.display = 'none';
        errorBox.style.display = 'none';

        // Basic client validation
        var name = document.getElementById('ph_name').value.trim();
        var email = document.getElementById('ph_email').value.trim();
        var phone = document.getElementById('ph_phone').value.trim();

        if (!name || !email || !phone) {
            errorMsg.innerHTML = 'Παρακαλούμε συμπληρώστε όλα τα υποχρεωτικά πεδία (Όνομα, Email, Τηλέφωνο).';
            errorBox.style.display = 'flex';
            leadSection.scrollIntoView({ behavior: 'smooth', block: 'start' });
            return;
        }

        // Disable button & show spinner
        submitBtn.disabled = true;
        btnIcon.style.display = 'none';
        spinner.style.display = 'inline-block';

        var formData = new FormData(form);

        fetch('/lead_handler.php', {
            method: 'POST',
            body: formData
        })
        .then(function(res) {
            return res.json();
        })
        .then(function(data) {
            submitBtn.disabled = false;
            btnIcon.style.display = 'inline-flex';
            spinner.style.display = 'none';

            if (data.status === 'success') {
                // Success
                document.getElementById('ph-lead-success-msg').innerHTML = data.message;
                successBox.style.display = 'flex';
                form.reset();

                // Trigger Google Tag Manager & Google Analytics 4 Event
                if (window.dataLayer) {
                    window.dataLayer.push({
                        'event': 'lead_form_submitted',
                        'form_name': 'Εκδήλωση Ενδιαφέροντος',
                        'service_requested': formData.get('service'),
                        'source_city': formData.get('source_city')
                    });
                }

                // Smooth scroll to message
                successBox.scrollIntoView({ behavior: 'smooth', block: 'center' });
            } else {
                // Server returned error
                errorMsg.innerHTML = data.message || 'Παρουσιάστηκε σφάλμα κατά την αποστολή. Παρακαλούμε δοκιμάστε ξανά.';
                errorBox.style.display = 'flex';
            }
        })
        .catch(function(err) {
            submitBtn.disabled = false;
            btnIcon.style.display = 'inline-flex';
            spinner.style.display = 'none';
            errorMsg.innerHTML = 'Παρουσιάστηκε σφάλμα σύνδεσης. Παρακαλούμε δοκιμάστε ξανά ή καλέστε μας άμεσα στο 6937329543.';
            errorBox.style.display = 'flex';
        });
    });
});
</script>
HTML;
});
