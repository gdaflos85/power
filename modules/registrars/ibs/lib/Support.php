<?php

namespace WHMCS\Module\Registrar\Ibs;

class Support
{
    /**
     * Open support ticket in case something goes wrong with a billable operation
     *
     * @param array<string,mixed> $params WHMCS' common module parameters
     * @param string $subject The subject of the ticket
     * @param string $message The message to be included in the ticket
     * @param bool $markdown Whether the message is markdown formatted
     * @return void
     */
    public static function openTicket($params, $subject, $message, $markdown = false)
    {
        //get dept id
        if (
            isset($params["NotifyOnError"])
            && (bool)preg_match("/.+\((\d+)\)/ix", $params["NotifyOnError"], $m)
        ) {
            $registrarid = $params["_registrar"]["name"];
            localAPI("OpenTicket", [
                "deptid" => $m[1],
                "subject" => \strtoupper($registrarid) . " MODULE ERROR: $subject",
                "message" => $message,
                "priority" => "High",
                "markdown" => $markdown,
                "email" => $params["_registrar"]["_module"]["support_email"],
                "name" => $registrarid . " registrar module"
            ]);
        }
    }

    /**
     * gets client's IP address
     *
     * @return string|null
     */
    public static function getClientIp()
    {
        foreach (["HTTP_X_FORWARDED_FOR", "REMOTE_ADDR"] as $key) {
            if (isset($_SERVER[$key])) {
                return $_SERVER[$key];
            }
        }
        return null;
    }
}
