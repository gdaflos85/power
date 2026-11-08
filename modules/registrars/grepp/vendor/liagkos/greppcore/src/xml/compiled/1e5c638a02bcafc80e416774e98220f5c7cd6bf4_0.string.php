<?php
/* Smarty version 3.1.48, created on 2026-06-15 04:24:54
  from '1e5c638a02bcafc80e416774e98220f5c7cd6bf4' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.48',
  'unifunc' => 'content_6a2f7e96bac190_78972817',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6a2f7e96bac190_78972817 (Smarty_Internal_Template $_smarty_tpl) {
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
