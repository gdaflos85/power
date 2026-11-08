<?php
/* Smarty version 3.1.48, created on 2025-06-29 16:27:53
  from 'a689cc83f1fb53eac063cbda8582889e91c92c2b' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.48',
  'unifunc' => 'content_686169896a2b85_56581979',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_686169896a2b85_56581979 (Smarty_Internal_Template $_smarty_tpl) {
echo '<?xml ';?>
version="1.0" encoding="UTF-8" standalone="no"<?php echo '?>';?>

<epp xmlns="urn:ietf:params:xml:ns:epp-1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:ietf:params:xml:ns:epp-1.0 epp-1.0.xsd">
    <command>
        <update>
            <contact:update xmlns:contact="urn:ietf:params:xml:ns:contact-1.0" xsi:schemaLocation="urn:ietf:params:xml:ns:contact-1.0 contact-1.0.xsd">
                <contact:id><?php echo $_smarty_tpl->tpl_vars['contactId']->value;?>
</contact:id>
                <contact:chg>
                    <?php if ((isset($_smarty_tpl->tpl_vars['street']->value)) || (isset($_smarty_tpl->tpl_vars['city']->value)) || (isset($_smarty_tpl->tpl_vars['region']->value)) || (isset($_smarty_tpl->tpl_vars['zip']->value)) || (isset($_smarty_tpl->tpl_vars['country']->value))) {?>
                    <contact:postalInfo type="loc">
                        <!-- contact:name & contact:org are not allowed to change -->
                        <contact:addr>
                            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['street']->value, 'address');
$_smarty_tpl->tpl_vars['address']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['address']->value) {
$_smarty_tpl->tpl_vars['address']->do_else = false;
?>
                            <contact:street><?php echo $_smarty_tpl->tpl_vars['address']->value;?>
</contact:street>
                            <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                            <?php if ((isset($_smarty_tpl->tpl_vars['city']->value))) {?>
                            <contact:city><?php echo $_smarty_tpl->tpl_vars['city']->value;?>
</contact:city>
                            <?php }?>
                            <?php if ((isset($_smarty_tpl->tpl_vars['region']->value))) {?>
                            <contact:sp><?php echo $_smarty_tpl->tpl_vars['region']->value;?>
</contact:sp>
                            <?php }?>
                            <?php if ((isset($_smarty_tpl->tpl_vars['zip']->value))) {?>
                            <contact:pc><?php echo $_smarty_tpl->tpl_vars['zip']->value;?>
</contact:pc>
                            <?php }?>
                            <?php if ((isset($_smarty_tpl->tpl_vars['country']->value))) {?>
                            <contact:cc><?php echo $_smarty_tpl->tpl_vars['country']->value;?>
</contact:cc>
                            <?php }?>
                        </contact:addr>
                    </contact:postalInfo>
                    <?php }?>
                    <?php if ((isset($_smarty_tpl->tpl_vars['phone']->value))) {?>
                    <contact:voice x=""><?php echo $_smarty_tpl->tpl_vars['phone']->value;?>
</contact:voice>
                    <?php }?>
                    <?php if ((isset($_smarty_tpl->tpl_vars['email']->value))) {?>
                    <contact:email><?php echo $_smarty_tpl->tpl_vars['email']->value;?>
</contact:email>
                    <?php }?>
                    <?php if ((isset($_smarty_tpl->tpl_vars['password']->value)) && (!$_smarty_tpl->tpl_vars['epp43']->value)) {?>
                    <contact:authInfo>
                        <contact:pw><![CDATA[<?php echo $_smarty_tpl->tpl_vars['password']->value;?>
]]></contact:pw>
                    </contact:authInfo>
                    <?php }?>
                </contact:chg>
            </contact:update>
        </update>
        <clTRID><?php echo $_smarty_tpl->tpl_vars['registrarId']->value;?>
:<?php echo $_smarty_tpl->tpl_vars['eppUserName']->value;?>
:<?php echo $_smarty_tpl->tpl_vars['pin']->value;?>
</clTRID>
    </command>
</epp>
<?php }
}
