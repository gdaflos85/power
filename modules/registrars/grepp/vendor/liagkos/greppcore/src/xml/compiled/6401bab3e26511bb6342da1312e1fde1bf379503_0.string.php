<?php
/* Smarty version 3.1.48, created on 2026-07-23 17:47:43
  from '6401bab3e26511bb6342da1312e1fde1bf379503' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.48',
  'unifunc' => 'content_6a6253bfd95588_63767683',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6a6253bfd95588_63767683 (Smarty_Internal_Template $_smarty_tpl) {
echo '<?xml ';?>
version="1.0" encoding="UTF-8" standalone="no"<?php echo '?>';?>

<epp xmlns="urn:ietf:params:xml:ns:epp-1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:ietf:params:xml:ns:epp-1.0 epp-1.0.xsd">
    <command>
        <create>
            <domain:create xmlns:domain="urn:ietf:params:xml:ns:domain-1.0" xsi:schemaLocation="urn:ietf:params:xml:ns:domain-1.0 domain-1.0.xsd">
                <domain:name><?php echo $_smarty_tpl->tpl_vars['domain']->value;?>
</domain:name>
                <domain:period unit="y"><?php echo $_smarty_tpl->tpl_vars['years']->value;?>
</domain:period>
                <?php if ((isset($_smarty_tpl->tpl_vars['nameservers']->value))) {?>
                <domain:ns>
                    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['nameservers']->value, 'nameserver');
$_smarty_tpl->tpl_vars['nameserver']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['nameserver']->value) {
$_smarty_tpl->tpl_vars['nameserver']->do_else = false;
?>
                    <domain:hostObj><?php echo $_smarty_tpl->tpl_vars['nameserver']->value;?>
</domain:hostObj>
                    <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                </domain:ns>
                <?php }?>
                <domain:registrant><?php echo $_smarty_tpl->tpl_vars['registrant']->value;?>
</domain:registrant>
                <?php if ((isset($_smarty_tpl->tpl_vars['contacts']->value))) {?>
                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['contacts']->value, 'contact');
$_smarty_tpl->tpl_vars['contact']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['contact']->value) {
$_smarty_tpl->tpl_vars['contact']->do_else = false;
?>
                <domain:contact type="<?php echo $_smarty_tpl->tpl_vars['contact']->value['type'];?>
"><?php echo $_smarty_tpl->tpl_vars['contact']->value['id'];?>
</domain:contact>
                <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                <?php }?>
                <domain:authInfo>
                    <?php if ($_smarty_tpl->tpl_vars['epp43']->value) {?>
                    <domain:pw/>
                    <?php } else { ?>
                    <domain:pw><![CDATA[<?php echo $_smarty_tpl->tpl_vars['password']->value;?>
]]></domain:pw>
                    <?php }?>
                </domain:authInfo>
            </domain:create>
        </create>
        <clTRID><?php echo $_smarty_tpl->tpl_vars['registrarId']->value;?>
:<?php echo $_smarty_tpl->tpl_vars['eppUserName']->value;?>
:<?php echo $_smarty_tpl->tpl_vars['pin']->value;?>
</clTRID>
    </command>
</epp>
<?php }
}
