{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/extensions/cms/includes/breadcrumbs.tpl"}
{/block}

{block name="template-tabs"}
    {include file="adminarea/extensions/cms/includes/tabs.tpl"}
{/block}

{block name="template-content"}
<div class="block">
        <div class="block__body">
            <div class="section">
                <h3 class="section__title">Information</h3>
                <ul class="panel list list--info list--p-1x">
                    <li class="list__item">
                        <span class="list__label">Version:</span>
                        <span class="list__value"><b>{$extension->getVersion()}</b></span>
                    </li>
                    <li class="list__item">
                        <span class="list__label">Name:</span>
                        <span class="list__value"><b>{$extension->getName()}</b></span>
                    </li>
                    <li class="list__item">
                        <span class="list__label">Description:</span>
                        <span class="list__value"><b>{$extension->getDescription()}</b></span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="block__sidebar info-sidebar-block info-sidebar-block--cms">
            <div class="widget widget--lg">
                <a class="widget__media has-overlay info-sidebar-widget">
                    {include file="adminarea/info/includes/sidebar-logo-lagom-2.tpl"}
                    {include file="adminarea/info/includes/sidebar-lines.tpl"}
                </a>
            </div>	
        </div>
    </div>
{/block}