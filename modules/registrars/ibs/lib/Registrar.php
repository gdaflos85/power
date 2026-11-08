<?php

namespace WHMCS\Module\Registrar\Ibs;

use WHMCS\Domains\DomainLookup\SearchResult;

class Registrar extends ApiHandler
{
    /**
     * Get the domain name from the given WHMCS parameters
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return string
     */
    public static function getDomain($params)
    {
        $tmp = $params["original"] ?? $params;
        // the api can't handle uppercase or camelcase
        return strtolower($tmp["domainname"] ?? $tmp["domain"] ?? ($tmp["sld"] . "." . $tmp["tld"]));
    }

    /**
     * Get the Domain Extension from the given WHMCS parameters
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return string
     */
    public static function getTld($params)
    {
        return $params["original"]["tld"] ?? $params["tld"];
    }

    /**
     * Get the nameserver from WHMCS' input data
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return string
     */
    private static function getNameserver($params)
    {
        $domain = self::getDomain($params);
        $nameserver = $params["original"]["nameserver"] ?? $params["nameserver"];
        if (($nameserver !== $domain) && strpos($nameserver, "." . $domain) === false) {
            $nameserver = $nameserver . "." . $domain;
        }
        return $nameserver;
    }

    /**
     * Get the TLD Info
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return array{tld:string,features:array{dnssec:bool,privatewhois:bool,supports_ds_data:bool,supports_key_data:bool}}|array{tld:string,error:string}
     */
    public static function getTldInfo($params)
    {
        $tld = self::getTld($params);
        $data = [
            "tld" => $tld
        ];

        // fetch TLD Info
        $result = self::call($params, "Domain/Tldinfo", $data);

        if ($result["status"] !== "SUCCESS") {
            return array_merge($data, [
                "error" => $result["message"]
            ]);
        }

        return array_merge($data, [
            "features" => [
                "dnssec" => $params["DNSSEC"] === "on" && $result["feature_dnssec"] === "YES", // DNSSEC support only offered in case it is enabled in WHMCS and supported by the registrar
                "privatewhois" => $result["feature_privatewhois"] === "YES", // Private WHOIS Support
                "supports_ds_data" => ($result["feature_dnssec_key_type"] === "DS"), // DNSSEC: DS Data Support
                "supports_key_data" => ($result["feature_dnssec_key_type"] !== "DS") // DNSSEC: Key Data Support
            ]
        ]);
    }

    /**
     * Get the Email Verification Details
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return array<string,mixed>
     */
    public static function emailVerificationStatus($params)
    {
        $response = [
            "domain" => self::getDomain($params),
            "domainid" => $params["domainid"]
        ];
        $result = self::call($params, "Domain/RegistrantVerification/Info", [
            "domain" => self::getDomain($params)
        ]);
        // Domain/RegistrantVerification/Info
        // status=SUCCESS
        // email=...
        // initiationdate=YYYY/MM/DD
        // expirationdate=YYYY/MM/DD
        // currentstatus=PENDING|VERIFIED|FAILED|NOT VERIFIED
        // PENDING and VERIFIED: obvious
        // FAILED: means the domain(s)/account using it is/are suspended
        // NOT VERIFIED: means not even attempted to verify (nothing triggered the verification)

        if ($result["status"] === "FAILURE") {
            return array_merge($response, [
                "error" => $result["message"]
            ]);
        }
        return array_merge($response, $result);
    }

    /**
     * Check if the email verification is pending
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @param array<string,mixed> $result result of emailVerificationStatus
     * @return bool
     */
    public static function isEmailVerificationPending($params, $result = null)
    {
        $result ??= self::emailVerificationStatus($params);
        return (!isset($result["error"]) && (bool)preg_match("/^PENDING$/i", $result["currentstatus"]));
    }

    /**
     * Check if the email verification failed and the domain is by that suspended
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @param array<string,mixed> $result result of emailVerificationStatus
     * @return bool
     */
    public static function isEmailVerificationSuspended($params, $result = null)
    {
        $result ??= self::emailVerificationStatus($params);
        return (!isset($result["error"]) && (bool)preg_match("/^FAILED|NOT VERIFIED$/i", $result["currentstatus"]));
    }

    /**
     * Get the Email Verification Details
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return array<string,mixed>
     */
    public static function emailVerificationRequest($params)
    {
        $response = [
            "domain" => self::getDomain($params),
            "domainid" => $params["domainid"]
        ];
        $result = self::call($params, "Domain/RegistrantVerification/Send", [
            "domain" => self::getDomain($params)
        ]);
        if ($result["status"] === "FAILURE") {
            return array_merge($response, [
                "error" => $result["message"]
            ]);
        }
        return array_merge($response, $result);
    }

    /**
     * Perform an domain availability check
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @param string $tld dotted TLD
     * @return array{status:string,premium:bool,premiumCostPricing:array<string,string>}
     */
    public static function domainCheck($params, $tld)
    {
        $res = self::call($params, "Domain/Check", [
            "domain" => $params["searchTerm"] . $tld,
            "currency" => "USD"
        ]);

        $data = [
            "status" => SearchResult::STATUS_REGISTERED,
            "premium" => false,
            "premiumCostPricing" => []
        ];

        if ($res["status"] === "FAILURE") {
            $data["status"] = SearchResult::STATUS_TLD_NOT_SUPPORTED;
            Logger::logActivity($params, $res["message"]);
        } elseif ($res["status"] === "AVAILABLE") {
            $data["status"] = SearchResult::STATUS_NOT_REGISTERED;
        }

        if (
            $res["price_ispremium"] === "YES" &&
            !empty($res["price_registration_1"]) &&
            !empty($res["price_renewal_1"]) &&
            !empty($res["price_transfer"]) &&
            !empty($res["price_currency"])
        ) {
            $data["premium"] = true;
            $data["premiumCostPricing"] = [
                "register" => $res["price_registration_1"],
                "renew" => $res["price_renewal_1"],
                "transfer" => $res["price_transfer"],
                "redemptionFee" => $res["price_restore"],
                "CurrencyCode" => $res["price_currency"],
            ];
        }

        return $data;
    }

    /**
     * Request a domain registration
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @param array<string,mixed> $data Data to update
     * @return array<string,mixed>
     */
    public static function domainAdd($params, $data)
    {
        $response = [
            "domainid" => $params["domainid"],
            "domain" => self::getDomain($params),
        ];
        return array_merge(
            $response,
            self::call($params, "Domain/Create", array_merge(
                ["domain" => $response["domain"]],
                $data
            ))
        );
    }

    /**
     * Request an domain update
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @param array<string,mixed> $data Data to update
     * @return array<string,mixed>
     */
    public static function domainUpdate($params, $data)
    {
        $response = [
            "domainid" => $params["domainid"],
            "domain" => self::getDomain($params),
        ];
        return array_merge(
            $response,
            self::call($params, "Domain/Update", array_merge(
                ["domain" => $response["domain"]],
                $data
            ))
        );
    }

    /**
     * Request the domain list
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @param array<string,mixed> $data possible data filter
     * @return array<string,mixed>
     */
    public static function domainList($params, $data = [])
    {
        return self::call($params, "Domain/List", $data);
    }

    /**
     * Request the domain restore
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return array<string,mixed>
     */
    public static function domainRestore($params)
    {
        return self::call($params, "Domain/Restore", [
            "domain" => self::getDomain($params)
        ]);
    }

    /**
     * Request the domain renewal
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @param array<string,mixed> $data Data to update
     * @return array<string,mixed>
     */
    public static function domainRenew($params, $data = [])
    {
        return self::call($params, "Domain/Renew", array_merge([
            "domain" => self::getDomain($params)
        ], $data));
    }

    /**
     * Request the domain status
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return array<string,mixed>
     */
    public static function domainStatus($params)
    {
        return self::call($params, "Domain/Info", [
            "domain" => self::getDomain($params)
        ]);
    }

    /**
     * Get the domain's currently assigned auth code
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return array<string,mixed>
     */
    public static function domainAuthInfoStatus($params)
    {
        return self::call($params, "Domain/AuthInfo/Get", [
            "domain" => self::getDomain($params)
        ]);
    }

    /**
     * Request the domain transfer lock status update
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return array<string,mixed>
     */
    public static function domainLockUpdate($params)
    {
        $response = [
            "domain" => self::getDomain($params),
            "domainid" => $params["domainid"]
        ];
        $status = (strtolower($params["lockenabled"]) === "locked") ? "Enable" : "Disable";
        return array_merge(
            $response,
            self::call($params, "Domain/RegistrarLock/" . $status, [
                "domain" => $response["domain"]
            ])
        );
    }

    /**
     * Request the domain transfer lock status
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return array<string,mixed>
     */
    public static function domainLockStatus($params)
    {
        return self::call($params, "Domain/RegistrarLock/Status", [
            "domain" => self::getDomain($params)
        ]);
    }

    /**
     * Check if the domain is locked
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return array{error?:string,islocked:bool,status:string}
     */
    public static function isDomainLocked($params)
    {
        $result = self::domainLockStatus($params);
        if ($result["status"] !== "SUCCESS") { // FAILURE ?!
            return [
                "error" => $result["message"],
                "status" => "unknown",
                "islocked" => true
            ];
        }
        $locked = (bool)preg_match("/^locked$/i", $result["registrar_lock_status"]);
        return [
            "islocked" => $locked,
            "status" => $locked ? "locked" : "unlocked"
        ];
    }

    /**
     * Request the list of tlds where whois privacy is supported
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return array<string>
     */
    public static function domainWhoisPrivacyList($params)
    {
        $r = self::call($params, "Domain/PrivateWhois");
        if ($r["status"] === "FAILURE" || (!isset($r["tldsidn"]) && !isset($r["tlds"]))) {
            return [];
        }
        if (isset($r["tldsidn"])) {
            return explode(",", $r["tldsidn"]); // no leading dot returned from API
        }

        $tlds = explode(",", $r["tlds"]);
        foreach ($tlds as &$val) { // tld without leading dot!
            $converted = \CNIC\IDNA\Factory\ConverterFactory::convert("." . $val); // add dot - mandatory for conversion
            $val = substr($converted["idn"], 1); // remove leading dot again
        }
        return $tlds;
    }

    /**
     * Request the domain whois privacy status update
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return array<string,mixed>
     */
    public static function domainWhoisPrivacyUpdate($params)
    {
        $response = [
            "domain" => self::getDomain($params),
            "domainid" => $params["domainid"]
        ];
        $status = ($params["protectenable"])  ? "enable" : "disable";
        return array_merge(
            $response,
            self::call($params, "Domain/PrivateWhois/" . $status, [
                "domain" => $response["domain"]
            ])
        );
    }

    /**
     * Request the domain whois privacy status
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return array<string,mixed>
     */
    public static function domainWhoisPrivacyStatus($params)
    {
        $response = [
            "domain" =>  self::getDomain($params),
            "domainid" => $params["domainid"]
        ];
        return array_merge(
            $response,
            self::call($params, "Domain/PrivateWhois/Status", [
                "domain" => $response["domain"]
            ])
        );
    }

    /**
     * Get the list of email forwardings
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return string|array<int,array{prefix:string,forwardto:string,source:string}>
     */
    public static function emailForwardingList($params)
    {
        $result = self::call($params, "Domain/EmailForward/List", [
            "domain" => self::getDomain($params)
        ]);
        if ($result["status"] === "FAILURE") {
            return $result["message"];
        }

        $values = [];
        $totalRules = (int)$result["total_rules"];
        for ($i = 1; $i <= $totalRules; $i++) {
            // prefix is the first part before @ at email addrss
            list($prefix) = explode("@", $result["rule_" . $i . "_source"]);
            $values[$i]["prefix"] = empty($prefix) ? "@" : $prefix;
            $values[$i]["forwardto"] = $result["rule_" . $i . "_destination"];
            $values[$i]["source"] = $result["rule_" . $i . "_source"];
        }
        return $values;
    }

    /**
     * Remove an email forwarding
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @param array<string,mixed> $data Data to remove
     * @return array<string,mixed>
     */
    public static function emailForwardingRemove($params, $data)
    {
        return self::call($params, "Domain/EmailForward/Remove", $data); // TODO: Check if domain is required
    }

    /**
     * Add an email forwarding
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @param array<string,mixed> $data Data to add
     * @return array<string,mixed>
     */
    public static function emailForwardingAdd($params, $data)
    {
        return self::call($params, "Domain/EmailForward/Add", $data); // TODO: Check if domain is required
    }

    /**
     * Request the list of DNS Records
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return array<string,mixed>
     */
    public static function dnszoneRecordList($params)
    {
        return self::call($params, "Domain/DnsRecord/List", [
            "domain" => self::getDomain($params)
        ]);
    }

    /**
     * Add a DNS Record
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @param array<string,mixed> $data Data to add
     * @return array<string,mixed>
     */
    public static function dnszoneRecordAdd($params, $data)
    {
        return self::call($params, "Domain/DnsRecord/Add", $data);
    }

    /**
     * Remove a DNS Record
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @param array<string,mixed> $data Data to remove
     * @return array<string,mixed>
     */
    public static function dnszoneRecordRemove($params, $data)
    {
        return self::call($params, "Domain/DnsRecord/Remove", $data);
    }

    /**
     * Request the list of URL Forwards
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return array<string,mixed>
     */
    public static function urlForwardList($params)
    {
        // STATUS=SUCCESS or FAILURE
        // TRANSACTID=Transaction ID
        // RULE_[x]_SOURCE          the source for the rule [x] where [x] is a number starting with 1 and incrementing for each rule
        // RULE_[x]_DESTINATION     the destination for rule [x]
        // RULE_[x]_ISFRAMED        YES/NO. If YES the following fields will also be present
        // RULE_[x]_TITLE           rule [x] title for framed redirect (optional)
        // RULE_[x]_DESCRIPTION     rule [x] meta description for framed redirect (optional)
        // RULE_[x]_KEYWORDS        rule [x] keywords for framed redirect (optional)
        return self::call($params, "Domain/UrlForward/List", [
            "domain" => self::getDomain($params)
        ]);
    }

    /**
     * Add a URL Forward
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @param array<string,mixed> $data Data to add
     * @return array<string,mixed>
     */
    public static function urlForwardAdd($params, $data)
    {
        return self::call($params, "Domain/UrlForward/Add", $data);
    }

    /**
     * Remove a URL Forward
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @param array<string,mixed> $data Data to remove
     * @return array<string,mixed>
     */
    public static function urlForwardRemove($params, $data)
    {
        return self::call($params, "Domain/UrlForward/Remove", $data);
    }

    /**
     * Request an transfer tag update for .uk domains
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return array<string,mixed>
     */
    public static function dotUkTagUpdate($params)
    {
        return self::call($params, "Domain/ChangeTagDotUK", [
            "domain" => self::getDomain($params),
            "newtag" => $params["transfertag"]
        ]);
    }

    /**
     * Initiate a domain transfer
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @param array<string,mixed> $data Data to add to the transfer request
     * @return array<string,mixed>
     */
    public static function transferAdd($params, $data)
    {
        return self::call($params, "Domain/Transfer/Initiate", array_merge(
            ["domain" => self::getDomain($params)],
            $data
        ));
    }

    /**
     * Request the domain transfer log / history
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return array<string,mixed>
     */
    public static function transferLog($params)
    {
        $result = self::call($params, "Domain/Transfer/History", [
            "domain" => self::getDomain($params)
        ]);
        if ($result["status"] === "SUCCESS") {
            // history_<int>_date=YYYY/MM/DD
            // history_<int>_statusmessage=...
            // history_<int>_statuscode=...
            // history_<int>_additionaldata=... or empty
            $regex = "/^history_(\d+)_date$/";
            $keys = preg_grep($regex, array_keys($result));
            if (empty($keys)) { // null or empty
                $result["reason"] = "No transfer history available.";
                return $result;
            }
            arsort($keys);
            preg_match($regex, $keys[0], $m);
            // phpstan does not recognize that we grep'ed the keys using the same regex
            // by that $m could not have matches of course while in our context it definitely has
            if (!isset($m[1])) {
                $result["reason"] = "No transfer history available.";
                return $result;
            }
            $result["reason"] = (
                $result["history_" . $m[1] . "_statuscode"] . ": " .
                $result["history_" . $m[1] . "_statusmessage"] . " (" .
                $result["history_" . $m[1] . "_date"] . ")"
            );
        }
        return $result;
    }

    /**
     * Get the list of domain private nameservers
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return array<string,mixed>
     */
    public static function hostList($params)
    {
        return self::call($params, "Domain/Host/List", [
            "domain" => self::getDomain($params),
            "compactlist" => "no"
        ]);
    }

    /**
     * Register a new host object / private nameserver
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return array<string,mixed>
     */
    public static function hostAdd($params)
    {
        $nameserver = self::getNameserver($params);
        return array_merge(self::call($params, "Domain/Host/Create", [
            "host" => $nameserver,
            "ip_list" => $params["ipaddress"]
        ]), ["nameserver" => $nameserver]);
    }

    /**
     * Update a host object / private nameserver
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return array<string,mixed>
     */
    public static function hostUpdate($params)
    {
        $nameserver = self::getNameserver($params);
        // $currentipaddress = $params["currentipaddress"];
        return array_merge(self::call($params, "Domain/Host/Update", [
            "host" => $nameserver,
            "ip_list" => $params["newipaddress"]
        ]), ["nameserver" => $nameserver]);
    }

    /**
     * Remove a host object / private nameserver
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return array<string,mixed>
     */
    public static function hostRemove($params)
    {
        $nameserver = self::getNameserver($params);
        return array_merge(self::call($params, "Domain/Host/Delete", [
            "host" => $nameserver
        ]), ["nameserver" => $nameserver]);
    }

    /**
     * Get the account price list
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return array<string,mixed>
     */
    public static function accountPriceList($params)
    {
        $defaultCurrency = \WHMCS\Database\Capsule::table('tblcurrencies')->where('default', 1)->value('code');
        return self::call($params, "Account/PriceList/Get", [
            "version" => "5",
            "currency" => ((bool)preg_match("/^USD|CAD|AUD|JPY|EUR|GBP$/i", $defaultCurrency)) ? $defaultCurrency : "USD"
        ]);
    }

    /**
     * Get the account status
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return array<string,mixed>
     */
    public static function accountBalanceStatus($params)
    {
        return self::call($params, "Account/Balance/Get");
    }

    /**
     * Check if account exists / api communication works
     *
     * @param array<string,mixed> $params WHMCS parameters
     * @return bool|string
     */
    public static function isConnectionError($params)
    {
        $result = self::call($params, "Account/Balance/Get");
        return ($result["status"] !== "FAILURE") ? false : $result["message"];
    }
}
