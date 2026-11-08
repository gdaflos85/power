'createdRow': function( row, data, dataIndex ) {
    $(row).attr('data-url', 'viewinvoice.php?id='+data.id);
},