<?php

namespace WHMCS\Module\Registrar\Ibs;

use Illuminate\Database\Capsule\Manager as DB;

class AdditionalFields
{
    /**
     * Validate contact data for AFNIC TLDs
     *
     * @param string $domain domain name
     * @param array<string,mixed> $fields additional fields
     * @param array<string,mixed> $clientDetails client details
     * @param string $countryCode country code
     * @param array<string,mixed> $clientDetails client details
     * @return array<string>
     */
    public static function validateContactDataAFNIC($domain, $fields, $countryCode, $clientDetails)
    {
        $errors = [];
        if (!Country::isEuropeanUnionCountry($countryCode)) {
            $errors[] = "Registrant must be from European union (" . $domain . "). Provided $countryCode";
        }
        return array_merge($errors, self::validateAFNIC($domain, $fields, $clientDetails));
    }

    /**
     * Validate additional fields for AFNIC TLDs
     *
     * @param string $domain domain name
     * @param array<string,mixed> $fields additional fields
     * @param array<string,mixed> $clientDetails client details
     * @return array<string>
     */
    public static function validateAFNIC($domain, $fields, $clientDetails)
    {
        $errors = [];
        switch ($fields["holdertype"]) {
            case "individual":
                if (
                    empty($fields["birthdate"])
                    || !preg_match("/^(\d{4})-(\d{2})-(\d{2})$/", $fields["birthdate"], $m)
                    || !checkdate((int)$m[2], (int)$m[3], (int)$m[1]) // m, d, y
                ) {
                    $errors[] = "Valid Date Of Birth is required (" . $domain . ")";
                }
                if (empty($fields["birthcountry"])) {
                    $errors[] = "Birth Country is required (" . $domain . ")";
                }
                if ($fields["birthcountry"] === "FR" && (empty($fields["birthcity"]) || empty($fields["birthpostalcode"]))) {
                    $errors[] = "Birth City plus its Postal Code are required (" . $domain . ")";
                }
                break;
            case "trademark":
                if (empty($fields["trademark"])) {
                    $errors[] = "Trademark is required (" . $domain . ")";
                }
                break;
            case "association":
                if (empty($fields["waldec"]) && empty($fields["dateofassociation"])) {
                    $errors[] = "Waldec or Date of Association is required (" . $domain . ")";
                }
                if (!empty($fields["dateofassociation"]) && empty($fields["dateofpublication"])) {
                    $errors[] = "Date of Publication is required (" . $domain . ")";
                }
                break;
            case "other":
                if (empty($fields["otherlegalstatus"])) {
                    $errors[] = "Other legal status is required (" . $domain . ")";
                }
                break;
        }
        return $errors;
    }

    /**
     * Validate additional fields for .ASIA TLD
     *
     * @param string $domain domain name
     * @param array<string,mixed> $fields additional fields
     * @param array<string,mixed> $clientDetails client details
     * @return array<string>
     */
    public static function validateASIA($domain, $fields, $clientDetails)
    {
        $errors = [];
        if ($fields["legalentity"] == "other") {
            if (!$fields["otherlegalentity"]) {
                $errors[] = "Other Legal Entity Type is required (" . $domain . ")";
            }
        }
        if ($fields["identificationform"] == "other") {
            if (!$fields["otheridentificationform"]) {
                $errors[] = "Other identification form is required (" . $domain . ")";
            }
        }
        return $errors;
    }

    /**
     * Validate contact data for .IT TLD
     *
     * @param string $domain domain name
     * @param array<string,mixed> $fields additional fields
     * @param string $countryCode country code
     * @param array<string,mixed> $clientDetails client details
     * @return array<string>
     */
    public static function validateContactDateIT($domain, $fields, $countryCode, $clientDetails)
    {
        $nationality = $fields["nationality"];
        if (strlen($nationality) > 2) {
            $nationality = Country::getCountryCodeByName($nationality);
        }
        if ($fields["legalentity"] === "1. Italian and foreign natural persons") {
            if (!Country::isEuropeanUnionCountry($nationality) && !Country::isEuropeanUnionCountry($countryCode)) {
                return [ "Registrant Nationality or Country has to be from European union (" . $domain . ")" ];
            }
        }
        if ($fields["legalentity"] == "7. foreigners who match 2 - 6") {
            if (!Country::isEuropeanUnionCountry($nationality) || $nationality !== $countryCode) {
                return [ "Registrant Nationality and Country have to be same and have to be from European union (" . $domain . ")" ];
            }
        }
        if ($countryCode !== "IT" && $countryCode !== "ITALY") {
            return [ "Registrant Country must be Italy (" . $domain . ")" ];
        }
        return [];
    }

    /**
     * Validate additional fields for .IT TLD
     *
     * @param string $domain domain name
     * @param array<string,mixed> $fields additional fields
     * @param array<string,mixed> $clientDetails client details
     * @return array<string>
     */
    public static function validateIT($domain, $fields, $clientDetails)
    {
        $errors = [];
        if ($fields["legalentity"] == "7. foreigners who match 2 - 6") {
            if (!Country::isEuropeanUnionCountry($fields["nationality"])) {
                $errors[] = "Nationality must be from European Countries (" . $domain . ")";
            }
        } elseif (isset($fields["legalentity"]) && $fields["legalentity"] !== "1. Italian and foreign natural persons") {
            if ($fields["nationality"] !== "IT" && $fields["nationality"] !== "ITALY") {
                $errors[] = "Nationality must be Italy (" . $domain . ")";
            }
        }
        if (isset($fields["legalentity"]) && $fields["legalentity"] !== "1. Italian and foreign natural persons" && $fields["whois"] == "on") {
            $errors[] = "Whois information can be hidden for Italian and foreign natural persons entity type only (" . $domain . ")";
        }
        return $errors;
    }

    /**
     * Validate contact data for .DE TLD
     *
     * @param string $domain domain name
     * @param array<string,mixed> $fields additional fields
     * @param string $countryCode country code
     * @param array<string,mixed> $clientDetails client details
     * @return array<string>
     */
    public static function validateContactDataDE($domain, $fields, $countryCode, $clientDetails)
    {
        // Admin from Germany!
        $errors = [];
        $adminCountryCode = Country::getAdminCountryCode($countryCode);
        if ($countryCode !== "DE" && $adminCountryCode !== "DE") {
            $errors[] = "Registrant or Admin must be from Germany (" . $domain . ")";
        }
        return array_merge($errors, self::validateDE($domain, $fields, $clientDetails));
    }

    /**
     * Validate additional fields for .DE TLD
     *
     * @param string $domain domain name
     * @param array<string,mixed> $fields additional fields
     * @param array<string,mixed> $clientDetails client details
     * @return array<string>
     */
    public static function validateDE($domain, $fields, $clientDetails)
    {
        $errors = [];
        if (
            // TODO: context of contact?!?
            (empty($clientDetails["companyname"]) && $fields["role"] === "ORG")
            || (!empty($clientDetails["companyname"]) && $fields["role"] === "PERSON")
        ) {
            $errors[] = empty($fields["companyname"])
                ? "<b>" . $domain . "</b>: Your account doesn't have a valid Company Name. Please select 'Person' as the contact role type in your cart or update your account details."
                : "<b>" . $domain . "</b>: Your account is marked as a company account. Please select 'Organization' as the contact role type in your cart or update your account details.";
        }
        return $errors;
    }

    /**
     * Validate contact data for .UK TLD
     *
     * @param string $domain domain name
     * @param array<string,mixed> $fields additional fields
     * @param string $countryCode country code
     * @param array<string,mixed> $clientDetails client details
     * @return array<string>
     */
    public static function validateContactDataUK($domain, $fields, $countryCode, $clientDetails)
    {
        $errors = [];
        $adminCountryCode = Country::getAdminCountryCode($countryCode);
        if (!(bool)preg_match("/^$(GG|IM|JE|GB)/i", $adminCountryCode)) {
            $errors[] = "Invalid Country for admininistrative Contact (" . $domain . ")";
        }
        return array_merge($errors, self::validateUK($domain, $fields, $clientDetails));
    }

    /**
     * Validate additional fields for .UK TLD
     *
     * @param string $domain domain name
     * @param array<string,mixed> $fields additional fields
     * @param array<string,mixed> $clientDetails client details
     * @return array<string>
     */
    public static function validateUK($domain, $fields, $clientDetails)
    {
        $errors = [];
        if (
            (bool)preg_match("/^(IP|LLP|LTD|PLC|RCHAR|SCH)$/i", $fields["legaltype"])
            && empty($fields["registrationnumber"])
        ) {
            $errors[] = "Registration Number is required (" . $domain . ")";
        }
        return $errors;
    }

    /**
     * Validate additional fields on shopping cart
     *
     * @param string $domain domain name
     * @param array<string,mixed> $fields additional fields
     * @return array<string>
     */
    public static function validate($domain, $fields)
    {
        list($sld, $tld) = explode(".", $domain, 2);

        $fn = "validate" . ((bool)preg_match("/\.(fr|re|pm|yt|wf|tf)$/i", "." . $tld) ? "AFNIC" : strtoupper($tld));
        if (is_callable([self::class, $fn])) {
            $data = localAPI("GetClientsDetails", [
                "clientid" => \WHMCS\Session::get("uid")
            ]);
            return self::$fn($domain, $fields, $data);
        }
        return [];
    }

    /**
     * Validate contact data
     *
     * @param string $domain domain name
     * @param array<string,mixed> $fields additional fields
     * @param string $countryCode country code
     * @return array<string>
     */
    public static function validateContactData($domain, $fields, $countryCode)
    {
        list($sld, $tld) = explode(".", $domain, 2);

        $fn = "validateContactData" . ((bool)preg_match("/\.(eu|fr|re|pm|yt|wf|tf)$/i", "." . $tld) ? "AFNIC" : strtoupper($tld));
        if (is_callable([self::class, $fn])) {
            $data = localAPI("GetClientsDetails", [
                "clientid" => \WHMCS\Session::get("uid")
            ]);
            return self::$fn($domain, $fields, $countryCode, $data);
        }
        return [];
    }

    /**
     * Validate contact data details
     *
     * @param string $countryCode country code
     * @param string $phoneNumber phone number
     * @return array{countryCode:string,phoneNumber:string}|array{error:string}
     */
    public static function validateContactDataDetails($countryCode, $phoneNumber)
    {
        $c1 = empty($countryCode);
        $c2 = empty($phoneNumber);
        if ($c1 && $c2) {
            return [ "error" => "Country Code and Phone Number are required" ];
        }
        if ($c1) {
            return [ "error" => "Country Code is required" ];
        }
        if ($c2) {
            return [ "error" => "Phone Number is required" ];
        }
        $formattedPhoneNumber = PhoneNumber::reformat($phoneNumber, $countryCode);
        $isValidPhone = PhoneNumber::validate($formattedPhoneNumber);
        if (!$isValidPhone) {
            return [ "error" => "Invalid phone Number " . $phoneNumber ];
        }
        return [
            "countryCode" => $countryCode,
            "phoneNumber" => $formattedPhoneNumber
        ];
    }

    /**
     * Fetch and validate contact data
     *
     * @param array<string,mixed> $params WHMCS params
     * @return array{countryCode:string,phoneNumber:string}|array{error:string}
     */
    public static function fetchAndValidateContactData($params)
    {
        if ($params["custtype"] === "new") {
            return self::validateContactDataDetails($params["country"], $params["phonenumber"]);
        }
        if (strtolower($params["contact"]) === "addingnew") {
            return self::validateContactDataDetails($params["domaincontactcountry"], $params["domaincontactphonenumber"]);
        }
        if ($params["contact"]) {
            $contact = DB::table("tblcontacts")
                        ->select("country", "phonenumber")
                        ->where("id", $params["contact"])
                        ->first();
            if (is_null($contact)) {
                return [ "error" => "Unable to load contact: " . $params["contact"] ];
            }
            /** @var array{country:string,phonenumber:string} $data */
            $data = get_object_vars($contact);
            return self::validateContactDataDetails($data["country"], $data["phonenumber"]);
        }

        // load client details
        $data = localAPI("GetClientsDetails", [
            "clientid" => \WHMCS\Session::get("uid")
        ]);
        return self::validateContactDataDetails($data["country"], $data["phonenumber"]);
    }
}
