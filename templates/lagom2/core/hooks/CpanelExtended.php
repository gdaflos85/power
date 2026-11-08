<?php

add_hook('ClientAreaSidebars', 1, function($vars) {
    $primarySidebar = Menu::primarySidebar();

    if ($primarySidebar && !is_null($primarySidebar->getChild('Manage Account'))) {
        $provisioningSidebar = $primarySidebar->getChild('Manage Account');
        if (!is_null($provisioningSidebar->getChild('addon_domains'))){
            $provisioningSidebar->getChild('addon_domains')->setIcon('fa-ticket lm lm-globe');
        }
        if (!is_null($provisioningSidebar->getChild('install_app'))){
            $provisioningSidebar->getChild('install_app')->setIcon('fa-ticket ls ls-apps');
        }
        if (!is_null($provisioningSidebar->getChild('backups'))){
            $provisioningSidebar->getChild('backups')->setIcon('fa-ticket lm lm-backup');
        }
        if (!is_null($provisioningSidebar->getChild('files'))){
            $provisioningSidebar->getChild('files')->setIcon('fa-ticket ls ls-document');
        }
        if (!is_null($provisioningSidebar->getChild('ftp'))){
            $provisioningSidebar->getChild('ftp')->setIcon('fa-ticket lm lm-upload');
        }
        if (!is_null($provisioningSidebar->getChild('subDomains'))){
            $provisioningSidebar->getChild('subDomains')->setIcon('fa-ticket ls ls-ticket-tag');
        }
        if (!is_null($provisioningSidebar->getChild('cron'))) {
            $provisioningSidebar->getChild('cron')->setIcon('fa-ticket ls ls-hourglass');
        }
        if (!is_null($provisioningSidebar->getChild('autoresponders'))){
            $provisioningSidebar->getChild('autoresponders')->setIcon('fa-ticket ls ls-reply');
        }
        if (!is_null($provisioningSidebar->getChild('diskUsage'))){
            $provisioningSidebar->getChild('diskUsage')->setIcon('fa-ticket lm lm-line-graph');
        }
        if (!is_null($provisioningSidebar->getChild('zoneEditor'))){
            $provisioningSidebar->getChild('zoneEditor')->setIcon('fa-ticket ls ls-pen');
        }
        if (!is_null($provisioningSidebar->getChild('parked_domains'))){
            $provisioningSidebar->getChild('parked_domains')->setIcon('fa-ticket ls ls-edit');
        }
        if (!is_null($provisioningSidebar->getChild('forward_domains'))) {
            $provisioningSidebar->getChild('forward_domains')->setIcon('fa-ticket ls ls-new-window');
        }
        if (!is_null($provisioningSidebar->getChild('emails'))) {
            $provisioningSidebar->getChild('emails')->setIcon('fa-ticket lm lm-users');
        }
        if (!is_null($provisioningSidebar->getChild('version_control'))){
            $provisioningSidebar->getChild('version_control')->setIcon('fas fa-code-merge');
        }
        if (!is_null($provisioningSidebar->getChild('ip_blocker'))){
            $provisioningSidebar->getChild('ip_blocker')->setIcon('fa-ticket lm lm-minus-circle');
        }
        if (!is_null($provisioningSidebar->getChild('jetBackups'))){
            $provisioningSidebar->getChild('jetBackups')->setIcon('fa-ticket lm lm-backup');
        }
        if (!is_null($provisioningSidebar->getChild('emails_forwarders'))){
            $provisioningSidebar->getChild('emails_forwarders')->setIcon('fas fa-users-cog');
        }
        if (!is_null($provisioningSidebar->getChild('mailing_lists'))){
            $provisioningSidebar->getChild('mailing_lists')->setIcon('fa-ticket ls ls-check-underline');
        }
        if (!is_null($provisioningSidebar->getChild('webalizer'))){
            $provisioningSidebar->getChild('webalizer')->setIcon('fas fa-chart-area');
        }
        if (!is_null($provisioningSidebar->getChild('modSecurity'))){
            $provisioningSidebar->getChild('modSecurity')->setIcon('fa-ticket ls ls-shield');
        }
        if (!is_null($provisioningSidebar->getChild('mx'))){
            $provisioningSidebar->getChild('mx')->setIcon('fa-ticket ls ls-arrow-down-right-thin');
        }
        if (!is_null($provisioningSidebar->getChild('postgresql_database'))){
            $provisioningSidebar->getChild('postgresql_database')->setIcon('fa-ticket lm lm-database');
        }
        if (!is_null($provisioningSidebar->getChild('phpVersion'))){
            $provisioningSidebar->getChild('phpVersion')->setIcon('fa-ticket ls ls-document-info');
        }
        if (!is_null($provisioningSidebar->getChild('databases'))){
            $provisioningSidebar->getChild('databases')->setIcon('fa-ticket lm lm-database');
        }
        if (!is_null($provisioningSidebar->getChild('subdomains'))){
            $provisioningSidebar->getChild('subdomains')->setIcon('fa-ticket lm lm-tool');
        }
        if (!is_null($provisioningSidebar->getChild('manage_ssl'))){
            $provisioningSidebar->getChild('manage_ssl')->setIcon('fa-ticket ls ls-padlock');
        }
        if (!is_null($provisioningSidebar->getChild('ssh'))){
            $provisioningSidebar->getChild('ssh')->setIcon('fa-ticket lm lm-shield');
        }
        if (!is_null($provisioningSidebar->getChild('unbanonlogin'))){
            $provisioningSidebar->getChild('unbanonlogin')->setIcon('fa-ticket ls ls-denial');
        }
        if (!is_null($provisioningSidebar->getChild('user_manager'))){
            $provisioningSidebar->getChild('user_manager')->setIcon('fa-ticket ls ls-configure');
        }
        if (!is_null($provisioningSidebar->getChild('email_deliverability'))){
            $provisioningSidebar->getChild('email_deliverability')->setIcon('fa-ticket ls ls-envelope');
        }
        if (!is_null($provisioningSidebar->getChild('wordPressManager'))){
            $provisioningSidebar->getChild('wordPressManager')->setIcon('fab fa-wordpress');
        }
        if (!is_null($provisioningSidebar->getChild('wordpress_toolkit'))){
            $provisioningSidebar->getChild('wordpress_toolkit')->setIcon('fab fa-wordpress');
        }
        if (!is_null($provisioningSidebar->getChild('remoteMySql'))){
            $provisioningSidebar->getChild('remoteMySql')->setIcon('fas fa-ticket ls ls-edit');
        }
    }
    if ($primarySidebar && !is_null($primarySidebar->getChild('One Click Login'))) {
        $provisioningSidebar = $primarySidebar->getChild('One Click Login');
        if (!is_null($provisioningSidebar->getChild('cpanel_login'))) {
            $provisioningSidebar->getChild('cpanel_login')->setIcon('fas fa-ticket ls ls-apps');
        }
        if (!is_null($provisioningSidebar->getChild('fileslogin'))) {
            $provisioningSidebar->getChild('fileslogin')->setIcon('fa-ticket ls ls-folder');
        }
        if (!is_null($provisioningSidebar->getChild('phpmyadmin'))) {
            $provisioningSidebar->getChild('phpmyadmin')->setIcon('fa-ticket ls ls-dashboard');
        }
        if (!is_null($provisioningSidebar->getChild('rvsitebuilderlogin'))) {
            $provisioningSidebar->getChild('rvsitebuilderlogin')->setIcon('fa-ticket ls ls-addon');
        }
        if (!is_null($provisioningSidebar->getChild('webmail_login'))) {
            $provisioningSidebar->getChild('webmail_login')->setIcon('fa-ticket ls ls-envelope');
        }
        if (!is_null($provisioningSidebar->getChild('wpt_login'))) {
            $provisioningSidebar->getChild('wpt_login')->setIcon('fab fa-wordpress');
        }
    }
});
