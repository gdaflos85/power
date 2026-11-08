'createdRow': function( row, data, dataIndex ) {
    $(row).attr('data-url', 'clientarea.php?action=productdetails&id='+data.id);
},