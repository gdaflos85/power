<?php
/* Smarty version 3.1.48, created on 2024-11-04 15:34:28
  from '42e626fac9b311470e98cdac0bca503f327f57ab' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.48',
  'unifunc' => 'content_6728e984366b78_75537726',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6728e984366b78_75537726 (Smarty_Internal_Template $_smarty_tpl) {
echo '<?xml ';?>
version="1.0" encoding="UTF-8" standalone="no"<?php echo '?>';?>

<epp xsi:schemaLocation="urn:ietf:params:xml:ns:epp-1.0 epp-1.0.xsd" xmlns="urn:ietf:params:xml:ns:epp-1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <command>
        <create>
            <host:create xsi:schemaLocation="urn:ietf:params:xml:ns:host-1.0 host-1.0.xsd" xmlns:host="urn:ietf:params:xml:ns:host-1.0">
                <host:name><?php echo $_smarty_tpl->tpl_vars['nameserver']->value;?>
</host:name>
                <?php if ((isset($_smarty_tpl->tpl_vars['ipv4']->value))) {?>
                <host:addr><?php echo $_smarty_tpl->tpl_vars['ipv4']->value;?>
</host:addr>
                <?php }?>
                <?php if ((isset($_smarty_tpl->tpl_vars['ipv6']->value))) {?>
                <host:addr ip="v6"><?php echo $_smarty_tpl->tpl_vars['ipv6']->value;?>
</host:addr>
                <?php }?>
            </host:create>
        </create>
        <clTRID><?php echo $_smarty_tpl->tpl_vars['registrarId']->value;?>
:<?php echo $_smarty_tpl->tpl_vars['eppUserName']->value;?>
:<?php echo $_smarty_tpl->tpl_vars['pin']->value;?>
</clTRID>
    </command>
</epp>
<?php }
}
