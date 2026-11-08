<?php

namespace WHMCS\Module\Registrar\Ibs;

use WHMCS\Module\Registrar\Ibs\WidgetBalance;
use WHMCS\Config\Setting;

/**
 * InternetBS Account Widget
 */
class Widget extends \WHMCS\Module\AbstractWidget
{
    /** @var string */
    protected $title;

    /** @var int */
    protected $cacheExpiry = 120;

    /** @var int */
    protected $weight = 150;

    /** @var string */
    public $widgetid;

    /** @var int */
    public static $sessionttl = 3600; // 1h

    /** @var \WHMCS\View\Asset */
    protected $assetHelper;

    /** @var string */
    protected $module;

    /** @var bool */
    protected static $headerOutputInitiated = false;

    /** @var integer */
    protected $version;

    /** @var array<string,mixed> */
    protected $params;

    /**
     * constructor
     *
     * @param array<string,mixed> $params common module parameters
     */
    public function __construct($params)
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        $this->title = ucwords($params["_registrar"]["_module"]["friendlyName"]) . " Dashboard Widget";
        $this->module = $params["_registrar"]["name"];
        $this->widgetid = $this->module . "dashwidget";
        $this->version = $params["_registrar"]["_module"]["version"];
        $this->params = $params;
        if (!self::$headerOutputInitiated) {
            $module = $this->module;
            $version = $this->version;
            add_hook("AdminAreaHeadOutput", 2, function ($vars) use ($module, $version) {
                $modulePath = \App::getSystemUrl() . "modules/registrars/{$module}";
                $cssPath = $modulePath . "/assets/css";
                $jsPath = $modulePath . "/assets/js";
                if ($vars["pagetitle"] === "Dashboard") {
                    return <<<HTML
                        <script type="text/javascript" src="{$jsPath}/widget.js?ts={$version}"></script>
                        <link rel="stylesheet" type="text/css" href="{$cssPath}/widget.css?ts={$version}" />
HTML;
                }
            });

            // Include only once
            self::$headerOutputInitiated = true;
        }
    }

    /**
     * Overrides default widget id
     *
     * @return string
     */
    public function getId()
    {
        return $this->widgetid;
    }

    /**
     * Fetch data that will be provided to generateOutput method
     * @return array<string,mixed> data array
     */
    public function getData()
    {
        $id = $this->getId();
        $statusId = $id . "status";
        // status toggle
        $status = \App::getFromRequest("status");
        if ($status !== "") {
            if (in_array($status, [0, 1])) {
                Setting::setValue($statusId, $status);
            }
        } else {
            $status = Setting::getValue($statusId);
        }

        // hidden widgets -> don't load data
        $isHidden = in_array($id, $this->adminUser->hiddenWidgets);
        if ($isHidden) {
            return [
                "status" => 0,
                "widgetid" => $id
            ];
        }

        // load data
        $data = [
            "status" => (int)$status,
            "widgetid" => $id
        ];

        if (
            !empty($_REQUEST["refresh"]) // refresh request
            || !isset($_SESSION[$id]) // Session not yet initialized
            || (time() > $_SESSION[$id]["expires"]) // data cache expired
        ) {
            $_SESSION[$id] = [
                "expires" => time() + self::$sessionttl,
                "ttl" =>  self::$sessionttl,
                "latestVersion" => $this->checkLatestVersion()
            ];
        }

        $balance = ($data['status'] == 1) ? new WidgetBalance($this->widgetid, $this->module, $this->params) : null;

        return array_merge($data, [
            "balance" => $balance
        ]);
    }

    /**
     * generate widget"s html output
     * @param mixed $data input data (from getData method)
     * @return string html code
     */
    public function generateOutput($data)
    {
        $widgetStatusIcon = ($data['status'] === 1) ? "on" : "off";
        $widgetStatus = $data["status"];
        $balance = $data["balance"];
        $widgetExpires = $_SESSION[$data["widgetid"]]["expires"] - time();
        $widgetTTL = $_SESSION[$data["widgetid"]]["ttl"];

        $templatevars = [
            "widgetExpires" => $widgetExpires,
            "widgetTTL" => $widgetTTL,
            "widgetId" => $this->getId(),
            "moduleName" => $this->module,
            "widgetStatus" => $widgetStatus,
            "widgetStatusIcon" => $widgetStatusIcon,
            "balanceHTML" => !empty($balance) ? $balance->toHTML() : null,
            "refreshRequest" => !empty($_REQUEST["refresh"]),
            "latestVersion" => $_SESSION[$data["widgetid"]]["latestVersion"],
            "currentVersion" => $this->version,
            "widgetTitle" => $this->title,
            "widgetDisableMessage" => "Widget is currently disabled. Use the first icon for enabling.",
            "repoLink" => $this->params["_registrar"]["_module"]["repoUrl"],
            "logo" => "/modules/registrars/{$this->module}/logo.gif"
        ];

        $smarty = new \WHMCS\Smarty();
        foreach ($templatevars as $key => $value) {
            $smarty->assign($key, $value);
        }
        $smarty->setTemplateDir(__DIR__ . "/..");
        return $smarty->fetch("tpl_widget.tpl");
    }

    /**
     * Not yet supported.
     *
     * @return boolean
     */
    protected function checkLatestVersion()
    {
        return true;
    }
}
