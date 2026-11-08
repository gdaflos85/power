<?php
/* Smarty version 3.1.48, created on 2026-05-30 12:02:15
  from '1641b000c1ecb3fa6ab614a0ebbb34a0b23a35e5' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.48',
  'unifunc' => 'content_6a1ad1c768acd6_50500298',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6a1ad1c768acd6_50500298 (Smarty_Internal_Template $_smarty_tpl) {
echo '<?xml ';?>
version="1.0" encoding="UTF-8" standalone="no"<?php echo '?>';?>

<epp xmlns="urn:ietf:params:xml:ns:epp-1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:ietf:params:xml:ns:epp-1.0 epp-1.0.xsd">
    <command>
        <login>
            <clID><?php echo $_smarty_tpl->tpl_vars['eppUserName']->value;?>
</clID>
            <pw><![CDATA[<?php echo $_smarty_tpl->tpl_vars['eppPassword']->value;?>
]]></pw>
            <options>
                <version>1.0</version>
                <lang><?php echo $_smarty_tpl->tpl_vars['language']->value;?>
</lang>
            </options>
            <svcs>
                <objURI>urn:ietf:params:xml:ns:contact-1.0</objURI>
                <objURI>urn:ietf:params:xml:ns:domain-1.0</objURI>
                <objURI>urn:ietf:params:xml:ns:host-1.0</objURI>
            </svcs>
        </login>
        <clTRID><?php echo $_smarty_tpl->tpl_vars['registrarId']->value;?>
:<?php echo $_smarty_tpl->tpl_vars['eppUserName']->value;?>
:<?php echo $_smarty_tpl->tpl_vars['pin']->value;?>
</clTRID>
    </command>
</epp><?php }
}
