<?php
/* Smarty version 3.1.48, created on 2024-08-26 12:26:37
  from '5322131cf9ce3c646fab63327e7ef5d6d30e6b6b' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.48',
  'unifunc' => 'content_66cc747dd70903_75208332',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_66cc747dd70903_75208332 (Smarty_Internal_Template $_smarty_tpl) {
echo '<?xml ';?>
version="1.0" encoding="UTF-8" standalone="no"<?php echo '?>';?>

<epp xmlns="urn:ietf:params:xml:ns:epp-1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:ietf:params:xml:ns:epp-1.0 epp-1.0.xsd">
    <command>
        <info>
            <domain:info xmlns:domain="urn:ietf:params:xml:ns:domain-1.0" xsi:schemaLocation="urn:ietf:params:xml:ns:domain-1.0 domain-1.0.xsd">
                <domain:name hosts="all"><?php echo $_smarty_tpl->tpl_vars['domain']->value;?>
</domain:name>
                <?php if ((isset($_smarty_tpl->tpl_vars['password']->value))) {?>
                <domain:authInfo>
                    <domain:pw><![CDATA[<?php echo $_smarty_tpl->tpl_vars['password']->value;?>
]]></domain:pw>
                </domain:authInfo>
                <?php }?>
            </domain:info>
        </info>
        <clTRID><?php echo $_smarty_tpl->tpl_vars['registrarId']->value;?>
:<?php echo $_smarty_tpl->tpl_vars['eppUserName']->value;?>
:<?php echo $_smarty_tpl->tpl_vars['pin']->value;?>
</clTRID>
    </command>
</epp><?php }
}
