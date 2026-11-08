<?php

//////////////////////////////////////////////////////////////
//===========================================================
// WEBUZO
//===========================================================
// Inspired by the DESIRE to be the BEST OF ALL
// ----------------------------------------------------------
// Started by: Pulkit
// Date:       10th Jan 2009
// Time:       21:00 hrs
// Site:       https://webuzo.com/ (WEBUZO)
// ----------------------------------------------------------
// Please Read the Terms of Use at https://webuzo.com/terms
// ----------------------------------------------------------
//===========================================================
// (c) Softaculous Ltd.
//===========================================================
//////////////////////////////////////////////////////////////

// Last Updated : 05/06/2025
// Version : 2.8

// Disable warning messages - in PHP 5.4
//error_reporting(E_ALL & ~E_STRICT & ~E_NOTICE);

// This is supported since WHMCS 6.0+
use WHMCS\Database\Capsule;
use WHMCS\Auth;
use WHMCS\Service\Status;

use WHMCS\Module\Server\Webuzo\WebuzoMetricsProvider;

include_once('webuzo_conf.php');

// Load panel ports
$webuzo_conf['panel_ports']['admin_ssl'] = '2005';
$webuzo_conf['panel_ports']['admin_nonssl'] = '2004';
$webuzo_conf['panel_ports']['enduser_ssl'] = '2003';
$webuzo_conf['panel_ports']['enduser_nonssl'] = '2002';

if(!empty($webuzo_conf['custom_ports']['admin_ssl'])){
	$webuzo_conf['panel_ports']['admin_ssl'] = $webuzo_conf['custom_ports']['admin_ssl'];
}

if(!empty($webuzo_conf['custom_ports']['admin_nonssl'])){
	$webuzo_conf['panel_ports']['admin_nonssl'] = $webuzo_conf['custom_ports']['admin_nonssl'];
}

if(!empty($webuzo_conf['custom_ports']['enduser_ssl'])){
	$webuzo_conf['panel_ports']['enduser_ssl'] = $webuzo_conf['custom_ports']['enduser_ssl'];
}

if(!empty($webuzo_conf['custom_ports']['enduser_nonssl'])){
	$webuzo_conf['panel_ports']['enduser_nonssl'] = $webuzo_conf['custom_ports']['enduser_nonssl'];
}

function webuzo_MetaData() {
	return array(
		'DisplayName' => 'Webuzo',
		'DefaultNonSSLPort' => $GLOBALS['webuzo_conf']['panel_ports']['admin_nonssl'],
		'DefaultSSLPort' => $GLOBALS['webuzo_conf']['panel_ports']['admin_ssl'],
		'ServiceSingleSignOnLabel' => 'Login to Webuzo Enduser',
		'AdminSingleSignOnLabel' => 'Webuzo Admin Panel',
		'ListAccountsUniqueIdentifierDisplayName' => 'Domain',
		'ListAccountsUniqueIdentifierField' => 'domain',
		'ListAccountsProductField' => 'configoption1',
	);
}

function webuzo_configOptions($params) {
	
	global $webuzo_conf, $whmcsmysql;
	
	// We just need the plan on the server
	$configarray['Select Plan'] = array("Type" => "text", "Size" => 25);

	// Create the uuid custom field automatically
	if(!empty($_REQUEST['id'])){
		
		$uuid = Capsule::table('tblcustomfields')
			->where('type', 'product')
			->where('relid', $_REQUEST['id'])
			->where('fieldname', 'uuid')
			->first();
		
		if(empty($uuid)){
			$ret_uuid = Capsule::table('tblcustomfields')->insert(array(
				array('type' => 'product',
					'relid' => $_REQUEST['id'], 
					"fieldname" => "uuid", 
					"fieldtype" => "text", 
					"adminonly" => "on"
				)
			));
		}
		
	}else{
		return $configarray;
	}
	
	// Get the product ID
	$pid = (int) $_REQUEST['id'];
	
	// First get the configoption1 to check if the user is on OLD method or New method.
	$res = Capsule::table('tblproducts')->where('id', $pid)->get();
	
	$product = (array) $res[0];
	//rprint($product);
	
	// Get the list of servers in this Server Group
	if(!empty($product['servergroup'])){
		$res = Capsule::table('tblservergroupsrel')->where('groupid', $product['servergroup'])->get();
	
		foreach($res as $re){
			$server_list[$re->serverid] = '';
		}
	}
	
	// Get the Servers
	if(!empty($server_list)){
		
		$res = Capsule::table('tblservers')
			->where('type', 'webuzo')
			->whereIn('id', array_keys($server_list))
			->get();
		
		if(empty($res)){
			echo '<font color="#FF0000">The Webuzo servers could not be found. Please add the Webuzo Server and Server group to proceed</font>';
			return;
		}
		
		$server_list = array();
		
		foreach($res as $re){
			$server_list[$re->id] = $re->id.' - '.trim($re->name);
			$server_data[$re->id] = (array) $re;
		}
	
	}
	
	if(!empty($server_list)){
		$i = 0;
		foreach($server_list as $sk => $server_name){
			
			if($i >= 6){
				break;
			}
			
			$sv = $server_data[$sk];
			
			$tmp_hostname = $sv['ipaddress'];
			if(empty($tmp_hostname)){
				$tmp_hostname = $sv['hostname'];
			}
			
			// Get the data from Webuzo
			$data = Webuzo_Curl::make_api_call($tmp_hostname, $sv['username'], get_webuzo_api_key($sv), 'index.php?act=add_user');
			
			if($webuzo_conf['loglevel'] > 1){
				logActivity('[Webuzo] Fetch Plans : '.var_export($data, 1));
			}
			
			// Build the options list to show Plans
			if(!empty($data['plans'])){
				foreach($data['plans'] as $k => $v){
					$tmp_plans[$k] = $k.' (Name : '.$v['plan_name'].')';
				}
			}
			
			/*if($params["producttype"] == 'reselleraccount'){
			
				// Get the Reseller Plans from Webuzo
				$rdata = Webuzo_Curl::make_api_call($tmp_hostname, $sv['username'], get_webuzo_api_key($sv), 'index.php?act=reseller_plans');
				
				if($webuzo_conf['loglevel'] > 1){
					logActivity('[Webuzo] Fetch Reseller Plans : '.var_export($rdata, 1));
				}
				
				// Build the options list to show Plans
				if(!empty($rdata['plans'])){
					foreach($rdata['plans'] as $k => $v){
						$reseller_plans[$k] = $k.' (Name : '.$v['plan_name'].')';
					}
				}
			
			}*/
			
			$i++;
		}
	}
	
	if(empty($tmp_plans)){
		return $configarray;
	}
	
	array_unshift($tmp_plans, 'Choose a Plan');
	
	$configarray['Select Plan'] = array("Type" => "dropdown", "Options" => implode(',', $tmp_plans));
	//$configarray['Default Node/ Group'] = array("Type" => "dropdown", "Options" => implode(',', array_values($tmp_default_node_grp)), "Description" => '[G] = Group Name');
	
	if($params["producttype"] == 'reselleraccount'){
		$configarray = array_merge($configarray, webuzo_reseller_config());
	}
	
	return $configarray;
}

function webuzo_reseller_config(){
	
	$configarray['Total Number of accounts'] = array('Type' => 'text', 'Size' => '10', 'wkey' => 'reseller_tot_acc_limit', 'conf' => 2);
	$configarray['Total Disk Space'] = array('Type' => 'text', 'Size' => '15', 'Description' => 'MB', 'wkey' => 'reseller_tot_disk_limit', 'conf' => 3);
	$configarray['Total Inode'] = array('Type' => 'text', 'Size' => '15', 'wkey' => 'reseller_tot_inode', 'conf' => 4);
	$configarray['Total Monthly Bandwidth'] = array('Type' => 'text', 'Size' => '15', 'Description' => 'MB', 'wkey' => 'reseller_tot_bandwidth', 'conf' => 5);
	$configarray['Total Subdomains'] = array('Type' => 'text', 'Size' => '10', 'wkey' => 'reseller_tot_subdomain', 'conf' => 6);
	$configarray['Total Parked Domains'] = array('Type' => 'text', 'Size' => '10', 'wkey' => 'reseller_tot_parked', 'conf' => 7);
	$configarray['Total Addon Domains'] = array('Type' => 'text', 'Size' => '10', 'wkey' => 'reseller_tot_addon', 'conf' => 8);
	$configarray['Home Directory'] = array('Type' => 'text', 'Size' => '20', 'Description' => 'Path of the storage', 'wkey' => 'home', 'conf' => 9);
	$configarray['Allow Overselling'] = array('Type' => 'yesno', 'Description' => 'Allow Unlimited values for subusers', 'wkey' => 'reseller_allow_overselling', 'conf' => 10);
	$configarray['Disable Subuser Shell Access'] = array('Type' => 'yesno', 'wkey' => 'disable_user_shell', 'conf' => 11);
	$configarray['Disable Terminate Accounts'] = array('Type' => 'yesno', 'wkey' => 'disable_terminate', 'conf' => 12);
	$configarray['Add Prefix to Package'] = array('Type' => 'yesno', 'Description' => 'Add username_ to package name', 'wkey' => 'username_plans_prefix', 'conf' => 13);
	$configarray['Reseller Ownership'] = array('Type' => 'yesno', 'Description' => 'Set the reseller to own their own account', 'conf' => 14);
	$configarray['Total FTP Accounts'] = array('Type' => 'text', 'Size' => '10', 'wkey' => 'reseller_tot_ftp', 'conf' => 15);
	$configarray['Total Email Accounts'] = array('Type' => 'text', 'Size' => '10', 'wkey' => 'reseller_tot_email', 'conf' => 16);
	$configarray['Total MySQL Databases'] = array('Type' => 'text', 'Size' => '10', 'wkey' => 'reseller_tot_database', 'conf' => 17);
	
	return $configarray;
	
}

function webuzo_MetricProvider($params){
    return new WebuzoMetricsProvider($params);
}

function webuzo_CreateAccount($params) {

	global $webuzo_conf, $whmcsmysql;

    # ** The variables listed below are passed into all module functions **
	
	$loglevel = (int) @$_REQUEST['loglevel'];
	
	if(!empty($webuzo_conf['loglevel'])){
		$loglevel = $webuzo_conf['loglevel'];
	}
	
	$serviceid = $params["serviceid"]; # Unique ID of the product/service in the WHMCS Database
	$pid = $params["pid"]; # Product/Service ID
	$producttype = $params["producttype"]; # Product Type: hostingaccount, reselleraccount, server or other
	$domain = $params["domain"];
	$username = $params["username"];
	$password = $params["password"];
	$clientsdetails = $params["clientsdetails"]; # Array of clients details - firstname, lastname, email, country, etc...
	$customfields = $params["customfields"]; # Array of custom field values for the product
	$configoptions = $params["configoptions"]; # Array of configurable option values for the product

	if(empty($customfields)){
		$customfields = webuzo_getcustomfields($params['serviceid']);
	}
	
	if(!empty($customfields['uuid'])){
		return 'The Account already exists in WHMCS records';
	}
		
	$server_group = '';
	$slave_server = '';
	$location = '';
	
	if(isset($params['configoptions']['slave_server']) && $params['configoptions']['slave_server'] != 'none'){
		$location = $params['configoptions']['slave_server'];
	}
	
	// Is it a Server group ?
	if(preg_match('/\[G\]/s', $location)){
		//$server_group = str_replace('[G] ', '', $location);
		//$server_group = trim($server_group);
		$tmp_sg = array();
		$tmp_sg = explode('- [', $location);
		$server_group = trim($tmp_sg[0]);
	}
	
	// If we do not get server group we will search it for slave server
	if($server_group == ''){
		// Is user wants auto selection from server?
		if($location == 'Auto Select Server'){
			
			$slave_server = 'auto';
			
		// Or is it a particular Slave server ?
		}else{
			
			$tmp_ss = array();
			$tmp_ss = explode("-", (string)$location);
			$slave_server = trim($tmp_ss[0]);
		}
	}
	
	$post['server_group'] = $server_group;
	if(strtolower($slave_server) != 'none'){
		$post['slave_server'] = $slave_server;
	}
	
	// Now get the plan SLUG to post
	$tmp_plid = explode(' ', $params['configoption1']);
	
	// Pass the user details
	$post['plan'] = trim($tmp_plid[0]);
	$post['domain'] = $params['domain'];
	$post['user'] = $params['username'];
	$post['user_passwd'] = $params['password'];
	$post['cnf_user_passwd'] = $params['password'];
	$post['email'] = $params["clientsdetails"]['email'];
	
	if($loglevel > 0) logActivity('[webuzo_createAccount] params : '.var_export($params, 1));
	
	// Are there any configurable options
	if(!empty($params['configoptions'])){
		foreach($params['configoptions'] as $k => $v){
			if(!isset($post[$k])){
				$post[$k] = $v;
			}
		}
	}
	
	// Any custom code ?
	if(file_exists(dirname(__FILE__).'/custom.php')){
		include_once(dirname(__FILE__).'/custom.php');
		
		if(!empty($custom_error)){
			return $custom_error;
		}
		
	}
	
	// No emails
	if(!empty($customfields['noemail'])){
		$post['noemail'] = 1;
	}
	
	$post['billing_prefill'] = 1;
	$post['node_select'] = 1;
	$post['create_user'] = 1;
	
	if($params['producttype'] == 'reselleraccount'){
		$post['reseller'] = 1;
		
		//logActivity('[webuzo_createAccount] Params: '.var_export($params, 1));
		
		// Are you your owner as well
		if(!empty($params['configoption15'])){
			$post['owner'] = $params['username'];
		}
	}
	
	if($loglevel > 1) logActivity('[webuzo_createAccount] POST : '.var_export($post, 1));
	
	$ret = webuzo_admin_call($params, 'index.php?act=add_user', $post);
	
	if($loglevel > 0){
		logActivity('[webuzo_createAccount] Return Create Call: '.var_export($ret, 1));
	}
	
	if(empty($ret)){
		$msg = 'Did not get any response from the server !';
		if($loglevel > 0) logActivity('[webuzo_createAccount] '.$msg);
		return $msg;
	}
	
	if(!empty($ret['error'])){
		return implode('<br>*', array_values($ret['error']));
	}
		
	// Fill the variables as per the OLD module as it will be inserted to WHMCS. Like ips, ips6, etc..
	if(!empty($ret['done']['user']['ips'])){
		$_ips = $ret['done']['user']['ips'];
	}
	
	if(!empty($ret['done']['user']['ipv6'])){
		$_ips6 = $ret['done']['user']['ipv6'];
	}
	
	if(!empty($ret['done']['user']['ipv6_subnet'])){
		$_ips6_subnet = $ret['done']['user']['ipv6_subnet'];
	}
	
	// Was the account created
	if(!empty($ret['done']['user'])){
		
		if($loglevel > 0) logActivity('[webuzo_CreateAccount] DONE : '.var_export($ret['done'], 1));
		
		// We will need to post 
		if($params['producttype'] == 'reselleraccount'){
			
			// Create the array of options for reseller privileges
			$privs = webuzo_reseller_config();
			$rpost['save_privileges'] = 1;
			$rpost['missing_val_set_default'] = 1;
			
			$rpost['user_name'] = $params['username'];
			
			foreach($privs as $kk => $vv){
				if(empty($params['configoption'.$vv['conf']])){
					continue;
				}
				
				// Handle checkboxes
				if($vv['Type'] == 'yesno' && strtolower($params['configoption'.$vv['conf']]) == 'on'){
					$params['configoption'.$vv['conf']] = 1;
				}
				
				$rpost[$vv['wkey']] = $params['configoption'.$vv['conf']];
			}
	
			if($loglevel > 1) logActivity('[webuzo_createAccount] Reseller Privileges POST : '.var_export($rpost, 1));
	
			$reseller_ret = webuzo_admin_call($params, 'index.php?act=reseller_privileges', $rpost);
			
			if($loglevel > 0){
				logActivity('[webuzo_createAccount] Return Reseller Privileges Call: '.var_export($reseller_ret, 1));
			}
			
		}
		
		// uuid of WEBUZO
		$query = Capsule::table('tblcustomfields')
				->where('relid', $pid)
				->where('fieldname', 'uuid')
				->get();
		$res = (array) $query[0];		
		
		// We will check if there is an entry if not we will insert it.
		$query = Capsule::table('tblcustomfieldsvalues')
				->select('relid')
				->where('relid', $serviceid)
				->where('fieldid', $res['id'])
				->get();
		$sel_res = (array) $query[0];	
		
		if($loglevel > 0) logActivity('[webuzo_CreateAccount] Did we find anything : '.var_export($sel_res, 1));
		
		// We will insert it if not found anything
		if(empty($sel_res['relid'])){
			Capsule::table('tblcustomfieldsvalues')
					->insert(array(
						'value' => $ret['done']['user']['uuid'],
						'relid' => $serviceid,
						'fieldid' => $res['id']
					));
			
		}else{
			Capsule::table('tblcustomfieldsvalues')
					->where('relid', $serviceid)
					->where('fieldid', $res['id'])
					->update(
						array('value' => $ret['done']['user']['uuid'])
					);
			
			if($loglevel > 0) {
				logActivity("UPDATE `tblcustomfieldsvalues` 
				SET `value` = '".$ret['done']['user']['uuid']."' 
				WHERE `relid` = '$serviceid' AND `fieldid` = '".$res['id']."'");
			}
		}
			
		// Change the Username to the email
		Capsule::table('tblhosting')
				->where('id', $serviceid)
				->update(
					array('username' => $ret['done']['user']['user'])
				);

		// The Dedicated IP
		Capsule::table('tblhosting')
			->where('id',$serviceid)
			->update(
				array('dedicatedip' => (!empty($_ips[0]) ? $_ips[0] : $_ips6[0]))
			);
		
		
		$tmp_ips = empty($_ips) ? array() : $_ips;
		
		if(!empty($_ips6_subnet)){
			foreach($_ips6_subnet as $k => $v){
				$tmp_ips[] = $v;
			}
		}
		
		if(!empty($_ips6)){
			foreach($_ips6 as $k => $v){
				$tmp_ips[] = $v;
			}
		}
		
		// Extra IPs
		if(count($tmp_ips) > 1){
			unset($tmp_ips[0]);
			Capsule::table('tblhosting')
				->where('id', $serviceid)
				->update(
					array('assignedips' => implode("\n", $ips))
				);
		}
		
		// Did it start ?
		if(!empty($ret['done'])){
			return 'success';	
		}else{
			return 'Errors : '.implode('<br>', $ret['error']);
		}
		
	}else{
		return 'Errors : '.implode('<br>', $ret['error']);
	}
	
}

function webuzo_AdminServicesTabFields($params) {
	
	// Do we need to show Webuzo panel ? 
	if(!empty($GLOBALS['webuzo_conf']['hide_webuzo_panel']) || !empty($GLOBALS['webuzo_conf']['admin_ui']['hide_webuzo_panel'])){
		return [];
	}
	
	if(!empty($_GET['wapi_mode']) || !empty($_GET['webuzo_static'])){
		ob_end_clean();
	}
	
	$url = 'clientsservices.php?userid='.$params['userid'].'&id='.$params['serviceid'].'&';
	
	$code = webuzo_newUI($params, $url.'wapi_mode=1&', $url.'webuzo_static=');
	
	$fieldsarray = array(
		'Account Information' => '<div style="width:100%" id="webuzo_tab"></div>'.$code,
	);
	
	return $fieldsarray;

}


function webuzo_TerminateAccount($params) {

	global $webuzo_conf, $whmcsmysql;
	
	$loglevel = (int) @$_REQUEST['loglevel'];
	$serviceid = $params["serviceid"]; # Unique ID of the product/service in the WHMCS Database
	
	if(!empty($webuzo_conf['loglevel'])){
		$loglevel = $webuzo_conf['loglevel'];
	}
	
	if(!empty($webuzo_conf['admin_ui']['disable_terminate'])){
		return 'Termination has been disabled by the Global Administrator';
	}

	if (empty($params['customfields']['uuid'])) {
		$params['customfields']['uuid'] = webuzo_getuuid($params['serviceid']);
	}
	
	$additional_params = '';
	if($params['producttype'] = 'reselleraccount' && !empty($webuzo_conf['delete_reseller_sub_accounts'])){
		$additional_params .= '&del_sub_acc=1';
	}
	
	if($params['producttype'] = 'reselleraccount' && !empty($webuzo_conf['delete_reseller_sub_accounts_only'])){
		$additional_params .= '&skip_reseller=1';
	}

	$data = webuzo_admin_call($params, 'index.php?act=users&delete_user='.$params['username'].$additional_params);
	
	if(empty($data)){
		return 'Could not load the server data.'.Webuzo_Curl::error($params);
	}

	// echo "<pre>";print_r($params);echo "</pre>";
	// echo "<pre>";print_r($data);echo "</pre>";
	
	// If the account has been deleted
    if ($data['done']) {
		
		if($loglevel > 0) logActivity('Data after termination : '.var_dump($data, 1));
		
		// uuid of Webuzo
		$query = Capsule::table('tblcustomfields')->select('id')->where('relid',$params["pid"])->where('fieldname','uuid')->get();
		$res = (array) $query[0];

		Capsule::table('tblcustomfieldsvalues')
			->where('relid',$params["serviceid"])
			->where('fieldid',$res['id'])
			->update(
				array('value' => '')
			);
		
		if($loglevel > 0) logActivity("UPDATE `tblcustomfieldsvalues` SET `value` = '' WHERE `relid` = '".$params["serviceid"]."' AND `fieldid` = '".$res['id']."'");
		
		// Do we have to preserve th einformation about the IP
		if(empty($webuzo_conf['admin_ui']['preserve_info'])){		
		// The Dedicated IP
			Capsule::table('tblhosting')
			->where('id',$params["serviceid"])
			->update(array(
				'dedicatedip' => '',
				'assignedips' => ''
			));
		
		}
		$result = "success";
	} else {
		$result = empty($data['error_msg']) ? "There was some error deleting the user" : $data['error_msg'];
	}
	
	return $result;
}

function webuzo_SuspendAccount($params) {
	
	global $webuzo_conf;
	
	$data = webuzo_admin_call($params, 'index.php?act=users&suspend='.$params['username'].'&suspend_reason='.(!empty($params['suspendreason']) ? rawurlencode($params['suspendreason']) : ''));
			
	if(empty($data)){
		return 'Could not load the server data.'.Webuzo_Curl::error($params);
	}

// echo "<pre>";print_r($params);echo "</pre>";
// echo "<pre>";print_r($data);echo "</pre>";

    if ($data['done']) {
		$result = "success";
	} else {
		$result = "There was some error suspending the user";
	}
	return $result;
}

function webuzo_UnsuspendAccount($params) {
	
	global $webuzo_conf;
	
	$data = webuzo_admin_call($params, 'index.php?act=users&unsuspend='.$params['username']);
			
	if(empty($data)){
		return 'Could not load the server data.'.Webuzo_Curl::error($params);
	}

	// echo "<pre>";print_r($params);echo "</pre>";
	// echo "<pre>";print_r($data);echo "</pre>";

    if ($data['done']) {
		$result = "success";
	} else {
		$result = "There was some error unsuspending the user";
	}
	return $result;
}

function webuzo_ChangePassword($params){
	
	$data = webuzo_enduser_call($params, $params['username'], 'index.php?act=changepassword');
	
	if(empty($data)){
		return 'Could not load the server data.'.Webuzo_Curl::error($params);
	}
	
	
	$post['changepass'] = 1;
	$post['newpass'] = $params['password'];
	$post['conf'] = $params['password'];
	
	if($webuzo_conf['loglevel'] > 1){
		logActivity('[webuzo_ChangePassword] Params Array : '.var_export($params, 1));
		logActivity('[webuzo_ChangePassword] Post Array : '.var_export($post_vps, 1));
	}
	
	$ret = webuzo_enduser_call($params, $params['username'], 'index.php?act=changepassword', $post);
	
	if($webuzo_conf['loglevel'] > 0){
		logActivity('[webuzo_ChangePassword] Return : '.var_export($ret, 1));
	}
			
	if(empty($ret)){
		return 'Could not load the server data after processing.'.Webuzo_Curl::error($params);
	}

    if(!empty($ret['done'])){
		
		$result = "success";
	
	}else{
	
		if(!empty($ret['error'])){
			return 'Errors : '.implode('<br>', $ret['error']);
		}
		
		$result = 'Unknown error occured. Please check logs';
	}

	return $result;
}

function webuzo_ChangePackage($params) {

	global $webuzo_conf;
	
	$loglevel = (int) @$_REQUEST['loglevel'];
	$serviceid = $params["serviceid"]; # Unique ID of the product/service in the WHMCS Database
	
	if(!empty($webuzo_conf['loglevel'])){
		$loglevel = $webuzo_conf['loglevel'];
	}

	if(empty($params['customfields']['uuid'])){
		$params['customfields']['uuid'] = webuzo_getuuid($params['serviceid']);
	}
	
	// Get the Data
	$data = webuzo_admin_call($params, 'index.php?act=add_user&user_name='.$params['username']);
			
	if(empty($data)){
		return 'Could not load the server data.'.Webuzo_Curl::error($params);
	}
	
	$post = $data['user']['p'];
	
	if($loglevel > 0){
		logActivity('[webuzo_ChangePackage] Change Package Params : '.var_export($params, 1));
		logActivity('[webuzo_ChangePackage] Orig Plan : '.var_export($post, 1));
	}
	
	// Now get the plan SLUG to post
	$tmp_plid = explode(' ', $params['configoption1']);
	
	// Pass the user details 
	$post['plan'] = trim($tmp_plid[0]);
	$post['domain'] = $params['domain'];
	$post['user'] = $params['username'];
	$post['email'] = $params['clientsdetails']['email'];
	
	if($loglevel > 0) logActivity('[webuzo_ChangePackage] params : '.var_export($params, 1));
	
	// Are there any configurable options
	if(!empty($params['configoptions'])){
		foreach($params['configoptions'] as $k => $v){
			if(!isset($post[$k])){
				$post[$k] = $v;
			}
		}
	}
	
	// No emails
	if(!empty($customfields['noemail'])){
		$post['noemail'] = 1;
	}
	
	$post['billing_prefill'] = 1;
	$post['node_select'] = 1;
	$post['edit_user'] = 1;
	
	if($loglevel > 0) logActivity('[webuzo_ChangePackage] POST : '.var_export($post, 1));
	
	$ret = webuzo_admin_call($params, 'index.php?act=add_user&user_name='.$params['username'], $post);
	
	if($loglevel > 0){
		logActivity('[webuzo_ChangePackage] Return : '.var_export($ret, 1));
	}
	
	if(empty($ret)){
		return 'Could not load the server data after processing.'.Webuzo_Curl::error($params);
	}
	
	if(!empty($ret['error'])){
		return implode('<br>*', array_values($ret['error']));
	}
		
	// Fill the variables as per the OLD module as it will be inserted to WHMCS. Like ips, ips6, etc..
	if(!empty($ret['done']['user']['ips'])){
		$_ips = $ret['done']['user']['ips'];
	}
	
	if(!empty($ret['done']['user']['ipv6'])){
		$_ips6 = $ret['done']['user']['ipv6'];
	}
	
	if(!empty($ret['done']['user']['ipv6_subnet'])){
		$_ips6_subnet = $ret['done']['user']['ipv6_subnet'];
	}
	
	// Lets update reseller privilleges
	if($params['producttype'] == 'reselleraccount'){
		
		// Create the array of options for reseller privileges
		$privs = webuzo_reseller_config();
		$rpost['save_privileges'] = 1;
		$rpost['missing_val_set_default'] = 1;
		
		$rpost['user_name'] = $params['username'];
		
		foreach($privs as $kk => $vv){
			if(empty($params['configoption'.$vv['conf']])){
				continue;
			}
			
			// Handle checkboxes
			if($vv['Type'] == 'yesno' && strtolower($params['configoption'.$vv['conf']]) == 'on'){
				$params['configoption'.$vv['conf']] = 1;
			}
			
			$rpost[$vv['wkey']] = $params['configoption'.$vv['conf']];
		}

		if($loglevel > 1) logActivity('[webuzo_reseller_priv] Reseller Privileges POST : '.var_export($rpost, 1));

		$reseller_ret = webuzo_admin_call($params, 'index.php?act=reseller_privileges', $rpost);
		
		if($loglevel > 0){
			logActivity('[webuzo_reseller_priv] Return Reseller Privileges Call: '.var_export($reseller_ret, 1));
		}	
	}
	
	// Was the account created
	if(!empty($ret['done']['user'])){
		
		$result = "success";
		
		$tmp_ips = empty($_ips) ? array() : $_ips;
		
		if(!empty($_ips6_subnet)){
			foreach($_ips6_subnet as $k => $v){
				$tmp_ips[] = $v;
			}
		}
		
		if(!empty($_ips6)){
			foreach($_ips6 as $k => $v){
				$tmp_ips[] = $v;
			}
		}
		
		// Extra IPs
		if(count($tmp_ips) > 1){
			unset($tmp_ips[0]);
			Capsule::table('tblhosting')
				->where('id', $serviceid)
				->update(
					array('assignedips' => implode("\n", $ips))
				);
		}
		
		//logActivity(var_export($tmp_ips, 1));
		
		// The Dedicated IP
		Capsule::table('tblhosting')
			->where('id',$serviceid)
			->update(array(
				'dedicatedip' => $tmp_ips[0]
			));
		
		// Extra IPs
		$tmp_cnt = count($tmp_ips);
		if(!empty($tmp_cnt)){
			unset($tmp_ips[0]);
			Capsule::table('tblhosting')
			->where('id',$serviceid)
			->update(array(
				'assignedips' => implode("\n", $tmp_ips)
			));
		}

	}else{
			
		if(!empty($ret['error'])){
			return 'Errors : '.implode('<br>', $ret['error']);
		}
		
		$result = 'Unknown error occured. Please check logs';
		
	}
	
	return $result;
	
}

function webuzo_ListAccounts($params){
	
	$accounts = array();
	
	try {
		$ret = webuzo_admin_call($params, '?act=users&reslen=all');
		
		if(!empty($ret['users'])){
			
			foreach($ret['users'] as $U){
				
				if($U['owner'] != $params['serverusername'] && $U['owner'] != $U['user']){
					continue;
				}
				
				$status = WHMCS\Service\Status::ACTIVE;
				if(!empty($U['status']) && $U['status'] == 'suspended'){
					$status = WHMCS\Service\Status::SUSPENDED;
				}
				
				$plan = $U['plan'];
				
				$createdDate = NULL;
				try {
					$startDate = $U['created'];
					if(is_numeric($startDate) && (int) $startDate !== 0){
						$startDateObject = WHMCS\Carbon::createFromTimestamp($startDate);
						if($startDateObject){
							$createdDate = $startDateObject->toDateTimeString();
						}
					}
				} catch (Exception $e) {
					
				}
				
				if(!$createdDate){
					$createdDate = WHMCS\Carbon::today()->toDateTimeString();
				}
				
				$account = array('name' => $U['user'], 'email' => $U['email'], 'username' => $U['user'], 'domain' => $U['domain'], 'uniqueIdentifier' => $U['domain'], 'product' => $plan, 'primaryip' => $U['ip'], 'created' => $createdDate, 'status' => $status);
				
				$accounts[] = $account;
				
			}
		}
		
		return array('success' => true, 'accounts' => $accounts);
		
	} catch (Exception $e) {
		return array('success' => false, 'accounts' => $accounts, 'error' => $e->getMessage());
	}
}

function webuzo_GetUserCount($params){
	
	try{
	
		$ret = webuzo_admin_call($params, '?act=users&reslen=all');
		
		$total_users = $owned_users = 0;
		
		if(!empty($ret['users'])){
			// The API call is made via the serverusername so it will return only owned users
			$total_users = $owned_users = count($ret['users']);
		}
		
		return array('success' => true, 'totalAccounts' => $total_users, 'ownedAccounts' => $owned_users);
		
	}catch(Exception $e){
		return array('success' => false, 'error' => 'could not connect');
	}
}

function webuzo_GetRemoteMetaData($params){
	
	try {
		$admin = webuzo_admin_call($params, 'index.php?');
		
		if(!empty($admin)){
			
			$ret = array();
			
			$ret['version'] = (!empty($admin['version']) ? $admin['version'] : '');
			$ret['load'] = (!empty($admin['load_average']) ? $admin['load_average'] : '');
			$ret['max_accounts'] = (!empty($admin['num_users']) ? $admin['num_users'] : 'Unlimited');
			$ret['num_accounts'] = (!empty($admin['count_data']['users']) ? $admin['count_data']['users'] : 0);
			
			return $ret;
		}
		
		return array('version' => $version, 'load' => $loads, 'max_accounts' => $maxUsers);
	} catch (Exception $e) {
		return array('success' => false, 'error' => 'Could not connect');
	}
}

function webuzo_RenderRemoteMetaData($params){
	
	try{
		
		$remoteData = $params['remoteData'];
		if($remoteData){
			$metaData = $remoteData->metaData;
		}
		
		if(!empty($metaData)){
		
			if(is_array($metaData['load'])){
				foreach($metaData['load'] as $k => $v){
					$metaData['load'][$k] = round($v, 2);
				}
			}else{
				$metaData['load'] = ['N', 'A'];
			}
			
			return "Webuzo Version: " . $metaData['version'] . "<br>\nLoad Averages: " . implode(', ', $metaData['load']) . "<br>\nLicense Max # of Accounts: " . (empty($metaData['max_accounts']) ? 'Unlimited' : $metaData['max_accounts']);
		}
	
	}catch(Exception $e){
		
	}
	
	return '';
	
}

function webuzo_TestConnection($params){
   
	$admin = webuzo_admin_call($params, 'index.php?act=add_user');
	//$client = webuzo_enduser_call($params, 0, 'index.php');

	if(empty($admin['title'])){
		return array('error' => 'FAILED: Could not connect to Webuzo. Please make sure that Ports '.$GLOBALS['webuzo_conf']['panel_ports']['enduser_ssl'].' and '.$GLOBALS['webuzo_conf']['panel_ports']['admin_ssl'].' are open on your WHMCS Server or please check the server details entered are as displayed on Admin Panel >> Configuration >> Server Info');
	}elseif(!empty($admin['error'])){
		return array('error' => 'FAILED: Could not connect to Webuzo. Error Message : '.$admin['error'][0]);
	}else{
		return array('success' => true);
	}
}

function webuzo_LoginLink($params) {
	
	if(!empty($_REQUEST['webuzo_do_login'])){
		
		$vars = $params;
		$vars['serverdata']['hostname'] = $params['serverhostname'];
		$vars['serverdata']['username'] = $params['serverusername'];
		$vars['serverdata']['password'] = $params['serverpassword'];
		$vars['serverdata']['ipaddress'] = get_webuzo_serverip($params);
		//print_r($vars);
		
		if(!empty($params['producttype']) && $params['producttype'] == 'reselleraccount'){
			// Login to Webuzo admin from WHMCS admin panel orders page for reseller accounts
			webuzo_admin_panel($vars);
		}else{
			// Login to Webuzo admin from WHMCS admin panel orders page for non-reseller accounts
			webuzo_enduser_panel($vars);
		}
	}
	
	$url = webuzo_get_current_url();
	$url = $url.(strstr($url, '?') ? '&' : '?').'webuzo_do_login=1';
	
	$code = "<a class=\"btn btn-primary\" href=\"".$url."\" target=\"_blank\" style=\"color:#fff;\">Login to Webuzo</a>";
	return $code;
	
}

function webuzo_UsageUpdate($params){
	
	$ret = webuzo_admin_call($params, '?act=users&reslen=all');
	
	if(!empty($ret['users']) && is_array($ret['users'])){
		
		foreach($ret['users'] as $_username => $U){
			
			if(empty($U['resource'])){
				continue;
			}
			
			$diskusage = (!empty($U['resource']['disk']['used_bytes']) ? $U['resource']['disk']['used_bytes'] / 1024 / 1024 : 0);
			$disklimit = (!empty($U['resource']['disk']['limit_bytes']) && (strtolower($U['resource']['disk']['limit_bytes']) != 'unlimited') ? $U['resource']['disk']['limit_bytes'] / 1024 / 1024 : 'Unlimited');
			$bwusage = (!empty($U['resource']['bandwidth']['used_bytes']) ? $U['resource']['bandwidth']['used_bytes'] / 1024 / 1024 : 0);
			$bwlimit = (!empty($U['resource']['bandwidth']['limit_bytes']) && (strtolower($U['resource']['bandwidth']['limit_bytes']) != 'unlimited') ? $U['resource']['bandwidth']['limit_bytes'] / 1024 / 1024 : 'Unlimited');

			try{
				\WHMCS\Database\Capsule::table('tblhosting')
				->where('server', $params['serverid'])
				->where('domain', $U['domain'])
				->update([
					'diskusage' => $diskusage,
					'disklimit' => $disklimit,
					'bwusage' => $bwusage,
					'bwlimit' => $bwlimit,
					'lastupdate' => Capsule::raw('now()'),
			                ]);
			}catch(\Exception $e){
				logActivity('ERROR: [Webuzo] Unable to update server usage: ' . $e->getMessage());
			}
			
		}
		
	}
}

// Login to admin panel when called
function webuzo_admin_panel($params = array(), $no_redirect = 0){
	
	$add_params = '';
	if(empty($params)){
		
		$serid = (int) $_REQUEST['webuzo_serid'];
		
		$query = Capsule::table('tblservers')
			->where('type', 'webuzo')
			->where('id', $serid)
			->get();
		$params = (array) $query[0];
		
		$params['serverpassword'] = decrypt($params['password']);
		$params['serverip'] = $params['ipaddress'];
		$params['serverusername'] = $params['username'];
		$params['serverhostname'] = $params['hostname'];
		
		if($_REQUEST['webuzo_admin_login'] != md5($params['serverpassword'])){
			echo 'The server password is wrong. This action is recorded !';
			die();
		}
		
	}else{
		$add_params = '&user='.$params['username'];
	}
	
	$ret = webuzo_admin_call($params, '?act=sso&noip=1'.$add_params);
	
	//print_r($params);print_r($ret);die();

	// For SSO we need hostname 1st because with IP there will be SSL cert error
	$tmp_hostname = $params['serverhostname'];
	if(empty($tmp_hostname)){
		$tmp_hostname = $params['serverip'];
	}
	
	if(!empty($ret['done']['sess_token']) && !empty($ret['done']['sess_key'])){
		$redirect_url = 'https://'.$tmp_hostname.':'.$GLOBALS['webuzo_conf']['panel_ports']['admin_ssl'].'/'.$ret['done']['sess_token'].'/?as='.$ret['done']['sess_key'];
	} else {
		$redirect_url = 'https://'.$tmp_hostname.':'.$GLOBALS['webuzo_conf']['panel_ports']['admin_ssl'].'/';
	}
	
	if(!empty($no_redirect)){
		return $redirect_url;
	}
	
	if(!headers_sent()){
		header("Location: " . $redirect_url);
	}
	echo '<meta http-equiv="Refresh" content="0;url='.$redirect_url.'">';
	exit;
	
}

// Admin API Call
function webuzo_admin_call($params, $path, $post = array(), $cookies = array()){
	webuzo_populate_server_params($params);
	$ip = get_webuzo_serverip($params);
	return Webuzo_Curl::make_api_call($ip, $params["serverusername"], get_webuzo_api_key($params), $path, $post, $cookies);
}

// Enduser API Call
function webuzo_enduser_call($params, $loginAs, $path, $post = array()){
	webuzo_populate_server_params($params);
	$ip = get_webuzo_serverip($params);
	return Webuzo_Curl::e_make_api_call($ip, $params["serverusername"], get_webuzo_api_key($params), $loginAs, $path, $post);
}

function webuzo_populate_server_params(&$params){
	// 1. Populate hosting service details if missing
	if(empty($params['username']) && !empty($params['serviceid'])){
		try {
			$service = Capsule::table('tblhosting')->where('id', $params['serviceid'])->first();
			if(!empty($service)){
				if(!empty($service->username)) $params['username'] = $service->username;
				if(!empty($service->server) && empty($params['serverid'])) $params['serverid'] = $service->server;
				if(!empty($service->domain) && empty($params['domain'])) $params['domain'] = $service->domain;
			}
		} catch (\Exception $e) {}
	}
	
	// 2. If serviceid wasn't in $params, try from $_REQUEST['id']
	if(empty($params['username']) && !empty($_REQUEST['id'])){
		try {
			$service = Capsule::table('tblhosting')->where('id', (int)$_REQUEST['id'])->first();
			if(!empty($service)){
				if(!empty($service->username)) $params['username'] = $service->username;
				if(!empty($service->server) && empty($params['serverid'])) $params['serverid'] = $service->server;
				if(!empty($service->domain) && empty($params['domain'])) $params['domain'] = $service->domain;
				$params['serviceid'] = (int)$_REQUEST['id'];
			}
		} catch (\Exception $e) {}
	}
	
	// 3. Always populate server credentials from tblservers
	$ser_id = !empty($params['serverid']) ? $params['serverid'] : 0;
	try {
		if(!empty($ser_id)){
			$ser_data = Capsule::table('tblservers')->where('id', $ser_id)->first();
		} else {
			$ser_data = Capsule::table('tblservers')->where('type', 'webuzo')->first();
		}
		
		if(!empty($ser_data)){
			$params['serverhostname'] = !empty($ser_data->hostname) ? $ser_data->hostname : $ser_data->ipaddress;
			$params['serverip'] = $ser_data->ipaddress;
			$params['serverusername'] = $ser_data->username;
			$params['serverpassword'] = decrypt($ser_data->password);
			$params['serveraccesshash'] = $ser_data->accesshash;
			$params['serversecure'] = $ser_data->secure;
		}
	} catch (\Exception $e) {}
	
	if(empty($params['serverhostname']) && !empty($params['serverip'])){
		$params['serverhostname'] = $params['serverip'];
	}
	if(empty($params['serverip']) && !empty($params['serverhostname'])){
		$params['serverip'] = $params['serverhostname'];
	}
}

function get_webuzo_api_key($params){
	if(empty($params['serveraccesshash']) && !empty($params['accesshash'])){
		$params['serveraccesshash'] = $params['accesshash'];
	}
	return (!empty($params['serveraccesshash']) ? $params['serveraccesshash'] : $params["serverpassword"]);
}

function get_webuzo_serverip($params){
	return (!empty($params["serverip"]) ? $params["serverip"] : $params["serverhostname"]);
}

class Webuzo_Curl {
	
	public static function error($params){
		
		$err = '';
		
		if(!empty($GLOBALS['webuzo_curl_err'])){
			$err .= ' Curl Error: '.$GLOBALS['webuzo_curl_err'];
		}
		
		$ip = get_webuzo_serverip($params);
		
		if(!empty($ip)){
			$err .= ' (Server IP : '.$ip.')';
		}
		
		return $err;
	}
	
	public static function make_api_call($ip, $apiuser = 'root', $pass, $path, $post = array(), $cookies = array()){
		
		global $webuzo_conf, $whmcsmysql;
		
		$apikey = $pass;
		
		$url = 'https://'.$ip.':'.$GLOBALS['webuzo_conf']['panel_ports']['admin_ssl'].'/'.$path;	
		$url .= (strstr($url, '?') ? '' : '?');	
		$url .= '&api=serialize&apiuser='.$apiuser.'&apikey='.rawurlencode($apikey).'&skip_callback=1';
	
		if($webuzo_conf['loglevel'] > 2){
			logActivity('[Webuzo] Admin Call URL : '. $url);
		}
		
		// Set the curl parameters.
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
			
		// Time OUT
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 3);
		
		// Turn off the server and peer verification (TrustManager Concept).
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
			
		// UserAgent
		curl_setopt($ch, CURLOPT_USERAGENT, 'Softaculous');
		
		// Cookies
		if(!empty($cookies)){
			curl_setopt($ch, CURLOPT_COOKIESESSION, true);
			curl_setopt($ch, CURLOPT_COOKIE, http_build_query($cookies, '', '; '));
		}
		
		if(!empty($post)){
			curl_setopt($ch, CURLOPT_POST, 1);
			curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($post));
		}
		
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		
		// Get response from the server.
		$resp = curl_exec($ch);
		
		if(empty($resp)){
			$GLOBALS['webuzo_curl_err'] = curl_error($ch);
		}
			
		curl_close($ch);
		
		// The following line is a method to test
		//if(preg_match('/sync/is', $url)) echo $resp;
		
		if(empty($resp)){
	
			if($webuzo_conf['loglevel'] > 2){
				logActivity('[Webuzo] Admin Call Response was empty !');
			}
			
			return false;
		}
	
		if($webuzo_conf['loglevel'] > 3){
			logActivity('[Webuzo] Admin Call Response : '.$resp);
		}
		
		// As a security prevention measure - Though this cannot happen
		$resp = str_replace($pass, '12345678901234567890123456789012', $resp);
		
		$r = unserialize($resp);
		
		if(empty($r)){
			return false;
		}
		
		return $r;
	}	

	public static function e_make_api_call($ip, $apiuser = 'root', $pass, $loginAs, $path, $post = array(), $cookies = array()){
		
		global $webuzo_conf, $whmcsmysql;
		
		$apikey = $pass;
		
		$url = 'https://'.$ip.':'.$GLOBALS['webuzo_conf']['panel_ports']['enduser_ssl'].'/'.$path;	
		$url .= (strstr($url, '?') ? '' : '?');	
		$url .= '&loginAs='.$loginAs.'&api=serialize&apiuser='.$apiuser.'&apikey='.rawurlencode($apikey).'&skip_callback=1';
	
		if($webuzo_conf['loglevel'] > 0){
			logActivity('[Webuzo] Enduser Call URL : '.$url);
		}
		
		// Set the curl parameters.
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		
		// Time OUT
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 3);
		
		// Turn off the server and peer verification (TrustManager Concept).
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
			
		// UserAgent
		curl_setopt($ch, CURLOPT_USERAGENT, 'Softaculous');
		
		// Cookies
		if(!empty($cookies)){
			curl_setopt($ch, CURLOPT_COOKIESESSION, true);
			curl_setopt($ch, CURLOPT_COOKIE, http_build_query($cookies, '', '; '));
		}
		
		if(!empty($post)){
			curl_setopt($ch, CURLOPT_POST, 1);
			curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($post));
		}
		
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		
		// Get response from the server.
		$resp = curl_exec($ch);
		$c_err = curl_error($ch);
		curl_close($ch);
		
		// The following line is a method to test
		//if(preg_match('/os/is', $url)) echo $resp;
	
		if($webuzo_conf['loglevel'] > 1){
			logActivity('[Webuzo] Enduser Call Raw Response : '.$resp);
			logActivity('[Webuzo] Enduser Call Curl Error : '.$c_err);
		}
		
		if(empty($resp)){
			return false;
		}
		
		// As a security prevention measure - Though this cannot happen
		$resp = str_replace($pass, '12345678901234567890123456789012', $resp);
		
		$r = unserialize($resp);
		
		if(empty($r)){
			return false;
		}
		
		return $r;
	}
	
	// Make a call but not an API call
	public static function enduser_call($ip, $apiuser = 'root', $pass, $loginAs, $path, $post = array(), $cookies = array()){
		
		global $webuzo_conf, $whmcsmysql;
		
		$apikey = $pass;
		
		$url = 'https://'.$ip.':'.$GLOBALS['webuzo_conf']['panel_ports']['enduser_ssl'].'/'.$path;	
		$url .= (strstr($url, '?') ? '' : '?');	
		$url .= '&loginAs='.$loginAs.'&apiuser='.$apiuser.'&apikey='.rawurlencode($apikey).'&from_billing=1&skip_callback=1';
	
		if($webuzo_conf['loglevel'] > 0){
			logActivity('[Webuzo] Enduser Call URL : '.$url);
		}
		
		// Set the curl parameters.
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		
		// Time OUT
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 3);
		
		// Turn off the server and peer verification (TrustManager Concept).
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
			
		// UserAgent
		curl_setopt($ch, CURLOPT_USERAGENT, 'Softaculous');
		
		// Cookies
		if(!empty($cookies)){
			curl_setopt($ch, CURLOPT_COOKIESESSION, true);
			curl_setopt($ch, CURLOPT_COOKIE, http_build_query($cookies, '', '; '));
		}
		
		if(!empty($post)){
			curl_setopt($ch, CURLOPT_POST, 1);
			curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($post));
		}
		
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		
		// Get response from the server.
		$resp = curl_exec($ch);
		curl_close($ch);
		
		// The following line is a method to test
		//if(preg_match('/os/is', $url)) echo $resp;
		
		if(empty($resp)){
			return false;
		}
		
		// As a security prevention measure - Though this cannot happen
		$resp = str_replace($pass, '12345678901234567890123456789012', $resp);
		
		return $resp;
		
	}
	
	public static function action($params, $action, $post = array(), $cookies = array()){
		
		global $webuzo_verify, $webuzo_errors;

		if(empty($params['customfields']['uuid'])){
			$params['customfields']['uuid'] = webuzo_getuuid($params['serviceid']);
		}
		
		$ip = get_webuzo_serverip($params);
		
		$response = Webuzo_Curl::enduser_call($ip, $params["serverusername"], get_webuzo_api_key($params), $params['username'], 'index.php?'.$action, $post);

		if(empty($response)){
			$webuzo_errors[] = 'The action could not be completed as no response was received.';
			return false;
		}
		
		return $response;
	
	} // function virt_curl_action ends	
	
	// Make a call but not an API call
	public static function enduser_static_call($ip, $path, $post = array(), $cookies = array()){
		
		global $webuzo_conf;
		
		$apikey = $pass;
		
		$url = 'https://'.$ip.':'.$GLOBALS['webuzo_conf']['panel_ports']['enduser_ssl'].'/'.$path;
	
		if($webuzo_conf['loglevel'] > 1){
			logActivity('[Webuzo] Static Call URL : '.$url);
		}
		
		// Set the curl parameters.
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		
		// Time OUT
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 3);
		
		// Turn off the server and peer verification (TrustManager Concept).
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
			
		// UserAgent
		curl_setopt($ch, CURLOPT_USERAGENT, 'Softaculous');
		
		// Cookies
		if(!empty($cookies)){
			curl_setopt($ch, CURLOPT_COOKIESESSION, true);
			curl_setopt($ch, CURLOPT_COOKIE, http_build_query($cookies, '', '; '));
		}
		
		if(!empty($post)){
			curl_setopt($ch, CURLOPT_POST, 1);
			curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($post));
		}
		
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		
		// Get response from the server.
		$resp = curl_exec($ch);
		
		// The following line is a method to test
		//if(preg_match('/os/is', $url)) echo $resp;
		
		if(empty($resp)){
			return false;
		}
		
		header('Cache-Control: public, max-age=600');
		header('Content-Type: '.curl_getinfo($ch, CURLINFO_CONTENT_TYPE));
		header('Content-Length: '.curl_getinfo($ch,  CURLINFO_CONTENT_LENGTH_DOWNLOAD));
		
		echo $resp;
		
		curl_close($ch);
		
	}


} // class Webuzo_Curl ends

function webuzo_ClientAreaCustomButtonArray() {
	
	global $webuzo_conf;
	if(!empty($webuzo_conf['client_ui']['hide_sidebar'])){
		return array();
	}
	
	# This function can define additional functions your module supports, the example here is a reboot button and then the reboot function is defined below
	$login_button = (!empty($GLOBALS['webuzo_conf']['client_ui']['rename_login_button']) ? $GLOBALS['webuzo_conf']['client_ui']['rename_login_button'] : 'Login to Webuzo');
	$buttonarray = array($login_button => "sso");
	
	return $buttonarray;
}


function webuzo_newUI($params, $url_prefix = 'clientarea.php?action=productdetails', $static_url = 'modules/servers'){
	
	global $virt_action_display, $webuzo_errors, $virt_resp, $webuzo_conf, $whmcsmysql;
	
	$serverip = get_webuzo_serverip($params);
	
	// Is the uuid there ?
	if(empty($params['customfields']['uuid'])){

		$params['customfields']['uuid'] = webuzo_getuuid($params['serviceid']);

		if(empty($params['customfields']['uuid'])){
			return 'Account not provisioned';
		}

	}
	
	if(!empty($_REQUEST['wapi_mode'])){
		
		$_POST['billing_ind'] = base64_encode($url_prefix);
		$_POST['billing_static'] = base64_encode($static_url);
		
		$res = Webuzo_Curl::action($params, http_build_query($_GET), $_POST);		
		echo $res;
		
		die();
		exit(0);
	}
		
	// Static file
	if(!empty($_REQUEST['webuzo_static'])){
		Webuzo_Curl::enduser_static_call($serverip, $_REQUEST['webuzo_static']);
		
		die();
		exit(0);
		
	}
	
	if(!empty($webuzo_conf['client_ui']['direct_login'])){
		return "<center><a href=\"https://".$serverip.":".$GLOBALS['webuzo_conf']['panel_ports']['enduser_ssl']."/\" target=\"_blank\">Login to Webuzo</a></center>";
	}

	$code .= '<script data-cfasync="false" type="text/javascript">

var panel_checker = "";
var panel_load_try_counter = 0;
function iResize(){
	try{
		// Save scroll position
		var scrollposition = window.scrollY; 
		
		document.getElementById("webuzo_manager").style.height = "0px";
		document.getElementById("webuzo_manager").style.height = 
		document.getElementById("webuzo_manager").contentWindow.document.body.offsetHeight + "px";
		
		// Restore scroll position
		window.scrollTo(0, scrollposition); 
	}catch(e){ };
}

setInterval("iResize()", 1000);

function load_webuzo_panel(){
	var divID = "webuzo_tab";
	if (!document.getElementById(divID)) {
        divID = "domain";
    }
	
	// If we get the div with webuzo_load_div then do not create new element
	if(document.getElementById("webuzo_load_div")){
		myDiv = document.getElementById("webuzo_load_div");
	}else{
		var myDiv = document.createElement("div");
		myDiv.id = "webuzo_load_div";
	}
	
	myDiv.innerHTML = \'<center style="padding:10px; background-color: #FAFBD9;">Loading Panel options ...</center><br /><br /><br />\';
	
	document.getElementById(divID).appendChild(myDiv);
	
	// If we get the div with webuzo_manager then do not create new element
	if(document.getElementById("webuzo_manager")){
		iframe = document.getElementById("webuzo_manager");
	}else{
		var iframe = document.createElement("iframe");
		iframe.id = "webuzo_manager";
	}
	
	iframe.width = "100%";
	iframe.style.display = "none";
	iframe.style.border = "none";
	iframe.scrolling = "no";
	iframe.src = "'.$url_prefix.'";
	document.getElementById(divID).appendChild(iframe);
	
	document.getElementById("webuzo_manager").onload = function(){
		$("#webuzo_load_div").hide();
		$(this).show();
		iResize();
	};
	
	$(".moduleoutput").each(function(){
		this.style.display = "none";
	});
};

function check_js_loaded(){
	
	if(panel_load_try_counter >= 30){
		clearInterval(panel_checker);
		var divID = "webuzo_tab";
		if (!document.getElementById(divID)) {
			divID = "domain";
		}
		document.getElementById(divID).innerHTML = "Failed to detect jQuery, please check jQuery is loaded properly or not";
		return false;
	}
	
	if(window.jQuery){
		load_webuzo_panel();
		clearInterval(panel_checker);
	}else{
		panel_load_try_counter++;
	}
};

panel_checker = setInterval(check_js_loaded,1000);

</script>';

	return $code;
		
}


function webuzo_ClientArea($params) {
	
	global $virt_action_display, $webuzo_errors, $virt_resp, $webuzo_conf, $whmcsmysql;
	
	$return = '';
	
	// Do we need to show Login to Webuzo button ? 
	if(empty($GLOBALS['webuzo_conf']['client_ui']['hide_login_btn_hosting_info'])){
		$url = webuzo_get_current_url();
		$url = $url.(strstr($url, '?') ? '&' : '?').'modop=custom&a=sso';
		
		$return .= '<p><a href="'.$url.'" class="btn btn-default" target="_blank">'.(!empty($GLOBALS['webuzo_conf']['client_ui']['rename_login_button']) ? $GLOBALS['webuzo_conf']['client_ui']['rename_login_button'] : 'Login to Webuzo').'</a>';
		
		if(!empty($params['producttype']) && $params['producttype'] == 'reselleraccount'){
			$reseller_url = $url.'&r=1';
			$return .= '&nbsp; <a href="'.$reseller_url.'" class="btn btn-default" target="_blank">Login to Webuzo (Reseller Panel)</a>';
		}
		
		$return .= '</p>';
	}
	
	// Do we need to show Webuzo panel ? 
	if(empty($GLOBALS['webuzo_conf']['hide_webuzo_panel']) && empty($GLOBALS['webuzo_conf']['client_ui']['hide_webuzo_panel'])){
	
		$url = 'clientarea.php?action=productdetails&id='.$params['serviceid'].'&';

		// The new UI
		$return .= webuzo_newUI($params, $url.'wapi_mode=1&', $url.'webuzo_static=');
		
	}
	
	return $return;

}

function webuzo_generate_sso_url($params){
	global $webuzo_conf;
	
	webuzo_populate_server_params($params);
	
	$tmp_hostname = !empty($params['serverhostname']) ? $params['serverhostname'] : (!empty($params['serverip']) ? $params['serverip'] : '');
	$admin_port = !empty($GLOBALS['webuzo_conf']['panel_ports']['admin_ssl']) ? $GLOBALS['webuzo_conf']['panel_ports']['admin_ssl'] : '2005';
	$enduser_port = !empty($webuzo_conf['use_sso_on_80']) ? 80 : $GLOBALS['webuzo_conf']['panel_ports']['enduser_ssl'];
	
	$username = !empty($params['username']) ? $params['username'] : '';
	
	// 1. PRIMARY: Admin API SSO on port 2005 (confirmed working from WHMCS Admin)
	if(!empty($username)){
		$ret = webuzo_admin_call($params, '?act=sso&noip=1&user='.$username);
		
		$log_entry = sprintf(
			"[Webuzo SSO AdminCall] User: %s | Server: %s:%s | Token: %s",
			$username,
			$tmp_hostname,
			$admin_port,
			(!empty($ret['done']['sess_token']) ? 'OK' : json_encode($ret))
		);
		logActivity($log_entry);
		@file_put_contents('/home/marconis/whmcsdata19/webuzo_sso_debug.log', date('Y-m-d H:i:s') . ' ' . $log_entry . "\n", FILE_APPEND);
		
		if(!empty($ret['done']['sess_token']) && !empty($ret['done']['sess_key'])){
			return 'https://'.$tmp_hostname.':'.$admin_port.'/'.$ret['done']['sess_token'].'/?as='.$ret['done']['sess_key'];
		}
	}
	
	// 2. SECONDARY: Enduser SSO call on port 2003
	if(!empty($username)){
		$ret_enduser = webuzo_enduser_call($params, $username, '?act=sso&noip=1');
		if(!empty($ret_enduser['done']['sess_token']) && !empty($ret_enduser['done']['sess_key'])){
			return 'https://'.$tmp_hostname.':'.$enduser_port.'/'.$ret_enduser['done']['sess_token'].'/?as='.$ret_enduser['done']['sess_key'];
		}
	}
	
	// 3. Fallback directly to Webuzo enduser panel
	return 'https://'.$tmp_hostname.':'.$enduser_port.'/';
}

// Login to enduser panel from WHMCS client and admin panel
function webuzo_enduser_panel($vars){
	$redirect_url = webuzo_generate_sso_url($vars);
	if(!headers_sent()){
		header("Location: " . $redirect_url);
	}
	echo '<meta http-equiv="Refresh" content="0;url='.$redirect_url.'">';
	echo '<script type="text/javascript">window.location.href = '.json_encode($redirect_url).';</script>';
	exit;
}

// Left menu in Clients Area Login function handler
function webuzo_sso($vars){
		
	if(!empty($vars['producttype']) && $vars['producttype'] == 'reselleraccount' && !empty($_GET['r'])){
		// Login to Webuzo admin from WHMCS client panel for reseller accounts
		webuzo_admin_panel($vars);
	}else{
		// Login to Webuzo admin from WHMCS client panel for non-reseller accounts
		webuzo_enduser_panel($vars);
	}
	
	return true;
	
}

function webuzo_AdminSingleSignOn($params){
	
	$return = array(
		'success' => false,
	);
	
	try {
		$redirect_url = webuzo_admin_panel($params, 1);
	} catch (Exception $e) {

	}

	if(!empty($redirect_url)){
		$return = array(
			'success' => true,
			'redirectTo' => $redirect_url,
		);
	}else{
		$return['errorMsg'] = 'Failed to generate SSO';
	}

	return $return;

}

function webuzo_ServiceSingleSignOn($params){
	$return = array(
		'success' => false,
	);
	
	try {
		$redirect_url = webuzo_generate_sso_url($params);
		$return = array(
			'success' => true,
			'redirectTo' => $redirect_url,
		);
	} catch (\Exception $e) {
		$return['errorMsg'] = $e->getMessage();
	}
	
	return $return;
}

function webuzo_get_current_url(){
	
	$protocol = (!empty($_SERVER['HTTPS']) ? "https://" : "http://");
	$server_port = ((!empty($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] != 80 && $_SERVER['SERVER_PORT'] != 443) ? ':'.$_SERVER['SERVER_PORT'] : '');
	
	$parse = parse_url($_SERVER['HTTP_HOST']);
	if(empty($parse['port'])){
		$full_url = $protocol.$_SERVER['HTTP_HOST'].$server_port.$_SERVER['REQUEST_URI'];
	}else{
		$full_url = $protocol.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
	}

	$full_url = str_replace('&amp;', '&', $full_url);
	$full_url = rtrim($full_url, '&');
	
	return $full_url;
}

// Reports the error
function webuzo_report_error($err){
	global $webuzo_conf;
	
	$err = 'Webuzo : '.$err;
	
	if(!empty($webuzo_conf['debug_echo'])){
		echo $err.'<br>';
	}
	
	// Write to the file
	if(!empty($webuzo_conf['debug_file'])){
		$fp = @fopen($webuzo_conf['debug_file'], 'a');
		if($fp){
			@fwrite($fp, $err."\n");
			@fclose($fp);
		}
	}
	
	if(!empty($webuzo_conf['log_error'])){
		error_log($err);
	}
	
	// Log Activity in WHMCS	
	if(!empty($webuzo_conf['logActivity'])){
		logActivity($err);
	}
}

add_hook('ClientAreaPrimarySidebar', 1, 'webuzo_hide_sidebar_menu');

function webuzo_hide_sidebar_menu($primarySidebar){
	
	global $webuzo_conf;
	
	// Check if we should show Login to Reseller Panel link
	$check_module = (!empty($GLOBALS['moduleparams']['moduletype']) ? strtolower($GLOBALS['moduleparams']['moduletype']) : '');

	if(!empty($GLOBALS['moduleparams']['producttype']) && $GLOBALS['moduleparams']['producttype'] == 'reselleraccount' && $check_module == 'webuzo'){
		
		$url = webuzo_get_current_url();
		$url = $url.(strstr($url, '?') ? '&' : '?').'modop=custom&a=sso&r=1';
		
		//@var \WHMCS\View\Menu\Item $primarySidebar
		if(!is_null($primarySidebar->getChild('Service Details Actions'))){
			$primarySidebar->getChild('Service Details Actions')->addChild(
				'Login to Webuzo',
				array(
					'name' => 'Login to Webuzo (Reseller Panel)',
					'label' => 'Login to Webuzo (Reseller Panel)',
					'uri' => 'clientarea.php?action=productdetails&id='.$_GET['id'].'&modop=custom&a=sso&r=1',
					'order' => 20,
					'attributes' => array(
						'target' => '_blank'
					)
				)
			);
		}
	}
	
	if(empty($webuzo_conf['client_ui']['hide_sidebar'])){
		return true;
	}
	
	//echo "<pre>";
	//print_r($primaryNavbar->getChild('Service Details Actions'));
	if(!is_null($primarySidebar->getChild('Service Details Actions'))){
		$primarySidebar->getChild('Service Details Actions')->removeChild('Change Password');
	}
}

function webuzo_getuuid($serviceid){
	
	$uuid = 0;

	$customfields = Capsule::table('tblcustomfields')
	->join('tblcustomfieldsvalues', 'tblcustomfields.id', '=', 'tblcustomfieldsvalues.fieldid')
	->select('tblcustomfields.fieldname', 'tblcustomfieldsvalues.value')
	->where('tblcustomfieldsvalues.relid', '=', $serviceid)
	->get();

	foreach ($customfields as $customfield) {
		if($customfield->fieldname == 'uuid'){
			$uuid = $customfield->value;
		}
	}

	return $uuid;
}

function webuzo_getcustomfields($serviceid){

	$data = array();

	$customfields = Capsule::table('tblcustomfields')
	->join('tblcustomfieldsvalues', 'tblcustomfields.id', '=', 'tblcustomfieldsvalues.fieldid')
	->select('tblcustomfields.fieldname', 'tblcustomfieldsvalues.value')
	->where('tblcustomfieldsvalues.relid', '=', $serviceid)
	->get();

	foreach ($customfields as $customfield) {

		if(strpos($customfield->fieldname, '|') !== false){
			$exploded = explode('|',$customfield->fieldname);
			$customfield->fieldname = $exploded[0];
		}

		
		if(strpos($customfield->value, '|') !== false){
			$exploded = explode('|',$customfield->value);
			$customfield->value = $exploded[0];
		}

		$data[$customfield->fieldname] = $customfield->value;

	}

	return $data;
	
}

function webuzo_server_pass_from_whmcs($enc_pass){
		
	global $cc_encryption_hash;
	
	// Include WHMCS database configuration file
	include_once(dirname(dirname(dirname(dirname(__FILE__)))).'/configuration.php');
	$key1 = md5 (md5 ($cc_encryption_hash));
	$key2 = md5 ($cc_encryption_hash);
	$key = $key1.$key2;
	$hasher = new webuzo_hash_encryption($key);
	return $hasher->decrypt($enc_pass);
}

// WHMCS Decrypter
class webuzo_hash_encryption {
	/**
	 * Hashed value of the user provided encryption key
	 * @var	string
	 **/
	var $hash_key;
	/**
	 * String length of hashed values using the current algorithm
	 * @var	int
	 **/	
	var $hash_lenth;
	/**
	 * Switch base64 enconding on / off
	 * @var	bool	true = use base64, false = binary output / input
	 **/	
	var $base64;
	/**
	 * Secret value added to randomize output and protect the user provided key
	 * @var	string	Change this value to add more randomness to your encryption
	 **/	
	var $salt = 'Change this to any secret value you like. "d41d8cd98f00b204e9800998ecf8427e" might be a good example.';
	

	/**
	 * Constructor method
	 *
	 * Used to set key for encryption and decryption.
	 * @param	string	$key	Your secret key used for encryption and decryption
	 * @param	boold	$base64	Enable base64 en- / decoding
	 * @return mixed
	 */
	function __construct($key, $base64 = true) {
		
		global $cc_encryption_hash;
		
		// Toggle base64 usage on / off
		$this->base64 = $base64;
		
		// Instead of using the key directly we compress it using a hash function
		$this->hash_key = $this->_hash($key);
		
		// Remember length of hashvalues for later use
		$this->hash_length = strlen($this->hash_key);
	}
		
	/**
	 * Method used for encryption
	 * @param	string	$string	Message to be encrypted
	 * @return string	Encrypted message
	 */
	function encrypt($string) {
		$iv = $this->_generate_iv();
		
		// Clear output
		$out = '';
		
		// First block of output is ($this->hash_hey XOR IV)
		for($c=0;$c < $this->hash_length;$c++) {
			$out .= chr(ord($iv[$c]) ^ ord($this->hash_key[$c]));
		}

		// Use IV as first key
		$key = $iv;
		$c = 0;

		// Go through input string
		while($c < strlen($string)) {
			// If we have used all characters of the current key we switch to a new one
			if(($c != 0) and ($c % $this->hash_length == 0)) {
				// New key is the hash of current key and last block of plaintext
				$key = $this->_hash($key . substr($string,$c - $this->hash_length,$this->hash_length));
			}
			// Generate output by xor-ing input and key character for character
			$out .= chr(ord($key[$c % $this->hash_length]) ^ ord($string[$c]));
			$c++;
		}
		// Apply base64 encoding if necessary
		if($this->base64) $out = base64_encode($out);
		return $out;
	}
	
	/**
	 * Method used for decryption
	 * @param	string	$string	Message to be decrypted
	 * @return string	Decrypted message
	 */
	function decrypt($string) {
		// Apply base64 decoding if necessary
		if($this->base64) $string = base64_decode($string);
		
		// Extract encrypted IV from input
		$tmp_iv = substr($string,0,$this->hash_length);
		
		// Extract encrypted message from input
		$string = substr($string,$this->hash_length,strlen($string) - $this->hash_length);
		$iv = $out = '';
		
		// Regenerate IV by xor-ing encrypted IV from block 1 and $this->hashed_key
		// Mathematics: (IV XOR KeY) XOR Key = IV
		for($c=0;$c < $this->hash_length;$c++) 
		{
			$iv .= chr(ord($tmp_iv[$c]) ^ ord($this->hash_key[$c]));
		}
		// Use IV as key for decrypting the first block cyphertext
		$key = $iv;
		$c = 0;
		
		// Loop through the whole input string
		while($c < strlen($string)) {
			// If we have used all characters of the current key we switch to a new one
			if(($c != 0) and ($c % $this->hash_length == 0)) {
				// New key is the hash of current key and last block of plaintext
				$key = $this->_hash($key . substr($out,$c - $this->hash_length,$this->hash_length));
			}
			// Generate output by xor-ing input and key character for character
			$out .= chr(ord($key[$c % $this->hash_length]) ^ ord($string[$c]));
			$c++;
		}
		return $out;
	}

	/**
	 * Hashfunction used for encryption
	 *
	 * This class hashes any given string using the best available hash algorithm.
	 * Currently support for md5 and sha1 is provided. In theory even crc32 could be used
	 * but I don't recommend this.
	 *
	 * @access	private
	 * @param	string	$string	Message to hashed
	 * @return string	Hash value of input message
	 */
	function _hash($string) {
		// Use sha1() if possible, php versions >= 4.3.0 and 5
		if(function_exists('sha1')) {
			$hash = sha1($string);
		} else {
			// Fall back to md5(), php versions 3, 4, 5
			$hash = md5($string);
		}
		$out ='';
		// Convert hexadecimal hash value to binary string
		for($c=0;$c<strlen($hash);$c+=2) {
			$out .= $this->_hex2chr($hash[$c] . $hash[$c+1]);
		}
		return $out;
	}
	
	/**
	 * Generate a random string to initialize encryption
	 *
	 * This method will return a random binary string IV ( = initialization vector).
	 * The randomness of this string is one of the crucial points of this algorithm as it
	 * is the basis of encryption. The encrypted IV will be added to the encrypted message
	 * to make decryption possible. The transmitted IV will be encoded using the user provided key.
	 *
	 * @todo	Add more random sources.
	 * @access	private
	 * @see function	hash_encryption
	 * @return string	Binary pseudo random string
	 **/
	function _generate_iv() {
		// Initialize pseudo random generator
		srand ((double)microtime()*1000000);
		
		// Collect random data.
		// Add as many "pseudo" random sources as you can find.
		// Possible sources: Memory usage, diskusage, file and directory content...
		$iv  = $this->salt;
		$iv .= rand(0,getrandmax());
		// Changed to serialize as the second parameter to print_r is not available in php prior to version 4.4
		$iv .= serialize($GLOBALS);
		return $this->_hash($iv);
	}
	
	/**
	 * Convert hexadecimal value to a binary string
	 *
	 * This method converts any given hexadecimal number between 00 and ff to the corresponding ASCII char
	 *
	 * @access	private
	 * @param	string	Hexadecimal number between 00 and ff
	 * @return	string	Character representation of input value
	 **/
	function _hex2chr($num) {
		return chr(hexdec($num));
	}
}

/*
function r_print($re){
	echo '<pre>';
	print_r($re);
	echo '</pre>';	
}
function died(){
	print_r(error_get_last());
}

register_shutdown_function('died');
*/


