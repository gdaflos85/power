<?php
/* Smarty version 3.1.48, created on 2024-09-02 05:18:00
  from 'f6e67c4373a5fce1f765c4c1b03d108e54b4ca1e' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.48',
  'unifunc' => 'content_66d54a88236a80_06898613',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_66d54a88236a80_06898613 (Smarty_Internal_Template $_smarty_tpl) {
echo '<?xml ';?>
version="1.0" encoding="UTF-8" standalone="no"<?php echo '?>';?>

<epp xmlns="urn:ietf:params:xml:ns:epp-1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:ietf:params:xml:ns:epp-1.0 epp-1.0.xsd">
    <command>
        <create>
            <contact:create xmlns:contact="urn:ietf:params:xml:ns:contact-1.0" xsi:schemaLocation="urn:ietf:params:xml:ns:contact-1.0 contact-1.0.xsd">
                <contact:id><?php echo $_smarty_tpl->tpl_vars['contactId']->value;?>
</contact:id>
                <contact:postalInfo type="loc">
                    <contact:name><![CDATA[<?php echo $_smarty_tpl->tpl_vars['fullName']->value;?>
]]></contact:name>
                    <?php if ((isset($_smarty_tpl->tpl_vars['org']->value))) {?>
                    <contact:org><![CDATA[<?php echo $_smarty_tpl->tpl_vars['org']->value;?>
]]></contact:org>
                    <?php }?>
                    <contact:addr>
                        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['street']->value, 'address');
$_smarty_tpl->tpl_vars['address']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['address']->value) {
$_smarty_tpl->tpl_vars['address']->do_else = false;
?>
                        <contact:street><![CDATA[<?php echo $_smarty_tpl->tpl_vars['address']->value;?>
]]></contact:street>
                        <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                        <?php if ((isset($_smarty_tpl->tpl_vars['city']->value))) {?>
                        <contact:city><![CDATA[<?php echo $_smarty_tpl->tpl_vars['city']->value;?>
]]></contact:city>
                        <?php }?>
                        <?php if ((isset($_smarty_tpl->tpl_vars['region']->value))) {?>
                        <contact:sp><![CDATA[<?php echo $_smarty_tpl->tpl_vars['region']->value;?>
]]></contact:sp>
                        <?php }?>
                        <?php if ((isset($_smarty_tpl->tpl_vars['zip']->value))) {?>
                        <contact:pc><?php echo $_smarty_tpl->tpl_vars['zip']->value;?>
</contact:pc>
                        <?php }?>
                        <?php if ((isset($_smarty_tpl->tpl_vars['country']->value))) {?>
                        <contact:cc><![CDATA[<?php echo $_smarty_tpl->tpl_vars['country']->value;?>
]]></contact:cc>
                        <?php }?>
                    </contact:addr>
                </contact:postalInfo>
                <contact:voice x=""><?php echo $_smarty_tpl->tpl_vars['phone']->value;?>
</contact:voice>
                <contact:email><?php echo $_smarty_tpl->tpl_vars['email']->value;?>
</contact:email>
                <contact:authInfo>
                    <?php if ($_smarty_tpl->tpl_vars['epp43']->value) {?>
                    <contact:pw/>
                    <?php } else { ?>
                    <contact:pw><![CDATA[<?php echo $_smarty_tpl->tpl_vars['password']->value;?>
]]></contact:pw>
                    <?php }?>
                </contact:authInfo>
                <contact:disclose flag="0">
                    <contact:name type="loc"/>
                    <contact:org type="loc"/>
                    <contact:addr type="loc"/>
                    <contact:voice/>
                    <contact:email/>
                </contact:disclose>
            </contact:create>
        </create>
        <clTRID><?php echo $_smarty_tpl->tpl_vars['registrarId']->value;?>
:<?php echo $_smarty_tpl->tpl_vars['eppUserName']->value;?>
:<?php echo $_smarty_tpl->tpl_vars['pin']->value;?>
</clTRID>
    </command>
</epp>
<?php }
}
