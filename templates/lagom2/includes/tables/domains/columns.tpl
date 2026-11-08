/* Cell Checbkox */
{ldelim}
    data: null,
    className: "cell-checkbox",
    "render": function (data, row){
        var text = '',
            collapseButton = '<button type="button" class="btn-table-collapse"></button>',
            checkbox = '<input type="checkbox" name="domids[]" class="domids stopEventBubble icheck-control" value="'+data.id+'"/>';

        text = collapseButton + checkbox;
        return text;
    }
{rdelim},

/* Cell Domain Name */
{ldelim} 
    data: null,
    {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['showDomainId'] == "1"}
        name: "id",
    {else}
        name: "domain",
    {/if}
    "render": function(data, row){ldelim}
        var domainId = '',
            sslStatus = '';
        {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['showDomainId'] == "1"}
            domainId = '#'+data.id+' - ';
        {/if}
        {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['hideSslIcon'] != "1"}
            if (data.sslStatus.status || data.status.status == "Active" || data.status.status == "Grace"){ldelim}
                var image = data.sslStatus.image;
                    image = image.split("/");
                    image = image.pop();
                    image = image.replace(".png", ".svg");
                   
                sslStatus = `<span class="ssl-info" data-element-id="`+data.id+`" data-type="domain" data-domain="`+data.domain+`">
                        <img id="sslStatus`+data.id+`" src="{$WEB_ROOT}/templates/{$template}/assets/img/ssl/12x12/`+image+`" data-toggle="tooltip" title="`+data.sslStatus.tooltipContent+`" width="12px" data-maintemplate="{$template}" class="ssl-status `+data.sslStatus.class+`"/>
                    </span>
                `;
            {rdelim} else if (data.status.status != "Active" && data.status.status != "Grace") {ldelim}
                sslStatus = `<span class="ssl-info" data-element-id="`+data.id+`" data-type="domain" data-domain="`+data.domain+`">
                        <img id="sslStatus{$service.id}" src="{$WEB_ROOT}/templates/{$template}/assets/img/ssl/12x12/ssl-inactive-domain.svg" data-toggle="tooltip" title="{lang key='sslState.sslInactiveDomain'}" data-maintemplate="{$template}" width="12px" class="ssl-status"/>
                    </span>    
                `;
            {rdelim}
        {/if}
        var text = sslStatus + domainId+'<a href="http://'+data.domain+'"target="_blank">'+data.domain+'</a>';
        return text;
    {rdelim}
{rdelim},

/* Cell Next Due Date */
{ldelim} 
    data: null,
    name: "nextduedate",
    "render": function(data, row){ldelim}
        var text = data.nextduedate;
        return text;
    {rdelim}
{rdelim},

/* Cell Auto Renew */
{ldelim} 
    data: null,
    name: "donotrenew",
    className: "switch-col",
    "render": function (data, row){ldelim}
        var text = '-';        
        {if $RSThemes.pages.clientareadomains.config.showAutoRenewSwitcher}
            if (data.status.status == "Active"){ldelim}
                var autorenew = "disable",
                    checked = 'checked="checked"';
                if (data.donotrenew == 1){ldelim}
                    autorenew = "enable"
                    checked = "";
                {rdelim}
                text = `<div class="not-allowed">
                    <label class="switch switch--text d-flex" data-auto-renew-switch>
                        <input class="switch__checkbox switch__checkbox--domain" 
                            type="checkbox" 
                            data-domainid="`+data.id+`"
                            data-domainsub="autorenew"
                            data-domainautorenew="`+autorenew+`"
                            data-token="{$token}"
                            data-action="{$smarty.server.PHP_SELF}?action=domaindetails"
                            `+checked+`
                        >
                        <span class="switch__container">
                            <span class="switch__handle"></span>
                            <div class="loader">
                                <div class="spinner spinner-sm">
                                    <div class="rect1"></div>
                                    <div class="rect2"></div>
                                    <div class="rect3"></div>
                                    <div class="rect4"></div>
                                </div>    
                            </div>
                        </span>
                    </label>  
                </div>`;
            {rdelim}
        {else}
            text = "{$LANG.domainsautorenewenabled}";
            if (data.donotrenew == 1){ldelim}
                text = "{$LANG.domainsautorenewdisabled}";
            {rdelim}
        {/if}
        return text;
    {rdelim}
{rdelim},

/* Cell Status */
{ldelim}
    data: null,
    name: "status",
    "render": function(data, row){ldelim}
        {if $RSThemes.addonSettings.show_status_icon == 'displayed' && in_array($templatefile, $iconsPages)}
            var text = `<span class="status status-`+data.status.cssFriendly+` {if $RSThemes.addonSettings.show_status_icon == 'displayed'}dot-hidden{/if}">
                {if $RSThemes.addonSettings.show_status_icon == 'displayed'}
                    <span class="status-icon" data-status-icon="`+data.status.cssFriendly+`">
                        `+data.status.statusIcon+`
                    </span>
                {/if}
                `+data.status.statusText+`</span>
            `;
        {else}
            var text = `<span class="status status-`+data.status.cssFriendly+`">`+data.status.statusText+`</span>`;
        {/if}    
        return text;
    {rdelim}
{rdelim},

/* Cell Actions */
{ldelim} 
    data: null,
    name: "actions",
    className: "cell-action",
    "render": function (data, row){ldelim}
        var text = '';
        {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['showManageButton'] == "1"}
            text = `<a href="clientarea.php?action=domaindetails&id=`+data.id+`" class="btn btn-default btn-sm btn-manage">{$_LANG['manage']}</a>`;
        {else}
            var activeActions = "",
                renewActions = "";

            {if $allowrenew}
                if (data.status.status== "Active") {ldelim}
                    activeActions = `
                        <li><a href="clientarea.php?action=domaindetails&id=`+data.id+`#tabNameservers">{$LANG.domainmanagens}</a></li>
                        <li><a href="clientarea.php?action=domaincontacts&domainid=`+data.id+`">{$LANG.domaincontactinfoedit}</a></li>
                        <li><a href="clientarea.php?action=domaindetails&id=`+data.id+`#tabAutorenew">{$LANG.domainautorenewstatus}</a></li>
                    `;
                {rdelim}
                if (data.canDomainBeManaged){ldelim}
                    renewActions = `<li><a href="{routePath('domain-renewal','replace-string')}">{lang key='domainsrenew'}</a></li>`;
                    renewActions = renewActions.replace('replace-string', data.domain);
                {rdelim} else {ldelim}
                    renewActions = `<li class="disabled"><a href="#" onclick="return false;" class="disabled" disabled="disabled">{lang key='domainsrenew'}</a></li>`;
                {rdelim}
            {/if}
            text = `<div class="dropdown" data-dropdown-counter>
                <a href="#" class="btn btn-icon dropdown-toggle" data-toggle="dropdown">
                    <i class="lm lm-more"></i>
                </a>
                <ul class="dropdown-menu  pull-right" role="menu">
                    <li>
                        <a href="clientarea.php?action=domaindetails&id=`+data.id+`">{$LANG.managedomain}</a>
                    </li>
                    `+activeActions+`
                    `+renewActions+`
                </ul>    
            </div>
            `;
        {/if}
        return text;
    {rdelim}
{rdelim}