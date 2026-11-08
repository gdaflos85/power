'createdRow': function( row, data, dataIndex ) {
    $(row).attr('data-url', 'viewticket.php?tid='+data.tid+'&c='+data.c);
},