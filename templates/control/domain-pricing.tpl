<div class="domain-pricing">
    
    {if $featuredTlds}
        <div class="featured-tlds-container">
            <div class="row">
                {foreach $featuredTlds as $num => $tldinfo}
                    {if $num % 3 == 0 && (count($featuredTlds) - $num < 3)}
                        {if count($featuredTlds) - $num == 2}
                            <div class="col-sm-2"></div>
                        {else}
                            <div class="col-sm-4"></div>
                        {/if}
                    {/if}
                    <div class="col-sm-4 col-xs-6">
                        <div class="featured-tld">
                            <div class="img-container">
                                <img src="{$BASE_PATH_IMG}/tld_logos/{$tldinfo.tldNoDots}.png">
                            </div>
                            <div class="price {$tldinfo.tldNoDots}">
                                {if is_object($tldinfo.register)}
                                    {$tldinfo.register->toPrefixed()}{if $tldinfo.period > 1}{lang key="orderForm.shortPerYears" years={$tldinfo.period}}{else}{lang key="orderForm.shortPerYear" years=''}{/if}
                                {else}
                                    {lang key="domainregnotavailable"}
                                {/if}
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>
        </div>
    {/if}

    {include file="$template/includes/tablelist.tpl" tableName="DomainPricing" noOrdering=true}

    <script type="text/javascript">
        jQuery(document).ready(function(){
            var table = jQuery('#tableDomainPricing').DataTable();
            {if $orderby == 'date'}
                table.order(0, '{$sort}');
            {elseif $orderby == 'subject'}
                table.order(1, '{$sort}');
            {/if}
            table.draw();
            jQuery('.tld-filters a').unbind();
            jQuery('.tld-filters a').click(function(e) {
                e.preventDefault();
                if (jQuery(this).hasClass('label-success')) {
                    jQuery('#tableDomainPricing_wrapper input[type="search"]').val('').trigger('keyup');
                    jQuery('.tld-filters a').removeClass('label-success');
                } else {
                    jQuery('#tableDomainPricing_wrapper input[type="search"]').val(jQuery(this).data('category')).trigger('keyup');
                    jQuery('.tld-filters a').removeClass('label-success');
                    jQuery(this).addClass('label-success');
                }
            });
        });
    </script>

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">{lang key='pricing.browseExtByCategory'}</h3>
        </div>
        <div class="panel-body">
            <div class="row">
                {if !$loggedin && $currencies}
                    <div class="col-lg-3 col-lg-push-9 col-md-4 col-md-push-8 col-sm-5 col-sm-push-7">
                        <form method="post" action="">
                            <select name="currency" class="form-control currency-selector" onchange="submit()">
                                <option>
                                    {lang key="changeCurrency"} ({$activeCurrency.prefix} {$activeCurrency.code})
                                </option>
                                {foreach $currencies as $currency}
                                    <option value="{$currency['id']}">
                                        {$currency['prefix']} {$currency['code']}
                                    </option>
                                {/foreach}
                            </select>
                            <br />
                        </form>
                    </div>
                {/if}
                <div class="tld-filters {if !$loggedin && $currencies}col-lg-9 col-lg-pull-3 col-md-8 col-md-pull-4 col-sm-7 col-sm-pull-5{else}col-sm-12{/if}">
                    {foreach $tldCategories as $category => $count}
                        <a href="#" data-category="{$category}" class="label label-default">{lang key="domainTldCategory.$category" defaultValue=$category} ({$count})</a>
                    {/foreach}
                </div>
            </div>
            <div class="table-container clearfix">
                <table class="table table-list" id="tableDomainPricing" width="100%">
                    <thead>
                        <tr>
                            <th>{lang key='domaintld'}</th>
                            <th>{lang key='category'}</th>
                            <th>{lang key='pricing.register'}</th>
                            <th>{lang key='pricing.transfer'}</th>
                            <th>{lang key='pricing.renewal'}</th>
                            <th>{lang key='gracePeriod'}</th>
                            <th>{lang key='redemptionPeriod'}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $pricing as $extension => $data}
                            <tr>
                                <td>
                                    {$extension}
                                    {if $data.group}
                                        <span class="tld-sale-group tld-sale-group-{$data.group}">
                                            {$data.group}!
                                        </span>
                                    {/if}
                                </td>
                                <td>
                                    {$data.categories[0]}
                                    <span class="hidden">
                                        {foreach $data.categories as $category}
                                            {$category}
                                        {/foreach}
                                    </span>
                                </td>
                                {foreach $data.register as $years => $price}
                                    <td>
                                        {if $price >= 0}
                                            {$price}<br>
                                            <small>{$years} {if $years > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</small>
                                        {else}
                                            <small>{lang key="domainregnotavailable"}</small>
                                        {/if}
                                    </td>
                                    {break}
                                {foreachelse}
                                    <td>-</td>
                                {/foreach}
                                {foreach $data.transfer as $years => $price}
                                    <td>
                                        {if $price >= 0}
                                            {$price}<br>
                                            <small>{$years} {if $years > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</small>
                                        {else}
                                            <small>{lang key="domainregnotavailable"}</small>
                                        {/if}
                                    </td>
                                    {break}
                                {foreachelse}
                                    <td>-</td>
                                {/foreach}
                                {foreach $data.renew as $years => $price}
                                    <td>
                                        {if $price >= 0}
                                            {$price}<br>
                                            <small>{$years} {if $years > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</small>
                                        {else}
                                            <small>{lang key="domainregnotavailable"}</small>
                                        {/if}
                                    </td>
                                    {break}
                                {foreachelse}
                                    <td>-</td>
                                {/foreach}
                                <td>
                                    {if is_null($data.grace_period)}
                                        -
                                    {else}
                                        {$data.grace_period.days} {lang key='domainrenewalsdays'}<br>
                                        <small>({$data.grace_period.price})</small>
                                    {/if}
                                </td>
                                <td>
                                    {if is_null($data.redemption_period)}
                                        -
                                    {else}
                                        {$data.redemption_period.days} {lang key='domainrenewalsdays'}<br>
                                        <small>({$data.redemption_period.price})</small>
                                    {/if}
                                </td>
                            </tr>
                        {foreachelse}
                            <tr>
                                <td colspan="7">{lang key="pricing.noExtensionsDefined"}</td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>