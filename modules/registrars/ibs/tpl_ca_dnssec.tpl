{assign "ttlheadlinekey" "domainDnsSec.ttl"}
{assign "ttlheadline" Lang::trans($ttlheadlinekey)}
{if $ttlheadline === $ttlheadlinekey} {assign "ttlheadline" "TTL"} {/if}

<div class="card">
    <div class="card-body">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="card-title mb-0">
                {Lang::trans("domainDnsSec.management")}
                {if $disabled}
                    <span class="label label-default ml-2">{Lang::trans("disabled")}</span>
                {else}
                    <span class="label label-success ml-2">{Lang::trans("enabled")}</span>
                {/if}
            </h3>
        </div>

        {if $successful}
            <div class="alert alert-success alert-dismissible fade show p-4" role="alert"
                style="border-left: 5px solid #28a745; background-color: #e9f7ef;">
                <div class="d-flex align-items-center">
                    <div>
                        <span style="font-size: 14px;">
                            {Lang::trans("changessavedsuccessfully")}
                        </span>
                    </div>
                </div>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"
                    style="position: absolute; top: 10px; right: 10px;">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        {/if}

        {if $error}
            <div class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="alert">
                    <span aria-hidden="true">&times;</span>
                </button>
                {$error}
            </div>
        {/if}

        <div class="alert alert-info alert-dismissible">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">&times;</span>
            </button>
            {Lang::trans("domainDnsSec.warning")}
        </div>

        <form method="POST" action="" class="form-horizontal" id="dnsSecForm">
            <input type="hidden" name="action" value="domaindetails" />
            <input type="hidden" name="modop" value="custom" />
            <input type="hidden" name="a" value="dnssec" />
            <input type="hidden" name="domainid" value="{$domainid}" />

            {if $supports_ds_data}
                <div class="section">
                    <h4 class="section-heading">
                        <i class="fas fa-key"></i> {Lang::trans("domainDnsSec.dsRecords")}
                    </h4>
                    <div class="table-container">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    {if $supportsTTL}
                                        <th class="text-center" width="100">
                                            <i class="fas fa-clock" data-toggle="tooltip" title="{$ttlheadline}"></i> {$ttlheadline}
                                        </th>
                                    {/if}
                                    <th width="120">{Lang::trans("domainDnsSec.keyTag")}</th>
                                    <th width="220">{Lang::trans("domainDnsSec.algorithm")}</th>
                                    <th width="180">{Lang::trans("domainDnsSec.digestType")}</th>
                                    <th>{Lang::trans("domainDnsSec.digest")}</th>
                                </tr>
                            </thead>
                            <tbody class="ds-records">
                                {foreach item=ds from=$secdnsds name=secdnsds}
                                    <tr>
                                        {if $supportsTTL}
                                            <td>
                                                <div class="input-group">
                                                    <input class="form-control" type="text"
                                                        name="SECDNS-DS[{$smarty.foreach.secdnsds.index}][ttl]" value="{$ds.ttl}">
                                                </div>
                                            </td>
                                        {/if}
                                        <td>
                                            <div class="input-group">
                                                <input class="form-control" type="text"
                                                    name="SECDNS-DS[{$smarty.foreach.secdnsds.index}][keytag]"
                                                    value="{$ds.keytag}">
                                            </div>
                                        </td>
                                        <td>
                                            <select name="SECDNS-DS[{$smarty.foreach.secdnsds.index}][alg]"
                                                class="form-control">
                                                {foreach $algOptions as $val => $name}
                                                    {if $val eq ""}
                                                        <option value="{$val}">{$name}</option>
                                                    {else}
                                                        <option value="{$val}" {if $val eq $ds.alg} selected{/if}>[{$val}]
                                                            {$name}
                                                        </option>
                                                    {/if}
                                                {/foreach}
                                            </select>
                                        </td>
                                        <td>
                                            <select name="SECDNS-DS[{$smarty.foreach.secdnsds.index}][digesttype]"
                                                class="form-control">
                                                {foreach $digestOptions as $val => $name}
                                                    {if $val eq ""}
                                                        <option value="{$val}">{$name}</option>
                                                    {else}
                                                        <option value="{$val}" {if $val eq $ds.digesttype} selected{/if}>
                                                            [{$val}]
                                                            {$name}</option>
                                                    {/if}
                                                {/foreach}
                                            </select>
                                        </td>
                                        <td>
                                            <div class="input-group">
                                                <input class="form-control" type="text"
                                                    name="SECDNS-DS[{$smarty.foreach.secdnsds.index}][digest]"
                                                    value="{$ds.digest}">
                                            </div>
                                        </td>
                                    </tr>
                                {/foreach}
                                <tr>
                                    {if $supportsTTL}
                                        <td>
                                            <div class="input-group">
                                                <input class="form-control" type="text"
                                                    name="SECDNS-DS[{$smarty.foreach.secdnsds.index+1}][ttl]" value=""
                                                    placeholder="86400">
                                            </div>
                                        </td>
                                    {/if}
                                    <td>
                                        <div class="input-group">
                                            <input class="form-control" type="text"
                                                name="SECDNS-DS[{$smarty.foreach.secdnsds.index+1}][keytag]" value="">
                                        </div>
                                    </td>
                                    <td>
                                        <select name="SECDNS-DS[{$smarty.foreach.secdnsds.index+1}][alg]"
                                            class="form-control">
                                            {foreach $algOptions as $val => $name}
                                                {if $val eq ""}
                                                    <option value="{$val}">{$name}</option>
                                                {else}
                                                    <option value="{$val}">[{$val}] {$name}</option>
                                                {/if}
                                            {/foreach}
                                        </select>
                                    </td>
                                    <td>
                                        <select name="SECDNS-DS[{$smarty.foreach.secdnsds.index+1}][digesttype]"
                                            class="form-control">
                                            {foreach $digestOptions as $val => $name}
                                                {if $val eq ""}
                                                    <option value="{$val}">{$name}</option>
                                                {else}
                                                    <option value="{$val}">[{$val}] {$name}</option>
                                                {/if}
                                            {/foreach}
                                        </select>
                                    </td>
                                    <td>
                                        <div class="input-group">
                                            <input class="form-control" type="text"
                                                name="SECDNS-DS[{$smarty.foreach.secdnsds.index+1}][digest]" value="">
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <button type="button" class="btn btn-sm btn-default add-record">
                        <i class="fas fa-plus"></i> Add New DS Key
                    </button>
                </div>
            {/if}

            {if $supports_key_data}
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">{Lang::trans("domainDnsSec.keyRecords")}</h4>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        {if $supportsTTL}<th style="width:100px;">{$ttlheadline}</th>{/if}
                                        <th style="width:250px;">{Lang::trans("domainDnsSec.flags")}</th>
                                        <th style="width:250px;">{Lang::trans("domainDnsSec.algorithm")}</th>
                                        <th>{Lang::trans("domainDnsSec.publicKey")}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach item=key from=$secdnskey name=secdnskey}
                                        <tr>
                                            {if $supportsTTL}
                                                <td>
                                                    <div class="input-group">
                                                        <input class="form-control" type="text"
                                                            name="SECDNS-KEY[{$smarty.foreach.secdnskey.index}][ttl]"
                                                            value="{$key.ttl}">
                                                    </div>
                                                </td>
                                            {/if}
                                            <td>
                                                <select name="SECDNS-KEY[{$smarty.foreach.secdnskey.index}][flags]"
                                                    class="form-control">
                                                    {foreach $flagOptions as $val => $name}
                                                        {if $val eq ""}
                                                            <option value="{$val}">{$name}</option>
                                                        {else}
                                                            <option value="{$val}" {if $val eq $key.flags} selected{/if}>
                                                                [{$val}]
                                                                {$name}</option>
                                                        {/if}
                                                    {/foreach}
                                                </select>
                                            </td>
                                            <td>
                                                <select name="SECDNS-KEY[{$smarty.foreach.secdnskey.index}][alg]"
                                                    class="form-control">
                                                    {foreach $algOptions as $val => $name}
                                                        {if $val eq ""}
                                                            <option value="{$val}">{$name}</option>
                                                        {else}
                                                            <option value="{$val}" {if $val eq $key.alg} selected{/if}>[{$val}]
                                                                {$name}
                                                            </option>
                                                        {/if}
                                                    {/foreach}
                                                </select>
                                            </td>
                                            <td>
                                                <div class="input-group">
                                                    <input class="form-control" type="text"
                                                        name="SECDNS-KEY[{$smarty.foreach.secdnskey.index}][pubkey]"
                                                        value="{$key.pubkey}">
                                                </div>
                                            </td>
                                        </tr>
                                    {/foreach}
                                    <tr>
                                        {if $supportsTTL}
                                            <td>
                                                <div class="input-group">
                                                    <input class="form-control" type="text"
                                                        name="SECDNS-KEY[{$smarty.foreach.secdnskey.index+1}][ttl]"
                                                        value="86400" placeholder="86400">
                                                </div>
                                            </td>
                                        {/if}
                                        <td>
                                            <select name="SECDNS-KEY[{$smarty.foreach.secdnskey.index+1}][flags]"
                                                class="form-control">
                                                {foreach $flagOptions as $val => $name}
                                                    {if $val eq ""}
                                                        <option value="{$val}">{$name}</option>
                                                    {else}
                                                        <option value="{$val}">[{$val}] {$name}</option>
                                                    {/if}
                                                {/foreach}
                                            </select>
                                        </td>
                                        <td>
                                            <input name="SECDNS-KEY[{$smarty.foreach.secdnskey.index+1}][protocol]"
                                                type="hidden" value="3" />
                                            <select name="SECDNS-KEY[{$smarty.foreach.secdnskey.index+1}][alg]"
                                                class="form-control">
                                                {foreach $algOptions as $val => $name}
                                                    {if $val eq ""}
                                                        <option value="{$val}">{$name}</option>
                                                    {else}
                                                        <option value="{$val}">[{$val}] {$name}</option>
                                                    {/if}
                                                {/foreach}
                                            </select>
                                        </td>
                                        <td>
                                            <div class="input-group">
                                                <input class="form-control" type="text"
                                                    name="SECDNS-KEY[{$smarty.foreach.secdnskey.index+1}][pubkey]" value="">
                                                <span class="input-group-addon">*</span>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <p class="help-block">* = {Lang::trans("domainDnsSec.publicKeyNoSpace")}</p>
                    </div>
                </div>
            {/if}

            <div class="form-actions text-center">
                <div class="pull-right">
                    <button type="submit" name="saveChanges" class="btn btn-primary" value="save">
                        <i class="fas fa-save"></i> {Lang::trans('clientareasavechanges')}
                    </button>
                    {if !$disabled}
                        <button type="button" class="btn btn-danger" onclick="confirmDisable()">
                            <i class="fas fa-power-off"></i> {Lang::trans('disable')}
                        </button>
                    {/if}
                </div>
            </div>
        </form>
    </div>
</div>

<div class="modal fade dnssec-modal" id="modalDisableDNSSEC" tabindex="-1" role="dialog"
    aria-labelledby="modalDisableDNSSECLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header dnssec-modal-header">
                <h4 class="modal-title dnssec-modal-title" id="modalDisableDNSSECLabel">
                    {Lang::trans("domainDnsSec.management")}</h4>
                <button type="button" class="close dnssec-modal-close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body dnssec-modal-body">
                <div class="alert alert-warning" style="margin-bottom:0;">
                    Are you sure you want to disable DNSSEC for this domain? This action may affect domain resolution.
                </div>
            </div>
            <div class="modal-footer dnssec-modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    <i class="fas fa-times"></i> Cancel
                </button>
                <button type="button" class="btn btn-danger" name="disableDnssec" id="btnConfirmDisable">
                    <i class="fas fa-power-off"></i> Disable DNSSEC
                </button>
            </div>
        </div>
    </div>
</div>

<style>
    .dnssec-modal-title {
        text-align: left !important;
        width: 100%;
        display: block;
        margin-right: 40px;
        /* space for close button */
    }

    .dnssec-modal-close {
        position: absolute;
        right: 15px;
        top: 15px;
        z-index: 10;
    }

    .dnssec-modal-header {
        position: relative;
        padding-right: 40px;
        /* space for close button */
    }

    .dnssec-modal-footer {
        text-align: right !important;
    }
</style>

<script>
    $(document).ready(function() {
        $('[data-toggle="tooltip"]').tooltip();

        // Add record button functionality
        $('.add-record').click(function() {
            var newRow = $(this).closest('.section').find('tbody tr:last').clone();
            newRow.find('input[type="text"]').val('');
            newRow.find('select').prop('selectedIndex', 0);
            $(this).closest('.section').find('tbody').append(newRow);
        });

        // Handle disable button click
        $('[onclick="confirmDisable()"]').removeAttr('onclick').click(function(e) {
            e.preventDefault();
            $('#modalDisableDNSSEC').modal('show');
        });

        // Handle modal confirm button
        $('#btnConfirmDisable').click(function() {
            $('#modalDisableDNSSEC').modal('hide');
            $('<input>').attr({
                type: 'hidden',
                name: 'disableDnssec',
                value: 'on'
            }).appendTo('#dnsSecForm');
            $('#dnsSecForm').submit();
        });

    });
</script>