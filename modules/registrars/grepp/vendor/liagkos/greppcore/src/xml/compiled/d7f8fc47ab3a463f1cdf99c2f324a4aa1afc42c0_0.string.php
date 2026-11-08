<?php
/* Smarty version 3.1.48, created on 2026-07-23 17:47:43
  from 'd7f8fc47ab3a463f1cdf99c2f324a4aa1afc42c0' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.48',
  'unifunc' => 'content_6a6253bf1275d4_28946435',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6a6253bf1275d4_28946435 (Smarty_Internal_Template $_smarty_tpl) {
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
