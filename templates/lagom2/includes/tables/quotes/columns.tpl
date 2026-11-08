/* Cell Quote ID */
{ldelim}
    data: null,
    name: "id",
    "render": function (data, row){        
        var text = '',
            collapseButton = '<button type="button" class="btn-table-collapse"></button>',
            id = data.id;

        text = collapseButton + id;
        return text;
    }
{rdelim},

/* Cell Subject */
{ldelim} 
    data: null,
    name: "subject",
    "render": function(data, row){ldelim}
        var text = data.subject;
        return text;
    {rdelim}
{rdelim},

/* Cell Date Created */
{ldelim} 
    data: null,
    name: "datecreated",
    "render": function(data, row){ldelim}
        var text = data.normalisedDateCreated;
        return text;
    {rdelim}
{rdelim},

/* Cell Valid Until */
{ldelim} 
    data: null,
    name: "validuntil",
    "render": function(data, row){ldelim}
        var text = data.normalisedValidUntil;
        return text;
    {rdelim}
{rdelim},

/* Cell Status */
{ldelim}
    data: null,
    name: "stage",
    className: "text-nowrap",
    "render": function(data, row){ldelim}
        {if $RSThemes.addonSettings.show_status_icon == 'displayed' && in_array($templatefile, $iconsPages)}
            var text = `<span class="status status-`+data.stage.cssFriendly+` {if $RSThemes.addonSettings.show_status_icon == 'displayed'}dot-hidden{/if}">
                {if $RSThemes.addonSettings.show_status_icon == 'displayed'}
                    <span class="status-icon" data-status-icon="`+data.stage.cssFriendly+`">
                        `+data.stage.statusIcon+`
                    </span>
                {/if}
                `+data.stage.statusText+`</span>
            `;
        {else}
            var text = `<span class="status status-`+data.stage.cssFriendly+`">`+data.stage.statusText+`</span>`;
        {/if}    
        return text;
    {rdelim}
{rdelim},

/* Cell PDF Button */
{ldelim} 
    data: null,
    name: "actions",
    className: "cell-action",
    "render": function (data, row){ldelim}
        text = `<a href="dl.php?type=q&amp;id=`+data.id+`" class="btn btn-icon btn-sm"><i class="ls ls-download"></i></a>`;
        return text;
    {rdelim}
{rdelim}

