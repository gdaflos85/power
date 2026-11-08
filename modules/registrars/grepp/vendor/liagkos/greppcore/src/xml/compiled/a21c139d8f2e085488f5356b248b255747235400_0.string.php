<?php
/* Smarty version 3.1.48, created on 2024-09-09 15:22:04
  from 'a21c139d8f2e085488f5356b248b255747235400' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.48',
  'unifunc' => 'content_66df129c6abb11_96290362',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_66df129c6abb11_96290362 (Smarty_Internal_Template $_smarty_tpl) {
echo '<?xml ';?>
version="1.0" encoding="UTF-8" standalone="no"<?php echo '?>';?>

<epp xmlns="urn:ietf:params:xml:ns:epp-1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:ietf:params:xml:ns:epp-1.0 epp-1.0.xsd">
    <command>
        <update>
            <domain:update xmlns:domain="urn:ietf:params:xml:ns:domain-1.0" xsi:schemaLocation="urn:ietf:params:xml:ns:domain-1.0 domain-1.0.xsd">
                <domain:name><?php echo $_smarty_tpl->tpl_vars['domain']->value;?>
</domain:name>
                                                <domain:<?php echo $_smarty_tpl->tpl_vars['task']->value;?>
>
                    <?php if ($_smarty_tpl->tpl_vars['what']->value == 'registrant') {?>
                    <domain:registrant><?php echo $_smarty_tpl->tpl_vars['registrant']->value;?>
</domain:registrant>
                    <?php }?>
                    <?php if ($_smarty_tpl->tpl_vars['what']->value == 'ns') {?>
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
                    <?php } elseif ($_smarty_tpl->tpl_vars['what']->value == 'contact') {?>
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
                    <?php } elseif ($_smarty_tpl->tpl_vars['what']->value == 'pw' && (!$_smarty_tpl->tpl_vars['epp43']->value)) {?>
                    <domain:authInfo>
                        <domain:pw><![CDATA[<?php echo $_smarty_tpl->tpl_vars['newPassword']->value;?>
]]></domain:pw>
                    </domain:authInfo>
                    <?php }?>
                </domain:<?php echo $_smarty_tpl->tpl_vars['task']->value;?>
>
            </domain:update>
        </update>
        <?php if ((isset($_smarty_tpl->tpl_vars['op']->value))) {?>
        <extension>
            <?php if ($_smarty_tpl->tpl_vars['epp43']->value) {?>
            <extdomain:update xmlns:extdomain="urn:ics-forth:params:xml:ns:extdomain-1.3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:ics-forth:params:xml:ns:extdomain-1.3 extdomain-1.3.xsd">
            <?php } else { ?>
            <extdomain:update xmlns:extdomain="urn:ics-forth:params:xml:ns:extdomain-1.2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:ics-forth:params:xml:ns:extdomain-1.2 extdomain-1.2.xsd">
            <?php }?>
                <extdomain:op><?php echo $_smarty_tpl->tpl_vars['op']->value;?>
</extdomain:op>
            </extdomain:update>
        </extension>
        <?php }?>
        <clTRID><?php echo $_smarty_tpl->tpl_vars['registrarId']->value;?>
:<?php echo $_smarty_tpl->tpl_vars['eppUserName']->value;?>
:<?php echo $_smarty_tpl->tpl_vars['pin']->value;?>
</clTRID>
    </command>
</epp><?php }
}
