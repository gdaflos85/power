<div class="alert alert-success text-center" role="alert">{$LANG.greppproducts.domainavailable|sprintf:$vars.domain}</div>

<form class="form" action="clientarea.php" method="post">
    <input type="hidden" name="action" value="productdetails">
    <input type="hidden" name="id" value="{$vars.serviceId}">
    <input type="hidden" name="modop" value="custom">
    <input type="hidden" name="a" value="Register">
    <input type="hidden" name="Domain" value="{$vars.domain}">
    <div class="form-group">
        <label for="Registrant">{$LANG.domaincontactdetails.Registrant}</label>
        <select class="form-control" id="Registrant" name="Registrant">
            <option value="{$vars.client.id}-{$vars.client.clientid}">{$vars.client.lastname} {$vars.client.firstname}, {$vars.client.companyname}, {$vars.client.address1}, {$vars.client.address2}, {$vars.client.city}, {$vars.client.phonenumber}, {$vars.client.email}</option>
            {foreach from=$vars.contacts item=contact}
                <option value="{$contact->id}-{$contact->clientid}">{$contact->lastname} {$contact->firstname}, {$contact->companyname}, {$contact->address1}, {$contact->address2}, {$contact->city}, {$contact->phonenumber}, {$contact->email}</option>
            {/foreach}
        </select>
    </div>
    <div class="form-group">
        <label for="Nameserver 1">{$LANG.domainnameserver1}</label>
        <input type="text" class="form-control" id="Nameserver 1" name="Nameserver 1"{if $vars.defaultNS[0]} value="{$vars.defaultNS[0]}"{/if}>
    </div>
    <div class="form-group">
        <label for="Nameserver 2">{$LANG.domainnameserver2}</label>
        <input type="text" class="form-control" id="Nameserver 2" name="Nameserver 2"{if $vars.defaultNS[1]} value="{$vars.defaultNS[1]}"{/if}>
    </div>
    <div class="form-group">
        <button type="submit" class="btn btn-primary">{$LANG.confirm}</button>
    </div>
</form>