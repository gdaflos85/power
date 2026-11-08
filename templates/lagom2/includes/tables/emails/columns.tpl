/* Cell Date */
{ldelim}
    data: null,
    name: "date",
    "render": function (data, row){        
        var text = '',
            collapseButton = '<button type="button" class="btn-table-collapse"></button>',
            date = data.normaliseddate;

        text = collapseButton + date;
        return text;
    }
{rdelim},

/* Cell Title */
{ldelim} 
    data: null,
    name: "subject",
    "render": function(data, row){ldelim}
            var attachmentCount = "";
            if (data.attachments > 0) {ldelim}
                var attachmentCount = '<i class="fal fa-paperclip"></i>';
            {rdelim}
            var text = `<a href="#">`+attachmentCount+` `+data.subject+`</a>`;
        return text;
    {rdelim}
{rdelim}