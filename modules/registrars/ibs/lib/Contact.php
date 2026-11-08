<?php

namespace WHMCS\Module\Registrar\Ibs;

class Contact
{
    /**
     * Map WHMCS contact data to API contact data
     *
     * @param array<string,mixed> $params WHMCS contact data
     * @return array<string,mixed> API contact data
     */
    public static function mapWHMCStoAPI($params)
    {
        // see https://developers.whmcs.com/domain-registrars/module-parameters/
        $whmcsContactFields = [
            "firstname",
            "lastname",
            "companyname",
            "address1",
            "address2",
            "city",
            "state",
            "postcode",
            "country", // admincountry (admin) vs. countrycode (registrant), see handling below
            "email"
        ];
        // map whmcs <-> api fields for contact data where they differ
        $apiContactFields = [
            "companyname"   => "organization",
            "country"       => "countrycode",
            "postcode"      => "postalcode",
            "address1"      => "street",
            "address2"      => "street2",
        ];

        $registrant = [];
        $admin = [];
        $useClientDetailsForAllContacts = \WHMCS\Config\Setting::getValue("RegistrarAdminUseClientDetails") === "on";

        foreach ($whmcsContactFields as $field) {
            $apifield = $apiContactFields[$field] ?? $field;
            if ($field === "country") { // countrycode (registrant) vs. country (admin)
                $registrant[$apifield] = $params[$field . "code"];
            } else {
                $registrant[$apifield] = $params[$field];
            }
            // if admin allowed to use client details for Tech/Billing/Admin contact details, use the same data as registrant
            $admin[$apifield] = $useClientDetailsForAllContacts ? $params[$field] : $params["admin" . $field];
        }

        $registrant["phonenumber"] = PhoneNumber::reformat($params["fullphonenumber"] ?? $params["phonenumber"], $params["country"]);
        // if admin allowed to use client details for Tech/Billing/Admin contact details, use the same phone number data as registrant
        $admin["phonenumber"] = $useClientDetailsForAllContacts ? $registrant["phonenumber"] : PhoneNumber::reformat($params["adminfullphonenumber"] ?? $params["adminphonenumber"], $params["admincountry"]);

        $contactTypes = ["registrant", "technical", "admin", "billing"];
        $result = [];

        foreach ($contactTypes as $type) {
            if ($type === "registrant") {
                foreach ($registrant as $key => $value) {
                    $result["{$type}_{$key}"] = $value;
                }
                continue;
            }
            foreach ($admin as $key => $value) {
                $result["{$type}_{$key}"] = $value;
            }
        }

        foreach ($contactTypes as $type) {
            if (empty(trim($result["{$type}_organization"]))) {
                unset($result["{$type}_organization"]);
            }
        }
        return $result;
    }
}
