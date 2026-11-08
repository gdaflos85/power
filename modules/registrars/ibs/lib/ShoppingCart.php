<?php

namespace WHMCS\Module\Registrar\Ibs;

use Illuminate\Database\Capsule\Manager as DB;

class ShoppingCart
{
    /**
     * Check if the shopping cart is empty
     *
     * @return bool
     */
    public static function isEmpty()
    {
        // check if domains are in cart
        $domains = $_SESSION["cart"]["domains"];
        return (is_null($domains) || empty($domains));
    }

    /**
     * Get the domains in the shopping cart
     *
     * @return array<array<string,mixed>>
     */
    public static function getDomains()
    {
        return $_SESSION["cart"]["domains"];
    }

    /**
     * Get the TLDs assigned to the registrar (dot prefixed)
     *
     * @param string $registrar registrar id e.g. ibs, moniker
     * @return array<string>
     */
    public static function getConfiguredTLDsOfRegistrar($registrar)
    {
        // get TLDs with given registrar
        $tlds = DB::table("tbldomainpricing")
            ->where("autoreg", $registrar)
            ->pluck("extension") // leading dot
            ->all();
        return $tlds;
    }

    /**
     * Get the TLDs in the shopping cart assigned to the registrar (dot prefixed)
     *
     * @param string $registrar registrar id e.g. ibs, moniker
     * @return array<string>
     */
    public static function getCartTLDsOfRegistrar($registrar)
    {
        // get TLDs with given registrar in whmcs
        $tlds = self::getConfiguredTLDsOfRegistrar($registrar);
        if (empty($tlds)) {
            return []; // none configured
        }

        // get all such TLDs that are in cart
        $found = [];
        $cart = ShoppingCart::getDomains();
        foreach ($cart as $item) {
            $domainName = $item["domain"];
            list($sld, $tld) = explode(".", $domainName, 2); // no leading dot
            $tld = "." . $tld;
            if (in_array($tld, $tlds)) {
                $found[] = $tld;
            }
        }

        // remove duplicates and reindex $found if not empty
        return (empty($found)) ? [] : array_values(array_unique($found));
    }
}
