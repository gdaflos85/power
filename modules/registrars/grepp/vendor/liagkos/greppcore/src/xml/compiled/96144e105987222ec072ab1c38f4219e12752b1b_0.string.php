<?php
/* Smarty version 3.1.48, created on 2024-08-27 08:30:39
  from '96144e105987222ec072ab1c38f4219e12752b1b' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.48',
  'unifunc' => 'content_66cd8eaf0e0261_84794457',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_66cd8eaf0e0261_84794457 (Smarty_Internal_Template $_smarty_tpl) {
echo '<?xml ';?>
version="1.0" encoding="UTF-8" standalone="no"<?php echo '?>';?>

<epp xmlns="urn:ietf:params:xml:ns:epp-1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:ietf:params:xml:ns:epp-1.0 epp-1.0.xsd">
<command>
    <renew>
        <domain:renew xmlns:domain="urn:ietf:params:xml:ns:domain-1.0" xsi:schemaLocation="urn:ietf:params:xml:ns:domain-1.0 domain-1.0.xsd">
            <domain:name><?php echo $_smarty_tpl->tpl_vars['domain']->value;?>
</domain:name>
            <domain:curExpDate><?php echo $_smarty_tpl->tpl_vars['expDate']->value;?>
</domain:curExpDate>
            <domain:period unit="y"><?php echo $_smarty_tpl->tpl_vars['years']->value;?>
</domain:period>
        </domain:renew>
    </renew>
    <clTRID><?php echo $_smarty_tpl->tpl_vars['registrarId']->value;?>
:<?php echo $_smarty_tpl->tpl_vars['eppUserName']->value;?>
:<?php echo $_smarty_tpl->tpl_vars['pin']->value;?>
</clTRID>
</command>
</epp><?php }
}
