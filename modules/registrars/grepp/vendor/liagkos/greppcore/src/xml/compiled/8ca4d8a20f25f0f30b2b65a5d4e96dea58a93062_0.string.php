<?php
/* Smarty version 3.1.48, created on 2024-09-09 15:22:03
  from '8ca4d8a20f25f0f30b2b65a5d4e96dea58a93062' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.48',
  'unifunc' => 'content_66df129b75d020_78623103',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_66df129b75d020_78623103 (Smarty_Internal_Template $_smarty_tpl) {
echo '<?xml ';?>
version="1.0" encoding="UTF-8" standalone="no"<?php echo '?>';?>

<epp xmlns="urn:ietf:params:xml:ns:epp-1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:ietf:params:xml:ns:epp-1.0 epp-1.0.xsd">
    <command>
        <transfer op="request">
            <domain:transfer xmlns:domain="urn:ietf:params:xml:ns:domain-1.0" xsi:schemaLocation="urn:ietf:params:xml:ns:domain-1.0 domain-1.0.xsd">
                <domain:name><?php echo $_smarty_tpl->tpl_vars['domain']->value;?>
</domain:name>
                <domain:authInfo>
                    <domain:pw><![CDATA[<?php echo $_smarty_tpl->tpl_vars['password']->value;?>
]]></domain:pw>
                </domain:authInfo>
            </domain:transfer>
        </transfer>
        <extension>
            <?php if ($_smarty_tpl->tpl_vars['epp43']->value) {?>
            <extdomain:transfer xmlns:extdomain="urn:ics-forth:params:xml:ns:extdomain-1.3" xsi:schemaLocation="urn:ics-forth:params:xml:ns:extdomain-1.3 extdomain-1.3.xsd">
            <?php } else { ?>
            <extdomain:transfer xmlns:extdomain="urn:ics-forth:params:xml:ns:extdomain-1.2" xsi:schemaLocation="urn:ics-forth:params:xml:ns:extdomain-1.2 extdomain-1.2.xsd">
            <?php }?>
                <extdomain:registrantid><?php echo $_smarty_tpl->tpl_vars['registrant']->value;?>
</extdomain:registrantid>
                <?php if (!$_smarty_tpl->tpl_vars['epp43']->value) {?>
                <extdomain:newPW><![CDATA[<?php echo $_smarty_tpl->tpl_vars['newpassword']->value;?>
]]></extdomain:newPW>
                <?php }?>
            </extdomain:transfer>
        </extension>
        <clTRID><?php echo $_smarty_tpl->tpl_vars['registrarId']->value;?>
:<?php echo $_smarty_tpl->tpl_vars['eppUserName']->value;?>
:<?php echo $_smarty_tpl->tpl_vars['pin']->value;?>
</clTRID>
    </command>
</epp>
<?php }
}
