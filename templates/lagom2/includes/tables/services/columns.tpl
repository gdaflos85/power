/* Cell Service */
{ldelim}
    data: null,
    {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['showIdProduct'] == "1"}
        name: "id",
    {else}
        name: "productName",
    {/if}
    "render": function (data, row){        
        var text = '',
            collapseButton = '<button type="button" class="btn-table-collapse"></button>',
            serviceId = '',
            sslStatus = '',
            domain = '',
            domainName = '',
            product = '';


        {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['showIdProduct'] == "1"}
            serviceId = '#'+data.id+' - ';
        {/if}   
        {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['hideTabServiceGroup'] != "1"}
            product = '<b>'+data.groupName+'</b> - '+data.productName;
        {else}
            product = '<b>'+data.productName+'</b>';
        {/if} 

        if (data.domain){
            {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['hideSslIcon'] != "1"}
                if (data.sslStatus.status || data.domainstatus.status == "Active"){ldelim}
                    var image = data.sslStatus.image;
                        image = image.split("/");
                        image = image.pop();
                        image = image.replace(".png", ".svg");
                    
                    sslStatus = `<span class="ssl-info" data-element-id="`+data.id+`" data-type="domain" data-domain="`+data.domain+`">
                            <img id="sslStatus`+data.id+`" src="{$WEB_ROOT}/templates/{$template}/assets/img/ssl/12x12/`+image+`" data-toggle="tooltip" title="`+data.sslStatus.tooltipContent+`" width="12px" data-maintemplate="{$template}" class="ssl-status `+data.sslStatus.class+`"/>
                        </span>
                    `;
                {rdelim} else if (data.domainstatus.status != "Active") {ldelim}
                    sslStatus = `<span class="ssl-info" data-element-id="`+data.id+`" data-type="domain" data-domain="`+data.domain+`">
                            <img id="sslStatus{$service.id}" src="{$WEB_ROOT}/templates/{$template}/assets/img/ssl/12x12/ssl-inactive-domain.svg" data-toggle="tooltip" title="{lang key='sslState.sslInactiveDomain'}" data-maintemplate="{$template}" width="12px" class="ssl-status"/>
                        </span>    
                    `;
                {rdelim}
            {/if}
            {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['removeUrlFromDomainName'] == "0"}
                domainName = '<a class="text-small" href="http://'+data.domain+'" target="_blank">'+data.domain+'</a>';
            {else}
                domainName = '<span class="text-small">'+data.domain+'</span>';
            {/if}
            domain = '<br />' + sslStatus + domainName;
        }

        text = collapseButton + serviceId + product + domain;
        return text;
    }
{rdelim},

/* Cell Price */
{ldelim} 
    data: null,
    name: "amount",
    className: "text-nowrap",
    "render": function(data, row){ldelim}
        var price = data.formatedAmount + '<br/><span class="small">'+data.billingcycle+'</span>';
        {if isset($RSThemes.addonSettings.free_product_price) && 
            $RSThemes.addonSettings.free_product_price == "enabled" &&
            isset($RSThemes.addonSettings.free_product_price_value) &&
            $RSThemes.addonSettings.free_product_price_value == "all"}
            if (data.amount == "0.00" || data.amount == "0.00"){
                var price = "{$LANG.orderfree}"
            }
        {/if}    
        return price;
    {rdelim}
{rdelim},

/* Cell Next Due Date */
{ldelim} 
    data: null,
    name: "nextduedate",
    "render": function(data, row){ldelim}
        if (data.autoterminateDays){
            text = '<span class="small">{$rslang->trans("services.trial_ends")}</span><br />'+data.autoterminateDays;
        }
        else if (data.normalisednextduedate == "0000-00-00"){
            text = '-';
        }
        else{
            text = '<span class="text-nowrap">'+data.nextduedate+'</span>';
        }
        return text;
    {rdelim}
{rdelim},

/* Cell Status */
{ldelim}
    data: null,
    name: "domainstatus",
    className: "text-nowrap",
    "render": function(data, row){ldelim}
        {if $RSThemes.addonSettings.show_status_icon == 'displayed' && in_array($templatefile, $iconsPages)}
            var text = `<span class="status status-`+data.domainstatus.cssFriendly+` {if $RSThemes.addonSettings.show_status_icon == 'displayed'}dot-hidden{/if}">
                {if $RSThemes.addonSettings.show_status_icon == 'displayed'}
                    <span class="status-icon" data-status-icon="`+data.domainstatus.cssFriendly+`">
                        `+data.domainstatus.statusIcon+`
                    </span>
                {/if}
                `+data.domainstatus.statusText+`</span>
            `;
        {else}
            var text = `<span class="status status-`+data.domainstatus.cssFriendly+`">`+data.domainstatus.statusText+`</span>`;
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
        {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['showManageButton'] == "1"}
            text = `<a href="clientarea.php?action=productdetails&id=`+data.id+`" class="btn btn-default btn-sm btn-manage">{$_LANG['manage']}</a>`;
        {else}
            var activeActions = "",
                downloads = "",
                addons = "",
                upgrades = "";

           
                if (data.domainstatus.status== "Active" && (data.downloads || data.addons || data.upgrades)) {ldelim}
                    if (data.downloads){ldelim}
                        downloads = `<li><a href="clientarea.php?action=productdetails&id=`+data.id+`#tabDownloads">{$LANG.downloadstitle}</a></li>`;
                    {rdelim}
                    if (data.addons){ldelim}
                        addons = `<li><a href="clientarea.php?action=productdetails&id=`+data.id+`#tabAddons">{$LANG.clientareahostingaddons}</a></li>`;
                    {rdelim}
                    if (data.upgrades){ldelim}
                        upgrades = `<li><a href="upgrade.php?type=package&id=`+data.id+`">{$LANG.upgradedowngradepackage}</a></li>`;
                    {rdelim}
                    activeActions = downloads + addons + upgrades;
                {rdelim}

            text = `<div class="dropdown">
                <a href="#" class="btn btn-icon dropdown-toggle" data-toggle="dropdown">
                    <i class="lm lm-more"></i>
                </a>
                <ul class="dropdown-menu  pull-right" role="menu">
                    <li>
                        <a href="clientarea.php?action=productdetails&id=`+data.id+`">{$LANG.clientareaviewdetails}</a>
                    </li>
                    `+activeActions+`
                </ul>    
            </div>
            `;
        {/if}
        return text;
    {rdelim}
{rdelim}