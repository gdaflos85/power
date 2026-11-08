<?php
/* Smarty version 3.1.48, created on 2024-09-02 05:18:00
  from 'bec39500b440c06299789064c228199668b19caf' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.48',
  'unifunc' => 'content_66d54a88f022a2_64697484',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_66d54a88f022a2_64697484 (Smarty_Internal_Template $_smarty_tpl) {
echo '<?xml ';?>
version="1.0" encoding="UTF-8" standalone="no"<?php echo '?>';?>

<epp xsi:schemaLocation="urn:ietf:params:xml:ns:epp-1.0 epp-1.0.xsd" xmlns="urn:ietf:params:xml:ns:epp-1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <command>
        <info>
            <host:info xsi:schemaLocation="urn:ietf:params:xml:ns:host-1.0 host-1.0.xsd" xmlns:host="urn:ietf:params:xml:ns:host-1.0">
                <host:name><?php echo $_smarty_tpl->tpl_vars['host']->value;?>
</host:name>
            </host:info>
        </info>
        <clTRID><?php echo $_smarty_tpl->tpl_vars['registrarId']->value;?>
:<?php echo $_smarty_tpl->tpl_vars['eppUserName']->value;?>
:<?php echo $_smarty_tpl->tpl_vars['pin']->value;?>
</clTRID>
    </command>
</epp><?php }
}
