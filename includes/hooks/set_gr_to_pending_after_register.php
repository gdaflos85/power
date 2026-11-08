<?php

/*-----------------------------------------------------------------------------------------------
# Change status from Active to Pending sfter fresh .gr registrations
# This way when EETT approves the domain, the greppsync CRON job will change the status to Active
# -----------------------------------------------------------------------------------------------
# Copyright (C) 2012 ValueHost, All Rights Reserved.
# @license - Copyrighted GPLv2 Software
# Author: Nasos Liagos
# Website:  http://www.valuehost.com.gr
# Email:  support@valuehost.com.gr
-------------------------------------------------------------------------*/

function hook_set_gr_to_pending_after_register($vars)
{
	
	$domain 		= $vars['params']['sld'].'.'.$vars['params']['tld'];
	$domainid 	= $vars['params']['domainid'];

	if (substr($domain,-2) == 'gr')
		update_query("tbldomains", array("status" => "Pending"), array("id" => (int)$domainid));
}

add_hook("AfterRegistrarRegistration",1,"hook_set_gr_to_pending_after_register","");

?>

	