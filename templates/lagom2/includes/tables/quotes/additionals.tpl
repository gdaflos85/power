'createdRow': function( row, data, dataIndex ) {
    $(row).attr('data-url', 'viewquote.php?id='+data.id);
},