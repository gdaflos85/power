<?php

namespace WHMCS\Module\Server\BitNinja\Controllers;

use WHMCS\Module\Server\BitNinja\API;
use WHMCS\Module\Server\BitNinja\Model\License as BitNinjaLicense;

class ClientAreaController
{
    protected $service;
    protected $params;

    public function __construct($params)
    {
        $this->params = $params;
        $this->service = $this->params['model'];
    }

    public function overview()
    {
        $templateFile = 'templates/overview.tpl';

        $api = new API($this->params['serverusername'], $this->params['serverpassword']);

        $licenseKey = $this->service->serviceProperties->get('Domain');

        return [
            'tabOverviewReplacementTemplate' => $templateFile,
            'templateVariables' => [
                'licenseKey' => $licenseKey,
            ],
        ];
    }
}