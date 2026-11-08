<?php

//////////////////////////////////////////////////////////////
//===========================================================
// softaculous_extra.php
//===========================================================
// SOFTACULOUS 
// Version : 1.1
// Inspired by the DESIRE to be the BEST OF ALL
// ----------------------------------------------------------
// Started by: Alons
// Date:       10th Jan 2009
// Time:       21:00 hrs
// Site:       http://www.softaculous.com/ (SOFTACULOUS)
// ----------------------------------------------------------
// Please Read the Terms of use at http://www.softaculous.com
// ----------------------------------------------------------
//===========================================================
// (c)Softaculous Inc.
//===========================================================
//////////////////////////////////////////////////////////////

global $webuzo_conf;


// If You want to give custom names to the Custom Fields
// Uncomment the fields and change the values as per the discription on the wiki : https://webuzo.com/docs/billing/whmcs-shared-hosting-module/

// Log Level
$webuzo_conf['loglevel'] = 0;

// Remove all reseller sub account, including main reseller account
//$webuzo_conf['delete_reseller_sub_accounts'] = 1;

// Remove all reseller sub account, main reseller will not be deleted
// If you pass this setting then make sure you pass $webuzo_conf['delete_reseller_sub_accounts'] as well
//$webuzo_conf['delete_reseller_sub_accounts_only'] = 1;

// Remove Webuzo Panel in WHMCS admin panel
// No = 0 (Default)
// Yes = 1
$webuzo_conf['admin_ui']['hide_webuzo_panel'] = '0';

// Remove Login to Webuzo button
// No = 0 (Default)
// Yes = 1
$webuzo_conf['client_ui']['direct_login'] = 0;
$webuzo_conf['client_ui']['rename_login_button'] = '';

// Remove left side bar options (Like Login to Webuzo)
// No = 0 (Default)
// Yes = 1
$webuzo_conf['client_ui']['hide_sidebar'] = 0;

// Remove Webuzo Panel in WHMCS enduser panel
// No = 0 (Default)
// Yes = 1
$webuzo_conf['client_ui']['hide_webuzo_panel'] = '0';


// Remove Login to Webuzo button under the Hosting Information section in WHMCS enduser panel
// No = 0 (Default)
// Yes = 1
$webuzo_conf['client_ui']['hide_login_btn_hosting_info'] = '0';

// Set this to 1 if you do not wish to show the Webuzo Panel in WHMCS admin AND enduser panel
$webuzo_conf['hide_webuzo_panel'] = '0';

// Set the Webuzo ports if you are using custom ports on Webuzo
$webuzo_conf['custom_ports']['admin_ssl'] = '';
$webuzo_conf['custom_ports']['admin_nonssl'] = '';
$webuzo_conf['custom_ports']['enduser_ssl'] = '';
$webuzo_conf['custom_ports']['enduser_nonssl'] = '';

// Account Termination
// Disable = 1
// Enable = 0
$webuzo_conf['admin_ui']['disable_terminate'] = 0;

// Preserve Information about the account
// No = 0 (Default)
// Yes = 1
$webuzo_conf['admin_ui']['preserve_info'] = 0;


// Configurable Options
$webuzo_conf['fields']['ips'] = 'Number of IPs';
$webuzo_conf['fields']['ips6'] = 'Number of IPv6 Address';
$webuzo_conf['fields']['ips6_subnet'] = 'Number of IPv6 Subnet';
$webuzo_conf['fields']['slave_server'] = 'Server';
$webuzo_conf['fields']['server_group'] = 'Region';

