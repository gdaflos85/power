<?php

add_hook('ClientAreaSidebars', 1, function($vars) {
    $primarySidebar = Menu::primarySidebar();

    if ($primarySidebar && !is_null($primarySidebar->getChild('Service Details Actions'))) {
        $serviceSidebar = $primarySidebar->getChild('Service Details Actions');
        if (!is_null($serviceSidebar->getChild('mg-wp-manager'))) {
            $serviceSidebar->getChild('mg-wp-manager')->setIcon('fab fa-wordpress');
        }
        if (!is_null($serviceSidebar->getChild('DNS Manager'))) {
            $serviceSidebar->getChild('DNS Manager')->setIcon('fa-ticket ls ls-input-code');
        }
    }
    if ($primarySidebar && !is_null($primarySidebar->getChild('mg-provisioning-module'))) {
        $provisioningSidebar = $primarySidebar->getChild('mg-provisioning-module');
        if (!is_null($provisioningSidebar->getChild('addonDomains'))){
            $provisioningSidebar->getChild('addonDomains')->setIcon('fa-ticket lm lm-globe');
        }
        if (!is_null($provisioningSidebar->getChild('applications'))){
            $provisioningSidebar->getChild('applications')->setIcon('fa-ticket ls ls-apps');
        }
        if (!is_null($provisioningSidebar->getChild('backups'))){
            $provisioningSidebar->getChild('backups')->setIcon('fa-ticket lm lm-backup');
        }
        if (!is_null($provisioningSidebar->getChild('databases'))){
            $provisioningSidebar->getChild('databases')->setIcon('fa-ticket ls ls-box');
        }
        if (!is_null($provisioningSidebar->getChild('dnsSettings'))){
            $provisioningSidebar->getChild('dnsSettings')->setIcon('fa-ticket ls ls-input-code');
        }
        if (!is_null($provisioningSidebar->getChild('ftp'))){
            $provisioningSidebar->getChild('ftp')->setIcon('fa-ticket lm lm-upload');
        }
        if (!is_null($provisioningSidebar->getChild('subdomains'))){
            $provisioningSidebar->getChild('subdomains')->setIcon('fa-ticket ls ls-ticket-tag');
        }
        if (!is_null($provisioningSidebar->getChild('emails'))){
            $provisioningSidebar->getChild('emails')->setIcon('fa-ticket ls ls-envelope');
        }
        if (!is_null($provisioningSidebar->getChild('emailForwarders'))){
            $provisioningSidebar->getChild('emailForwarders')->setIcon('fa-ticket lm lm-users');
        }
        if (!is_null($provisioningSidebar->getChild('spamFilter'))){
            $provisioningSidebar->getChild('spamFilter')->setIcon('fa-ticket ls ls-denial');
        }
        if (!is_null($provisioningSidebar->getChild('wordPressManager'))){
            $provisioningSidebar->getChild('wordPressManager')->setIcon('fab fa-wordpress');
        }
        if (!is_null($provisioningSidebar->getChild('ssl'))) {
            $provisioningSidebar->getChild('ssl')->setIcon('fa-ticket ls ls-padlock');
        }
        if (!is_null($provisioningSidebar->getChild('logRotation'))){
            $provisioningSidebar->getChild('logRotation')->setIcon('fa-ticket ls ls-document');
        }
        if (!is_null($provisioningSidebar->getChild('phpSettings'))){
            $provisioningSidebar->getChild('phpSettings')->setIcon('fa-ticket ls ls-configure');
        }
        if (!is_null($provisioningSidebar->getChild('gitRepositories'))){
            $provisioningSidebar->getChild('gitRepositories')->setIcon('fas fa-code-merge');
        }
        if (!is_null($provisioningSidebar->getChild('nodeJs'))){
            $provisioningSidebar->getChild('nodeJs')->setIcon('fab fa-node-js');
        }
        if (!is_null($provisioningSidebar->getChild('webUsers'))){
            $provisioningSidebar->getChild('webUsers')->setIcon('fa-ticket lm lm-users');
        }
        if (!is_null($provisioningSidebar->getChild('domainAliases'))){
            $provisioningSidebar->getChild('domainAliases')->setIcon('fas fa-browser');
        }
        if (!is_null($provisioningSidebar->getChild('wordPressToolkit'))){
            $provisioningSidebar->getChild('wordPressToolkit')->setIcon('fa-ticket fab fa-wordpress');
        }
        if ($primarySidebar && !is_null($primarySidebar->getChild('one-click-login'))) {
            $serviceSidebar = $primarySidebar->getChild('one-click-login');
            if (!is_null($serviceSidebar->getChild('pleskBackupLogin'))) {
                $serviceSidebar->getChild('pleskBackupLogin')->setIcon('fas fa-ticket lm lm-backup');
            }
            if (!is_null($serviceSidebar->getChild('plesk'))) {
                $serviceSidebar->getChild('plesk')->setIcon('fas fa-ticket ls ls-addon');
            }
            if (!is_null($serviceSidebar->getChild('pleskWordPressToolkit'))) {
                $serviceSidebar->getChild('pleskWordPressToolkit')->setIcon('fa-ticket fab fa-wordpress');
            }
        }
        if ($primarySidebar && !is_null($primarySidebar->getChild('mg-wordpress-manager-list'))) {
            $serviceSidebar = $primarySidebar->getChild('mg-wordpress-manager-list');
            if (!is_null($serviceSidebar->getChild('mg-wordpress-manager-install-2'))) {
                $serviceSidebar->getChild('mg-wordpress-manager-install-2')->setIcon('fas fa-ticket ls ls-sign-in');
            }
        }

    }
});