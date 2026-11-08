<?php

if(!defined('SOFTACULOUS')){
	die('Unauthorized access');
}

$GLOBALS['softaculous_wordpress']['license'] = 'WPMAN-52862-60872-10586-77911';

// Include product ids which you want to use this module with
// If empty will be enabled for all supported module types e.g. cPanel
$GLOBALS['softaculous_wordpress']['conf']['pids'] = array();

// Exclude product ids which you do not want to use this module with
$GLOBALS['softaculous_wordpress']['conf']['exclude_pids'] = array();

// Auto Update - 0 to enable updates - 1 to disable updates
$GLOBALS['softaculous_wordpress']['conf']['disable_auto_update'] = 0;

// Set connection protocol
$GLOBALS['softaculous_wordpress']['conf']['protocol'] = '';

// Set the div-id after which you want softaculous to load
$GLOBALS['softaculous_wordpress']['conf']['custom_divid'] = '';

// Set connection port
$GLOBALS['softaculous_wordpress']['conf']['cp_port'] = '';

// Skip the following modules from the WordPress Manager
$GLOBALS['softaculous_wordpress']['conf']['disable_modules'] = array();

// DA login using Admin credentials (Set 1 to use)
$GLOBALS['softaculous_wordpress']['conf']['da_use_admin_creds'] = '';

// Set the div at which you want softaculous Wordpress Manager tab
$GLOBALS['softaculous_wordpress']['conf']['custom_tab'] = '';

// Set the div after which you want softaculous Wordpress Manager iframe
$GLOBALS['softaculous_wordpress']['conf']['custom_div'] = '';