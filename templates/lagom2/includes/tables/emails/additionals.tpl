'createdRow': function( row, data, dataIndex ) {
    $(row).attr('onclick', "popupWindow('viewemail.php?id="+data.id+"', 'emailWin', '650', '450')");
},