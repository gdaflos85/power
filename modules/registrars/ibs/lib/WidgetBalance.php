<?php

namespace WHMCS\Module\Registrar\Ibs;

class WidgetBalance
{
    /** @var array<string,mixed> */
    private $data = [];
    /** @var string */
    private $widgetid = null;
    /** @var string */
    private $registrarid = null;
    /** @var array<string,mixed> */
    private $currency = [];

    /**
     * Constructor
     *
     * @param string $widgetid the widget id
     * @param string $registrarid the registrar id
     * @param array<string,mixed> $params common module parameters
     */
    public function __construct($widgetid, $registrarid, $params)
    {
        $this->widgetid = $widgetid;
        $this->registrarid = $registrarid;

        /**
         * @codeCoverageIgnore
         */
        // init status
        if (isset($_SESSION[$this->widgetid]["data"])) { // data cache exists
            $this->data = $_SESSION[$this->widgetid]["data"];
        } else {
            $this->data = [
                "amount" => 0,
                "currency" => "USD",
            ];
            $fn = $this->registrarid . "_getAccountDetails";
            if (!function_exists($fn)) {
                return;
            }
            $accountsStatus = $fn($params);
            if ($accountsStatus["status"] === "SUCCESS") {
                $this->data["amount"] = $accountsStatus["balance_0_amount"];
                $this->data["currency"] = $accountsStatus["balance_0_currency"];
                $_SESSION[$this->widgetid]["data"] = $this->data;
            }
        }

        // init currency
        $currencies = localAPI("GetCurrencies", []);
        $currenciesAsAssocList = [];
        if ($currencies["result"] === "success") {
            foreach ($currencies["currencies"]["currency"] as $idx => $d) {
                $currenciesAsAssocList[$d["code"]] = $d;
            }
        }
        $this->currency  = $currenciesAsAssocList;
    }

    /**
     * get balance data
     * @return array<string,mixed>
     */
    public function getData(): array
    {
        $amount = floatval($this->data["amount"]);
        $currency = $this->data["currency"];
        $currencyid = $this->currency[$currency]["id"] ?? null;
        return [
            "amount" => $amount,
            "currency" => $currency,
            "currencyID" => $currencyid,
        ];
    }

    /**
     * get formatted balance data
     * @return array<string,mixed>
     */
    public function getDataFormatted(): ?array
    {
        $data = $this->getData();
        if (is_null($data["currencyID"])) {
            $formattedAmount = number_format($data["amount"], 2, ".", ",") . " " . $data["currency"];
        } else {
            $formattedAmount = formatCurrency($data["amount"], $data["currencyID"]);
        }
        return [
            "amount" => $formattedAmount,
            "rawAmount" => $data["amount"],
        ];
    }

    /**
     * generate balance as HTML
     * @return string
     */
    public function toHTML(): string
    {
        $newData = $this->getDataFormatted();
        if (is_null($newData)) {
            return <<<HTML
                <div class="widget-content-padded widget-billing">
                    <div class="color-pink">Loading Account Data failed.</div>
                </div>
HTML;
        }
        // The value will be without currency, so just cast to float
        $balanceColor = (floatval($newData["rawAmount"]) < 0) ? "pink" : "green";
        return <<<HTML
            <div class="item text-right">
                <div class="data color-{$balanceColor}">{$newData["amount"]}</div>
                <div class="note">Account Balance</div>
            </div>
HTML;
    }
}
