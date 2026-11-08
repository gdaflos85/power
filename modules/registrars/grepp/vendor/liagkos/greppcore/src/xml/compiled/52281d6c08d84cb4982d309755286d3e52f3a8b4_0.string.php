<?php
/* Smarty version 3.1.48, created on 2024-08-26 07:04:10
  from '52281d6c08d84cb4982d309755286d3e52f3a8b4' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.48',
  'unifunc' => 'content_66cc28ea11c213_10179175',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_66cc28ea11c213_10179175 (Smarty_Internal_Template $_smarty_tpl) {
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
