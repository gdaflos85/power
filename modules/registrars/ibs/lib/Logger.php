<?php

namespace WHMCS\Module\Registrar\Ibs;

class Logger implements \CNIC\LoggerInterface
{
    /** @var string */
    private $registrar;
    /** @var bool */
    private $testmode;

    /**
     * Logger constructor.
     *
     * @param string $registrar
     * @param bool $testmode
     */
    public function __construct($registrar, $testmode)
    {
        $this->registrar = $registrar;
        $this->testmode = $testmode;
    }
    /**
     * Finding last called function and returining function name without registrar prefix
     *
     * @param string $registrar
     * @return string
     */
    private static function getAction($registrar)
    {
        $trace = debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS | DEBUG_BACKTRACE_PROVIDE_OBJECT);
        $fnName = strtolower($trace[0]["function"]);
        foreach ($trace as $t) {
            if (preg_match("/^" . $registrar . "_(.+)$/i", $t["function"], $m)) {
                $fnName = strtolower($m[1]);
                break;
            }
        }
        return $fnName;
    }

    /**
     * Hide sensitive data from log
     *
     * @param array<string,mixed> $data
     * @param string|array<string,mixed>|null $post
     * @return array<string>
     */
    private function hideFromLog($data, $post)
    {
        // extract variables from the query string if it is a string
        if (is_string($post)) {
            parse_str(urldecode($post), $post);
        }
        // define the keys to be replaced
        $replaceKeys = ["password"]; // TODO auth, authinfo, etc

        // combine the command and the parsed string arrays
        $mergeArrayData = array_merge($post ?? [], $data);

        // flip the arrayKeys to make the values as keys
        $flippedKeys = array_flip($replaceKeys);

        // filter the array by the replace keys and return the values
        return array_values(array_intersect_key($mergeArrayData, $flippedKeys));
    }

    /**
     * output/log given data
     *
     * @param string $post post request data in string format
     * @param \CNIC\IBS\Response $r Response to log
     * @param string|null $error error message
     * @return void
     */
    public function log(string $post, \CNIC\HEXONET\Response $r, ?string $error = null): void
    {
        if (!function_exists("logModuleCall")) {
            return;
        }

        $apiurl = $r->getRequestURL();
        $endpoint = preg_replace("/^http(s)?:\/\/[^\/]+\//", "", $apiurl);
        if (is_null($endpoint)) {
            return;
        }
        $req = $r->getCommandPlain();
        if (empty($req)) {
            $req = "[]";
        }

        logModuleCall(
            $this->registrar,
            self::getAction($this->registrar),
            implode("\n", [
                $endpoint . " @ " . ($this->testmode ? "OT&E" : "LIVE") . " Environment (" . str_replace($endpoint, "", $apiurl) . ")\n",
                "$req\n",
                $post
            ]),
            ($error ? $error . "\n\n" : "") . $r->getPlain(),
            "",
            self::hideFromLog($r->getCommand(), $post)
        );
    }

    /**
     * Log activity to WHMCS activity log
     *
     * @param array<string,mixed> $params WHMCS module parameters
     * @param string $reason error message for the log, otherwise empty (=success case)
     * @return array{error:string}|array{success:true}
     */
    public static function logActivity(array $params, $reason = ""): array
    {
        static $messages = [
            "verify" => [
                "success" => "Verification Email requested successfully.",
                "fail" => "Failed to request verification email."
            ],
            "domainurlforwarding" => [
                "success" => "Updated url forwarding successfully",
                "fail" => "Failed to update url forwarding"
            ],
            "sync" => [
                "success" => "domain synchronized",
                "fail" => "domain synchronized"
            ],
            "transfersync" => [
                "success" => "domain transfer synchronized",
                "fail" => "domain transfer synchronized"
            ],
            "geteppcode" => [
                "success" => "Loaded EPP code successfully.",
                "fail" => "Failed to load EPP code."
            ],
            "savecontactdetails" => [
                "success" => "Updated contact details successfully.",
                "fail" => "Failed to update contact details."
            ],
            "saveregistrarlock" => [
                "success" => "Updated domain registrar lock successfully.",
                "fail" => "Failed to update domain registrar lock."
            ],
            "savenameservers" => [
                "success" => "Updated nameservers successfully.",
                "fail" => "Failed to update nameservers."
            ],
            "registernameserver" => [
                "success" => "Registered private nameserver successfully.",
                "fail" => "Failed to register private nameserver."
            ],
            "modifynameserver" => [
                "success" => "Updated private nameserver successfully.",
                "fail" => "Failed to update private nameserver."
            ],
            "deletenameserver" => [
                "success" => "Deleted private nameserver successfully.",
                "fail" => "Failed to delete private nameserver."
            ],
            "savedns" => [
                "success" => "Updated DNS zone successfully.",
                "fail" => "Failed to update DNS zone."
            ],
            "send" => [
                "success" => "Verficiation email sent successfully.",
                "fail" => "Failed to send verification email."
            ],
            "dnssec" => [
                "success" => "Updated DNSSEC successfully.",
                "fail" => "Failed to update DNSSEC."
            ],
            "saveemailforwarding" => [
                "success" => "Updated email forwarding successfully.",
                "fail" => "Failed to update email forwarding."
            ],
            "idprotecttoggle" => [
                "success" => "Updated ID protect status successfully.",
                "fail" => "Failed to update ID protect status."
            ],
            "registerdomain" => [
                "success" => "Registered domain successfully.",
                "fail" => "Failed to register domain."
            ],
            "transferdomain" => [
                "success" => "Transferred domain successfully.",
                "fail" => "Failed to transfer domain."
            ],
            "renewdomain" => [
                "success" => "Renewed domain successfully.",
                "fail" => "Failed to renew domain."
            ],
            "releasedomain" => [
                "success" => "Released domain successfully.",
                "fail" => "Failed to release domain."
            ],
            "default" => [
                "success" => "Updated the data successfully.",
                "fail" => "Failed to update the data.",
            ]
        ];

        $registrar = $params["_registrar"]["name"];
        $action = self::getAction($registrar);
        $statusKey = empty($reason) ? "success" : "fail";

        $message = trim(implode(" ", [
            $params["_logItem"] . ":",
            ($messages[$action][$statusKey] ?? $messages["default"][$statusKey]),
            empty($reason) ? "" : " ({$reason})"
        ]));

        /**
         * Updates session data for "SaveDNS", "SaveNameservers" etc based on the action and status.
         * - If the action matches a session key, ensures the session array is initialized.
         * - If the status is "fail", stores the failure reason for the given item.
         * - Otherwise, removes the item from the session.
         */
        foreach (["SaveDNS", "SaveNameservers", "SaveContactDetails", "SaveEmailForwarding", "SaveRegistrarLock", "RegisterNameserver", "DeleteNameserver", "ModifyNameserver"] as $sesskey) {
            if (strcasecmp($action, $sesskey) === 0) {
                $sesskey = preg_replace("/(Register|Delete|Modify)Nameserver/i", "SaveNameservers", $sesskey);
                // Initialize the session array if it doesn't exist
                $_SESSION["cnic_track"][$sesskey] ??= [];
                if ($statusKey === "fail") {
                    $_SESSION["cnic_track"][$sesskey][$params["_logItem"]] = $reason;
                } else {
                    unset($_SESSION["cnic_track"][$sesskey][$params["_logItem"]]);
                }
            }
        }

        if (isset($params["userid"])) {
            \logActivity("[" . $registrar . "] " . $message, $params["userid"]);
        } else {
            \logActivity("[" . $registrar . "] " . $message);
        }

        if ($statusKey === "fail") { // can be reused to respond to WHMCS
            return [
                "error" => $reason
            ];
        }
        return [
            "success" => true
        ];
    }
}
