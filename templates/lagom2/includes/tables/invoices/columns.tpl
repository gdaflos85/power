/* Cell Invoice Number */
{ldelim}
    data: null,
    name: "id",
    "render": function (data, row){        
        var text = '',
            collapseButton = '<button type="button" class="btn-table-collapse"></button>',
            title = data.title;

        text = collapseButton + title;
        return text;
    }
{rdelim},

/* Cell Date Created */
{ldelim} 
    data: null,
    name: "date",
    "render": function(data, row){ldelim}
        var text = data.normalisedDate;
        return text;
    {rdelim}
{rdelim},

/* Cell Due Date */
{ldelim} 
    data: null,
    name: "duedate",
    "render": function(data, row){ldelim}
        var text = data.normalisedDueDate;
        return text;
    {rdelim}
{rdelim},

/* Cell Total */
{ldelim} 
    data: null,
    name: "total",
    "render": function(data, row){ldelim}
        var text = data.formattedTotal;
        return text;
    {rdelim}
{rdelim},

/* Cell Status */
{ldelim}
    data: null,
    name: "status",
    className: "text-nowrap",
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
{rdelim}
{if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['showPdfButton'] == "1"}
,
/* Cell PDF Button */
{ldelim} 
    data: null,
    name: "actions",
    className: "cell-action",
    "render": function (data, row){ldelim}
        text = `<a href="dl.php?type=i&amp;id=`+data.id+`" class="btn btn-default btn-sm btn-manage">{$LANG.invoicesdownload}</a>`;
        return text;
    {rdelim}
{rdelim}
{/if}

{if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['showManageButton'] == "1"}
,
/* Cell Actions */
{ldelim} 
    data: null,
    name: "actions",
    className: "cell-action cell-action--last",
    "render": function (data, row){ldelim}
        text = `<a href="viewinvoice.php?id=`+data.id+`" class="btn btn-default btn-sm btn-manage">{$_LANG['manage']}</a>`;
        return text;
    {rdelim}
{rdelim}
{/if}