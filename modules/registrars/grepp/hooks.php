<?php
// *********************************************************************
// grEPP WHMCS registrar module for .gr TLD
// Copyright (c) 2011-2025 Athanasios Liagkos
// Version: 2.3.6
// Release Date: 2025-02-02
// *********************************************************************
// Email: info@valuehost.com.gr
// Website: https://www.valuehost.com.gr
// *********************************************************************
// This software is furnished under a license and may be used and copied
// only  in  accordance  with  the  terms  of such  license and with the
// inclusion of the above copyright notice.  This software  or any other
// copies thereof may not be provided or otherwise made available to any
// other person.  No title to and  ownership of the  software is  hereby
// transferred.
//
// You may not reverse  engineer, decompile, defeat  license  encryption
// mechanisms, or  disassemble this software product or software product
// license.  ValueHost  may terminate  this license if  you don't comply
// with  any of the  terms  and  conditions  set forth in  our  end user
// license agreement (EULA).  In such event,  licensee  agrees to return
// licensor  or destroy  all copies of software  upon termination of the
// license.
// *********************************************************************
// * This file is intentionally left unencoded for compatibility reasons
// *********************************************************************

require_once __DIR__ . '/vendor/autoload.php';

use Liagkos\EPP\Core as Core;
use Liagkos\WHMCS\Registrar\GR as Module;

add_hook('AdminClientDomainsTabFields', 1, function($vars) {
    /** @var $grEPP_parsed Core\Details\Domain */
    global $grEPP_parsed, $grEPP_result;

    return Module\Hooks::AdminClientDomainsTabFields($vars);
});

add_hook('AdminHomeWidgets', 1, function() {
    return new Module\GreppCreditInfo();
});

add_hook('AfterRegistrarRegistration', 1, function($vars) {
    Module\Sync::setDatesAfterRegisterRenewTransfer($vars);
});

add_hook('AfterRegistrarRenewal', 1, function($vars) {
    Module\Sync::setDatesAfterRegisterRenewTransfer($vars);
});

add_hook('AfterRegistrarTransfer', 1, function($vars) {
    Module\Sync::setDatesAfterRegisterRenewTransfer($vars, true);
});

add_hook('PreRegistrarGetEPPCode', 1, function($vars) {
    global $CONFIG;
    Module\Hooks::PreRegistrarGetEPPCode($CONFIG, $vars);
});

add_hook('ShoppingCartValidateDomain', 1, function($vars) {
    Module\Hooks::ShoppingCartValidateDomain($vars);
});

add_hook('ShoppingCartValidateCheckout', 1, function($vars) {
    return Module\Hooks::ShoppingCartValidateCheckout($vars);
});

add_hook('CartTotalAdjustment', 1, function($vars) {
    global $_LANG;

    $adjustment = Module\Hooks::CartTotalAdjustment($_LANG, $vars);

    if ($adjustment !== FALSE) {
        return $adjustment;
    }

});

add_hook('ShoppingCartValidateDomainsConfig', 1, function($vars) {
   Module\Hooks::ShoppingCartValidateDomainsConfig($vars);
});

add_hook('PreAutomationTask', 1, function($vars) {
    Module\Hooks::PreAutomationTask($vars);
});