'createdRow': function( row, data, dataIndex ) {
    $(row).attr('data-url', 'clientarea.php?action=domaindetails&id='+data.id);
},