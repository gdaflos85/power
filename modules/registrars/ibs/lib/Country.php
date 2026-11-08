<?php

namespace WHMCS\Module\Registrar\Ibs;

require_once __DIR__ . "/vendor/autoload.php";

// TODO:
// * use the hexonet country class instead of this one

class Country
{
    /**
     * Get Country Code by Country Name
     *
     * @param string $countryName Country Name
     * @return string
     */
    public static function getCountryCodeByName($countryName)
    {
        $collection = new \Omisai\Countries\Collection();
        $country = $collection->getCountryByName($countryName);
        if ($country) {
            return $country->alpha2;
        }
        return $countryName;
    }

    /**
     * Get Country Name by Country Code
     *
     * @param string $countryCode Country Code
     * @return string
     */
    public static function getCountryNameByCode($countryCode)
    {
        $countries = new \WHMCS\Utility\Country();
        $country = $countries->getName($countryCode);
        return $country;
    }

    /**
     * Get 2-char province code for italian province
     *
     * @param string $province Province name
     * @return string
     */
    public static function getDotITProvinceCode($province)
    {
        $province = trim($province);
        // we already have a 2 char province code
        if (strlen($province) === 2) {
            return strtoupper($province);
        }

        // try to find the province by name
        $finder = new \MLocati\ComuniItaliani\Finder();
        $provinces = $finder->findProvincesByName($province);

        // found the province, return the 2 char code (vehicle code)
        if (!empty($provinces)) {
            return ($provinces[0])->getVehicleCode();
        }

        // no match, return the original province name
        return $province;
    }

    /**
     * Check if a country is in the European Union
     *
     * @param string $countryCode
     * @return bool
     */
    public static function isEuropeanUnionCountry($countryCode)
    {
        return (bool)preg_match("/^(AT|BE|BG|HR|CY|CZ|DK|EE|FI|FR|DE|GR|HU|IE|IT|LV|LT|LU|MT|NL|PL|PT|RO|SK|SI|ES|SE)$/i", $countryCode);
    }

    /**
     * Check if a language is a European language
     *
     * @param string $languageCode
     * @return bool
     */
    public static function isEuropeanLanguage($languageCode)
    {
        return (bool)preg_match("/^(bg|cs|da|de|el|en|es|et|fi|fr|ga|hr|hu|it|lt|lv|mt|nl|pl|pt|ro|sk|sl|sv)$/i", $languageCode);
    }

    /**
     * Check if a country is a French territory
     *
     * @param string $countryCode
     * @return bool
     */
    public static function isFrenchTerritory($countryCode)
    {
        return (bool)preg_match("/^(BL|FR|GF|GP|NC|MF|MQ|PF|PM|RE|TF|WF|YT)$/i", $countryCode);
    }

    /**
     * Get List of European Countries
     *
     * @return array<string>
     */
    public static function getEuropeanCountries()
    {
        $collection = new \Omisai\Countries\Collection();
        $euCountries = $collection->getCountriesByContinent('EU');
        $tmp = [];
        foreach ($euCountries as $country) {
            $tmp[] = $country->alpha2;
        }
        return $tmp;
    }

    /**
     * Get Admin Country Code
     *
     * @param string $countryCode Country Code, Client Details
     * @return string
     */
    public static function getAdminCountryCode($countryCode)
    {
        //use client details Scountry code (=$countryCode) when configured
        if (\WHMCS\Config\Setting::getValue("RegistrarAdminUseClientDetails") === "on") {
            return $countryCode;
        }
        //get admin countrycode from database otherwise
        return \WHMCS\Config\Setting::getValue("RegistrarAdminCountry");
    }
}
