<?php

namespace WHMCS\Module\Registrar\Ibs;

use WHMCS\Application\Support\Facades\Di as DI;
use Illuminate\Database\Capsule\Manager as DB;

// load software dependencies (php-sdk)
require_once __DIR__ . "/vendor/autoload.php";

class ApiHandler
{
    /**
     * @var \CNIC\CNR\SessionClient|\CNIC\HEXONET\SessionClient|\CNIC\IBS\SessionClient|null
     */
    public static $cl = null;

    /**
     * Make an API request using the provided command and return response in Hash Format
     *
     * @param array<string,mixed> $params common WHMCS module parameters
     * @param string $path API endpoint script path
     * @param array<string,mixed> $requestParams API request parameters (optional)
     * @return array<string,mixed> API response in hash format
     */
    public static function call($params, $path, $requestParams = [])
    {
        $registrar = $params["_registrar"]["name"];
        if (!self::$cl) {
            self::$cl = \CNIC\ClientFactory::getClient([
                "registrar" => \strtoupper($registrar)
            ]);
        }
        $isOTE = $params["TestMode"] === 1 || $params["TestMode"] === "on";
        if ($isOTE) {
            self::$cl->useOTESystem();
        }

        self::$cl->setCredentials($params["Username"], html_entity_decode($params["Password"], ENT_QUOTES))
            ->setReferer($GLOBALS["CONFIG"]["SystemURL"])
            ->setUserAgent("WHMCS", $GLOBALS["CONFIG"]["Version"], self::getStatisticsData($params))
            // earlier "WHMCS (ibs vX.Y.Z)",
            // now e.g. "WHMCS (PHP_OS;php_uname("m"); rv:WHMCS_VERSION) ibs/X.Y.Z db/MySQLv10 php-sdk/11.0.0 php/8.2.0"
            ->enableDebugMode() // activate logging
            ->setCustomLogger(new Logger($registrar, $isOTE));
        return self::$cl->request($requestParams, $path)->getHash();
    }

    /**
     * Get Statistics Data
     *
     * @param array<string,mixed> $params common WHMCS module parameters
     * @return array<string>
     */
    public static function getStatisticsData($params)
    {
        return array_merge([
            $params["_registrar"]["name"] . "/" . $params["_registrar"]["_module"]["version"],
            "db/" . self::getDatabaseStats()["label"] // get db driver mariadb/mysql etc
        ], self::getActiveAddonsModules());
    }

    /**
     * Get DB Engine Name and Version
     *
     * @return array{engine:string,version:string,label:string}
     */
    private static function getDatabaseStats()
    {
        // inject db dependency
        $db = DI::make("db");

        // get system driver version 5/8 etc
        $version = $db->getSqlVersion();

        // get the DB Engine Name
        $engine = stripos($db->getSqlVersionComment() . $version, "mariadb") === false ? "MySQL" : "MariaDB";

        $version = preg_replace("/[^\\d\\.]*/", "", $version);
        $version = (empty($version)) ? "" : "v$version";

        return [
            "engine" => $engine,
            "version" => $version,
            "label" => $engine . $version
        ];
    }

    /**
     * Get active addon modules
     *
     * @param string $separator separator character to join addon name and version
     * @return array<string>
     */
    private static function getActiveAddonsModules(string $separator = "/")
    {
        // Get addon modules from tbladdonmodules.
        $addonModules = DB::table("tbladdonmodules")
            ->select("module as addon", "value as version")
            ->where("setting", "version")
            ->where(function ($query) {
                $query->where("module", "like", "cnic%");
            })
            ->get()
            ->map(function ($item) {
                return [
                    'addon' => $item->addon,
                    'version' => $item->version
                ];
            })
            ->toArray();

        if ($addonModules) {
            // Get active addon modules from tblconfiguration.
            $activeAddons = DB::table("tblconfiguration")
                ->where("setting", "ActiveAddonModules")
                ->pluck("value")
                ->map(function ($value) {
                    return array_map('trim', explode(",", $value));
                })
                ->flatten()
                ->toArray();
            // Filter addonModules to include only those whose 'addon' key matches any value in activeAddons.
            $addonModules = array_filter($addonModules, function ($addon) use ($activeAddons) {
                return in_array($addon['addon'], $activeAddons);
            });

            // Implode array values of $addonModules into "addon/version" format with a separator "/".
            $addonModules = array_map(function ($addon) use ($separator) {
                return $addon['addon'] . $separator . $addon['version'];
            }, $addonModules);
        }
        return $addonModules;
    }
}
