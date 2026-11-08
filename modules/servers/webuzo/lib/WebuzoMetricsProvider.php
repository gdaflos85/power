<?php

namespace WHMCS\Module\Server\Webuzo;

use WHMCS\UsageBilling\Contracts\Metrics\MetricInterface;
use WHMCS\UsageBilling\Contracts\Metrics\ProviderInterface;
use WHMCS\UsageBilling\Metrics\Metric;
use WHMCS\UsageBilling\Metrics\Units\Accounts;
use WHMCS\UsageBilling\Metrics\Units\MegaBytes;
use WHMCS\UsageBilling\Metrics\Units\GigaBytes;
use WHMCS\UsageBilling\Metrics\Units\WholeNumber;
use WHMCS\UsageBilling\Metrics\Usage;

class WebuzoMetricsProvider implements ProviderInterface
{
    private $moduleParams = [];
    public function __construct($moduleParams)
    {
        $this->moduleParams = $moduleParams;
    }

    public function metrics()
    {
        return [
            new Metric(
                'disk',
                'Disk Space',
                MetricInterface::TYPE_SNAPSHOT,
                new GigaBytes()
            ),
            new Metric(
                'combined_disk',
                'Total Disk Space (including sub-accounts)',
                MetricInterface::TYPE_SNAPSHOT,
                new GigaBytes()
            ),
            new Metric(
                'inode',
                'Inode',
                MetricInterface::TYPE_SNAPSHOT,
                new WholeNumber('Inodes')
            ),
            new Metric(
                'combined_inode',
                'Total Inode (including sub-accounts)',
                MetricInterface::TYPE_SNAPSHOT,
                new WholeNumber('Inodes')
            ),
            new Metric(
                'bandwidth',
                'Bandwidth',
                MetricInterface::TYPE_PERIOD_MONTH,
                new GigaBytes()
            ),
            new Metric(
                'combined_bandwidth',
                'Total Bandwidth (including sub-accounts)',
                MetricInterface::TYPE_PERIOD_MONTH,
                new GigaBytes()
            ),
            new Metric(
                'subaccounts',
                'Sub-Accounts',
                MetricInterface::TYPE_SNAPSHOT,
                new Accounts('Sub-Accounts')
            ),
            new Metric(
                'email_account',
                'Email Mailboxes',
                MetricInterface::TYPE_SNAPSHOT,
                new Accounts('Mailboxes')
            ),
            new Metric(
                'ftp',
                'FTP Accounts',
                MetricInterface::TYPE_SNAPSHOT,
                new Accounts('FTP-Accounts')
            ),
            new Metric(
                'db',
                'MySQL Databases',
                MetricInterface::TYPE_SNAPSHOT,
                new Accounts('MySQL-DBs')
            ),
            new Metric(
                'dbdisk',
                'MySQL Disk Usage',
                MetricInterface::TYPE_SNAPSHOT,
                new MegaBytes()
            ),
            new Metric(
                'addondom',
                'Addon Domains',
                MetricInterface::TYPE_SNAPSHOT,
                new Accounts('AddonDomains')
            ),
            new Metric(
                'parkeddom',
                'Parked Domains',
                MetricInterface::TYPE_SNAPSHOT,
                new Accounts('Mailboxes')
            ),
            new Metric(
                'subdom',
                'Sub-Domains',
                MetricInterface::TYPE_SNAPSHOT,
                new Accounts('SubDomains')
            ),
        ];
    }

    public function usage()
    {
		$usage = $this->webuzoGetStats();
		
        return $usage;
    }
    
    public function tenantUsage($tenant)
    {
		// $tenant is domain.com
		$usage = $this->webuzoGetStats($tenant);
		
        return $usage[$tenant];
    }

    private function wrapUserData($data)
    {
        $wrapped = [];
        foreach ($this->metrics() as $metric) {
            $key = $metric->systemName();
            if ($data[$key]) {
                $value = $data[$key];
                $metric = $metric->withUsage(
                    new Usage($value)
                );
            }
            
            $wrapped[] = $metric;
        }
        
        return $wrapped;
    }

    private function webuzoGetStats($domain = '')
    {
		$domain_wise = (!empty($domain) ? '&domain='.rawurlencode($domain) : '');
		$serverdata = webuzo_admin_call($this->moduleParams, '?act=users&reslen=all'.$domain_wise);
		
        $usage = [];
		
		if(empty($serverdata) || empty($serverdata['users'])){
			return $usage;
		}
		
        foreach ($serverdata['users'] as $username => $data) {
			
			$userdata = array();
			
			foreach ($this->metrics() as $metric) {
				$key = $metric->systemName();
				if (isset($data['resource'][$key]['used']) || isset($data['resource'][$key]['used_bytes'])) {
					if(in_array($key, array('disk', 'bandwidth', 'combined_disk', 'combined_bandwidth'))){
						// Convert bytes to GB
						$userdata[$key] = $data['resource'][$key]['used_bytes'] / 1024 / 1024 / 1024;
					}elseif(in_array($key, array('dbdisk'))){
						// Convert bytes to MB
						$userdata[$key] = $data['resource'][$key]['used_bytes'] / 1024 / 1024;
					}else{
						$userdata[$key] = $data['resource'][$key]['used'];
					}
				}
				
			}
			
			// WHMCS expects data with primary domain in the key and not username
            $usage[$data['domain']] = $this->wrapUserData($userdata);
        }
		
		return $usage;
    }
}