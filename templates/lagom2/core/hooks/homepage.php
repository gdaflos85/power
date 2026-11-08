<?php

use WHMCS\Database\Capsule;
use \RSThemes\Extensions\PromoBannersExtension as Banner;
use \WHMCS\Product\Group;
use \Punic\Currency;
use \WHMCS\Domains\Domain;
use WHMCS\Session;
use WHMCS\View\Formatter\Price as Price;

add_hook('ClientAreaPage', 22, function ($v) {
    if (Capsule::schema()->hasTable("rstheme_themes")) {
        $pageConfig = Capsule::table('rstheme_themes')->select('pages_configuration')->whereName('lagom2')->first()->pages_configuration;
        if ($v['templatefile'] == 'homepage') {
            return [
                'homepage' => new \RSThemes\Helpers\GetHomeVars($v)
            ];
        }
    }
});

add_hook('ClientAreaPageCart', 1, function($vars) {
    $return = ['productsPricing'=>[]];
    $currency = null;
    if(isset($_SESSION['currency']))
        $currency = $_SESSION['currency'];
    $uid=null;
    if(isset($_SESSION['uid']))
        $uid = $_SESSION['uid'];
    $currentCurrency = getCurrency($uid, $currency);
    $products = \RSThemes\Models\ProductCalculatedPricing::where("gid",$vars['gid'])->where("currency",$currentCurrency['id'])->get();
    foreach($products as $item){
        $return['productsPricing'][$item->pid] = \RSThemes\Helpers\GetHomeVars::returnParsedPricing($item, $currentCurrency);
    }
    return $return;
});