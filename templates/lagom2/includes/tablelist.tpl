{if file_exists("templates/$template/includes/overwrites/tablelist.tpl")}
    {include file="{$template}/includes/overwrites/tablelist.tpl"}  
{else}
    <link rel="stylesheet" type="text/css" href="{$BASE_PATH_CSS}/dataTables.responsive.css">   
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.7/js/dataTables.responsive.js"></script>

    {if isset($filterColumn) && $filterColumn}
    <script type="text/javascript">
        if (typeof(buildFilterRegex) !== "function") {
            
            {if isset($RSThemes.addonSettings.enable_table_ajax_load) && $RSThemes.addonSettings.enable_table_ajax_load == "enabled" && isset($tableIncludes)}
                function buildFilterRegex(filterValue) {                
                    if (filterValue.indexOf('&') === -1) {
                        return '[~>]\\s*\\b' + jQuery.fn.dataTable.util.escapeRegex(filterValue) + '\\b\\s*[<~]';
                    } else {
                        var tempDiv = document.createElement('div');
                        tempDiv.innerHTML = filterValue;
                        return '\\s*\\b' + jQuery.fn.dataTable.util.escapeRegex(tempDiv.innerText) + '\\b\\s*';
                    }
                }
            {else}
                function buildFilterRegex(filterValue) {                
                    if (filterValue.indexOf('&') === -1) {
                        return '[~>]\\s*' + jQuery.fn.dataTable.util.escapeRegex(filterValue) + '\\s*[<~]';
                    } else {
                        var tempDiv = document.createElement('div');
                        tempDiv.innerHTML = filterValue;
                        return '\\s*' + jQuery.fn.dataTable.util.escapeRegex(tempDiv.innerText) + '\\s*';
                    }
                }
            {/if}
        }

        jQuery(document).ready(function () {ldelim}
            if($('.main-content').hasClass('status-icons-enabled')){
                jQuery(".view-filter-btns .dropdown-menu a").click(function(e) {ldelim}
                    var filterValue = jQuery(this).find("span").data('value');
                    var filterText = jQuery(this).find("span.filter-name").html().trim();
                    var filterIcon = jQuery(this).find("span.status-icon").html().trim();
                    var filterStatusClass = jQuery(this).find("span").data('status-class');
                    var filterStatusColor = jQuery(this).data('status-color');
                    var dataTable = jQuery('#table{$tableName}').DataTable();
                    var filterValueRegex;
                    $(this).closest('.dropdown-menu').find('.active').removeClass('active');
                    $(this).parent().addClass('active');
                    $(this).closest('.view-filter-btns').find('.dropdown-toggle span.filter-name').html(filterText);
                    $(this).closest('.view-filter-btns').find('.dropdown-toggle span.status-icon').attr('class','status-icon').addClass('status-'+filterStatusClass).html(filterIcon);
                    if (filterValue == "all") {ldelim}
                        dataTable.column({$filterColumn}).search('').draw();
                        $(this).closest('.view-filter-btns').find('.dropdown-toggle span.status').addClass('hidden');
                        {rdelim} else {ldelim}
                        if (filterStatusColor != undefined){ldelim} 
                            $(this).closest('.view-filter-btns').find('.dropdown-toggle span.status').attr('style','--status-color:'+filterStatusColor).removeClass('hidden');
                        {rdelim} else {ldelim} 
                            $(this).closest('.view-filter-btns').find('.dropdown-toggle span.status').addClass('status-'+filterStatusClass).removeClass('hidden');
                        {rdelim}

                        if (filterValue != undefined){ldelim} 
                            filterValueRegex = buildFilterRegex(filterValue);
                        {rdelim} else {ldelim} 
                            filterValueRegex = buildFilterRegex(filterText);
                        {rdelim}

                        dataTable.column({$filterColumn})
                            .search(filterValueRegex, true, false, false)
                            .draw();
                    {rdelim}
                    // Prevent jumping to the top of the page
                    // when no matching tag is found.
                    e.preventDefault();
                    
                {rdelim});

            }else{
                jQuery(".view-filter-btns .dropdown-menu a").click(function(e) {ldelim}
                var filterValue = jQuery(this).find("span").data('value');
                var filterText = jQuery(this).find("span").html().trim();
                var filterStatusClass = jQuery(this).find("span").data('status-class');
                var filterStatusColor = jQuery(this).data('status-color');
                var dataTable = jQuery('#table{$tableName}').DataTable();
                var filterValueRegex;

                $(this).closest('.dropdown-menu').find('.active').removeClass('active');
                $(this).parent().addClass('active');
                $(this).closest('.view-filter-btns').find('.dropdown-toggle span:not(.status)').text(filterText);
                if (filterValue == "all") {ldelim}
                    dataTable.column({$filterColumn}).search('').draw();
                    $(this).closest('.view-filter-btns').find('.dropdown-toggle span.status').addClass('hidden');
                    {rdelim} else {ldelim}
                    if (filterStatusColor != undefined){ldelim} 
                        $(this).closest('.view-filter-btns').find('.dropdown-toggle span.status').attr('style','--status-color:'+filterStatusColor).removeClass('hidden');
                    {rdelim} else {ldelim} 
                        $(this).closest('.view-filter-btns').find('.dropdown-toggle span.status').attr('class','status').addClass('status-'+filterStatusClass).removeClass('hidden');
                    {rdelim}

                     if (filterValue != undefined){ldelim} 
                        filterValueRegex = buildFilterRegex(filterValue);
                    {rdelim} else {ldelim} 
                        filterValueRegex = buildFilterRegex(filterText);
                    {rdelim}
                    //console.log(filterValueRegex);
                    dataTable.column({$filterColumn})
                        .search(filterValueRegex, true, false, false)
                        .draw();
                {rdelim}
                // Prevent jumping to the top of the page
                // when no matching tag is found.
                e.preventDefault();
                
            {rdelim});
            }
           
        {rdelim});
       
    

        jQuery(document).ready(function () {
            jQuery(".sidebar .view-filter-btns a").click(function (e) {
                var filterValue = jQuery(this).find("span").not('.badge').html().trim(),
                    dataTable = jQuery('#table{$tableName}').DataTable(),
                    filterValueRegex;
                if (jQuery(this).hasClass('active')) {
                    {if !isset($dontControlActiveClass) || !$dontControlActiveClass}
                        jQuery(this).removeClass('active');                    
                    {/if}
                    dataTable.column({$filterColumn}).search('').draw();
                } else {
                    {if !isset($dontControlActiveClass) || !$dontControlActiveClass}
                        jQuery('.view-filter-btns .list-group-item').removeClass('active');                    
                        jQuery(this).addClass('active');
                    {/if}
                    filterValueRegex = buildFilterRegex(filterValue);
                    dataTable.column({$filterColumn})
                        .search(filterValueRegex, true, false, false)
                        .draw();
                }

                // Prevent jumping to the top of the page when no matching tag is found.
                e.preventDefault();
            });
        });
        </script>   
    {/if}

    <script type="text/javascript">
        function checkAll(){
            let checkAll = $('#selectAll');
            let checkboxes = $('.domids').not(':disabled');
            checkAll.on('ifChecked ifUnchecked', function(e) {
                if (e.type == 'ifChecked') {
                    checkboxes.iCheck('check');
                } else {
                    checkboxes.iCheck('uncheck');
                }
            });
            checkboxes.on('ifChanged', function(e){
                if(checkboxes.filter(':checked').length > 0){
                    $('#domainSelectedCounter').addClass('badge-primary');
                    $('.bottom-action-sticky').removeClass('hidden');           
                }
                else{
                    $('#domainSelectedCounter').removeClass('badge-primary');
                    $('.bottom-action-sticky').addClass('hidden');   
                }
                $('#domainSelectedCounter').text(checkboxes.filter(':checked').length);
                if(checkboxes.filter(':checked').length == checkboxes.length) {
                    checkAll.prop('checked', 'checked');
                } else {
                    checkAll.removeProp('checked');
                }
                checkAll.iCheck('update');
            });
        };

        var alreadyReady = false; // The ready function is being called twice on page load.
        {if isset($RSThemes.addonSettings.enable_table_ajax_load) && $RSThemes.addonSettings.enable_table_ajax_load == "enabled" && isset($tableIncludes)}
            var saveState = false
        {else if $saveState}
            var saveState = {$saveState}
        {else}
            var saveState = true;
        {/if}

        {if isset($RSThemes['addonSettings']['enable_table_cache']) && $RSThemes['addonSettings']['enable_table_cache'] == "displayed"}
            {if isset($RSThemes['addonSettings']['table_cache_duration'])}
                {if $RSThemes['addonSettings']['table_cache_duration'] == "disabled"}
                    var saveState = false;
                    var stateDuration = 7200;
                    var noStartFilters = true;
                {else}
                    var stateDuration = {$RSThemes['addonSettings']['table_cache_duration']}
                    var noStartFilters = false;
                {/if}
            {else}
                var stateDuration = 7200;
                var noStartFilters = false;
            {/if}
        {else}
            var noStartFilters = false;
            var stateDuration = 7200;
        {/if}

        jQuery(document).ready( function () {ldelim}

            var table = jQuery("#table{$tableName}").DataTable({ldelim}
                {if isset($RSThemes.addonSettings.enable_table_ajax_load) && $RSThemes.addonSettings.enable_table_ajax_load == "enabled" && isset($tableIncludes)}
                    ajax: {ldelim}
                        url: '{$ajaxUrl}',
                        data: function(d){
                            let checkbox = $('[data-inactive-services-checkbox]');
                            if (checkbox.length){
                                if (checkbox[0].checked){
                                    d.hideInactiveStatus = 1;
                                }
                            }
                        },
                        dataSrc: 'data'
                    {rdelim},
                    processing: true,
                    serverSide: true,
                    columns: [
                        {if isset($tableIncludes) && file_exists("templates/$template/includes/tables/$tableIncludes/columns.tpl")}                                   
                            {include file="{$template}/includes/tables/{$tableIncludes}/columns.tpl"} 
                        {/if}
                    ], 
                    initComplete: function (settings, json) {
                        //console.log(json);
                    },   
                    drawCallback: function (settings) {
                        jQuery('.table-container').removeClass('loading');
                        jQuery('#tableLoading').addClass('hidden');
                    },
                    {if isset($tableIncludes) && file_exists("templates/$template/includes/tables/$tableIncludes/additionals.tpl")}                                   
                        {include file="{$template}/includes/tables/{$tableIncludes}/additionals.tpl"}
                    {/if}
                {/if}
                "dom": '<"listtable"fit>pl',{if isset($noPagination) && $noPagination}
                "paging": false,{/if}
                "info": false,{if isset($noSearch) && $noSearch}
                "filter": false,{/if}
                "responsive": true,
                "oLanguage": {ldelim}
                    "sEmptyTable":     "{$LANG.norecordsfound}",
                    "sInfo":           "{$LANG.tableshowing}",
                    "sInfoEmpty":      "{$LANG.tableempty}",
                    "sInfoFiltered":   "{$LANG.tablefiltered}",
                    "sInfoPostFix":    "",
                    "sInfoThousands":  ",",
                    "sLengthMenu":     "{$LANG.tablelength}",
                    "sLoadingRecords": "{$LANG.tableloading}",
                    "sProcessing":     "{$LANG.tableprocessing}",
                    "sSearch":         "",
                    "sZeroRecords":    "{$LANG.norecordsfound}",
                    "oPaginate": {ldelim}
                        "sFirst":    "{$LANG.tablepagesfirst}",
                        "sLast":     "{$LANG.tablepageslast}",
                        "sNext":     "{$LANG.tablepagesnext}",
                        "sPrevious": "{$LANG.tablepagesprevious}"
                    {rdelim}
                {rdelim},
                "pageLength": 10,
                "order": [
                    [ {if isset($startOrderCol) && $startOrderCol}{$startOrderCol}{else}0{/if}, "asc" ]
                ],
                {if isset($RSThemes.addonSettings.enable_table_ajax_load) && $RSThemes.addonSettings.enable_table_ajax_load == "enabled" && isset($tableIncludes)}
                    "lengthMenu": [
                        [10, 25, 50],
                        [10, 25, 50]
                    ],
                {else}
                    "lengthMenu": [
                        [10, 25, 50, -1],
                        [10, 25, 50, "{$LANG.tableviewall}"]
                    ],
                {/if}
                "aoColumnDefs": [
                    {ldelim}
                        "bSortable": false,
                        "aTargets": [ {if isset($noSortColumns) && $noSortColumns !== ''}{$noSortColumns}{/if} ]
                    {rdelim},
                    {ldelim}
                        "sType": "string",
                        "aTargets": [ {if isset($filterColumn) && $filterColumn}{$filterColumn}{/if} ],
                    {rdelim}
                    {if isset($tableIncludes) && file_exists("templates/$template/includes/tables/$tableIncludes/columnDefs.tpl")}                                   
                        ,{include file="{$template}/includes/tables/{$tableIncludes}/columnDefs.tpl"} 
                    {/if}
                ],
                "stateSave": saveState,
                "stateDuration": stateDuration,
                "autoWidth": false,
            {rdelim});
               
            {if isset($filterColumn) && $filterColumn}
            // highlight remembered filter on page re-load
            if (!noStartFilters && table.state()){
                var rememberedFilterTerm = table.state().columns[{$filterColumn}].search.search;
            }
            if (rememberedFilterTerm && !alreadyReady) {
                // This should only run on the first "ready" event.
                if($('.main-content').hasClass('status-icons-enabled')){
                    jQuery(".view-filter-btns a > span").each(function(index) {
                        if (buildFilterRegex(jQuery(this).text().trim()) == rememberedFilterTerm) {
                            var filterValue = jQuery(this).data('value');
                            var filterStatusClass = jQuery(this).data('status-class');
                            var filterStatusColor = jQuery(this).parent().data('status-color');
                            var filterFullStatusClass = 'status-' + filterStatusClass;
                            var ifTicket = jQuery(this).data('status');
                            $(this).closest('li').addClass('active');
                            var icon = $(this).find('.status-icon').html();

                            $(this).closest('.view-filter-btns').find('.dropdown-toggle span:not(.status)').text(jQuery(this).text());
                            $('<span class="status-icon"></span>').insertAfter($(this).closest('.view-filter-btns').find('.dropdown-toggle span.status'));
                            if(ifTicket == 'ticket'){
                                $(this).closest('.view-filter-btns').find('.dropdown-toggle .status-icon').addClass(filterFullStatusClass).attr('data-status', 'ticket').append(icon);
                            }else{
                                $(this).closest('.view-filter-btns').find('.dropdown-toggle .status-icon').addClass(filterFullStatusClass).append(icon);
                            }
                            
                            if (filterStatusColor != 'undefined') {
                                $(this).closest('.view-filter-btns').find('.dropdown-toggle span.status').attr('style','--status-color:'+filterStatusColor).removeClass('hidden');
                            } 
                            else {
                                $(this).closest('.view-filter-btns').find('.dropdown-toggle span.status').addClass('status-'+filterStatusClass).removeClass('hidden');
                            }
                            $('#clearFilters').removeClass('hidden');
                        }
                    });
                }else{
                    jQuery(".view-filter-btns a span").each(function(index) {
                        if (buildFilterRegex(jQuery(this).text().trim()) == rememberedFilterTerm) {
                            var filterValue = jQuery(this).data('value');
                            var filterStatusClass = jQuery(this).data('status-class');
                            var filterStatusColor = jQuery(this).parent().data('status-color'); 
                            
                            $(this).closest('li').addClass('active');
                            $(this).closest('.view-filter-btns').find('.dropdown-toggle span:not(.status)').text(jQuery(this).text());
                            if (filterStatusColor != undefined) {
                                $(this).closest('.view-filter-btns').find('.dropdown-toggle span.status').attr('style','--status-color:'+filterStatusColor).removeClass('hidden');
                            } 
                            else {
                                $(this).closest('.view-filter-btns').find('.dropdown-toggle span.status').addClass('status-'+filterStatusClass).removeClass('hidden');
                            }
                            $('#clearFilters').removeClass('hidden');
                        }
                    });
                }
            }
            {/if}
            alreadyReady = true;
            if ($('#table-search').length > 0 && $('.dataTables_filter').length > 0){
                var searchTableVal = $('.dataTables_filter input').val();
                $('#table-search').val(searchTableVal);
                var searchVal = $('#table-search').val();
                table.search(searchVal, true).draw();
            }
            var searchTimeout = null;
            $('#table-search').on('keyup', function () {
               {if isset($RSThemes.addonSettings.enable_table_ajax_load) && $RSThemes.addonSettings.enable_table_ajax_load == "enabled"}  
                    clearTimeout(searchTimeout);
                    searchTimeout = setTimeout(() => {
                        table.search(this.value, true).draw();
                    }, 500);
                {else}
                    table.search(this.value, true).draw();
               {/if}
            });
            table.on('draw.dt', function () {
                $('body').find('input:not(.icheck-input):not(.switch__checkbox)').iCheck({
                    checkboxClass: 'checkbox-styled',
                    radioClass: 'radio-styled',
                    increaseArea: '40%'
                });
                checkAll();
                {if isset($RSThemes.addonSettings.enable_table_ajax_load) && $RSThemes.addonSettings.enable_table_ajax_load == "enabled"}
                    $('.bottom-action-sticky').addClass('hidden');
                    $('#selectAll').iCheck('uncheck');
                {/if}
            });  
            {if isset($RSThemes.addonSettings.enable_table_ajax_load) && $RSThemes.addonSettings.enable_table_ajax_load == "enabled" && isset($tableIncludes)}
                table.on('preDraw', function () {
                    jQuery('.table-container').addClass('loading');
                    jQuery('#tableLoading').removeClass('hidden');
                });
            {/if}

            {if isset($RSThemes.addonSettings.enable_table_ajax_load) && $RSThemes.addonSettings.enable_table_ajax_load == "enabled" && isset($tableIncludes)}
                $('[data-inactive-services-checkbox]').on('change', function(){ldelim}
                    table.column(0).search("", true, false, false).draw();    
                {rdelim});
            {else}
                $('[data-inactive-services-checkbox]').on('change', function(){ldelim}
                    if ($(this)[0].checked === true) {ldelim}
                        table.column(0).search("lagomshowservice", true, false, false).draw();      
                    {rdelim}
                    else {ldelim}
                        table.column(0).search("", true, false, false).draw();    
                    {rdelim}
                {rdelim});
            
                {if $templatefile == "clientareaproducts"}
                    {if !$hideInactiveServices['inactiveServices'] && isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['hideInactiveServices'] == "1" && !empty($RSThemes['pages'][$templatefile]['config']['hideInactiveServicesStatus'])}
                        table.column(0).search("lagomshowservice", true, false, false).draw();    
                    {else}
                        table.column(0).search("", true, false, false).draw();     
                    {/if}
                {/if}
                {if $templatefile == "clientareadomains"}
                    {if !$hideInactiveServices['inactiveDomains'] && isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['hideInactiveServices'] == "1" && !empty($RSThemes['pages'][$templatefile]['config']['hideInactiveServicesStatus'])}
                        table.column(0).search("lagomshowservice", true, false, false).draw();    
                    {else}
                        table.column(0).search("", true, false, false).draw();     
                    {/if}
                {/if}
            {/if}



            $('.view-filter-btns .dropdown-menu a').on('click', function(e) {
                e.preventDefault();

                var filterName = $(this).find('span').data('value'),
                    filterText = $(this).text();

                if (filterName !== 'all') {
                    $('#clearFilters').removeClass('hidden');
                    $('.view-filter-btns > .btn > .filter-name').text(filterText);
                } else {
                    $('#clearFilters').addClass('hidden');
                    $('.view-filter-btns > .btn > .filter-name').text('{$rslang->trans('generals.all_entries')}');
                }
            });

            $('#clearFilters').on('click', function() {
                table.state.clear();
                table.search('').columns().search('').draw();
                $('#clearFilters').addClass('hidden');
                $('.view-filter-btns > .btn > .filter-name').text('{$rslang->trans('generals.all_entries')}');
                $('.view-filter-btns .dropdown-toggle .status').addClass('hidden');
                $('.view-filter-btns .dropdown-toggle .status-icon').find('svg').remove();
                $('.view-filter-btns ul li').removeClass('active');
            });

            let defaultFilters = $('[data-default-filter]');
            if (defaultFilters.length){
                let setFilter = defaultFilters.data('defaultFilter');
                let defaultTarget = $('.view-filter-btns .dropdown-menu').find('li[data-status="'+setFilter+'"]');
                if (defaultTarget.length){
                    defaultTarget.find('a').trigger('click');
                }
            }

            {rdelim});
    </script>
{/if}