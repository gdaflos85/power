<?php

namespace WHMCS\Module\Registrar\Ibs;

class RegistrarDomain extends \WHMCS\Domain\Registrar\Domain
{
    /** @var array{isPremium:bool,isTrusteeUsed:bool,registrantTaxId:string,createdDate:string,signed:bool} */
    protected $registrarData = [
        "isPremium" => false,
        "isTrusteeUsed" => false,
        "registrantTaxId" => "",
        "createdDate" => "",
        "signed" => false
    ];

    /**
     * Set the registrar data "signed" for the domain (using dnssec)
     *
     * @param bool $signed flag to indicate if the domain is signed (dnssec)
     * @return $this
     */
    public function setSigned($signed)
    {
        $this->registrarData["signed"] = $signed;
        return $this;
    }

    /**
     * Get the registrar data "signed" for the domain (using dnssec)
     *
     * @return bool
     */
    public function isSigned()
    {
        return $this->registrarData["signed"];
    }

    /**
     * Set the registrar data "isPremium" for the domain
     *
     * @param bool $isPremium
     * @return $this
     */
    public function setPremium($isPremium)
    {
        $this->registrarData["isPremium"] = $isPremium;
        return $this;
    }

    /**
     * Get the registrar data "isPremium" for the domain
     *
     * @return bool
     */
    public function isPremium()
    {
        return $this->registrarData["isPremium"];
    }

    /**
     * Set the registrar data "isTrusteeUsed" for the domain
     *
     * @param bool $isTrusteeUsed
     * @return $this
     */
    public function setTrusteeUsed($isTrusteeUsed)
    {
        $this->registrarData["isTrusteeUsed"] = $isTrusteeUsed;
        return $this;
    }

    /**
     * Get the registrar data "isTrusteeUsed" for the domain
     *
     * @return bool
     */
    public function isTrusteeUsed()
    {
        return $this->registrarData["isTrusteeUsed"];
    }

    /**
     * Set the registrar data "registrantTaxId" for the domain
     *
     * @param string $registrantTaxId
     * @return $this
     */
    public function setRegistrantTaxId($registrantTaxId)
    {
        $this->registrarData["registrantTaxId"] = $registrantTaxId;
        return $this;
    }

    /**
     * Get the registrar data "registrantTaxId" for the domain
     *
     * @return string
     */
    public function getRegistrantTaxId()
    {
        return $this->registrarData["registrantTaxId"];
    }

    /**
     * Set the registrar data "createdDate" for the domain
     *
     * @param string $createdDate
     * @return $this
     */
    public function setCreatedDate($createdDate)
    {
        $this->registrarData["createdDate"] = $createdDate;
        return $this;
    }

    /**
     * Get the registrar data "createdDate" for the domain
     *
     * @return string
     */
    public function getCreatedDate()
    {
        return $this->registrarData["createdDate"];
    }
}
