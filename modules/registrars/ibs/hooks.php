<?php

use WHMCS\Module\Registrar\Ibs\HookMgr;

/**
 * Validate Additional Fields as part of ShoppingCartValidateDomainsConfig Hook
 * Error messages are returned as an array - if empty, no errors
 *
 * @param array<string,mixed> $params WHMCS input parameters
 * @return array<string>
 */
function ibs_validateAdditionalFields($params)
{
    return HookMgr::invoke("shoppingCartValidateDomainsConfig", $params);
}
HookMgr::subscribe("ShoppingCartValidateDomainsConfig", "ibs_validateAdditionalFields");

/**
 * Automatically add the include statement for additional fields configuration file
 *
 * @param array<string,mixed> $vars WHMCS input parameters for ClientAreaPageDomain* hooks
 * @return void
 */
function ibs_autoAdditionalFieldsInclude($vars)
{
    HookMgr::invoke("autoAdditionalFieldsInclude", $vars);
}
HookMgr::subscribe("AfterCronJob", "ibs_autoAdditionalFieldsInclude");

/**
 * Validate fields when user perform final checkout as part of ShoppingCartValidateCheckout Hook
 * Error messages are returned as an array - if empty, no errors
 *
 * @param array<string,mixed> $params WHMCS input parameters
 * @return array<string>
 */
function ibs_shoppingCartValidateCheckout($params)
{
    return HookMgr::invoke("shoppingCartValidateCheckout", $params);
}
HookMgr::subscribe("ShoppingCartValidateCheckout", "ibs_shoppingCartValidateCheckout");

/**
 * Remove Menu Entry "Registrar Lock Status" if not supported by TLD
 *
 * @param array<string,mixed> $vars WHMCS input parameters for ClientAreaPageDomain* hooks
 * @return array<string,mixed>
 */
function ibs_clientAreaPageDomainMenuRemoval($vars)
{
    return HookMgr::invoke("clientAreaPageDomainMenuRemoval", $vars);
}
HookMgr::subscribe("ClientAreaPageDomain*", "ibs_clientAreaPageDomainMenuRemoval");

/**
 * Update error message on client area sections for domain management e.g. DNS, Nameservers, etc.
 * Because WHMCS does not provide a way to show error messages if something fails and shows only generic error message
 *
 * @param array<string,mixed> $vars WHMCS input parameters for ClientAreaPageDomain* hooks
 * @return array<string,mixed>
 */
function ibs_clientAreaDomainErrorMessageHandler($vars)
{
    return HookMgr::invoke("clientAreaDomainErrorMessageHandler", $vars);
}
HookMgr::subscribe("ClientAreaPage", "ibs_clientAreaDomainErrorMessageHandler", 100 * 100 * 100); // trying to set last priority

/**
 *
 * Register the balance widget for registrar module which shows at the WHMCS Admin Dashboard
 *
 * This hook does not support named (non-anonymous) functions only hooks that are listed in the Hooks index page of WHMCS are supported.
 * Check WHMCS Support Ticket: #HLF-985426
 *
 * @param array<string,mixed> $vars WHMCS input parameters
 * @return \WHMCS\Module\Registrar\Ibs\Widget
 */
HookMgr::subscribe("AdminHomeWidgets", function ($vars) {
    return HookMgr::invoke("registerBalanceWidget", $vars);
}, 1);
