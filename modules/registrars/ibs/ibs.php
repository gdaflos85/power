<?php

use WHMCS\Module\Registrar\Ibs\RegistrarModule;

if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}

/**
 * Add custom buttons to the client area domain details page
 * An array to be returned where the key is the label for the button
 * and the value is the underlying function name without registrar prefix.
 *
 * @param array<string,mixed> $params WHMCS' common module parameters
 * @return array<string,string>
 */
function ibs_ClientAreaCustomButtonArray($params)
{
    return RegistrarModule::invoke("clientAreaCustomButtonArray", $params);
}

/**
 * Custom Client Area Feature: DNSSEC Management
 *
 * @param array<string,mixed> $params common module parameters
 * @return array<string,mixed>
 */
function ibs_dnssec(array $params): array
{
    return RegistrarModule::invoke("dnssec", $params);
}

/**
 * Custom Client Area Feature: Private Whois Management
 *
 * @param array<string,mixed> $params WHMCS' common module parameters
 * @return array<string,mixed>
 */
function ibs_privatewhois(array $params): array
{
    return RegistrarModule::invoke("privatewhois", $params);
}

/**
 * Custom Client Area Feature: Contact Verification
 *
 * @param array<string,mixed> $params WHMCS' common module parameters
 * @return array<string,mixed>
 */
function ibs_verify($params)
{
    return RegistrarModule::invoke("verify", $params);
}

/**
 * Custom Client Area Feature: Additional Domain Fields Configurations
 *
 * @param array<string,mixed> $params WHMCS' common module parameters
 * @return array<string,mixed>
 */
function ibs_additionalfields($params)
{
    return RegistrarModule::invoke("additionalfields", $params);
}

/**
 * Custom Client Area Feature: URL Forwarding
 *
 * @param array<string,mixed> $params WHMCS' common module parameters
 * @return array<string,mixed>
 */
function ibs_domainurlforwarding($params)
{
    return RegistrarModule::invoke("domainurlforwarding", $params);
}

/**
 * Undocumented function to validate user inputs in getConfigArray's form - only invoked if configuration settings are submitted
 *
 * @link https://www.whmcs.com/members/viewticket.php?tid=ESD-183344&c=wjZ1LjOs #ESD-183344
 * @param array<string,mixed> $params WHMCS' common module parameters
 * @throws \Exception
 * @return void
 */
function ibs_config_validate($params)
{
    RegistrarModule::invoke("configValidate", $params);
}

/**
 * Return Registrar Module Configuration Settings
 * NOTE: for some reason, WHMCS is invoking the function twice
 *
 * @param array<string,mixed> $params WHMCS' common module parameters
 * @return array<string,mixed>
 */
function ibs_GetDomainInformation($params)
{
    return RegistrarModule::invoke("getDomainInformation", $params);
}

/**
 * Return Domain Status Information to WHMCS
 * !!! NOT A REPLACEMENT FOR GetRegistrarLock, GetNameservers !!!
 *
 * @param array<string,mixed> $params WHMCS' common module parameters
 * @return \WHMCS\Domain\Registrar\Domain
 */
function ibs_getConfigArray($params)
{
    return RegistrarModule::invoke("getConfigArray", $params);
}


/**
 * Domain Synchronization Integration
 *
 * @param array<string,mixed> $params WHMCS' common module parameters
 * @return array<string,mixed>
 */
function ibs_Sync($params)
{
    return RegistrarModule::invoke("sync", $params);
}

/**
 * Domain Transfer Synchronization Integration
 *
 * @param array<string,mixed> $params WHMCS' common module parameters
 * @return array<string,mixed>
 */
function ibs_TransferSync($params)
{
    return RegistrarModule::invoke("transferSync", $params);
}

/**
 * gets list of nameservers for a domain
 *
 * @param array<string,mixed> $params WHMCS' common module parameters
 * @return array<string,string>
 */
function ibs_GetNameservers($params)
{
    return RegistrarModule::invoke("getNameservers", $params);
}

/**
 * attach nameserver to a domain by Domain/Update command
 *
 * @param array<string,mixed> $params WHMCS' common module parameters
 * @return array{error:string}|array{success:bool}
 */
function ibs_SaveNameservers($params)
{
    return RegistrarModule::invoke("saveNameservers", $params);
}

/**
 * gets registrar lock status of a domain
 *
 * @param array<string,mixed> $params WHMCS' common module parameters
 * @return array{error:string}|string
 */
function ibs_GetRegistrarLock($params)
{
    return RegistrarModule::invoke("getRegistrarLock", $params);
}

/**
 * enable/disable registrar lock for a domain
 *
 * @param array<string,mixed> $params WHMCS' common module parameters
 * @return array{error:string}|array{success:bool}
 */
function ibs_SaveRegistrarLock($params)
{
    return RegistrarModule::invoke("saveRegistrarLock", $params);
}

/**
 * This function is called to toggle Id protection status
 * @param array<string,mixed> $params WHMCS' common module parameters
 * @return array{error:string}|array{success:bool}
 */

function ibs_IDProtectToggle($params)
{
    return RegistrarModule::invoke("iDProtectToggle", $params);
}

/**
 * gets email forwarding rules list of a domain
 *
 * @param array<string,mixed> $params WHMCS input parameters
 * @return array{error:string}|array<int,array{prefix:string,forwardto:string,source:string}>
 */
function ibs_GetEmailForwarding($params)
{
    return RegistrarModule::invoke("getEmailForwarding", $params);
}

/**
 * saves email forwarding rules of a domain
 *
 * @param array<string,mixed> $params WHMCS input parameters
 * @return array{error:string}|array{success:bool}
 */
function ibs_SaveEmailForwarding($params)
{
    return RegistrarModule::invoke("saveEmailForwarding", $params);
}

/**
 * gets DNS Record list of a domain
 *
 * @param array<string,mixed> $params WHMCS input parameters
 * @return array{error:string}|array<array{type:string,hostname:string,address:string,priority?:string}>
 */
function ibs_GetDNS($params)
{
    return RegistrarModule::invoke("getDNS", $params);
}

/**
 * saves dns records for a domain
 *
 * @param array<string,mixed> $params WHMCS input parameters
 * @return array<string,string>|array{success:string}
 */
function ibs_SaveDNS($params)
{
    return RegistrarModule::invoke("saveDNS", $params);
}

/**
 * registers a domain
 *
 * @param array<string,mixed> $params WHMCS input parameters
 * @return array{error:string}|array{success:true}
 */
function ibs_RegisterDomain($params)
{
    return RegistrarModule::invoke("registerDomain", $params);
}

/**
 * This function is called when a domain release is requested (eg. UK IPSTag Changes)
 *
 * @param array<string,mixed> $params WHMCS input parameters
 * @return array{success:true}|array{error:string}
 */
function ibs_ReleaseDomain($params)
{
    return RegistrarModule::invoke("releaseDomain", $params);
}

/**
 * initiates transfer for a domain
 *
 * @param array<string,mixed> $params WHMCS input parameters
 * @return array{success:true}|array{error:string}
 */
function ibs_TransferDomain($params)
{
    return RegistrarModule::invoke("transferDomain", $params);
}

/**
 * renews a domain
 *
 * @param array<string,mixed> $params WHMCS input parameters
 * @return array{success:true}|array{error:string}
 */
function ibs_RenewDomain($params)
{
    return RegistrarModule::invoke("renewDomain", $params);
}

/**
 * gets contact details for a domain
 *
 * @param array<string,mixed> $params WHMCS input parameters
 * @return array<string,mixed>
 */
function ibs_GetContactDetails($params)
{
    return RegistrarModule::invoke("getContactDetails", $params);
}

/**
 * Saves contact details
 *
 * @param array<string,mixed> $params WHMCS input parameters
 * @return array<string,mixed>
 */
function ibs_SaveContactDetails($params)
{
    return RegistrarModule::invoke("saveContactDetails", $params);
}

/**
 * gets domain secret/ transfer auth info of a domain
 *
 * @param array<string,mixed> $params WHMCS input parameters
 * @return array{eppcode:string}|array{error:string}|array{}
 */
function ibs_GetEPPCode($params)
{
    return RegistrarModule::invoke("getEPPCode", $params);
}

/**
 * creates a host for a domain
 *
 * @param array<string,mixed> $params WHMCS input parameters
 * @return array{success:true}|array{error:string}
 */
function ibs_RegisterNameserver($params)
{
    return RegistrarModule::invoke("registerNameserver", $params);
}

/**
 * updates host of a domain
 *
 * @param array<string,mixed> $params WHMCS input parameters
 * @return array{success:true}|array{error:string}
 */
function ibs_ModifyNameserver($params)
{
    return RegistrarModule::invoke("modifyNameserver", $params);
}

/**
 * deletes a host
 *
 * @param array<string,mixed> $params WHMCS input parameters
 * @return array{success:true}|array{error:string}
 */
function ibs_DeleteNameserver($params)
{
    return RegistrarModule::invoke("deleteNameserver", $params);
}

/**
 * Get Domain Name Suggestions
 *
 * @param array<string,mixed> $params WHMCS input parameters
 * @return \WHMCS\Domains\DomainLookup\ResultsList
 */
function ibs_GetDomainSuggestions($params)
{
    return RegistrarModule::invoke("getDomainSuggestions", $params);
}

/**
 * Check Domain Availability
 *
 * @param array<string,mixed> $params WHMCS input parameters
 * @return \WHMCS\Domains\DomainLookup\ResultsList
 */
function ibs_CheckAvailability($params)
{
    return RegistrarModule::invoke("checkAvailability", $params);
}

/**
 * Get Url Forwardings
 *
 * @param array<string,mixed> $params WHMCS input parameters
 * @return array{error:string}|array<array{hostname:string,type:string,address:string}>
 */
function ibs_GetUrlForwarding($params)
{
    return RegistrarModule::invoke("getUrlForwarding", $params);
}

/**
 * Save Url Forwarding
 *
 * @param array<string,mixed> $params WHMCS input parameters
 * @return array{error:string}|array{success:true}
 */
function ibs_SaveUrlForwarding($params)
{
    return RegistrarModule::invoke("saveUrlForwarding", $params);
}

/**
 * Remove Url Forwarding
 *
 * @param array<string,mixed> $params WHMCS input parameters
 * @return array{error:string}|array{success:true}
 */
function ibs_RemoveUrlForwarding($params)
{
    return RegistrarModule::invoke("removeUrlForwarding", $params);
}

/**
 * Get TLD Pricing
 *
 * @param array<string,mixed> $params WHMCS input parameters
 * @return \WHMCS\Results\ResultsList
 */
function ibs_GetTldPricing($params)
{
    return RegistrarModule::invoke("getTldPricing", $params);
}

/**
 * Get Premium Domain Pricing
 *
 * @param array<string,mixed> $params common module parameters
 * @return array<string,mixed>
 */
function ibs_GetPremiumPrice($params)
{
    return RegistrarModule::invoke("getPremiumPrice", $params);
}


/**
 * Returns customer account details such as amount, currency, deposit etc.
 *
 * @param array<string,mixed> $params WHMCS' common module parameters
 * @return array<string,mixed>
 */
function ibs_getAccountDetails($params): array
{
    return RegistrarModule::invoke("getAccountDetails", $params);
}
