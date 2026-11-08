<?php
/* Smarty version 3.1.48, created on 2024-08-26 12:27:17
  from 'd0db3c774ef7f50dc35204078c6d0d26d194b701' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.48',
  'unifunc' => 'content_66cc74a59c4e44_88473033',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_66cc74a59c4e44_88473033 (Smarty_Internal_Template $_smarty_tpl) {
echo '<?xml ';?>
version="1.0" encoding="UTF-8" standalone="no"<?php echo '?>';?>

<epp xmlns="urn:ietf:params:xml:ns:epp-1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:ietf:params:xml:ns:epp-1.0 epp-1.0.xsd">
	<command>
		<update>
			<domain:update xmlns:domain="urn:ietf:params:xml:ns:domain-1.0" xsi:schemaLocation="urn:ietf:params:xml:ns:domain-1.0 domain-1.0.xsd">
				<domain:name><?php echo $_smarty_tpl->tpl_vars['domain']->value;?>
</domain:name>
			</domain:update>
		</update>
		<extension>
			<dacor:issueToken xmlns:dacor="urn:ics-forth:params:xml:ns:dacor-1.0" xsi:schemaLocation="urn:ics-forth:params:xml:ns:dacor-1.0 dacor-1.0.xsd"/>
		</extension>
		<clTRID><?php echo $_smarty_tpl->tpl_vars['registrarId']->value;?>
:<?php echo $_smarty_tpl->tpl_vars['eppUserName']->value;?>
:<?php echo $_smarty_tpl->tpl_vars['pin']->value;?>
</clTRID>
	</command>
</epp><?php }
}
