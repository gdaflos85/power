{extends file="adminarea/includes/layout.tpl"} 

{block name="template-heading"}
    {include file="adminarea/extensions/emailstyle/includes/breadcrumb.tpl"}
{/block}

{block name="template-tabs"}
    {include file="adminarea/extensions/emailstyle/includes/tabs.tpl"} 
{/block}

{block name="template-content"}
    <div class="section">
        <div class="section__header">
            <h3 class="section__title">
                Styles
                {include file="adminarea/includes/helpers/docs.tpl" link='https://lagom.rsstudio.net/docs/v2/settings.html#general'}
            </h3>
        </div>
        <div class="section__body">
            {foreach $extension->getStyles() as $key => $emailTemplate}
            <div class="d-inline-block m-r-2x">
                <form id="styleForm{$key}" method="POST" action="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName(),'exaction'=>'styles'])}">
                    <input type="hidden" name="exaction" value="activatestyle">
                    <input type="hidden" name="style" value="{$key}">
                    <div class="widget widget--checkbox widget--email-style {if $extension->getActivatedStyle() == $key}is-active{/if}" {if $extension->getActivatedStyle() != $key}onclick="document.getElementById(`styleForm{$key}`).submit();"{/if} >
                        <div class="widget__header">
                            <div class="widget__media widget__media--lg">
                                <img src="{$whmcsURL}/templates/{$themeName}/core/extensions/{$extension->className}/styles/{$key}/thumb.png" alt=""/>
                            </div>
                            <div class="widget__checkbox">
                                <img src="{$helper->img('widgets/checkbox.svg')}" alt="">
                            </div>
                        </div>
                        <div class="widget__actions widget__actions--raised flex flex-items-xs-between">
                            <div>
                                <strong>
                                    {if $key == 'basic'}Default{elseif $key == 'depth'}Depth{elseif $key == 'future'}Futuristic{else}{ucfirst($key)}{/if}
                                </strong>
                            </div>
                                {if $extension->getActivatedStyle() != $key}
                                {/if}
                            {if $extension->getActivatedStyle() == $key}
                                <label class="label label--success label--outline">Active</label>
                            {else}
                                <label class="label label--default label--outline">Activate</label>
                            {/if}
                        </div>
                    </div>
                </form>
            </div>
            {/foreach}
        </div>
    </div>
{/block}

































