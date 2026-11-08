<?php
//
// WHMCS hook
// Format phone number and strip any invalid characters
// Remove +XX. and keep XX
// Remove non-number characters from rest phone (ie - or space)
// Remove any leading 0 or 00 from numbers
// (c) 2013-2014 Athanasios Liagkos
// www.valuehost.com.gr
// info@valuehost.com.gr
//
function check_phone_gr($vars) {
	global $params;
	if( $params['registrar'] == 'grepp' )
	{
		$phone = $params['fullphonenumber'];
		$params['fullphonenumber'] = substr($phone,0,strpos($phone,'.')+1).preg_replace(array("/\+[0-9]*\./","/[^0-9]/","/^0*/","/^".substr($phone,1,strpos($phone,'.')-1)."/"),"",$phone);
	}
}
add_hook("PreDomainRegister",1,"check_phone_gr");
?>