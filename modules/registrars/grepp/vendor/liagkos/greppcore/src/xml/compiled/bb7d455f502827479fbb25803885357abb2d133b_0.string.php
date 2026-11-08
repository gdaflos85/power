<?php
/* Smarty version 3.1.48, created on 2024-09-09 16:46:35
  from 'bb7d455f502827479fbb25803885357abb2d133b' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.48',
  'unifunc' => 'content_66df266b0be478_89477155',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_66df266b0be478_89477155 (Smarty_Internal_Template $_smarty_tpl) {
echo '<?xml ';?>
version="1.0" encoding="UTF-8" standalone="no"<?php echo '?>';?>

<epp xmlns="urn:ietf:params:xml:ns:epp-1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:ietf:params:xml:ns:epp-1.0 epp-1.0.xsd">
    <command>
        <info>
            <contact:info xmlns:contact="urn:ietf:params:xml:ns:contact-1.0" xsi:schemaLocation="urn:ietf:params:xml:ns:contact-1.0 contact-1.0.xsd">
                <contact:id><?php echo $_smarty_tpl->tpl_vars['contactid']->value;?>
</contact:id>
                <?php if ((isset($_smarty_tpl->tpl_vars['password']->value))) {?>
                <contact:authInfo>
                    <contact:pw<?php if ($_smarty_tpl->tpl_vars['epp43']->value) {?> roid="domain-roid"<?php }?>><![CDATA[<?php echo $_smarty_tpl->tpl_vars['password']->value;?>
]]></contact:pw>
                </contact:authInfo>
                <?php }?>
            </contact:info>
        </info>
        <clTRID><?php echo $_smarty_tpl->tpl_vars['registrarId']->value;?>
:<?php echo $_smarty_tpl->tpl_vars['eppUserName']->value;?>
:<?php echo $_smarty_tpl->tpl_vars['pin']->value;?>
</clTRID>
    </command>
</epp><?php }
}
