<?php

namespace WHMCS\Module\Registrar\Ibs;

use WHMCS\Application\Support\Facades\Menu;
use WHMCS\Module\Registrar\Ibs\AdditionalFields;
use WHMCS\Module\Registrar\Ibs\ApiHandler;
use WHMCS\Module\Registrar\Ibs\RegistrarModule;
use WHMCS\Module\Registrar\Ibs\ShoppingCart;
use WHMCS\Module\Registrar\Ibs\Widget;

class HookMgr extends RegistrarModule
{
    /**
     * initialize andload the registrar module
     *
     * @param array<string,mixed> $params WHMCS input parameters
     * @return ?\WHMCS\Module\Registrar
     */
    private static function initRegistrar($params)
    {
         // check if registrar is active and the setting active
        $registrarid = $params["_registrar"]["name"];
        $registrar = new \WHMCS\Module\Registrar();
        if (!$registrar->load($registrarid) || !$registrar->isActivated()) {
            return null;
        }
        return $registrar;
    }
    /**
     * Call a function in this class
     *
     * @param string $fnname Function name to call
     * @param array<string,mixed> $params Parameters to pass to the function
     * @param string $class Class to call the function on (optional)
     * @return mixed
     * @throws \Exception
     */
    public static function invoke($fnname, $params, $class = __CLASS__)
    {
        // add registrar scope check (hooks)
        $scope = ((bool)preg_match("/^WHMCS\\\\Module\\\\Registrar\\\\(Ibs|Moniker)\\\\/i", $class, $m)) ? $m[1] : "other";

        return parent::invoke($fnname, $params, $class);
    }

    /**
     * Subscribe to a hook
     *
     * @param string $hook Hook to subscribe to
     * @param string|callable $function Function to call when the hook is triggered
     * @param int $priority Priority of the hook (default 1, optional)
     * @return void
     */
    public static function subscribe($hook, $function, $priority = 1)
    {
        static $hookMap = [
            "ClientAreaPageDomain*" => [
                "ClientAreaPageDomainDNSManagement",
                "ClientAreaPageDomainEPPCode",
                "ClientAreaPageDomainContacts",
                "ClientAreaPageDomainRegisterNameservers",
                "ClientAreaPageDomainDetails"
            ]
        ];

        $hooks = $hookMap[$hook] ?? [$hook];

        foreach ($hooks as $hook) {
            add_hook($hook, $priority, $function);
        }
    }

    /**
     * Validate Additional Fields as part of ShoppingCartValidateDomainsConfig Hook
     * Error messages are returned as an array - if empty, no errors
     *
     * @param array<string,mixed> $params WHMCS input parameters
     * @return array<string>
     */
    public static function shoppingCartValidateDomainsConfig($params)
    {
        // check if domains are in cart
        if (ShoppingCart::isEmpty()) {
            return [];
        };

        // check if registrar is active and the setting active
        $registrar = self::initRegistrar($params);
        if (!$registrar) {
            return [];
        }
        $settings = $registrar->getSettings();
        if (!isset($settings["VALIDATEFIELDS"]) || $settings["VALIDATEFIELDS"] !== "on") {
            return [];
        }

        // get TLDs with internet.bs registrar in cart
        $found = ShoppingCart::getCartTLDsOfRegistrar($params["_registrar"]["name"]);
        if (empty($found)) {
            return [];
        }

        // validate additional fields
        $errors = [];
        $domains = ShoppingCart::getDomains();
        foreach ($domains as $item) {
            list($sld, $tld) = explode(".", $item["domain"], 2);
            if (!in_array("." . $tld, $found)) {
                continue;
            }
            $errors = array_merge($errors, AdditionalFields::validate($item["domain"], $item["fields"]));
        }
        return $errors;
    }

    /**
     * Validate fields when user perform final checkout as part of ShoppingCartValidateCheckout Hook
     * Error messages are returned as an array - if empty, no errors
     *
     * @param array<string,mixed> $params WHMCS input parameters
     * @return array<string>
     */
    public static function shoppingCartValidateCheckout($params)
    {
        // check if domains are in cart
        if (ShoppingCart::isEmpty()) {
            return [];
        };

        // check if registrar is active and the setting active
        $registrar = self::initRegistrar($params);
        if (!$registrar) {
            return [];
        }

        // fetch settings and check if this mechanism is active
        $settings = $registrar->getSettings();
        if (!isset($settings["VALIDATEFIELDS"]) || $settings["VALIDATEFIELDS"] !== "on") {
            return [];
        }

        // get TLDs with internet.bs registrar in cart
        $found = ShoppingCart::getCartTLDsOfRegistrar($params["_registrar"]["name"]);
        if (empty($found)) {
            return [];
        }

        $contactdata = AdditionalFields::fetchAndValidateContactData($params);
        if (isset($contactdata["error"])) {
            return [$contactdata["error"]];
        }

        $errors = [];
        $cart = ShoppingCart::getDomains();
        foreach ($cart as $item) {
            list($sld, $tld) = explode(".", $item["domain"], 2);
            // skip if TLD is not from internet.bs registrar
            if (!in_array("." . $tld, $found)) {
                continue;
            }

            // Check Country Code for EU
            $errors = array_merge($errors, AdditionalFields::validateContactData($item["domain"], $item["fields"], $contactdata["countryCode"])); // @phpstan-ignore offsetAccess.notFound
        }
        return $errors;
    }

    /**
     * Remove Menu Entry "Registrar Lock Status" if not supported by TLD
     *
     * @param array<string,mixed> $vars WHMCS input parameters for ClientAreaPageDomain* hooks
     * @return array<string,mixed>
     */
    public static function clientAreaPageDomainMenuRemoval($vars)
    {
        // \WHMCS\Domain\Domain
        $domain = Menu::context("domain");

        $menu = $vars["primarySidebar"]->getChild("Domain Details Management");
        if (is_null($menu) || $domain->registrar !== $vars["_registrar"]["name"]) {
            return [];
        }

        // check if registrar is active and the setting active
        $registrar = self::initRegistrar($vars);
        if (!$registrar) {
            return [];
        }

        // fetch TLD Info
        $result = ApiHandler::call($registrar->getSettings(), "Domain/Check", [
            "domain" => $domain->domain
        ]);

        // Transferlock supported
        if (
            isset($result["registrarlockallowed"])
            && $result["registrarlockallowed"] === "NO"
        ) {
            $vars["managementoptions"]["locking"] = false;
            $vars["lockstatus"] = false;
            $menu->removeChild("Registrar Lock Status");
        }

        // get private nameservers
        $vars["hosts"] = self::getHostsForDomain(array_merge($vars, $registrar->getSettings()));

        return $vars;
    }

    /**
     * Automatically add the include statement for additional fields configuration file
     *
     * @param array<string,mixed> $vars WHMCS input parameters for ClientAreaPageDomain* hooks
     * @return void
     */
    public static function autoAdditionalFieldsInclude($vars)
    {
        // check if registrar is active and the setting active
        $registrarid = $vars["_registrar"]["name"];
        $registrar = self::initRegistrar($vars);
        if (!$registrar) {
            logActivity("[" . $registrarid . "] auto-add additional fields include: failed loading the registrar module.");
            return;
        }

        // fetch settings and check if this mechanism is active
        $settings = $registrar->getSettings();
        if (!isset($settings["AUTOADDFIELDSINCLUDE"]) || $settings["AUTOADDFIELDSINCLUDE"] !== "on") {
            // nothing to do
            return;
        }

        $filePath = ROOTDIR . "/resources/domains/dist.additionalfields.php";
        // Check if the file exists
        if (!file_exists($filePath)) {
            logActivity("[" . $registrarid . "] auto-add additional fields include: /resources/domains/dist.additionalfields.php missing.");
            return;
        }
        // Get the content of the file
        $fileContent = file_get_contents($filePath);
        if ($fileContent === false) {
            logActivity("[" . $registrarid . "] auto-add additional fields include: failed loading contents of default config file.");
            return;
        }

        $fileContent = trim($fileContent);
        $fileContent = preg_replace("/\s+/", "", $fileContent) ?? $fileContent; // remove any spaces, tabs, ...
        $lineToCheck = 'include(ROOTDIR."/modules/registrars/' . $registrarid . '/' . $registrarid . '_additionaldomainfields.php");';
        // Check if the line already exists in the file content
        if (strpos($fileContent, $lineToCheck) !== false) {
            // logActivity("[" . $registrarid . "] auto-add additional fields include: include statement present. OK!");
            return;
        }

        // If the line doesn’t exist, append it to the file
        $result = file_put_contents($filePath, PHP_EOL . $lineToCheck, FILE_APPEND);
        if ($result === false) {
            logActivity("[" . $registrarid . "] auto-add additional fields include: failed adding the include statement.");
            return;
        }

        logActivity("[" . $registrarid . "] auto-add additional fields include: include statement added.");
    }

    /**
     * Update error message on client area sections for domain management e.g. DNS, Nameservers, etc.
     * Because WHMCS does not provide a way to show error messages if something fails and shows only generic error message
     *
     * @param array<string,mixed> $vars WHMCS input parameters for ClientAreaPageDomain* hooks
     * @return array<string,mixed>
     */
    public static function clientAreaDomainErrorMessageHandler($vars)
    {
        // check if registrar is active and the setting active and domain is registered with our registrar
        $domain = Menu::context("domain");
        $registrar = self::initRegistrar($vars);
        if (
            !$registrar
            || $$vars["_registrar"]["name"] !== $domain->registrar
            || $_SERVER["REQUEST_METHOD"] !== "POST"
        ) {
            return [];
        }

        $actionMappings = [
            "domaindns" => "SaveDNS",
            "domaindetails" => "SaveNameservers",
            "domainregisterns" => "SaveNameservers",
            "domaincontacts" => "SaveContactDetails",
            "domainemailforwarding" => "SaveEmailForwarding",
            "domainreglock" => "SaveRegistrarLock"
        ];

        // Check if the action exists in the action mappings and if there's an error or result
        $action = $vars["action"] ?? null;
        if ($action && isset($actionMappings[$action]) && !empty($vars["domain"])) {
            $key = $actionMappings[$action];
            $errorKey = ($action === "domainregisterns" && isset($vars["result"])) ? "result" : "error";

            // Append additional error details from the session if available
            if ($vars[$errorKey] && isset($_SESSION["cnic_track"][$key][$vars["domain"]])) {
                $vars[$errorKey] .= "<br /><small>" . $_SESSION["cnic_track"][$key][$vars["domain"]] . "</small>";
            }
        }

        return $vars;
    }

    /**
     * Register the balance widget for the WHMCS Admin Dashboard
     *
     * @param array<string,mixed> $params Parameters passed to the registrar module
     * @return \WHMCS\Module\Registrar\Ibs\Widget|null
     */
    public static function registerBalanceWidget($params)
    {
        $registrar = self::initRegistrar($params);
        if (!$registrar) {
            return null;
        }
        $settings = $registrar->getSettings();
        $params = $params + $settings;
        return new Widget($params);
    }
}
