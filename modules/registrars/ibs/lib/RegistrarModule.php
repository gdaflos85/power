<?php

namespace WHMCS\Module\Registrar\Ibs;

use Illuminate\Database\Capsule\Manager as DB;
use WHMCS\Domains\DomainLookup\ResultsList;
use WHMCS\Domains\DomainLookup\SearchResult;
use WHMCS\Domain\TopLevel\ImportItem;
use WHMCS\Module\Registrar\Ibs\Contact;
use WHMCS\Module\Registrar\Ibs\Country;
use WHMCS\Module\Registrar\Ibs\Logger;
use WHMCS\Module\Registrar\Ibs\PhoneNumber;
use WHMCS\Module\Registrar\Ibs\Support;

class RegistrarModule extends \WHMCS\Module\Registrar\Ibs\Registrar
{
    /**
     * Call a function from the registrar module with extended $params
     *
     * @param string $fnname Function name
     * @param array<string,mixed> $params WHMCS' common module parameters
     * @param string $class Class to call the function on (optional)
     * @return mixed
     * @throws \Exception
     */
    public static function invoke($fnname, $params, $class = __CLASS__)
    {
        if (!is_callable([$class, $fnname])) {
            throw new \Exception("Function {$fnname} not found in " . $class);
        }

        $cfgfile = __DIR__ . "/../whmcs.json";
        if (!file_exists($cfgfile)) {
            throw new \Exception("Please, ensure that the file whmcs.json is available and readable.");
        }
        $raw = file_get_contents($cfgfile);
        if ($raw === false) {
            throw new \Exception("Please, ensure that the file whmcs.json is available and readable.");
        }
        $config = json_decode($raw, true);
        if ($config === null || is_bool($config)) {
            throw new \Exception("Please, ensure that the file whmcs.json is a valid JSON file.");
        }
        $version = preg_replace("/^.+ v/", "", $config["description"]["name"]);
        $friendlyName = preg_replace("/ v[0-9.]+$/", "", $config["description"]["name"]);
        if ($version === null || $friendlyName === null) {
            die("Please, ensure that the file whmcs.json contains its original name field including its version number.");
        }
        $config["_module"]["version"] = $version;
        $config["_module"]["friendlyName"] = $friendlyName;

        // add registrar scope check (hooks)
        $config["scope"] = ((bool)preg_match("/^WHMCS\\\\Module\\\\Registrar\\\\(Ibs|Moniker)\\\\/i", $class, $m)) ? strtolower($m[1]) : "other";

        // extend the params with the registrar config
        return $class::$fnname($params + [
            "_logItem" => self::getDomain($params), // for Logger context
            "_registrar" => $config
        ]);
    }

    /**
     * Add custom buttons to the client area domain details page
     * An array to be returned where the key is the label for the button
     * and the value is the underlying function name without registrar prefix.
     *
     * @param array<string,mixed> $params WHMCS' common module parameters
     * @return array<string,string>
     */
    public static function clientAreaCustomButtonArray($params)
    {
        $buttonArray = [];
        $lang = [
            "dnssec" => "DNSSEC Management",
            "verify" => "Verify Email",
            "additionalfields" => "Domain Configurations",
            "domainurlforwarding" => "URL Forwarding",
            "privatewhois" => "Manage Id Protection"
        ];

        // fetch TLD Info
        $result = self::getTldInfo($params);

        if (isset($result["features"])) {
            foreach ($result["features"] as $feature => $isSupported) {
                if ($isSupported && isset($lang[$feature]) && function_exists($params["_registrar"]["name"] . "_" . $feature)) {
                    $buttonArray[$lang[$feature]] = $feature;
                }
            }
        }

        // For Email Verification
        if (self::isEmailVerificationPending($params)) {
            $buttonArray[$lang["verify"]] = "verify";
        }

        if (self::getTld($params) !== "tel") {
            $addflds = new \WHMCS\Domains\AdditionalFields();
            $fields = $addflds
                ->setDomain(self::getDomain($params))
                ->setDomainType("register")
                ->getAsNameValueArray();

            if (count($fields) > 0) {
                $buttonArray[$lang["additionalfields"]] = "additionalfields";
            }
        }

        return array_merge($buttonArray, [
            $lang["domainurlforwarding"] => "domainurlforwarding"
        ]);
    }

    /**
     * Custom Client Area Feature: DNSSEC Management
     *
     * @param array<string,mixed> $params common module parameters
     * @return array<string,mixed>
     */
    public static function dnssec(array $params): array
    {
        $domain = self::getDomain($params);

        $tpl = [
            "templatefile" => "tpl_ca_dnssec",
            "vars" => [
                "supportsTTL" => true,
                "flagOptions" => [
                    "" => "Please Select",
                    256 => "Zone Signing Key",
                    257 => "Secure Entry Point"
                ],
                "algOptions" => [
                    "" => "Please Select",
                    8 => "RSA/SHA256",
                    10 => "RSA/SHA512",
                    12 => "GOST R 34.10-2001",
                    13 => "ECDSA/SHA-256",
                    14 => "ECDSA/SHA-384",
                    15 => "Ed25519",
                    16 => "Ed448"
                ],
                "digestOptions" => [
                    "" => "Please Select",
                    2 => "SHA-256",
                    3 => "GOST R 34.11-94",
                    4 => "SHA-384"
                ],
                "secdnsds" => [],
                "secdnskey" => [],
                "supports_ds_data" => false,
                "supports_key_data" => false,
                "successful" => false,
                "error" => false,
                "disabled" => false
            ]
        ];

        // disable & cleanup dnssec
        if ($_SERVER["REQUEST_METHOD"] === "POST" && !empty(\App::getFromRequest("token"))) {
            if (\App::getFromRequest("saveChanges") && \App::getFromRequest("saveChanges") === "save") {
                // cleanup dnssec records
                // DS record can be generated from DNSKEY, but not the other way around
                // most registries want just DS records
                // but registries like .cz, .de, be, eu want DNSKEY
                // all the others need DS
                // Q: Couldn't that then the DS Record auto-generated by API and submitted on-demand?
                // A: Yes, that could be done eventually. For now, we skip this and submit both
                //    DS and DNSKEY as this is said to work

                //add DS and KEY records
                $dnssecrr = [];
                foreach (["SECDNS-DS", "SECDNS-KEY"] as $keyname) {
                    if (isset($_POST[$keyname])) {
                        foreach ($_POST[$keyname] as $record) {
                            $something_missing = false;
                            foreach ($record as $attribute) {
                                if (!strlen($attribute)) {
                                    $something_missing = true;
                                    break;
                                }
                            }
                            if ($something_missing) {
                                // skip
                                continue;
                            }

                            if ($keyname === "SECDNS-KEY") {
                                // <zone> <ttl> IN DNSKEY <flags> <protocol> <alg> <pubkey>
                                $dnssecrr[] = implode(" ", [
                                    $domain . ".",
                                    $record["ttl"],
                                    "IN DNSKEY",
                                    $record["flags"],
                                    3, //DNSSEC
                                    $record["alg"],
                                    preg_replace("/[\r\n\s]+/", "", $record["pubkey"])
                                ]);
                                continue;
                            }

                            // keyname === "SECDNS-DS"
                            // <zone> <ttl> IN DS <key tag> <alg> <digest-type> <digest>
                            $dnssecrr[] = implode(" ", [
                                $domain . ".",
                                $record["ttl"],
                                "IN DS",
                                $record["keytag"],
                                $record["alg"],
                                $record["digesttype"],
                                preg_replace("/[\r\n\s]+/", "", $record["digest"])
                            ]);
                        }
                    }
                }

                //process domain update
                $result = self::domainUpdate($params, [
                    "dnssec" => empty($dnssecrr) ? "" : implode("\n", $dnssecrr)
                ]);

                if ($result["status"] === "FAILURE") {
                    // domain update failed!
                    $tpl["vars"]["error"] = "<b>" . $result["message"] . "</b>" . (empty($dnssecrr) ? "" : "<pre style=\"text-align:left;\">" . implode("\n", $dnssecrr) . "</pre>");
                    Logger::logActivity($params, $result["message"]);
                } elseif ($result["status"] === "SUCCESS") {
                    // domain update ok!
                    $tpl["vars"]["successful"] = "updated";
                    Logger::logActivity($params);
                }
            } else if (\App::getFromRequest("disableDnssec") && \App::getFromRequest("disableDnssec") === "on") {
                // if the user disables DNSSEC, we delete the records
                $result = self::domainUpdate($params, [
                    "dnssec" => ""
                ]);
                if ($result["status"] === "FAILURE") {
                    Logger::logActivity($params, $result["message"]);
                    // domain update failed!
                    $tpl["vars"]["error"] = "<b>" . $result["message"] . "</b>";
                } elseif ($result["status"] === "SUCCESS") {
                    // domain update ok!
                    $tpl["vars"]["successful"] = "disabled";
                }
            }
        }

        // fetch domain info
        $result = self::domainStatus($params);

        // domain info failed
        if ($result["status"] === "FAILURE") {
            if (!$tpl["vars"]["error"]) {
                $tpl["vars"]["error"] = $result["message"];
            }
            Logger::logActivity($params, $result["message"]);
            return $tpl;
        }

        // status detection
        $tpl["vars"]["disabled"] = ($result["dnssec"] === "disabled");

        // fetched domain info successfully
        // parse dnssec data and keys
        $keys = preg_grep("/^dnssec[0-9]+/", array_keys($result)) ?: [];

        $dsData = [];
        $keyData = [];
        foreach ($keys as $key) {
            $record = $result[$key];
            $split = explode(" ", $record);
            if (count($split) <= 7) { // max index 7
                continue;
            }
            // DS Records
            if (preg_match("/ IN DS /", $record)) {
                $dsData[] = [
                    // zone at index 0
                    "ttl" => $split[1],
                    // IN at index 2
                    // DS at index 3
                    "keytag" => $split[4],
                    "alg" => $split[5],
                    "digesttype" => $split[6],
                    "digest" => $split[7]
                ];
                continue;
            }
            // DNSKEY Records
            $keyData[] = [
                // zone at index 0
                "ttl" => $split[1],
                // IN at index 2
                // DS at index 3
                "flags" => $split[4],
                "protocol" => $split[5],
                "alg" => $split[6],
                "pubkey" => $split[7]
            ];
        }

        $tpl["vars"]["secdnsds"] = $dsData;
        $tpl["vars"]["secdnskey"] = $keyData;

        Logger::logActivity($params, $result["message"]);

        $result = self::getTldInfo($params);
        if (isset($result["features"])) {
            $tpl["vars"] = array_merge($tpl["vars"], $result["features"]);
        }

        return $tpl;
    }

    /**
     * DEPRECATED per v5.0.0
     * Get the id protection status of the domain
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return array<string,mixed>
     */
    public static function privatewhois($params)
    {
        // TODO: App::getFromRequest("status")
        $fn = "domainWhoisPrivacyStatus";
        if ((bool)preg_match("/^(disabled|enabled)$/", strtolower($_POST["status"] ?? "n/a"), $m)) {
            $fn = "domainWhoisPrivacyUpdate";
            $params["protectenable"] = $m[1] === "disabled";
        }
        $result = self::$fn($params);

        $successmessage = "";
        if ($result["status"] === "FAILURE") {
            $errormessage = $result["message"];
            $idStatus = "unknown";
        } elseif (!$result["status"]) {
            $errormessage = "Id Protection is not supported";
            $idStatus = "unsupported";
        } else {
            $errormessage = "";
            $idStatus = (bool)preg_match("/^disable(d)?$/i", $result["privatewhoisstatus"]) ? "disabled" : "enabled";
            if ($fn === "domainWhoisPrivacyUpdate") {
                $successmessage = "Id Protection " . $idStatus;
            }
        }

        return [
            "templatefile" => "tpl_ca_whois",
            "breadcrumb" => [
                "clientarea.php?action=domaindetails&id=" . $result["domainid"] . "&modop=custom&a=whois" => "whois"
            ],
            "vars" => [
                "domain" => $result["domain"],
                "status" => $idStatus,
                "errormessage" => $errormessage,
                "successmessage" => $successmessage
            ]
        ];
    }

    /**
     * Custom Client Area Feature: Contact Verification
     *
     * @param array<string,mixed> $params WHMCS' common module parameters
     * @return array<string,mixed>
     */
    public static function verify($params)
    {
        $reqResult = [
            "successmessage" => "",
            "errormessage" => ""
        ];
        if (isset($_POST["do"]) && $_POST["do"] === "send") {
            $result = self::emailVerificationRequest($params);

            $reqResult = [
                "successmessage" => "",
                "errormessage" => "Due to some technical reason email cannot be sent."
            ];
            if ($result["status"] === "FAILURE") {
                if (!empty($result["message"])) {
                    $reqResult["errormessage"] = $result["message"];
                }
                Logger::logActivity($params, $result["message"]);
            } elseif ($result["status"] === "SUCCESS") {
                $reqResult["errormessage"] = "";
                $reqResult["successmessage"] = "Verification email has been " . $result["operation"] . ". Please check your mail box within a couple of minutes. Make sure you also check the spam folder.";
                Logger::logActivity($params);
            }
        }
        return [
            "templatefile" => "tpl_ca_verify",
            "breadcrumb" => [
                "clientarea.php?action=domaindetails&domainid=" . $params["domainid"] . "&modop=custom&a=verify" => "Verify Email"
            ],
            "vars" => array_merge(
                self::emailVerificationStatus($params),
                $reqResult
            )
        ];
    }

    /**
     * Custom Client Area Feature: Additional Domain Fields Configurations
     *
     * @param array<string,mixed> $params WHMCS' common module parameters
     * @return array<string,mixed>
     */
    public static function additionalfields($params)
    {
        global $additionaldomainfields;

        $tld = self::getTld($params);
        $domainName = self::getDomain($params);

        include(ROOTDIR . "/resources/domains/dist.additionalfields.php");

        /* Additional Domain Fields for tld from additionaldimainfields file */
        $additionalfields = $additionaldomainfields["." . $tld];

        if (count($_POST) > 0) {
            $whoisData = $_POST; // phew ...
            unset($whoisData["token"]);
            unset($whoisData["modop"]);
            unset($whoisData["a"]);
            unset($whoisData["id"]);
            foreach ($whoisData as $key => $value) {
                if (strpos($key, "other_") !== false) {
                    $newKey = str_replace("other_", "", $key);
                    $whoisData[$newKey] = $whoisData[$key];
                    unset($whoisData[$key]);
                }
            }
            if ($tld === "nl") {
                $whoisData["registrant_clientip"] = Support::getClientIp();
                if ($whoisData["registrant_nlterm"] !== "") {
                    $whoisData["registrant_nlterm"] = "YES";
                } else {
                    $whoisData["registrant_nlterm"] = "NO";
                }
            }
            if ($tld === "de") {
                if ($whoisData["registrant_restricted_publication"] === "on") {
                    $whoisData["registrant_discloseName"] = $whoisData["registrant_discloseContact"] = $whoisData["registrant_discloseAddress"] = "Yes";
                } else {
                    $whoisData["registrant_discloseName"] = $whoisData["registrant_discloseContact"] = $whoisData["registrant_discloseAddress"] = "No";
                }
                unset($whoisData["registrant_restricted_publication"]);
                if ($whoisData["admin_restricted_publication"] === "on") {
                    $whoisData["admin_discloseName"] = $whoisData["admin_discloseContact"] = $whoisData["admin_discloseAddress"] = "Yes";
                } else {
                    $whoisData["admin_discloseName"] = $whoisData["admin_discloseContact"] = $whoisData["admin_discloseAddress"] = "No";
                }
                unset($whoisData["admin_restricted_publication"]);
                if ($whoisData["technical_restricted_publication"] === "on") {
                    $whoisData["technical_discloseName"] = $whoisData["technical_discloseContact"] = $whoisData["technical_discloseAddress"] = "Yes";
                } else {
                    $whoisData["technical_discloseName"] = $whoisData["technical_discloseContact"] = $whoisData["technical_discloseAddress"] = "No";
                }
                unset($whoisData["technical_restricted_publication"]);
                if ($whoisData["zone_restricted_publication"] === "on") {
                    $whoisData["zone_discloseName"] = $whoisData["zone_discloseContact"] = $whoisData["zone_discloseAddress"] = "Yes";
                } else {
                    $whoisData["zone_discloseName"] = $whoisData["zone_discloseContact"] = $whoisData["zone_discloseAddress"] = "No";
                }
                unset($whoisData["zone_restricted_publication"]);
                $whoisData["clientip"] = Support::getClientIp();
            }
            if ($tld === "it") {
                $entityTypes = [
                    "1. Italian and foreign natural persons" => 1,
                    "2. Companies/one man companies" => 2,
                    "3. Freelance workers/professionals" => 3,
                    "4. non-profit organizations" => 4,
                    "5. public organizations" => 5,
                    "6. other subjects" => 6,
                    "7. foreigners who match 2 - 6" => 7
                ];
                $whoisData["registrant_dotitentitytype"] = $entityTypes[$whoisData["registrant_dotitentitytype"]];
                if (strlen($whoisData["registrant_dotitnationality"]) > 2) {
                    $whoisData["registrant_dotitnationality"] = Country::getCountryCodeByName($whoisData["registrant_dotitnationality"]);
                }
                if ($whoisData["registrant_itterms"] === "on") {
                    $whoisData["registrant_dotitterm1"] = "Yes";
                    $whoisData["registrant_dotitterm2"] = "Yes";
                    $whoisData["registrant_dotitterm3"] = "Yes";
                    $whoisData["registrant_dotitterm4"] = "Yes";
                    unset($whoisData["registrant_itterms"]);
                } else {
                    $whoisData["registrant_dotitterm1"] = "No";
                    $whoisData["registrant_dotitterm2"] = "No";
                    $whoisData["registrant_dotitterm3"] = "No";
                    $whoisData["registrant_dotitterm4"] = "No";
                }
                if ($whoisData["registrant_dotithidewhois"] === "on" && (int)$whoisData["registrant_dotitentitytype"] === 1) {
                    $whoisData["registrant_dotithidewhois"] = "Yes";
                } else {
                    $whoisData["registrant_dotithidewhois"] = "No";
                }
                if ($whoisData["admin_dotithidewhois"] === "on") {
                    $whoisData["admin_dotithidewhois"] = "Yes";
                } else {
                    $whoisData["admin_dotithidewhois"] = "No";
                }
                if ($whoisData["technical_dotithidewhois"] === "on") {
                    $whoisData["technical_dotithidewhois"] = "Yes";
                } else {
                    $whoisData["technical_dotithidewhois"] = "No";
                }
            }
            $result = self::domainUpdate($params, array_merge([
                "registrant_clientip" => Support::getClientIp()
            ], $whoisData));

            if ($result["status"] === "FAILURE") {
                $errormessage = $result["message"];
            } else {
                $successmessage = "Data Saved Successfully";
            }
        }

        //Change the name of the tld specific fields
        switch ($tld) {
            case "fr":
            case "re":
            case "pm":
            case "yt":
            case "wf":
                foreach ($additionalfields as $key => &$value) {
                    if ($value["Name"] === "Holder Type") {
                        $value["Name"] = "dotfrcontactentitytype";
                    }
                    if ($value["Name"] === "Birth Date YYYY-MM-DD") {
                        $value["Name"] = "dotfrcontactentitybirthdate";
                    }
                    if ($value["Name"] === "Birth Country Code") {
                        $value["Name"] = "dotfrcontactentitybirthplacecountrycode";
                    }
                    if ($value["Name"] === "Birth City") {
                        $value["Name"] = "dotfrcontactentitybirthcity";
                    }
                    if ($value["Name"] === "Birth Postal code") {
                        $value["Name"] = "dotfrcontactentitybirthplacepostalcode";
                    }
                    if ($value["Name"] === "Restricted Publication") {
                        $value["Name"] = "dotfrcontactentityrestrictedpublication";
                    }
                    if ($value["Name"] === "Siren") {
                        $value["Name"] = "dotfrcontactentitysiren";
                    }
                    if ($value["Name"] === "Trade Mark") {
                        $value["Name"] = "dotfrcontactentitytradeMark";
                    }
                    if ($value["Name"] === "Waldec") {
                        $value["Name"] = "dotfrcontactentitywaldec";
                    }
                    if ($value["Name"] === "Date of Association YYYY-MM-DD") {
                        $value["Name"] = "dotfrcontactentitydateofassociation";
                    }
                    if ($value["Name"] === "Date of Publication YYYY-MM-DD") {
                        $value["Name"] = "dotfrcontactentitydateofpublication";
                    }
                    if ($value["Name"] === "Announce No") {
                        $value["Name"] = "dotfrcontactentityannounceno";
                    }
                    if ($value["Name"] === "Page No") {
                        $value["Name"] = "dotfrcontactentitypageno";
                    }
                    if ($value["Name"] === "Other Legal Status") {
                        $value["Name"] = "dotfrothercontactentity";
                    }
                    if ($value["Name"] === "VATNO") {
                        $value["Name"] = "dotfrcontactentityvat";
                    }
                    if ($value["Name"] === "DUNSNO") {
                        $value["Name"] = "dotfrcontactentityduns";
                    }
                }
                break;
            case "asia":
                foreach ($additionalfields as $key => &$value) {
                    if ($value["Name"] === "Locality") {
                        $value["Name"] = "dotasiacedlocality";
                    }
                    if ($value["Name"] === "Legal Entity Type") {
                        $value["Name"] = "dotasiacedentity";
                    }
                    if ($value["Name"] === "Identification Form") {
                        $value["Name"] = "dotasiacedidform";
                    }
                    if ($value["Name"] === "Identification Number") {
                        $value["Name"] = "dotasiacedidnumber";
                    }
                    if ($value["Name"] === "Other legal entity type") {
                        $value["Name"] = "dotasiacedentityother";
                    }
                    if ($value["Name"] === "Other identification form") {
                        $value["Name"] = "dotasiacedidformother";
                    }
                }
                break;
            case "us":
                foreach ($additionalfields as $key => &$value) {
                    $value["contactType"] = ["registrant"];
                    if ($value["Name"] === "Nexus Category") {
                        $value["DisplayName"] = $value["Name"];
                        $value["Name"] = "usnexuscategory";
                    }
                    if ($value["Name"] === "Nexus Country") {
                        $value["DisplayName"] = $value["Name"];
                        $value["Name"] = "usnexuscountry";
                    }
                    if ($value["Name"] === "Application Purpose") {
                        $value["DisplayName"] = $value["Name"];
                        $value["Name"] = "uspurpose";
                    }
                }
                break;
            case "de":
                foreach ($additionalfields as $key => &$value) {
                    if (strtolower($value["Name"]) === "tosagree") {
                        $value["contactType"] = ["other"];
                    }
                    if (strtolower($value["Name"]) === "role") {
                        $value["contactType"] = ["registrant"];
                    }
                    if (strtolower($value["Name"]) === "restricted publication") {
                        $value["contactType"] = ["registrant", "admin"];
                    }
                }
                array_unshift($additionalfields, [
                    "Name" => "role",
                    "DisplayName" => "Role",
                    "Type" => "dropdown",
                    "Options" => "person|Person",
                    "contactType" => ["admin"]
                ]);
                array_unshift($additionalfields, [
                    "Name" => "role",
                    "DisplayName" => "Role",
                    "Type" => "dropdown",
                    "Options" => "person|Person,role|Role",
                    "contactType" => ["technical"]
                ]);
                array_unshift($additionalfields, [
                    "Name" => "role",
                    "DisplayName" => "Role",
                    "Type" => "dropdown",
                    "Options" => "person|Person,role|Role",
                    "contactType" => ["zone"]
                ]);
                break;
            case "nl":
                foreach ($additionalfields as $key => &$value) {
                    if (strtolower($value["Name"]) === "nlterm") {
                        $value["contactType"] = ["registrant"];
                    }
                }
                break;
            case "it":
                foreach ($additionalfields as $key => &$value) {
                    if ($value["Name"] === "Legal Entity Type") {
                        $value["Name"] = "dotitentitytype";
                        $value["contactType"] = ["registrant"];
                    }
                    if ($value["Name"] === "Nationality") {
                        $value["Name"] = "dotitnationality";
                        $value["contactType"] = ["registrant"];
                    }
                    if ($value["Name"] === "VATTAXPassportIDNumber") {
                        $value["Name"] = "dotitregcode";
                        $value["contactType"] = ["registrant"];
                    }
                    if ($value["Name"] === "Hide data in public WHOIS") {
                        $value["Name"] = "dotithidewhois";
                    }
                    if ($value["Name"] === "itterms") {
                        $value["contactType"] = ["registrant"];
                    }
                }
                break;
            case "eu":
                foreach ($additionalfields as $key => &$value) {
                    if ($value["Name"] === "Language") {
                        $value["Name"] = "language";
                    }
                }
                break;
        }
        //Get Domain information
        $result = self::domainStatus($params);

        // If error, return the error message in the value below
        if ($result["status"] === "FAILURE") {
            $errormessage = $result["message"];
        } else {
            //assign additional fields to new array to display it to the users
            $contactIndex = 0;
            $contacts = [];
            $contactData = [];
            foreach ($result as $resultKey => $resultValue) {
                foreach ($additionalfields as $extravalue) {
                    if (strpos($resultKey, "contacts_") !== false) {
                        $newKey = str_replace("contacts_", "", $resultKey);
                        $newKey = explode("_", $newKey);
                        if (strtolower($extravalue["Name"]) === strtolower($newKey[1])) {
                            $contactData[$newKey[0]][$newKey[1]] = $result[$resultKey];
                            if (!in_array($newKey[0], $contacts)) {
                                $contacts[$contactIndex] = $newKey[0];
                                $contactIndex++;
                            }
                        }
                    }
                }
            }
            //tld specific modifications to additional fields values obtained from api
            if ($tld === "de") {
                if (strtolower($result["contacts_registrant_disclosename"]) === "yes" || strtolower($result["contacts_registrant_disclosecontact"]) === "yes" || strtolower($result["contacts_registrant_discloseaddress"]) === "yes") {
                    $contactData["registrant"]["restricted publication"] = "Yes";
                } else {
                    $contactData["registrant"]["restricted publication"] = "No";
                }
                if (strtolower($result["contacts_admin_disclosename"]) === "yes" || strtolower($result["contacts_admin_disclosecontact"]) === "yes" || strtolower($result["contacts_admin_discloseaddress"]) === "yes") {
                    $contactData["admin"]["restricted publication"] = "Yes";
                } else {
                    $contactData["admin"]["restricted publication"] = "No";
                }
                $contacts[$contactIndex] = "other";
                $contactData["other"]["tosagree"] = "NO";
            }
        }
        return [
            "templatefile" => "tpl_ca_additionalfields",
            "breadcrumb" => [
                "clientarea.php?action=domaindetails&id=" . $params["domainid"] . "&modop=custom&a=additionalfields" => "additionalfields"
            ],
            "vars" => [
                "additionalfields" => $additionalfields,
                "domainName" => $domainName,
                "whoisContacts" => $contacts ?? [],
                "additionalFieldValue" => $contactData ?? [],
                "errormessage" => $errormessage ?? "",
                "successmessage" => $successmessage ?? ""
            ]
        ];
    }

    /**
     * Custom Client Area Feature: URL Forwarding
     *
     * @param array<string,mixed> $params WHMCS' common module parameters
     * @return array<string,mixed>
     */
    public static function domainurlforwarding($params)
    {
        $domainid = $params["domainid"];
        $error = "";
        $success = false;

        $domainName = self::getDomain($params);
        $data = self::getUrlForwarding($params);
        if (isset($data["error"])) {
            $error = $data["error"];
            $data = [];
        } elseif ((isset($_POST["dnsrecordaddress"]) && is_countable($_POST["dnsrecordhost"])) ? count($_POST["dnsrecordaddress"]) > 0 : false) {
            // remove all existing records
            /** @var array{hostname:string,type:string,address:string} $row */
            foreach ($data as $i => $row) {
                $params["source"] = trim(trim($row["hostname"], " .") . "." . $domainName, " .");
                $result = self::removeUrlForwarding($params);
                if (isset($result["error"])) {
                    $error .= $result["error"] . "\n";
                }
            }

            // save new records from posted form
            $iMax = (isset($_POST["dnsrecordaddress"]) && is_countable($_POST["dnsrecordhost"])) ? count($_POST["dnsrecordaddress"]) : 0;
            for ($i = 0; $i < $iMax; $i++) {
                $params["hostName"] = $_POST["dnsrecordhost"][$i];
                $params["type"] = $_POST["dnsrecordtype"][$i];
                $params["address"] = $_POST["dnsrecordaddress"][$i];
                if ($params["hostName"] === "" || $params["type"] === "" || $params["address"] === "") { // empty line
                    continue;
                }
                $result = self::saveUrlForwarding($params);
                if (isset($result["error"])) {
                    $error .= $result["error"] . "\n";
                }
            }
            $data = self::getUrlForwarding($params);
            $success = empty($error);
        }
        return [
            "templatefile" => "tpl_ca_domainurlforwarding",
            "breadcrumb" => [
                "clientarea.php?action=domaindetails&domainid=" . $domainid . "&modop=custom&a=domainurlforwarding" => "URL Forwarding"
            ],
            "vars" => [
                "domainName" => $domainName,
                "domainid" => $domainid,
                "data" => $data,
                "errormessage" => $error,
                "success" => $success
            ]
        ];
    }

    /**
     * Undocumented function to validate user inputs in getConfigArray's form - only invoked if configuration settings are submitted
     *
     * @link https://www.whmcs.com/members/viewticket.php?tid=ESD-183344&c=wjZ1LjOs #ESD-183344
     * @param array<string,mixed> $params WHMCS' common module parameters
     * @throws \Exception
     * @return void
     */
    public static function configValidate($params)
    {
        $system = ($params["TestMode"] === "on") ? "TEST" : "LIVE";
        $error = self::isConnectionError($params);

        if ($error) {
            $url = $params["_registrar"]["support"]["support_url"];
            throw new \Exception(
                <<<HTML
                    <h2>Connecting to the {$system} Environment failed. <small>({$error})</small></h2>
                    <p>Reach out to <a href="{$url}" target="_blank" class="alert-link" style="text-decoration:underline">us</a> if you need help.
    HTML
            );
        } else {
            unset($_SESSION["ConfigurationWarning"]);
        }
    }

    /**
     * Return Registrar Module Configuration Settings
     * NOTE: for some reason, WHMCS is invoking the function twice
     *
     * @param array<string,mixed> $params WHMCS' common module parameters
     * @return array<string,mixed>
     */
    public static function getConfigArray($params)
    {
        global $CONFIG;

        $whmcsJson = $params["_registrar"];

        $configarray = [
            "FriendlyName" => [
                "Type" => "System",
                "Value" => "\0 " . $whmcsJson["description"]["name"]
            ],
            "Description" => [
                "Type" => "System",
                "Value" => $whmcsJson["_module"]["description"]
            ],
            "Username" => [
                "Type" => "text",
                "Size" => "50",
                "Description" => $whmcsJson["_module"]["description_apikey"]
            ],
            "Password" => [
                "Type" => "password",
                "Size" => "50",
                "Description" => $whmcsJson["_module"]["description_apipassword"]
            ],
            "TestMode" => [
                "FriendlyName" => "Test Mode",
                "Type" => "yesno",
                "Description" => $whmcsJson["_module"]["description_testmode"]
            ],
            "HideWhoisData" => [
                "FriendlyName" => "Hide Whois Data",
                "Type" => "yesno",
                "Description" => $whmcsJson["_module"]["description_feat_it_hide_whois"]
            ],
            "RenewAfterTransfer" => [
                "FriendlyName" => "Renew After Transfer",
                "Type" => "yesno",
                "Description" => $whmcsJson["_module"]["description_feat_renew_on_transfer"]
            ],
            "DNSSEC" => [
                "FriendlyName" => "Allow DNSSEC",
                "Type" => "yesno",
                "Default" => false,
                "Description" => $whmcsJson["_module"]["description_feat_dnssec"]
            ],
            "AUTOADDFIELDSINCLUDE" => [
                "FriendlyName" => "Additional Fields",
                "Type" => "yesno",
                "Default" => false,
                "Description" => $whmcsJson["_module"]["description_feat_auto_fields"]
            ],
            "SYNCIDPROTECTION" => [
                "FriendlyName" => "Sync Id Protection",
                "Type" => "yesno",
                "Description" => $whmcsJson["_module"]["description_feat_sync_idprotection"]
            ],
            "VALIDATEFIELDS" => [
                "FriendlyName" => "Prevalidate Additional Fields",
                "Type" => "yesno",
                "Default" => false,
                "Description" => $whmcsJson["_module"]["description_feat_validate_fields"]
            ],
        ];

        $results = localAPI("GetSupportDepartments", []);
        $departments = ["-"];
        if ($results["result"] === "success" && $results["totalresults"] > 0) {
            foreach ($results["departments"]["department"] as $dept) {
                $departments[] = $dept["name"] . " (" . $dept["id"] . ")";
            }
            $configarray["NotifyOnError"] = [
                "FriendlyName" => "Notify department",
                "Type" => "dropdown",
                "Description" => $whmcsJson["_module"]["description_feat_dep_notification"],
                "Options" => implode(",", $departments)
            ];
        }

        $parts = parse_url($CONFIG["SystemURL"]);
        $ip = "unknown";
        if ($parts !== false && isset($parts["host"])) {
            $ip = gethostbyname($parts["host"]);
        }
        $description = $whmcsJson["_module"]["description_feat_validation"];

        // Display user agent information only in the development environment
        $userAgent = "";
        if ($ip === "172.16.237.11") {
            $client = \CNIC\ClientFactory::getClient(["registrar" => strtoupper($whmcsJson["name"])]);
            $client->setUserAgent("WHMCS", $GLOBALS["CONFIG"]["Version"], ApiHandler::getStatisticsData($params));
            $userAgent = "<br /><b>User Agent:</b> " . htmlspecialchars($client->getUserAgent(), ENT_QUOTES, 'UTF-8');
        }

        $configarray[""] = [
            "Type" => "system",
            "Description" => (<<<HTML
                    <div class="alert alert-info" style="font-size:medium;margin-bottom:0px;">
                        {$description}: {$ip}
                        {$userAgent}
                    </div>
    HTML
            )
        ];

        return $configarray;
    }

    /**
     * Return Domain Status Data to WHMCS
     *
     * @param array<string,mixed> $params WHMCS' common module parameters
     * @return \WHMCS\Domain\Registrar\Domain
     */
    public static function getDomainInformation($params)
    {
        $domain = new RegistrarDomain();

        $data = self::domainStatus($params);
        if ($data["status"] === "FAILURE") {
            return $domain;
        }

        $domainName = self::getDomain($params);
        $nameservers = self::getNameservers($params, $data);
        $transferlock = self::getRegistrarLock($params, $data);

        $contactVerification = self::emailVerificationStatus($params);
        $isContactChangePending = self::isEmailVerificationPending($params, $contactVerification);
        $isContactChangeSuspended = self::isEmailVerificationSuspended($params, $contactVerification);
        if ($isContactChangePending) {
            $contactChangeExpiry = $contactVerification["expirationtime"]; // YYYY-MM-DD 00:00:00, UTC
            $domain->setDomainContactChangePending(true);
            $domain->setPendingSuspension(true);
            if (strtotime($contactChangeExpiry) > time()) {
                /*
                 * @phpstan-ignore-next-line
                 */
                $domain->setDomainContactChangeExpiryDate(\WHMCS\Carbon::createFromFormat("Y-m-d", $contactChangeExpiry));
            }
        }

        if ($isContactChangeSuspended) {
            $domain->setDomainContactChangePending(true)
                ->setPendingSuspension(true);
        }

        $domain
            ->setDomain($domainName)
            ->setRegistrantEmailAddress($data["contacts_registrant_email"] ?? "")
            ->setNameservers($nameservers)
            ->setDnsManagementStatus($params["original"]["dnsmanagement"] ?? $params["dnsmanagement"])
            ->setEmailForwardingStatus($params["original"]["emailforwarding"] ?? $params["emailforwarding"])
            ->setIdProtectionStatus(($data["whoisprivacy"] === "on"))
            ->setDomainContactChangePending($isContactChangePending)
            ->setTransferLock((is_string($transferlock) && $transferlock === "locked"))
            ->setIrtpVerificationTriggerFields(
                [
                    "Registrant" => [
                        "First Name",
                        "Last Name",
                        "Organization Name",
                        "Email"
                    ]
                ]
            )
            ->setIsIrtpEnabled(true);

        // ---------------------------------------------------------------------------------------
        // | ... ping Pavel in April 2025 again for this ...                                     |
        // ---------------------------------------------------------------------------------------
        // ->setIsIrtpEnabled(in_array($response["tld"], [".com"]))      <------------------- TODO
        // ->setIrtpOptOutStatus($response["irtp"]["optoutstatus"])      <------------------- TODO
        // ->setIrtpTransferLock($response["irtp"]["lockstatus"])        <------------------- TODO
        // ->IrtpTransferLockExpiryDate($irtpTransferLockExpiryDate)     <------------------- TODO
        // ---------------------------------------------------------------------------------------

        // if you update the expirydate detection here, please review the sync() method as well
        foreach (["paiduntil", "expiration"] as $key) {
            if (isset($data[$key]) && $data[$key] !== "n/a") {
                $ts = \WHMCS\Carbon::createFromFormat("Y-m-d", $data[$key]); // YYYY-MM-DD, UTC
                $domain->setExpiryDate($ts); // @phpstan-ignore-line
                break;
            }
        }

        /** Additional Registrar Data **/
        $domain->setPremium($data["price_ispremium"] !== "NO")
            ->setCreatedDate($data["registrationdate"])
            ->setSigned($data["dnssec"] !== "disabled");

        return $domain;
    }

    /**
     * Domain Synchronization Integration
     *
     * @param array<string,mixed> $params WHMCS' common module parameters
     * @return array<string,mixed>
     */
    public static function sync($params)
    {
        // RSRMID-1744 / RTLDEV-13317
        $domainName = self::getDomain($params);

        // -------------------------------------------------
        // Transferred Away
        // - - - - - - - - - - - - - - - - - - - - - - - - -
        // No longer returned by /domain/list is moved away
        // -------------------------------------------------
        $result = self::call($params, "Domain/List", [
            "searchTermFilter" => $domainName,
            "returnfields" => "expiration,status,PaidUntil"
        ]);

        if ($result["status"] === "FAILURE") {
            return Logger::logActivity($params, $result["message"]);
        }

        // searchTermFilter matches any string including the term as substring
        // so, not an exact match ...
        $index = -1;
        $domainNameLC = strtolower($domainName);
        foreach ($result as $key => $val) {
            if (
                (bool)preg_match("/^domain_([0-9]+)_name$/i", $key, $m)
                && (strtolower($val) === $domainNameLC)
            ) {
                $index = (int)$m[1];
                break;
            }
        }
        if ($index === -1) {
            Logger::logActivity($params, "transferred away");
            return [
                "transferredAway" => true
            ];
        }

        // get expiration data
        $expdate = "";
        foreach (["paiduntil", "expiration"] as $key) {
            $fullkey = "domain_" . $index . "_" . $key;
            // domain_0_expiration=YYYY-MM-DD
            // domain_0_paiduntil=YYYY-MM-DD
            if (isset($result[$fullkey]) && $result[$fullkey] !== "n/a") {
                $expdate = $result[$fullkey]; // Format: YYYY-MM-DD
                break;
            }
        }
        $data = [];
        if ($expdate !== "") {
            $data["expirydate"] = $expdate;
        }

        $status = strtoupper($result["domain_" . $index . "_status"]);

        // -------------------------------------------------
        // Expired (in Grace)
        // Expired (in Redemption)
        // - - - - - - - - - - - - - - - - - - - - - - - - -
        // via TRLDEV-13317
        // -------------------------------------------------
        if (in_array($status, ["EXPIRED", "DELETED"])) {
            Logger::logActivity($params, "expired");
            return array_merge($data, [
                "expired" => true
            ]);
        }

        // -------------------------------------------------
        // Pending Transfer
        // - - - - - - - - - - - - - - - - - - - - - - - - -
        // via TRLDEV-13317
        // -------------------------------------------------
        if ($status === "PENDING TRANSFER") {
            Logger::logActivity($params, "pending transfer");
            return $data; // update expiry date if available, otherwise no changes at all
        }

        // -------------------------------------------------
        // Active
        // - - - - - - - - - - - - - - - - - - - - - - - - -
        // via RTLDEV-13317
        // -------------------------------------------------
        Logger::logActivity($params);
        return array_merge($data, [
            "active" => true
        ]);
    }

    /**
     * Domain Transfer Synchronization Integration
     *
     * @param array<string,mixed> $params WHMCS' common module parameters
     * @return array<string,mixed>
     */
    public static function transferSync($params)
    {
        // RSRMID-1744 / RTLDEV-13317
        $result = self::domainStatus($params);

        if ($result["status"] === "SUCCESS") {
            Logger::logActivity($params);
            if ($result["domainstatus"] === "PENDING TRANSFER") {
                // keep transfer pending
                return [];
            }

            foreach (["paiduntil", "expirationdate"] as $key) {
                if (isset($result[$key]) && $result[$key] !== "n/a") {
                    return [
                        "completed" => true,
                        "expirydate" => $result[$key] // Format: YYYY-MM-DD
                    ];
                }
            }

            // keep transfer pending
            return [];
        }

        if ((int)$result["code"] === 100005) {
            // message=Permission denied! "<domain>" permission is not granted.
            $log = self::transferLog($params);
            if ($log["status"] === "SUCCESS") {
                Logger::logActivity($params, $log["reason"]);
                return [
                    "failed" => true,
                    "reason" => $log["reason"]
                ];
            }
            $msg = "no transfer in the registrar system";
            Logger::logActivity($params, $msg);
            return [
                "failed" => true,
                "reason" => $msg
            ];
        }
        return Logger::logActivity($params, $result["message"]);
    }

    /**
     * gets list of nameservers for a domain
     *
     * @param array<string,mixed> $params WHMCS' common module parameters
     * @param array<string,mixed>|null $result API Domain/Info response
     * @return array<string,string>
     */
    public static function getNameservers($params, $result = null)
    {
        $result ??= self::domainStatus($params);
        if ($result["status"] === "FAILURE") {
            return [];
        }

        // possible number of hosts exists
        $values = [];
        $i = 0;
        while (isset($result["nameserver_" . $i])) {
            $values["ns" . ($i + 1)] = strtolower(trim($result["nameserver_" . $i]));
            $i++;
        }

        return $values;
    }

    /**
     * attach nameserver to a domain by Domain/Update command
     *
     * @param array<string,mixed> $params WHMCS' common module parameters
     * @return array{error:string}|array{success:bool}
     */
    public static function saveNameservers($params)
    {
        $paramsData = $params["original"] ?? $params;
        $nslist = [];
        for ($i = 1; $i <= 5; $i++) {
            if (isset($paramsData["ns$i"])) {
                if (isset($paramsData["ns" . $i . "_ip"]) && strlen($paramsData["ns" . $i . "_ip"])) {
                    $paramsData["ns$i"] .= " " . $paramsData["ns" . $i . "_ip"];
                }
                $nslist[] = $paramsData["ns$i"];
            }
        }

        $result = self::domainUpdate($params, [
            "ns_list" => trim(implode(",", $nslist), ",")
        ]);

        if ($result["status"] === "FAILURE") {
            return Logger::logActivity($params, $result["message"]);
        }
        return Logger::logActivity($params);
    }

    /**
     * gets registrar lock status of a domain
     *
     * @param array<string,mixed> $params WHMCS' common module parameters
     * @param array<string,mixed>|null $result API Domain/Info response
     * @return array{error:string}|string
     */
    public static function getRegistrarLock($params, $result = null)
    {
        $result ??= self::isDomainLocked($params);
        if (isset($result["error"])) {
            return $result["error"];
        }
        return ($result["registrarlock"] === "ENABLED") ? "locked" : "unlocked";
    }

    /**
     * enable/disable registrar lock for a domain
     *
     * @param array<string,mixed> $params WHMCS' common module parameters
     * @return array{error:string}|array{success:bool}
     */
    public static function saveRegistrarLock($params)
    {
        $result = self::domainLockUpdate($params);

        if ($result["status"] === "FAILURE") {
            return Logger::logActivity($params, $result["message"]);
        }

        return Logger::logActivity($params);
    }

    /**
     * This function is called to toggle Id protection status
     * @param array<string,mixed> $params WHMCS' common module parameters
     * @return array{error:string}|array{success:bool}
     */

    public static function iDProtectToggle($params)
    {
        //if protectenable is set, we need to enable whois
        $result = self::domainWhoisPrivacyUpdate($params);

        if ($result["status"] === "FAILURE") {
            return Logger::logActivity($params, $result["message"]);
        }
        return Logger::logActivity($params);
    }

    /**
     * gets email forwarding rules list of a domain
     *
     * @param array<string,mixed> $params WHMCS input parameters
     * @return array{error:string}|array<int,array{prefix:string,forwardto:string,source:string}>
     */
    public static function getEmailForwarding($params)
    {
        //get email forwardings - the result should be an array of prefixes and forward to emails (max 10)
        $result = self::emailForwardingList($params);
        if (is_string($result)) {
            return [
                "error" => $result
            ];
        }
        return $result;
    }

    /**
     * saves email forwarding rules of a domain
     *
     * @param array<string,mixed> $params WHMCS input parameters
     * @return array{error:string}|array{success:bool}
     */
    public static function saveEmailForwarding($params)
    {
        // firstly, remove all existing rules
        $result = self::emailForwardingList($params);
        if (is_string($result)) { // error
            return [
                "error" => $result
            ];
        }
        foreach ($result as $rule) {
            // $source = trim($rule["prefix"], "@ ") . "@" . $domainName;
            self::emailForwardingRemove($params, [
                "source" => urlencode($rule["source"])
            ]);
        }

        // then, add new rules
        $errorMessages = "";
        $domainName = self::getDomain($params);
        $prefix = $params["original"]["prefix"] ?? $params["prefix"];
        $forwardto = $params["original"]["forwardto"] ?? $params["forwardto"];

        foreach ($prefix as $key => $value) {
            if (trim($forwardto[$key]) === "") {
                continue;
            }
            // try to add rule
            $result = self::emailForwardingAdd($params, [
                "source" => urlencode(trim($prefix[$key], "@ ") . "@" . $domainName),
                "destination" => urlencode($forwardto[$key])
            ]);
            if ($result["status"] === "FAILURE") {
                $errorMessages .= $result["message"];
            }
        }
        // error occurs
        if (strlen($errorMessages)) {
            return Logger::logActivity($params, $errorMessages);
        }
        return Logger::logActivity($params);
    }

    /**
     * gets DNS Record list of a domain
     *
     * @param array<string,mixed> $params WHMCS input parameters
     * @return array{error:string}|array<array{type:string,hostname:string,address:string,priority?:string}>
     */
    public static function getDNS($params)
    {
        $domainName = self::getDomain($params);

        $result = self::dnszoneRecordList($params);
        if ($result["status"] === "FAILURE") {
            return [
                "error" => $result["message"]
            ];
        }

        $totalRecords = 0;
        $regexp = "/^records_([0-9]+)_type$/";
        $keys = preg_grep($regexp, array_keys($result)) ?: [];
        foreach ($keys as $key) {
            list($prefix, $recNo) = explode("_", $key);
            $recNo = (int)$recNo;
            if ($recNo > $totalRecords) {
                $totalRecords = $recNo;
            }
        }

        $hostrecords = [];
        for ($i = 0; $i <= $totalRecords; $i++) {
            if (
                !isset(
                    $result["records_" . $i . "_type"],
                    $result["records_" . $i . "_name"],
                    $result["records_" . $i . "_value"]
                )
                || !preg_match("/^(A|MX|CNAME|TXT|AAAA)$/i", trim($result["records_" . $i . "_type"])) // TODO ... add more types
            ) {
                continue;
            }

            $recordHostname = $result["records_" . $i . "_name"];
            // If the record hostname matches the domain name, use '@'
            if ($recordHostname === $domainName) {
                $recordHostname = "@";
            } else {
                // Remove the domain name from the end of the record hostname
                $recordHostname = preg_replace('/\.' . preg_quote($domainName, '/') . '$/', '', $recordHostname);
            }

            $record = [
                "hostname" => $recordHostname,
                "type" => trim($result["records_" . $i . "_type"]),
                "address" => htmlspecialchars($result["records_" . $i . "_value"])
            ];
            if (isset($result["records_" . $i . "_priority"])) {
                $record["priority"] = $result["records_" . $i . "_priority"];
            }
            $hostrecords[] = $record;
        }

        $result = self::urlForwardList($params);
        if ($result["status"] === "FAILURE") {
            return [
                "error" => $result["message"]
            ];
        }

        $totalRecords = (int)$result["total_rules"];
        for ($i = 1; $i <= $totalRecords; $i++) {
            if (
                !isset(
                    $result["rule_" . $i . "_isframed"],
                    $result["rule_" . $i . "_source"],
                    $result["rule_" . $i . "_destination"]
                )
            ) {
                continue;
            }
            $recordHostname = $result["rule_" . $i . "_source"];
            if ($recordHostname === $domainName) {
                $recordHostname = "@";
            } else {
                $dParts = explode(".", $domainName);
                $hParts = explode(".", $recordHostname);
                $recordHostname = "";
                for ($j = 0; $j < (count($hParts) - count($dParts)); $j++) {
                    $recordHostname .= (empty($recordHostname) ? "" : ".") . $hParts[$j];
                }
            }

            $hostrecords[] = [
                "hostname" => $recordHostname,
                "type" => trim($result["rule_" . $i . "_isframed"]) === "YES" ? "FRAME" : "URL",
                "address" => htmlspecialchars($result["rule_" . $i . "_destination"])
            ];
        }
        return $hostrecords;
    }

    /**
     * saves dns records for a domain
     *
     * @param array<string,mixed> $params WHMCS input parameters
     * @return array{error:string}|array{success:true}
     */
    public static function saveDNS($params)
    {
        $domainName = self::getDomain($params);

        $recs = self::getDNS($params);
        if (isset($recs["error"])) {
            /** @var string $error */
            $error = $recs["error"];
            return Logger::logActivity($params, $error);
        }

        // First, remove all existing records
        /** @var array<array{type:string,hostname:string,address:string,priority?:string}> $records */
        $records = $recs;
        foreach ($records as $r) {
            $source = ($r["hostname"] === "@" || $r["hostname"] === $domainName)
                ? $domainName
                : rtrim($r["hostname"] . "." . $domainName, ". ");
            if ((bool)preg_match("/^(FRAME|URL)$/i", $r["type"])) {
                self::urlForwardRemove($params, [
                    "source" => $source
                ]);
                continue;
            }
            self::dnszoneRecordRemove($params, [
                "FullRecordName" => $source,
                "type" => $r["type"]
            ]);
        }
        // Loop through the submitted records
        $errorMessages = "";
        $dnsRecords = $params["original"]["dnsrecords"] ?? $params["dnsrecords"];

        $errorMessages = "";
        // Add only unique records
        $uniqueRecords = [];
        foreach ($dnsRecords as $rec) {
            if (
                !isset($rec["hostname"], $rec["type"], $rec["address"])
                || (trim($rec["address"]) === ""
                    && trim($rec["hostname"]) === "")
            ) {
                continue;
            }

            // Normalize hostname
            $hostname = trim($rec["hostname"]);
            if ($hostname === "@" || $hostname === "") {
                $hostname = $domainName;
            } else if (
                ($hostname !== $domainName)
                && strpos($hostname, "." . $domainName) === false
            ) {
                $hostname = $hostname . "." . $domainName;
            }
            $hostname = trim($hostname, ". ");

            // Normalize type
            $type = $rec["type"] === "SPF" ? "TXT" : $rec["type"];

            // Build unique key
            $priority = isset($rec["priority"]) ? intval($rec["priority"]) : 0;
            $key = $hostname . '|' . $type . '|' . trim($rec["address"]) . '|' . $priority;

            if (isset($uniqueRecords[$key])) {
                continue; // skip duplicate
            }
            if (strlen($rec["address"]) === 0) {
                continue; // skip empty address
            }
            $uniqueRecords[$key] = [
                "hostname" => $hostname,
                "type" => $type,
                "address" => $rec["address"],
                "priority" => $priority
            ];
        }

        foreach ($uniqueRecords as $rec) {
            if ((bool)preg_match("/^(URL|FRAME)$/", $rec["type"])) {
                $result = self::urlForwardAdd($params, [
                    "source" => $rec["hostname"],
                    "isFramed" => ($rec["type"] === "FRAME") ? "YES" : "NO",
                    "Destination" => $rec["address"]
                ]);
            } else {
                $result = self::dnszoneRecordAdd($params, [
                    "fullrecordname" => $rec["hostname"],
                    "type" => $rec["type"],
                    "value" => $rec["address"],
                    "priority" => $rec["priority"]
                ]);
            }

            if ($result["status"] === "FAILURE") {
                $errorMessages .= $result["message"];
            }
        }

        if (strlen($errorMessages)) {
            return Logger::logActivity($params, $errorMessages);
        }
        return Logger::logActivity($params);
    }

    /**
     * registers a domain
     *
     * @param array<string,mixed> $params WHMCS input parameters
     * @return array{error:string}|array{success:true}
     */
    public static function registerDomain($params)
    {
        $errormsg = "";
        $hideWhoisData = (isset($params["HideWhoisData"]) && ("on" === strtolower($params["HideWhoisData"]))) ? "YES" : "NO";
        $premiumDomainsEnabled = (bool)$params["premiumEnabled"];
        $premiumDomainsCost = $params["premiumCost"]; //this is USD because we only get the price in USD

        $tld = self::getTld($params);
        $domainName = self::getDomain($params);
        $regperiod = (int)$params["regperiod"];

        $nslist = [];
        if (isset($params["original"])) {
            $paramsData = $params["original"];
        } else {
            $paramsData = $params;
        }
        for ($i = 1; $i <= 5; $i++) {
            if (isset($paramsData["ns$i"])) {
                array_push($nslist, $paramsData["ns$i"]);
            }
        }

        $data = Contact::mapWHMCStoAPI($params);

        if ($premiumDomainsEnabled && $premiumDomainsCost) {
            $data["confirmpricecurrency"] = "USD";
            $data["confirmpriceamount"] = $premiumDomainsCost;
        }

        // ns_list is optional
        if (count($nslist)) {
            $data["ns_list"] = trim(implode(",", $nslist), ",");
        }
        if ($params["idprotection"]) {
            $data["privateWhois"] = "FULL";
        }

        $extarr = explode(".", $tld);
        $ext = array_pop($extarr);

        $fields = $params["additionalfields"] ?? [];

        // if DUNS & Siren Number fields are present and not empty, remove spaces
        foreach (["Siren", "DUNSNO"] as $field) {
            if (isset($fields[$field]) && strlen($fields[$field])) {
                $fields[$field] = preg_replace("/\s+/", "", $fields[$field]);
            }
        }

        if (in_array($tld, ["eu", "be", "uk"])) {
            $data["registrant_language"] = isset($fields["Language"]) ? $fields["Language"] : "en";
        }

        if ($tld === "se") {
            // Registrant ID Number
            if (isset($fields["seregistrantidnumber"])) {
                $data["registrant_idnumber"] = $fields["seregistrantidnumber"];
            }
            // Registrant VAT ID
            if (isset($fields["seregistrantvatid"])) {
                $data["registrant_vat"] = $fields["seregistrantvatid"];
            }
        }

        if ((bool)preg_match("/\.es$/i", $domainName)) {
            $ctypes = ["registrant", "admin", "technical", "billing"];
            $fieldKeys = [
                "_tipo-identificacion" => [
                    "ID Form Type",
                    "estldidformtype"
                ],
                "_identificacion" => [
                    "ID Form Number",
                    "estldidformnum"
                ],
                "_legalform" => [
                    "Legal Form",
                    "estldlegalform"
                ]
            ];
            foreach ($ctypes as $ctype) {
                foreach ($fieldKeys as $key1 => $keys2) {
                    foreach ($keys2 as $key2) {
                        if (isset($fields[$key2])) {
                            $data[$ctype . $key1] = $fields[$key2];
                            break;
                        }
                    }
                }
            }
        }

        if ($tld === "ca") {
            // Legal Entity Type
            if (isset($fields["calegalentitytype"])) {
                $data["registrant_entitytype"] = $fields["calegalentitytype"];
            }
            // Trademark Number
            if (isset($fields["catrademarknumber"])) {
                $data["registrant_trademarknumber"] = $fields["catrademarknumber"];
            }
            // Domain Name is Trademark?
            if (isset($fields["catrademark"])) {
                $data["registrant_trademark"] = $fields["catrademark"];
            }
        }

        if ($tld === "com.au") {
            // Legal Entity Type
            if (isset($fields["comaulegalentitytype"])) {
                $data["registrant_eligibilitytype"] = $fields["comaulegalentitytype"];
            }
            // Relation Type
            if (isset($fields["comaurelationtype"])) {
                $data["registrant_relationtypes"] = $fields["comaurelationtype"];
            }
            // Company / Trademark ID
            if (isset($fields["comaucompanynumber"])) {
                $data["registrant_companynumber"] = $fields["comaucompanynumber"];
            }
            // Trademark Owner Name
            if (isset($fields["comautrademarkownername"])) {
                $data["registrant_trademarkname"] = $fields["comautrademarkownername"];
            }
        }

        if ($tld === "eu") {
            if (!Country::isEuropeanLanguage($data["registrant_language"])) {
                $data["registrant_language"] = "en";
            }
            if (!Country::isEuropeanUnionCountry($data["registrant_countrycode"])) {
                //let the registration fail if the registrant is not from EU
                $errormsg = "Registration failed: Registrant must be from the European Union";
            }
        }

        if ($tld === "be") {
            if (!in_array($data["registrant_language"], ["en", "fr", "nl"])) {
                $data["registrant_language"] = "en";
            }

            // Same as for .EU
            if (!Country::isEuropeanUnionCountry($data["registrant_countrycode"])) {
                //let the registration fail if the registrant is not from EU
                $errormsg = "Registration failed: Registrant must be from the European Union";
            }
        }

        // ADDED FOR .DE //
        if ($tld === "de") {
            $isOrg = $fields["role"] === "ORG";
            $data["registrant_role"] = $fields["role"];
            $data["admin_role"] = "Person";
            $data["technical_role"] = ($isOrg) ? "Role" : "Person";
            $data["zone_role"] = ($isOrg) ? "Role" : "Person";

            $data["clientip"] = Support::getClientIp();
            $data["zone_firstname"] = $data["admin_firstname"];
            $data["zone_lastname"] = $data["admin_lastname"];
            $data["zone_email"] = $data["admin_email"];
            $data["zone_phonenumber"] = PhoneNumber::reformat($params["phonenumber"], $params["country"]);
            $data["zone_postalcode"] = $data["admin_postalcode"];
            $data["zone_city"] = $data["admin_city"];
            $data["zone_street"] = $data["admin_street"];
            $data["zone_countrycode"] = $data["admin_countrycode"];
        }
        // END OF .DE //

        // ADDED FOR .NL //

        if ($tld === "nl") {
            if ($fields["nlTerm"] !== "") {
                $data["registrant_nlTerm"] = "YES";
            } else {
                $data["registrant_nlTerm"] = "NO";
            }
            $data["registrant_clientip"] = Support::getClientIp();
            $data["registrant_nlLegalForm"] = $fields["nlLegalForm"];
            $data["registrant_nlRegNumber"] = $fields["nlRegNumber"];
            $data["technical_nlLegalForm"] = $fields["nlLegalForm"];
            $data["technical_nlRegNumber"] = $fields["nlRegNumber"];
            $data["admin_nlLegalForm"] = $fields["nlLegalForm"];
            $data["admin_nlRegNumber"] = $fields["nlRegNumber"];
            $data["billing_nlLegalForm"] = $fields["nlLegalForm"];
            $data["billing_nlRegNumber"] = $fields["nlRegNumber"];
        }
        //END OF .NL //

        if ($tld === "us") {
            if (isset($fields["Application Purpose"])) {
                $usDomainPurpose = trim($fields["Application Purpose"]);

                if (strtolower($usDomainPurpose) === strtolower("Business use for profit")) {
                    $data["registrant_uspurpose"] = "P1";
                } elseif (strtolower($usDomainPurpose) === strtolower("Educational purposes")) {
                    $data["registrant_uspurpose"] = "P4";
                } elseif (strtolower($usDomainPurpose) === strtolower("Personal Use")) {
                    $data["registrant_uspurpose"] = "P3";
                } elseif (strtolower($usDomainPurpose) === strtolower("Government purposes")) {
                    $data["registrant_uspurpose"] = "P5";
                } else {
                    $data["registrant_uspurpose"] = "P2";
                }
            } else {
                $data["registrant_uspurpose"] = $fields["uspurpose"];
            }
            if (isset($fields["Nexus Category"])) {
                $data["registrant_usnexuscategory"] = $fields["Nexus Category"];
            } else {
                $data["registrant_usnexuscategory"] = $fields["usnexuscategory"];
            }
            if (isset($fields["Nexus Country"])) {
                $data["registrant_usnexuscountry"] = $fields["Nexus Country"];
            } else {
                $data["registrant_usnexuscountry"] = $fields["usnexuscountry"];
            }
        }

        if ($ext === "uk") {
            $legalType = $fields["Legal Type"];
            $dotUKOrgType = $legalType;
            switch ($legalType) {
                case "Individual":
                    $dotUKOrgType = "IND";
                    break;
                case "UK Limited Company":
                    $dotUKOrgType = "LTD";
                    break;
                case "UK Public Limited Company":
                    $dotUKOrgType = "PLC";
                    break;
                case "UK Partnership":
                    $dotUKOrgType = "PTNR";
                    break;
                case "UK Limited Liability Partnership":
                    $dotUKOrgType = "LLP";
                    break;
                case "Sole Trader":
                    $dotUKOrgType = "STRA";
                    break;
                case "Industrial/Provident Registered Company":
                    $dotUKOrgType = "IP";
                    break;
                case "UK School":
                    $dotUKOrgType = "SCH";
                    break;
                case "Government Body":
                    $dotUKOrgType = "GOV";
                    break;
                case "Corporation By Royal Charter":
                    $dotUKOrgType = "CRC";
                    break;
                case "Uk Statutory Body":
                    $dotUKOrgType = "STAT";
                    break;
                case "UK Registered Charity":
                    $dotUKOrgType = "RCHAR";
                    break;
                case "UK Entity (other)":
                    $dotUKOrgType = "OTHER";
                    break;
                case "Non-UK Individual":
                    $dotUKOrgType = "FIND";
                    break;
                case "Non-Uk Corporation":
                    $dotUKOrgType = "FCORP";
                    break;
                case "Other foreign entity":
                    $dotUKOrgType = "FOTHER";
                    break;
            }

            if (in_array($dotUKOrgType, ["LTD", "PLC", "LLP", "IP", "SCH", "RCHAR"])) {
                $data["registrant_dotUkOrgNo"] = $fields["Company ID Number"];
                $data["registrant_dotUKRegistrationNumber"] = $fields["Company ID Number"];
            }

            // organization type
            $data["registrant_dotUKOrgType"] = isset($fields["Legal Type"]) ? $dotUKOrgType : "IND";
            if ($data["registrant_dotUKOrgType"] === "IND") {
                // hide data in private whois? (Y/N)
                $data["registrant_dotUKOptOut"] = "N";
            }

            $data["registrant_dotUKLocality"] = $data["admin_countrycode"];
        }

        if ($tld === "asia") {
            if (!isset($fields["Locality"])) {
                $data["registrant_dotASIACedLocality"] = $data["registrant_countrycode"];
            } else {
                $data["registrant_dotASIACedLocality"] = $fields["Locality"];
            }
            $data["registrant_dotasiacedentity"] = $fields["Legal Entity Type"];
            if ($data["registrant_dotasiacedentity"] === "other") {
                $data["registrant_dotasiacedentityother"] = isset($fields["Other legal entity type"]) ? $fields["Other legal entity type"] : "otheridentity";
            }
            $data["registrant_dotasiacedidform"] = $fields["Identification Form"];
            if ($data["registrant_dotasiacedidform"] !== "other") {
                $data["registrant_dotASIACedIdNumber"] = $fields["Identification Number"];
            }
            if ($data["registrant_dotasiacedidform"] === "other") {
                $data["registrant_dotasiacedidformother"] = isset($fields["Other identification form"]) ? $fields["Other identification form"] : "otheridentity";
            }
        }

        if (in_array($ext, ["fr", "re", "pm", "tf", "wf", "yt"])) {
            $holderType = isset($fields["Holder Type"]) ? $fields["Holder Type"] : "individual";
            $data["registrant_dotfrcontactentitytype"] = $holderType;
            $data["admin_dotfrcontactentitytype"] = $holderType;

            switch ($holderType) {
                case "individual":
                    $data["registrant_dotfrcontactentitybirthdate"] = $fields["Birth Date YYYY-MM-DD"];
                    $data["registrant_dotfrcontactentitybirthplacecountrycode"] = $fields["Birth Country Code"];
                    $data["admin_dotfrcontactentitybirthdate"] = $fields["Birth Date YYYY-MM-DD"];
                    $data["admin_dotfrcontactentitybirthplacecountrycode"] = $fields["Birth Country Code"];
                    if (strtolower($fields["Birth Country Code"]) === "fr") {
                        $data["registrant_dotFRContactEntityBirthCity"] = $fields["Birth City"];
                        $data["registrant_dotFRContactEntityBirthPlacePostalCode"] = $fields["Birth Postal code"];
                        $data["admin_dotFRContactEntityBirthCity"] = $fields["Birth City"];
                        $data["admin_dotFRContactEntityBirthPlacePostalCode"] = $fields["Birth Postal code"];
                    }
                    $data["registrant_dotFRContactEntityRestrictedPublication"] = isset($fields["Restricted Publication"]) ? 1 : 0;
                    $data["admin_dotFRContactEntityRestrictedPublication"] = isset($fields["Restricted Publication"]) ? 1 : 0;
                    break;
                case "company":
                    $data["registrant_dotFRContactEntitySiren"] = trim($fields["Siren"]);
                    $data["admin_dotFRContactEntitySiren"] = trim($fields["Siren"]);
                    break;
                case "trademark":
                    $data["registrant_dotFRContactEntityTradeMark"] = $fields["Trade Mark"];
                    $data["admin_dotFRContactEntityTradeMark"] = $fields["Trade Mark"];
                    break;
                case "association":
                    if (isset($fields["Waldec"]) && $fields["Waldec"] !== "") {
                        $data["registrant_dotFRContactEntityWaldec"] = $fields["Waldec"];
                        $data["admin_dotFRContactEntityWaldec"] = $fields["Waldec"];
                    } else {
                        $data["registrant_dotfrcontactentitydateofassociation"] = $fields["Date of Association YYYY-MM-DD"];
                        $data["registrant_dotFRContactEntityDateOfPublication"] = $fields["Date of Publication YYYY-MM-DD"];
                        $data["registrant_dotfrcontactentityannounceno"] = $fields["Annouce No"];
                        $data["registrant_dotFRContactEntityPageNo"] = $fields["Page No"];
                        $data["admin_dotfrcontactentitydateofassociation"] = $fields["Date of Association YYYY-MM-DD"];
                        $data["admin_dotFRContactEntityDateOfPublication"] = $fields["Date of Publication YYYY-MM-DD"];
                        $data["admin_dotfrcontactentityannounceno"] = $fields["Annouce No"];
                        $data["admin_dotFRContactEntityPageNo"] = $fields["Page No"];
                    }
                    break;
                case "other":
                    $data["registrant_dotFROtherContactEntity"] = $fields["Other Legal Status"];
                    $data["admin_dotFROtherContactEntity"] = $fields["Other Legal Status"];
                    if (isset($fields["Siren"])) {
                        $data["registrant_dotFRContactEntitySiren"] = $fields["Siren"];
                        $data["admin_dotFRContactEntitySiren"] = $fields["Siren"];
                    } elseif (isset($fields["Trade Mark"])) {
                        $data["registrant_dotFRContactEntityTradeMark"] = $fields["Trade Mark"];
                        $data["admin_dotFRContactEntityTradeMark"] = $fields["Trade Mark"];
                    }
                    break;
            }

            $data["registrant_dotFRContactEntityVat"] = trim($fields["VATNO"]);
            $data["admin_dotFRContactEntityVat"] = trim($fields["VATNO"]);
            $data["registrant_dotFRContactEntitySiren"] = $fields["Siren"];
            $data["admin_dotFRContactEntitySiren"] = $fields["Siren"];
            $data["registrant_dotFRContactEntityDuns"] = $fields["DUNSNO"];
            $data["admin_dotFRContactEntityDuns"] = $fields["DUNSNO"];

            if ($holderType !== "individual") {
                $data["registrant_dotFRContactEntityName"] = empty($data["registrant_organization"]) ? $data["registrant_firstname"] . " " . $data["registrant_lastname"] : $data["registrant_organization"];
                $data["admin_dotFRContactEntityName"] = empty($data["admin_organization"]) ? $data["admin_firstname"] . " " . $data["admin_lastname"] : $data["admin_organization"];
            }
        }

        if ($tld === "tel") {
            if (isset($fields["telhostingaccount"])) {
                $TelHostingAccount = $fields["telhostingaccount"];
            } else {
                $TelHostingAccount = md5($data["registrant_lastname"] . $data["registrant_firstname"] . time() . rand(0, 99999));
            }
            if (isset($fields["telhostingpassword"])) {
                $TelHostingPassword = $fields["telhostingpassword"];
            } else {
                $TelHostingPassword = "passwd" . rand(0, 99999);
            }

            $data["telHostingAccount"] = $TelHostingAccount;
            $data["telHostingPassword"] = $TelHostingPassword;
            if ($fields["telhidewhoisdata"] !== "") {
                $data["telHideWhoisData"] = "YES";
            } else {
                $data["telHideWhoisData"] = "NO";
            }
        }

        if ($tld === "it") {
            $EntityTypes = [
                "1. Italian and foreign natural persons" => 1,
                "2. Companies/one man companies" => 2,
                "3. Freelance workers/professionals" => 3,
                "4. non-profit organizations" => 4,
                "5. public organizations" => 5,
                "6. other subjects" => 6,
                "7. foreigners who match 2 - 6" => 7
            ];
            $legalEntityType = $fields["Legal Entity Type"];
            $et = $EntityTypes[$legalEntityType];
            $data["registrant_dotitentitytype"] = $et;

            $isDotIdAdminAndRegistrantSame = (1 === $et);
            if (strlen($fields["Nationality"]) > 2) {
                $nationality = Country::getCountryCodeByName($fields["Nationality"]);
            } else {
                $nationality = $fields["Nationality"];
            }
            if ($et >= 2 && $et <= 6) {
                $data["registrant_countrycode"] = $params["country"];
                $data["registrant_dotitnationality"] = $nationality;
            } elseif ($et === 7) {
                if (!Country::isEuropeanUnionCountry($data["registrant_countrycode"])) {
                    $errormsg = "Registration failed. Registrant should be from EU.";
                }
                $data["registrant_dotitnationality"] = $data["registrant_countrycode"];
            } else {
                if (!Country::isEuropeanUnionCountry($nationality) && !Country::isEuropeanUnionCountry($data["registrant_countrycode"])) {
                    //$nationality="IT";
                    $errormsg = "Registration failed. Registrant nationality or country of residence should be from EU.";
                }
                $data["registrant_dotitnationality"] = $nationality;
            }

            if (strtoupper($data["registrant_countrycode"]) === "IT") {
                // Extract province code from input value
                $data["registrant_dotitprovince"] = Country::getDotITProvinceCode($data["registrant_state"]);
            } else {
                $data["registrant_dotitprovince"] = $data["registrant_state"];
            }
            if (strtoupper($data["admin_countrycode"]) === "IT") {
                $data["admin_dotitprovince"] = Country::getDotITProvinceCode($data["admin_state"]);
            } else {
                $data["admin_dotitprovince"] = $data["admin_state"];
            }

            $data["technical_dotitprovince"] = $data["admin_dotitprovince"];

            $data["registrant_dotitregcode"] = $fields["VATTAXPassportIDNumber"];
            $data["registrant_dotithidewhois"] = ($fields["Hide data in public WHOIS"] === "on" && $et === 1) ? "YES" : "NO";
            $data["admin_dotithidewhois"] = $data["registrant_dotithidewhois"];

            // Hide or not data in public whois
            if (!$isDotIdAdminAndRegistrantSame) {
                $data["admin_dotithidewhois"] = $hideWhoisData;
            }
            $data["technical_dotithidewhois"] = $hideWhoisData;
            $data["registrant_clientip"] = Support::getClientIp();
            $data["registrant_dotitterm1"] = "yes";
            $data["registrant_dotitterm2"] = "yes";
            $data["registrant_dotitterm3"] = ($fields["Hide data in public WHOIS"] === "on" && $et === 1) ? "no" : "yes";
            $data["registrant_dotitterm4"] = "yes";
        }
        if ($tld === "ro") {
            $data["registrant_identificationnumber"] = $fields["CNPFiscalCode"];
            $data["registrant_companynumber"] = $fields["Registration Number"];
            $data["registrant_passport"] = $fields["CNPFiscalCode"];
            $data["registrant_vat"] = $fields["VAT Number"];
        }

        if ($tld === "dk") {
            foreach ($fields as $key => $value) {
                if (stripos($key, $tld) !== false) {
                    $data["registrant_" . strtolower($key)] = strtolower($value);
                }
            }
        }

        // period is optional
        if (isset($params["regperiod"]) && $regperiod > 0) {
            $data["period"] = $regperiod . "Y";
        }

        $result = null;
        if (empty($errormsg)) {
            // create domain
            $result = self::domainAdd($params, $data);

            // If error, return the error message in the value below
            $error = false;
            if ($result["status"] === "FAILURE") {
                $errormsg = $result["message"];
                $error = true;
            }

            if ($result["product_0_status"] === "FAILURE") {
                $error = true;
                if (!empty($errormsg)) {
                    $errormsg .= $result["product_0_message"];
                } else {
                    $errormsg = $result["product_0_message"];
                }
            }
            if ($error && empty($errormsg)) {
                $errormsg = "Error: cannot register domain";
            }
        }

        //There was an error registering the domain
        if (!empty($errormsg)) {
            Support::openTicket(
                $params,
                "$domainName registration error",
                ("There was an error registering the domain $domainName: " . $errormsg . "\n\n\n" .
                    "Request parameters: " . print_r($data, true) . "\n\n" .
                    "Response data: " . (is_null($result) ? "No API Request made." : print_r($result, true)) . "\n\n"
                )
            );
            return Logger::logActivity($params, $errormsg);
        }
        return Logger::logActivity($params);
    }


    /**
     * This function is called when a domain release is requested (eg. UK IPSTag Changes)
     *
     * @param array<string,mixed> $params WHMCS input parameters
     * @return array{success:true}|array{error:string}
     */
    public static function releaseDomain($params)
    {
        $result = self::dotUkTagUpdate($params);

        if ($result["status"] === "FAILURE") {
            return Logger::logActivity($params, $result["message"]);
        }
        return Logger::logActivity($params);
    }

    /**
     * initiates transfer for a domain
     *
     * @param array<string,mixed> $params WHMCS input parameters
     * @return array{success:true}|array{error:string}
     */
    public static function transferDomain($params)
    {
        $errormsg = "";
        $hideWhoisData = (isset($params["HideWhoisData"]) && ("on" === strtolower($params["HideWhoisData"]))) ? "YES" : "NO";

        $tld = self::getTld($params);
        $domainName = self::getDomain($params);

        $nslist = [];
        for ($i = 1; $i <= 5; $i++) {
            if (isset($params["ns$i"])) {
                array_push($nslist, $params["ns$i"]);
            }
        }

        $data = array_merge(Contact::mapWHMCStoAPI($params), [
            "transferAuthInfo" => $params["transfersecret"]
        ]);

        // ns_list is optional
        if (count($nslist)) {
            $data["ns_list"] = trim(implode(",", $nslist), ",");
        }

        $extarr = explode(".", $tld);
        $ext = array_pop($extarr);

        // ADDED FOR .EU, .BE, .UK //
        if ((bool)preg_match("/^(eu|be|ul)$/i", $tld)) {
            $data["registrant_language"] = isset($params["Language"]) ? $params["Language"] : "en";
        }
        // END OF .EU, .BE, .UK //

        // ADDED FOR .DE //
        if ((bool)preg_match("/\.de$/i", $domainName)) {
            if (strtolower($params["RenewAfterTransfer"]) === "on") {
                $data["RenewAfterTrasnfer"] = "Yes";
            }
            if ($params["additionalfields"]["role"] === "ORG") {
                $data["registrant_role"] = $params["additionalfields"]["role"];
                $data["admin_role"] = "Person";
                $data["technical_role"] = "Role";
                $data["zone_role"] = "Role";
            } else {
                $data["registrant_role"] = $params["additionalfields"]["role"];
                $data["admin_role"] = "Person";
                $data["technical_role"] = "Person";
                $data["zone_role"] = "Person";
            }
            if ($params["additionalfields"]["tosAgree"] !== "") {
                $data["tosAgree"] = "YES";
            } else {
                $data["tosAgree"] = "NO";
            }
            $data["registrant_sip"] = @$params["additionalfields"]["sip"];
            $data["clientip"] = Support::getClientIp();
            $data["registrant_clientip"] = $data["clientip"];
            if ($params["additionalfields"]["Restricted Publication"] !== "") {
                $data["registrant_discloseName"] = "YES";
                $data["registrant_discloseContact"] = "YES";
                $data["registrant_discloseAddress"] = "YES";
            } else {
                $data["registrant_discloseName"] = "NO";
                $data["registrant_discloseContact"] = "NO";
                $data["registrant_discloseAddress"] = "NO";
            }
            $data["zone_firstname"] = $data["admin_firstname"];
            $data["zone_lastname"] = $data["admin_lastname"];
            $data["zone_email"] = $data["admin_email"];
            $data["zone_phonenumber"] = PhoneNumber::reformat($params["phonenumber"], $params["country"]);
            $data["zone_postalcode"] = $data["admin_postalcode"];
            $data["zone_city"] = $data["admin_city"];
            $data["zone_street"] = $data["admin_street"];
            $data["zone_countrycode"] = $data["admin_countrycode"];
        }
        // END OF .DE //

        // ADDED FOR .NL //
        if ((bool)preg_match("/\.nl$/i", $domainName)) {
            if (strtolower($params["RenewAfterTransfer"]) === "on") {
                $data["renewAfterTrasnfer"] = "Yes";
            }
            if ($params["additionalfields"]["nlTerm"] !== "") {
                $data["registrant_nlTerm"] = "YES";
            } else {
                $data["registrant_nlTerm"] = "NO";
            }
            $data["registrant_clientip"] = Support::getClientIp();
            $data["registrant_nlLegalForm"] = $params["additionalfields"]["nlLegalForm"];
            $data["registrant_nlRegNumber"] = $params["additionalfields"]["nlRegNumber"];
        }
        // END OF .NL //

        // ADDED FOR .US //
        if ((bool)preg_match("/\.us$/i", $domainName)) {
            if (isset($params["additionalfields"]["Application Purpose"])) {
                $usDomainPurpose = trim($params["additionalfields"]["Application Purpose"]);

                if (strtolower($usDomainPurpose) === strtolower("Business use for profit")) {
                    $data["registrant_uspurpose"] = "P1";
                } elseif (strtolower($usDomainPurpose) === strtolower("Educational purposes")) {
                    $data["registrant_uspurpose"] = "P4";
                } elseif (strtolower($usDomainPurpose) === strtolower("Personal Use")) {
                    $data["registrant_uspurpose"] = "P3";
                } elseif (strtolower($usDomainPurpose) === strtolower("Government purposes")) {
                    $data["registrant_uspurpose"] = "P5";
                } else {
                    $data["registrant_uspurpose"] = "P2";
                }
            } else {
                $data["registrant_uspurpose"] = $params["additionalfields"]["uspurpose"];
            }
            if (isset($params["additionalfields"]["Nexus Category"])) {
                $data["registrant_usnexuscategory"] = $params["additionalfields"]["Nexus Category"];
            } else {
                $data["registrant_usnexuscategory"] = $params["additionalfields"]["usnexuscategory"];
            }
            if (isset($params["additionalfields"]["Nexus Country"])) {
                $data["registrant_usnexuscountry"] = $params["additionalfields"]["Nexus Country"];
            } else {
                $data["registrant_usnexuscountry"] = $params["additionalfields"]["usnexuscountry"];
            }
        }
        // END OF .US //

        // ADDED FOR .ASIA //
        if ((bool)preg_match("/\.asia$/i", $domainName)) {
            $data["registrant_dotASIACedLocality"] = $data["admin_countrycode"];
            $data["registrant_dotasiacedentity"] = $params["additionalfields"]["Legal Entity Type"];
            if ($data["registrant_dotasiacedentity"] === "other") {
                $data["registrant_dotasiacedentityother"] = isset($params["additionalfields"]["Other legal entity type"]) ? $params["additionalfields"]["Other legal entity type"] : "otheridentity";
            }
            $data["registrant_dotasiacedidform"] = $params["additionalfields"]["Identification Form"];
            if ($data["registrant_dotasiacedidform"] !== "other") {
                $data["registrant_dotASIACedIdNumber"] = $params["additionalfields"]["Identification Number"];
            }
            if ($data["registrant_dotasiacedidform"] === "other") {
                $data["registrant_dotasiacedidformother"] = isset($params["additionalfields"]["Other identification form"]) ? $params["additionalfields"]["Other identification form"] : "otheridentity";
            }
        }
        // END OF .ASIA //

        // ADDED FOR AFNIC TLDs //
        if (in_array($ext, ["fr", "re", "pm", "tf", "wf", "yt"])) {
            $holderType = isset($params["additionalfields"]["Holder Type"]) ? $params["additionalfields"]["Holder Type"] : "individual";

            if ($tld === "fr") {
                $holderType = isset($params["additionalfields"]["Holder Type"]) ? $params["additionalfields"]["Holder Type"] : "individual";
                //$data["admin_countrycode"] = "FR";
                if ($data["admin_countrycode"] !== "FR") {
                    $errormsg = "Administrator should be from France.";
                    Support::openTicket(
                        $params,
                        "$domainName transfer error",
                        ("There was an error starting transfer for $domainName: " . $errormsg . "\n\n\n" .
                            "Request parameters: " . print_r($data, true) . "\n\n" .
                            "Response data: No API Request made.\n\n"
                        )
                    );
                    return Logger::logActivity($params, "Transfer failed. " . $errormsg);
                }
            } elseif ($tld === "re") {
                $holderType = isset($params["additionalfields"]["Holder Type"]) ? $params["additionalfields"]["Holder Type"] : "other";
                //$data["registrant_countrycode"] = "RE";
                if ($data["registrant_countrycode"] !== "RE") {
                    $errormsg = "Registrant should be from Reunion.";
                    Support::openTicket(
                        $params,
                        "$domainName transfer error",
                        ("There was an error starting transfer for $domainName: " . $errormsg . "\n\n\n" .
                            "Request parameters: " . print_r($data, true) . "\n\n" .
                            "Response data: No API Request made.\n\n"
                        )
                    );
                    return Logger::logActivity($params, "Transfer failed. " . $errormsg);
                }
                if (!Country::isFrenchTerritory($data["admin_countrycode"])) {
                    $errormsg = "Administrator should be from Reunion.";
                    Support::openTicket(
                        $params,
                        "$domainName transfer error",
                        ("There was an error starting transfer for $domainName: " . $errormsg . "\n\n\n" .
                            "Request parameters: " . print_r($data, true) . "\n\n" .
                            "Response data: No API Request made.\n\n"
                        )
                    );
                    return Logger::logActivity($params, "Transfer failed. " . $errormsg);
                }
            }

            $data["registrant_dotfrcontactentitytype"] = $holderType;
            $data["admin_dotfrcontactentitytype"] = $holderType;

            switch ($holderType) {
                case "individual":
                    $data["registrant_dotfrcontactentitybirthdate"] = $params["additionalfields"]["Birth Date YYYY-MM-DD"];
                    $data["registrant_dotfrcontactentitybirthplacecountrycode"] = $params["additionalfields"]["Birth Country Code"];
                    $data["admin_dotfrcontactentitybirthdate"] = $params["additionalfields"]["Birth Date YYYY-MM-DD"];
                    $data["admin_dotfrcontactentitybirthplacecountrycode"] = $params["additionalfields"]["Birth Country Code"];
                    $data["registrant_dotFRContactEntityBirthCity"] = $params["additionalfields"]["Birth City"];
                    $data["registrant_dotFRContactEntityBirthPlacePostalCode"] = $params["additionalfields"]["Birth Postal code"];
                    $data["admin_dotFRContactEntityBirthCity"] = $params["additionalfields"]["Birth City"];
                    $data["admin_dotFRContactEntityBirthPlacePostalCode"] = $params["additionalfields"]["Birth Postal code"];

                    $data["registrant_dotFRContactEntityRestrictedPublication"] = isset($params["additionalfields"]["Restricted Publication"]) ? 1 : 0;
                    $data["admin_dotFRContactEntityRestrictedPublication"] = isset($params["additionalfields"]["Restricted Publication"]) ? 1 : 0;
                    break;
                case "company":
                    $data["registrant_dotFRContactEntitySiren"] = $params["additionalfields"]["Siren"];
                    $data["admin_dotFRContactEntitySiren"] = $params["additionalfields"]["Siren"];
                    break;
                case "trademark":
                    $data["registrant_dotFRContactEntityTradeMark"] = $params["additionalfields"]["Trade Mark"];
                    $data["admin_dotFRContactEntityTradeMark"] = $params["additionalfields"]["Trade Mark"];
                    break;
                case "association":
                    if (isset($params["Waldec"])) {
                        $data["registrant_dotFRContactEntityWaldec"] = $params["additionalfields"]["Waldec"];
                        $data["admin_dotFRContactEntityWaldec"] = $params["additionalfields"]["Waldec"];
                    } else {
                        $data["registrant_dotfrcontactentitydateofassociation"] = $params["additionalfields"]["Date of Association YYYY-MM-DD"];
                        $data["registrant_dotFRContactEntityDateOfPublication"] = $params["additionalfields"]["Date of Publication YYYY-MM-DD"];
                        $data["registrant_dotfrcontactentityannounceno"] = $params["additionalfields"]["Annouce No"];
                        $data["registrant_dotFRContactEntityPageNo"] = $params["additionalfields"]["Page No"];
                        $data["admin_dotfrcontactentitydateofassociation"] = $params["additionalfields"]["Date of Association YYYY-MM-DD"];
                        $data["admin_dotFRContactEntityDateOfPublication"] = $params["additionalfields"]["Date of Publication YYYY-MM-DD"];
                        $data["admin_dotfrcontactentityannounceno"] = $params["additionalfields"]["Annouce No"];
                        $data["admin_dotFRContactEntityPageNo"] = $params["additionalfields"]["Page No"];
                    }

                    break;
                case "other":
                    $data["registrant_dotFROtherContactEntity"] = $params["additionalfields"]["Other Legal Status"];
                    $data["admin_dotFROtherContactEntity"] = $params["additionalfields"]["Other Legal Status"];
                    if (isset($params["additionalfields"]["Siren"])) {
                        $data["registrant_dotFRContactEntitySiren"] = $params["additionalfields"]["Siren"];
                        $data["admin_dotFRContactEntitySiren"] = $params["additionalfields"]["Siren"];
                    } elseif (isset($params["additionalfields"]["Trade Mark"])) {
                        $data["registrant_dotFRContactEntityTradeMark"] = $params["additionalfields"]["Trade Mark"];
                        $data["admin_dotFRContactEntityTradeMark"] = $params["additionalfields"]["Trade Mark"];
                    }
                    break;
            }
            $data["registrant_dotFRContactEntitySiren"] = trim($params["additionalfields"]["Siren"]);
            $data["admin_dotFRContactEntitySiren"] = trim($params["additionalfields"]["Siren"]);
            $data["registrant_dotFRContactEntityVat"] = trim($params["additionalfields"]["VATNO"]);
            $data["admin_dotFRContactEntityVat"] = trim($params["additionalfields"]["VATNO"]);
            $data["registrant_dotFRContactEntityDuns"] = trim($params["additionalfields"]["DUNSNO"]);
            $data["admin_dotFRContactEntityDuns"] = trim($params["additionalfields"]["DUNSNO"]);

            if ($holderType !== "individual") {
                $data["registrant_dotFRContactEntityName"] = empty($data["registrant_organization"]) ? $data["registrant_firstname"] . " " . $data["registrant_lastname"] : $data["registrant_organization"];
                $data["admin_dotFRContactEntityName"] = empty($data["admin_organization"]) ? $data["admin_firstname"] . " " . $data["admin_lastname"] : $data["admin_organization"];
            }
        }
        // END OF AFNIC TLDs //

        // ADDED FOR .TEL //
        if ((bool)preg_match("/\.tel$/i", $domainName)) {
            if (isset($params["additionalfields"]["telhostingaccount"])) {
                $TelHostingAccount = $params["additionalfields"]["telhostingaccount"];
            } else {
                $TelHostingAccount = md5($data["registrant_lastname"] . $data["registrant_firstname"] . time() . rand(0, 99999));
            }
            if (isset($params["additionalfields"]["telhostingpassword"])) {
                $TelHostingPassword = $params["additionalfields"]["telhostingpassword"];
            } else {
                $TelHostingPassword = "passwd" . rand(0, 99999);
            }

            $data["telHostingAccount"] = $TelHostingAccount;
            $data["telHostingPassword"] = $TelHostingPassword;
            if ($params["additionalfields"]["telhidewhoisdata"] !== "") {
                $data["telHideWhoisData"] = "YES";
            } else {
                $data["telHideWhoisData"] = "NO";
            }
        }
        // END OF .TEL //

        // ADDED FOR .IT //
        if ((bool)preg_match("/\.it$/i", $domainName)) {
            $EntityTypes = [
                "1. Italian and foreign natural persons" => 1,
                "2. Companies/one man companies" => 2,
                "3. Freelance workers/professionals" => 3,
                "4. non-profit organizations" => 4,
                "5. public organizations" => 5,
                "6. other subjects" => 6,
                "7. foreigners who match 2 - 6" => 7
            ];
            // --- legal entity type
            $et = $EntityTypes[$params["additionalfields"]["Legal Entity Type"]];
            $data["registrant_dotitentitytype"] = $et;
            // error cases first - exit as early as possible
            if ($et === 7 && !Country::isEuropeanUnionCountry($data["registrant_countrycode"])) {
                $errormsg = "Registrant should be from EU.";
                Support::openTicket(
                    $params,
                    "$domainName transfer error",
                    ("There was an error starting transfer for $domainName: " . $errormsg . "\n\n\n" .
                        "Request parameters: " . print_r($data, true) . "\n\n" .
                        "Response data: No API Request made.\n\n"
                    )
                );
                return Logger::logActivity($params, "Transfer failed. " . $errormsg);
            }

            // --- nationality
            $data["registrant_dotitnationality"] = $params["additionalfields"]["Nationality"];
            if (strlen($data["registrant_dotitnationality"]) > 2) {
                $data["registrant_dotitnationality"] = Country::getCountryCodeByName($data["registrant_dotitnationality"]);
            }
            if ($et === 7) {
                $data["registrant_dotitnationality"] = $data["registrant_countrycode"];
            }

            // error cases first - exit as early as possible
            if ($et === 1) {
                if (
                    !Country::isEuropeanUnionCountry($data["registrant_dotitnationality"])
                    && !Country::isEuropeanUnionCountry($data["registrant_countrycode"])
                ) {
                    $errormsg = "Registrant country of residence of nationality should be from EU.";
                    Support::openTicket(
                        $params,
                        "$domainName transfer error",
                        ("There was an error starting transfer for $domainName: " . $errormsg . "\n\n\n" .
                            "Request parameters: " . print_r($data, true) . "\n\n" .
                            "Response data: No API Request made.\n\n"
                        )
                    );
                    return Logger::logActivity($params, "Transfer failed. " . $errormsg);
                }
            }

            $data["registrant_dotitprovince"] = $data["registrant_state"];
            if (strtoupper($data["registrant_countrycode"]) === "IT") {
                $data["registrant_dotitprovince"] = Country::getDotITProvinceCode($data["registrant_state"]);
            }
            $data["admin_dotitprovince"] = $data["admin_dotitprovince"];
            if (strtoupper($data["admin_countrycode"]) === "IT") {
                $data["admin_dotitprovince"] = Country::getDotITProvinceCode($data["admin_state"]);
            }

            $data["technical_dotitprovince"] = $data["admin_dotitprovince"];
            $data["registrant_dotitregcode"] = $params["additionalfields"]["VATTAXPassportIDNumber"];

            // Hide or not data in public whois
            $data["registrant_dotithidewhois"] = ($params["additionalfields"]["Hide data in public WHOIS"] === "on" && $et === 1
            ) ? "YES" : "NO";
            $data["admin_dotithidewhois"] = $data["registrant_dotithidewhois"];
            $isDotIdAdminAndRegistrantSame = (1 === $et);
            if (!$isDotIdAdminAndRegistrantSame) {
                $data["admin_dotithidewhois"] = $hideWhoisData;
            }
            $data["technical_dotithidewhois"] = $hideWhoisData;

            $data["registrant_clientip"] = Support::getClientIp();
            $data["registrant_dotitterm1"] = "yes";
            $data["registrant_dotitterm2"] = "yes";
            $data["registrant_dotitterm3"] = strtolower($data["registrant_dotithidewhois"]);
            $data["registrant_dotitterm4"] = "yes";
        }
        // END OF .IT //

        // START OF .CA //
        if ($tld === "ca") {
            // Legal Entity Type
            if (isset($params["additionalfields"]["calegalentitytype"])) {
                $data["registrant_entitytype"] = $params["additionalfields"]["calegalentitytype"];
            }
            // Trademark Number
            if (isset($params["additionalfields"]["catrademarknumber"])) {
                $data["registrant_trademarknumber"] = $params["additionalfields"]["catrademarknumber"];
            }
            // Domain Name is Trademark?
            if (isset($params["additionalfields"]["catrademark"])) {
                $data["registrant_trademark"] = $params["additionalfields"]["catrademark"];
            }
        }

        // END OF .CA //

        if ($params["idprotection"]) {
            $data["privateWhois"] = "FULL";
        }
        // initiate domain transfer
        $result = self::transferAdd($params, $data);

        $error = false;
        if ($result["status"] === "FAILURE") {
            $errormsg = $result["message"];
            $error = true;
        }
        if ($result["product_0_status"] === "FAILURE") {
            $error = true;
            if (!empty($errormsg)) {
                $errormsg .= $result["product_0_message"];
            } else {
                $errormsg = $result["product_0_message"];
            }
        }
        if ($error && empty($errormsg)) {
            $errormsg = "Error: cannot start transfer domain";
        }
        //There was an error transferring the domain
        if (!empty($errormsg)) {
            Support::openTicket(
                $params,
                "$domainName transfer error",
                ("There was an error starting transfer for $domainName: " . $errormsg . "\n\n\n" .
                    "Request parameters: " . print_r($data, true) . "\n\n" .
                    "Response data: " . print_r($result, true) . "\n\n"
                )
            );
            return Logger::logActivity($params, $errormsg);
        }

        if (isset($result["price"]) && $result["price"] === "0.00") {
            $regPeriod = (int)$params["regperiod"];
            $msg = (
                "The Domain Transfer for Domain **$domainName** can not technically be initiated using WHMCS **" . $regPeriod . "Y** " .
                "term, but allows for transferring for free. WHMCS is not compatible to this as it does not support this sort of transfer and does not support such a transfer. " .
                "WHMCS always expects a renewal to be included in a domain transfer which is this TLD not possible. Still, we successfully initiated the transfer for you for free." .
                " Finally, as of the missing renewal, this requires your attention and action.\n\n" .
                "After successful transfer completion, please trigger the renewal as follows:\n\n" .
                "## DOMAIN DETAILS ##\n" .
                "**Domain**: $domainName\n" .
                "**How many years**: $regPeriod\n\n" .
                "You do this by opening the domain, ensure it says $regPeriod in the Registration Period, then hit the **Renew** button, it will show the expiration date " .
                "showing +$regPeriod to the calendar year, match the next due accordingly. Then you can close this ticket."
            );
            Support::openTicket(
                $params,
                "$domainName transfer, missing Renewal",
                $msg,
                true
            );
        }

        return Logger::logActivity($params);
    }

    /**
     * renews a domain
     *
     * @param array<string,mixed> $params WHMCS input parameters
     * @return array{success:true}|array{error:string}
     */
    public static function renewDomain($params)
    {
        $domainName = self::getDomain($params);

        if (
            isset($params["isInRedemptionGracePeriod"])
            && $params["isInRedemptionGracePeriod"]
        ) {
            $result = self::domainRestore($params);
            if ($result["status"] !== "FAILURE") {
                return Logger::logActivity($params);
            }
        }

        $result = self::domainList($params, [
            "searchTermFilter" => $domainName,
            "returnfields" => "expiration,status"
        ]);
        if ($result["status"] === "FAILURE") {
            return Logger::logActivity($params, $result["message"]);
        }

        // Initialize index to -1 to indicate not found
        $index = -1;
        foreach ($result as $key => $val) {
            if (
                (bool)preg_match("/^domain_([0-9]+)_name$/i", $key, $m)
                && (strtolower($val) === $domainName)
            ) {
                $index = (int)$m[1];
                break;
            }
        }
        if ($index === -1) {
            return Logger::logActivity($params, "Domain not found in the provider's system: $domainName");
        }

        // currentexpiration parameter detection
        $response = DB::table("tbldomains")
            ->select("expirydate")
            ->where("id", $params["domainid"])
            ->first();

        if (is_null($response) || empty($response->expirydate)) {
            return Logger::logActivity($params, "Unable to fetch the expirydate for Domain: $domainName");
        }

        $dbCurrentExpiration = trim($response->expirydate);
        $dbCurrentExpirationTS = strtotime($dbCurrentExpiration);
        if ($dbCurrentExpirationTS === false) {
            return Logger::logActivity($params, "Invalid format for expirydate in DB for Domain: $domainName");
        }
        // Normally we expect from mysql to get result like YYYY-MM-DD, if it's not then we try to autofix it
        if (!preg_match("/^[0-9]{4}\-[0-9]{2}\-[0-9]{2}$/is", $dbCurrentExpiration)) {
            $dbCurrentExpirationTmp = date("Y-m-d", $dbCurrentExpirationTS);
            $dbCurrentExpirationTS = strtotime($dbCurrentExpirationTmp);
            if ($dbCurrentExpirationTS === false) {
                return Logger::logActivity($params, "Invalid format for expirydate in DB for Domain: $domainName ($dbCurrentExpiration)");
            }
        }

        $data = [];
        // Get expiration data
        /** @var string $expdate */
        $expdate = str_replace("n/a", "", $result["domain_" . $index . "_expiration"] ?? "");

        // detect currentexpiration API request parameter
        // Extract the year from both dates
        if ($expdate !== "") {
            $data["currentexpiration"] = $expdate; // Format: YYYY-MM-DD
            $apiCurrentExpirationTS = strtotime($data["currentexpiration"]);
            if ($apiCurrentExpirationTS === false) {
                return Logger::logActivity($params, "Invalid format for expiration date in Domain Registrar's System for Domain: $domainName, " . $data["currentexpiration"]);
            }
            $apiExpiryYear = date("Y", $apiCurrentExpirationTS);
            $dbExpiryYear = date("Y", $dbCurrentExpirationTS);
            if ($apiExpiryYear !== $dbExpiryYear) {
                return Logger::logActivity($params, "The domain appears to have already been renewed.");
            }
        }

        // period is optional
        if (
            isset($params["regperiod"])
            && (int)$params["regperiod"] > 0
        ) {
            $data["period"] = (int)$params["regperiod"] . "Y";
        }

        $result = self::domainRenew($params, $data);

        // If error, return the error message in the value below
        if ($result["status"] !== "FAILURE") {
            return Logger::logActivity($params);
        }

        //There was an error renewing the domain
        Support::openTicket(
            $params,
            "$domainName renew/restore error",
            ("There was an error with domain renew/restore of domain $domainName: " .
                $result["message"] . "\n\n\n" .
                "Request parameters: " . print_r($data, true) . "\n\n" .
                "Response data: " . print_r($result, true) . "\n\n"
            )
        );
        return Logger::logActivity($params, $result["message"]);
    }

    /**
     * gets contact details for a domain
     *
     * @param array<string,mixed> $params WHMCS input parameters
     * @return array<string,mixed>
     */
    public static function getContactDetails($params)
    {
        $result = self::domainStatus($params);

        if ($result["status"] === "FAILURE") {
            return [
                "error" => $result["message"]
            ];
        }

        $contactTypes = ["Registrant", "Admin", "Technical", "Billing"];
        $data = [];
        foreach ($contactTypes as $type) {
            $prefix = strtolower($type);
            $data[$type] = [
                "First Name" => $result["contacts_{$prefix}_firstname"] ?? '',
                "Last Name" => $result["contacts_{$prefix}_lastname"] ?? '',
                "Company Name" => $result["contacts_{$prefix}_organization"] ?? '',
                "Email" => $result["contacts_{$prefix}_email"] ?? '',
                "Phone Number" => $result["contacts_{$prefix}_phonenumber"] ?? '',
                "Address" => $result["contacts_{$prefix}_street"] ?? '',
                "Address 2" => $result["contacts_{$prefix}_street2"] ?? '',
                "State" => $result["contacts_{$prefix}_state"] ?? '',
                "Postcode" => $result["contacts_{$prefix}_postalcode"] ?? '',
                "City" => $result["contacts_{$prefix}_city"] ?? '',
                "Country" => $result["contacts_{$prefix}_countrycode"] ?? '',
            ];
        }

        return $data;
    }

    /**
     * Saves contact details
     *
     * @param array<string,mixed> $params WHMCS input parameters
     * @return array<string,mixed>
     */
    public static function saveContactDetails($params)
    {
        $tld = self::getTld($params);

        $fields = $params["additionalfields"] ?? [];

        $contactTypes = ["Registrant", "Admin", "Technical", "Billing"];
        $data = [];

        foreach ($contactTypes as $type) {
            $prefix = strtolower($type);
            $details = $params["contactdetails"][$type];
            $data["{$prefix}_firstname"] = $details["First Name"];
            $data["{$prefix}_lastname"] = $details["Last Name"];
            $data["{$prefix}_organization"] = $details["Company Name"];
            $data["{$prefix}_street"] = $details["Address"];
            $data["{$prefix}_street2"] = $details["Address 2"];
            $data["{$prefix}_city"] = $details["City"];
            $data["{$prefix}_state"] = $details["State"];
            $data["{$prefix}_countrycode"] = Country::getCountryCodeByName($details["Country"]);
            $data["{$prefix}_postalcode"] = $details["Postcode"];
            $data["{$prefix}_email"] = $details["Email"];
            $data["{$prefix}_phonenumber"] = PhoneNumber::reformat($details["Phone Number"], $data["{$prefix}_countrycode"]);
        }

        foreach ($data as $key => $val) {
            $data[$key] = html_entity_decode($val, ENT_QUOTES | ENT_XML1, "UTF-8");
        }

        $extarr = explode(".", $tld);
        $ext = array_pop($extarr);
        // Unset params which is not possible update for domain
        if ("it" === $ext) {
            //$params["additionalfields"]["Hide data in public WHOIS"] = empty($params["additionalfields"]["Hide data in public WHOIS"]) && !empty($getStatus["contacts_registrant_dotithidewhois"]) ? $getStatus["contacts_registrant_dotithidewhois"] : $params["additionalfields"]["Hide data in public WHOIS"];
            //$params["additionalfields"]["Legal Entity Type"] = empty($params["additionalfields"]["Legal Entity Type"]) && !empty($getStatus["contacts_registrant_dotitentitytype"]) ? $getStatus["contacts_registrant_dotitentitytype"] : $params["additionalfields"]["Legal Entity Type"];
            //$params["additionalfields"]["Nationality"] = empty($params["additionalfields"]["Nationality"]) && !empty($getStatus["contacts_registrant_dotitnationality"]) ? $getStatus["contacts_registrant_dotitnationality"] : $params["additionalfields"]["Nationality"];
            //$params["additionalfields"]["VATTAXPassportIDNumber"] = empty($params["additionalfields"]["VATTAXPassportIDNumber"]) && !empty($getStatus["contacts_registrant_dotitregcode"]) ? $getStatus["contacts_registrant_dotitregcode"] : $params["additionalfields"]["VATTAXPassportIDNumber"];
            $data["registrant_clientip"] = Support::getClientIp();
            $data["registrant_dotitterm1"] = "yes";
            $data["registrant_dotitterm2"] = "yes";
            $data["registrant_dotitterm3"] = $fields["Hide data in public WHOIS"] === "on" ? "no" : "yes";
            $data["registrant_dotitterm4"] = "yes";
            $data["registrant_dotitentitytype"] = $fields["Legal Entity Type"];
            $data["registrant_dotitnationality"] = $fields["Nationality"];
            $data["registrant_dotitregcode"] = $fields["VATTAXPassportIDNumber"];
        }

        if ($ext === "nl") {
            //$params["additionalfields"]["nlLegalForm"] = empty($params["additionalfields"]["nlLegalForm"]) && !empty($getStatus["contacts_registrant_nllegalform"]) ? $getStatus["contacts_registrant_nllegalform"] : $params["additionalfields"]["nlLegalForm"];
            //$params["additionalfields"]["nlRegNumber"] = empty($params["additionalfields"]["nlRegNumber"]) && !empty($getStatus["contacts_registrant_nlregnumber"]) ? $getStatus["contacts_registrant_nlregnumber"] : $params["additionalfields"]["nlRegNumber"];
            //$params["additionalfields"]["nlTerm"] = empty($params["additionalfields"]["nlTerm"]) && !empty($getStatus["contacts_registrant_nlterm"]) ? $getStatus["contacts_registrant_nlterm"] : $params["additionalfields"]["nlTerm"];
            $data["registrant_clientip"] = Support::getClientIp();
            $data["registrant_nlTerm"] = ($fields["nlTerm"] !== "") ? "YES" : "NO";
            $data["registrant_nllegalform"] = $fields["nlLegalForm"];
            $data["registrant_nlregnumber"] = $fields["nlRegNumber"];
        }

        if ($ext === "de") {
            $admin = $params["contactdetails"]["Admin"];
            $data["zone_firstname"] = $admin["First Name"];
            $data["zone_lastname"] = $admin["Last Name"];
            $data["zone_email"] = $admin["Email"];
            $data["zone_phonenumber"] = PhoneNumber::reformat($admin["Phone Number"], $admin["Country"]);
            $data["zone_postalcode"] = $admin["Postcode"];
            $data["zone_city"] = $admin["City"];
            $data["zone_street"] = $admin["Address"];
            $data["zone_countrycode"] = $admin["Country"];
            $data["tosagree"] = "Yes";
        }

        $data["clientip"] = Support::getClientIp();
        $data["registrant_clientip"] = Support::getClientIp();

        $result = self::domainUpdate($params, $data);

        if ($result["status"] === "FAILURE") {
            return Logger::logActivity($params, $result["message"]);
        }
        return Logger::logActivity($params);
    }

    /**
     * gets domain secret/ transfer auth info of a domain
     *
     * @param array<string,mixed> $params WHMCS input parameters
     * @return array{eppcode:string}|array{error:string}|array{}
     */
    public static function getEPPCode($params)
    {
        // code to request the EPP code
        // if the API returns it, [ "eppcode" => ... ]
        // otherwise return empty array and it will assume code is emailed
        // in case of error return [ "error" => ... ] as usual
        $domainName = self::getDomain($params);

        if ((bool)preg_match("/\.(be|de|eu|no)$/i", $domainName)) {
            $result = self::domainAuthInfoStatus($params);
            $result["transferauthinfo"] = $result["password"] ?? "";
        }
        // either the above TLD regex did not apply or the transferauthinfo got not returned
        if (empty($result["transferauthinfo"])) {
            $result = self::domainStatus($params);
        }

        if ($result["status"] === "FAILURE") {
            /** @var array{error:string} $response */
            $response = Logger::logActivity($params, $result["message"]);
            return $response;
        }
        if (empty($result["transferauthinfo"])) {
            return []; // shows to endcustomer that it is send to registrant by email
        }
        Logger::logActivity($params);
        return [
            "eppcode" => $result["transferauthinfo"]
        ];
    }

    /**
     * creates a host for a domain
     *
     * @param array<string,mixed> $params WHMCS input parameters
     * @return array{success:true}|array{error:string}
     */
    public static function registerNameserver($params)
    {
        $result = self::hostAdd($params);

        if ($result["status"] === "FAILURE") {
            $reason = isset($result["message"]) ?
                $result["message"] :
                "Due to some technical issue nameserver cannot be registered.";
            return Logger::logActivity($params, $reason);
        }
        return Logger::logActivity($params);
    }

    /**
     * updates host of a domain
     *
     * @param array<string,mixed> $params WHMCS input parameters
     * @return array{success:true}|array{error:string}
     */
    public static function modifyNameserver($params)
    {
        $result = self::hostUpdate($params);

        if ($result["status"] === "FAILURE") {
            return Logger::logActivity($params, $result["message"]);
        }

        return Logger::logActivity($params);
    }

    /**
     * Gets the private nameservers
     *
     * @param array<string,mixed> $params WHMCS input parameters
     * @return array<string,array<string,list<string>|string>>
     */
    public static function getHostsForDomain($params)
    {
        $result = self::hostList($params);

        if ($result["status"] === "FAILURE") {
            Logger::logActivity($params, $result["message"]);
            return [];
        }

        $hostrecords = [];
        $totalRecords = (int)$result["total_hosts"];

        for ($i = 1; $i <= $totalRecords; $i++) {
            if (!isset($result["host_" . $i . "_hostname"])) {
                continue;
            }
            $hostName = htmlspecialchars($result["host_" . $i . "_hostname"]);
            $ipCount = (int)$result["host_" . $i . "_ipcount"];
            if ($ipCount === 0) {
                continue;
            }

            $ipAddress = [];
            for ($j = 1; $j <= $ipCount; $j++) {
                $ipAddress[] = htmlspecialchars($result["host_" . $i . "_ip_" . $j]);
            }

            $hostrecords[$hostName] = [
                "ips" => $ipAddress,
                "sub" => str_ireplace("." . $params["domain"], "", $hostName)
            ];
        }

        return $hostrecords;
    }
    /**
     * deletes a host
     *
     * @param array<string,mixed> $params WHMCS input parameters
     * @return array{success:true}|array{error:string}
     */
    public static function deleteNameserver($params)
    {
        $result = self::hostRemove($params);

        if ($result["status"] === "FAILURE") {
            return Logger::logActivity($params, $result["message"]);
        }
        return Logger::logActivity($params);
    }

    /**
     * Get Domain Name Suggestions
     *
     * @param array<string,mixed> $params WHMCS input parameters
     * @return \WHMCS\Domains\DomainLookup\ResultsList
     */
    public static function getDomainSuggestions($params)
    {
        return new ResultsList();
    }

    /**
     * Check Domain Availability
     *
     * @param array<string,mixed> $params WHMCS input parameters
     * @return \WHMCS\Domains\DomainLookup\ResultsList
     */
    public static function checkAvailability($params)
    {
        $sld = $params["searchTerm"]; //$params["sld"];
        $tlds = $params["tldsToInclude"];

        $results = new ResultsList();
        foreach ($tlds as $tld) {
            $res = self::domainCheck($params, $tld);

            $sr = new SearchResult($sld, $tld);
            $sr->setStatus($res["status"]);
            $sr->setPremiumDomain($res["premium"]);
            $sr->setPremiumCostPricing($res["premiumCostPricing"]);
            $results->append($sr);
        }
        return $results;
    }

    /**
     * Get Url Forwardings
     *
     * @param array<string,mixed> $params WHMCS input parameters
     * @return array{error:string}|array<array{hostname:string,type:string,address:string}>
     */
    public static function getUrlForwarding($params)
    {
        $domainName = self::getDomain($params);
        $result = self::urlForwardList($params);

        if ($result["status"] === "FAILURE") {
            return [
                "error" => $result["message"]
            ];
        }
        $hostrecords = [];
        $totalRecords = (int)$result["total_rules"];
        for ($i = 1; $i <= $totalRecords; $i++) {
            if (
                !isset(
                    $result["rule_" . $i . "_source"],
                    $result["rule_" . $i . "_isframed"],
                    $result["rule_" . $i . "_destination"]
                )
            ) {
                continue;
            }

            $recordHostname = $result["rule_" . $i . "_source"];
            $dParts = explode(".", $domainName);
            $hParts = explode(".", $recordHostname);
            $recordHostname = "";
            for ($j = 0; $j < (count($hParts) - count($dParts)); $j++) {
                $recordHostname .= (empty($recordHostname) ? "" : ".") . $hParts[$j];
            }

            $hostrecords[] = [
                "hostname" => $recordHostname,
                "type" => trim($result["rule_" . $i . "_isframed"]) === "YES" ? "FRAME" : "URL",
                "address" => htmlspecialchars($result["rule_" . $i . "_destination"])
            ];
        }

        return $hostrecords;
    }

    /**
     * Save Url Forwarding
     *
     * @param array<string,mixed> $params WHMCS input parameters
     * @return array{error:string}|array{success:true}
     */
    public static function saveUrlForwarding($params)
    {
        $destination = trim($params["address"], " .");
        if (empty($destination)) {
            return ["error" => "Empty destination address data field."];
        }
        $domainName = trim(trim($params["hostName"], ". ") . "." . $params["domainname"], ".");
        $result = self::urlForwardAdd($params, [
            "Source" => $domainName,
            "isFramed" => ($params["type"] === "FRAME") ? "YES" : "NO",
            "Destination" => $destination
        ]);

        if ($result["status"] === "FAILURE") {
            return Logger::logActivity($params, $result["message"]);
        }
        return Logger::logActivity($params);
    }

    /**
     * Remove Url Forwarding
     *
     * @param array<string,mixed> $params WHMCS input parameters
     * @return array{error:string}|array{success:true}
     */
    public static function removeUrlForwarding($params)
    {
        $result = self::urlForwardRemove($params, [
            "source" => $params["source"]
        ]);

        if ($result["status"] === "FAILURE") {
            return Logger::logActivity($params, $result["message"]);
        }
        return Logger::logActivity($params);
    }

    /**
     * Get TLD Pricing
     *
     * @param array<string,mixed> $params WHMCS input parameters
     * @return \WHMCS\Results\ResultsList
     */
    public static function getTldPricing(array $params)
    {
        $registrarid = $params["_registrar"]["name"];
        $results = new \WHMCS\Results\ResultsList();
        // Perform API call to retrieve extension information
        // A connection error should return a simple array with error key and message
        // return ["error" => "This error occurred",];
        $r = self::accountPriceList($params);

        $i = 0;
        while (isset($r["product_" . $i . "_tld"])) {
            list($tld, $product) = explode(" ", $r["product_" . $i . "_name"]);

            // dot is mandatory for the idn conversion
            $converted = \CNIC\IDNA\Factory\ConverterFactory::convert("." . $r["product_" . $i . "_tld"]);
            $tld = substr($converted["idn"], 1); // WHMCS needs IDN without leading dot

            // All the set methods can be chained and utilised together.
            $item = (new ImportItem())
                ->setExtension($tld)
                ->setMinYears($r["product_" . $i . "_minperiod"])
                ->setMaxYears($r["product_" . $i . "_maxperiod"])
                ->setRegisterPrice($r["product_" . $i . "_registration"])
                ->setRenewPrice($r["product_" . $i . "_renewal"])
                ->setTransferPrice($r["product_" . $i . "_transfer"])
                ->setRedemptionFeeDays(((int)trim($r["product_" . $i . "_rgp"])) / 24)
                ->setRedemptionFeePrice($r["product_" . $i . "_restore"])
                ->setCurrency($r["product_" . $i . "_currency"])
                ->setEppRequired((strtolower($r["product_" . $i . "_authinforequired"]) === "yes"));

            $results[] = $item;
            $i++;
        }

        // update id protection (missing feature in registrar tld sync)
        if ($params["SYNCIDPROTECTION"] === "on") {
            // fetch list of tlds that support whois privacy
            $tlds = self::domainWhoisPrivacyList($params);
            // disable id protection for all our TLDs
            DB::table("tbldomainpricing")
                ->where("autoreg", $registrarid)
                ->whereNotIn("extension", $tlds)
                ->update(["idprotection" => 0]);
            // enable id protection for all our TLDs supporting it
            DB::table("tbldomainpricing")
                ->where("autoreg", $registrarid)
                ->whereIn("extension", $tlds)
                ->update(["idprotection" => 1]);
        }

        return $results;
    }

    /**
     * Get Premium Domain Pricing
     *
     * @param array<string,mixed> $params common module parameters
     * @return array<string,mixed>
     */
    public static function getPremiumPrice($params)
    {
        $domainName = self::getDomain($params);
        $result = self::domainCheck($params, $domainName);

        if ($result["status"] === "FAILURE") {
            return [];
        }

        if ($result["premium"]) {
            $currency = \WHMCS\Billing\Currency::where("code", $result["premiumCostPricing"]["CurrencyCode"])->first();
            if (!$currency) {
                Logger::logActivity($params, "Missing required currency configuration in WHMCS system: " . $result["premiumCostPricing"]["CurrencyCode"]);
                return [];
            }

            if (empty($result["premiumCostPricing"])) {
                Logger::logActivity($params, "Premium prices are missing for the domain: " . $domainName);
                return [];
            }

            list($sld, $tld) = explode(".", $params["domain"], 2);
            $sr = new SearchResult($sld, $tld);
            $sr->setPremiumDomain(true);
            $sr->setPremiumCostPricing(
                $result["premiumCostPricing"]
            );
            $getPremiumPriceWithMarkup = $sr->pricing()->toArray(); // object to array
            $registerPrice = $getPremiumPriceWithMarkup[1]["register"]->getValue();
            $renewPrice = $getPremiumPriceWithMarkup[1]["renew"]->getValue();
            $transferPrice = $getPremiumPriceWithMarkup[1]["transfer"]->getValue();
            $redemptionPrice = $getPremiumPriceWithMarkup[1]["redemptionFee"]->getValue();
            $currency = $getPremiumPriceWithMarkup[1]["renew"]->getCurrency()["code"];
            return [
                "CurrencyCode" => $currency,
                "register" => $registerPrice,
                "renew" => $renewPrice,
                "transfer" => $transferPrice,
                "redemptionFee" => $redemptionPrice,
            ];
        }

        return [];
    }

    /**
     * Get Account Details
     *
     * @param array<string,mixed> $params common module parameters
     * @return array<string,mixed>
     */
    public static function getAccountDetails($params)
    {
        $result = self::accountBalanceStatus($params);
        if ($result["status"] === "FAILURE") {
            return [];
        }
        return $result;
    }
}
