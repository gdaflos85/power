<!-- Re-load theme options -->
{include file="$template/includes/theme-options.tpl"}
{include file="orderforms/$carttpl/cart-options.tpl"}
{if $invalid}
    <div class="alert alert-warning">
        {if $reason}
            {$reason}
        {else}
            {$LANG.cartdomaininvalid}
        {/if}
    </div>
    {if $smarty.request.cancelbtn}
		<div class="text-center">
            <button type="button" class="btn btn-default res-100" onclick="cancelcheck();return false">{$LANG.carttryanotherdomain}</button>
		</div>
	{/if}
{elseif $alreadyindb}
    <div class="alert alert-warning">
        {$LANG.cartdomainexists}
    </div>
    {if $smarty.request.cancelbtn}
		<div class="text-center">
            <button type="button" class="btn btn-default res-100" onclick="cancelcheck();return false">{$LANG.carttryanotherdomain}</button>
		</div>
	{/if}
{else}

    {if $checktype=="register" && $regenabled}

        <input type="hidden" name="domainoption" value="register" />

        {if $status eq "available" || $status eq "error"}

            <div class="alert alert-success domain-result">
	            <i class="fas fa-2x fa-check"></i> <span class="results-text"><strong>{$domain}</strong> {$LANG.domainavailable2}</span>
            </div>

        	<br />

            <input type="hidden" name="domains[]" value="{$searchResults.domainName}" />
            <input type="hidden" name="domainsregperiod[{$domain}]" value="{$searchResults.shortestPeriod.period}" />
            <div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">{$LANG.register} {$searchResults.domainName}</h3>
				</div>
	            <div class="panel-body">
					<div class="text-center">
		                <br />
			            {if count($searchResults.pricing) == 1}
			                <p class="margin-bottom">{$LANG.cartregisterhowlong}</p>
			                <button type="button" class="btn btn-default btn-sm">
			                    <span class="far fa-shopping-cart"></span>
								{$searchResults.shortestPeriod.period} {$LANG.orderyears} @ {$searchResults.shortestPeriod.register}
			                </button>
			                <br />
			            {else}
			                <h4 class="margin-bottom">{$LANG.cartregisterhowlong}</h4>
			                <br />
			                <div class="btn-group btn-group-sm margin-bottom">
			                    <button type="button" class="btn btn-default btn-sm">
			                        <span name="{$searchResults.domainName}-selected-price">
			                            <b class="far fa-shopping-cart"></b>
			                            {$searchResults.shortestPeriod.period} {$LANG.orderyears} @ {$searchResults.shortestPeriod.register}
			                        </span>
			                    </button>
			                    <button type="button" class="btn btn-default btn-sm dropdown-toggle additional-options" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                        <b class="caret"></b>
			                        <span class="sr-only">
			                            {lang key="domainChecker.additionalPricingOptions" domain=$searchResults.domainName}
			                        </span>
			                    </button>
			                    <ul class="dropdown-menu" role="menu">
			                        {foreach $searchResults.pricing as $years => $price}
			                            <li>
			                                <a href="#" onclick="selectDomainPricing('{$searchResults.domainName}', '{$price.register}', {$years}, '{$LANG.orderyears}');return false;">
			                                    <b class="far fa-shopping-cart"></b>
			                                    {$years} {$LANG.orderyears} @ {$price.register}
			                                </a>
			                            </li>
			                        {/foreach}
			                    </ul>
			                </div>
			                <br />
						{/if}
		                <br />
					</div>
				</div>
			</div>
            {assign var='continueok' value=true}
        {elseif $status eq "unavailable"}
        	<div class="alert alert-danger">
				<i class="fas fa-2x fa-times"></i> <span class="results-text"><strong>{$domain}</strong> {$LANG.domainunavailable2}</span>
				<div class="clearfix"></div>
			</div>
        {/if}

    {elseif $checktype=="transfer" && $transferenabled}

        <input type="hidden" name="domainoption" value="transfer" />

        {if $status eq "available"}

        	<div class="alert alert-danger">
				<i class="fas fa-2x fa-times"></i> <span class="results-text"><strong>{$domain}</strong> {$LANG.domaintransfer} {$LANG.domainunavailable}</span>
				<div class="clearfix"></div>
			</div>

			<div class="text-center">
	            <p>{$LANG.carttransfernotregistered|sprintf2:$domain}.</p>
				<p class="text-center">{$LANG.orderForm.tryRegisteringInstead}</p>
			</div>

        {elseif $status eq "unavailable" || $status eq "error"}

        	<div class="alert alert-success domain-result">
				<i class="fas fa-2x fa-check"></i> <span class="results-text"><strong>{$domain}</strong> {$LANG.domaincheckertransferable}</span>
				<div class="clearfix"></div>
			</div>

            <div class="text-center">
                <p>{$LANG.carttransferpossible|sprintf2:$domain:$transferprice}</p>
                <br />
            </div>

            <input type="hidden" name="domains[]" value="{$domain}" />
            <input type="hidden" name="domainsregperiod[{$domain}]" value="{$transferterm}" />

            {assign var='continueok' value=true}

        {/if}

    {elseif $checktype=="owndomain" || $checktype=="subdomain"}

        <input type="hidden" name="domainoption" value="{$checktype}" />
        <input type="hidden" name="sld" value="{$sld}" />
        <input type="hidden" name="tld" value="{$tld}" />
        <script language="javascript">
            domainGotoNextStep();
        </script>

    {/if}

    {if $checktype=="register" && $searchResults.suggestions}
		<br />
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">{$LANG.domainssuggestions}</h3>
			</div>
            <div class="panel-body">
				<p>{$LANG.cartotherdomainsuggestions}</p>
				<br />
		        {foreach $searchResults.suggestions as $num => $result}
					<div class="row">
						<div class="col-xs-1">
				            <input type="hidden" name="domainsregperiod[{$result.domainName}]" value="{$result.shortestPeriod.period}" />
							<input type="checkbox" name="domains[]" value="{$result.domainName}" id="domainSuggestion{$num}" class="icheck suggested-domains" />
							<br /><br />
						</div>
						<div class="col-xs-11">
							<label class="pull-left" for="domainSuggestion{$num}">{$result.domainName}</label>
							<div class="pull-right">
		                    {if count($result.pricing) > 1}
		                        <div class="btn-group domain-suggestion-pricing">
		                    {/if}
			                    <button type="button" class="btn btn-default btn-sm" onclick="selectDomainPricing('{$result.domainName}', '{$result.shortestPeriod.register}', {$result.shortestPeriod.period}, '{$LANG.orderyears}', '{$num}')">
			                        <span name="{$result.domainName}-selected-price">
			                            <b class="far fa-shopping-cart"></b>
			                            {$result.shortestPeriod.period} {$LANG.orderyears} @ {$result.shortestPeriod.register}
			                        </span>
			                    </button>
			                    {if count($result.pricing) > 1}
			                        <button type="button" class="btn btn-default btn-sm dropdown-toggle additional-options" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                            <b class="caret"></b>
			                            <span class="sr-only">
			                                {lang key="domainChecker.additionalPricingOptions" domain=$result.domainName}
			                            </span>
			                        </button>
			                        <ul class="dropdown-menu" role="menu">
			                            {foreach $result.pricing as $years => $price}
			                                <li>
			                                    <a href="#" onclick="selectDomainPricing('{$result.domainName}', '{$price.register}', {$years}, '{$LANG.orderyears}', '{$num}');return false;">
			                                        <b class="far fa-shopping-cart"></b>
			                                        {$years} {$LANG.orderyears} @ {$price.register}
			                                    </a>
			                                </li>
			                            {/foreach}
			                        </ul>
			                        </div>
			                    {/if}
		                    </div>
		                </div>
					</div>
		        {/foreach}
			</div>
        </div>
        {assign var='continueok' value=true}
    {/if}
    {if $continueok}
    	<br />
	    {if $checktype=="register"}
	        <div class="alert alert-info info-text-sm">
	            <i class="fas fa-info-circle"></i>
	            {$LANG.orderForm.domainAvailabilityCached}
	        </div>
	        <br />
		{/if}
		{if $smarty.request.cancelbtn}
			<div>
				<button type="submit" class="btn btn-primary btn-3d btn-lg">
	                {$LANG.continue}
	                &nbsp;<i class="fas fa-arrow-circle-right"></i>
	            </button>
	            <button type="button" class="btn btn-default pull-right res-left res-100" onclick="cancelcheck();return false">{$LANG.cancel}</button>
			</div>
		{else}
	        <div class="text-center">
	            <button type="submit" class="btn btn-primary btn-3d btn-lg">
	                {$LANG.continue}
	                &nbsp;<i class="fas fa-arrow-circle-right"></i>
	            </button>
	        </div>
        {/if}
    {else}
    	{if $smarty.request.cancelbtn}
			<div class="text-center">
	            <button type="button" class="btn btn-default res-100" onclick="cancelcheck();return false">{$LANG.carttryanotherdomain}</button>
			</div>
		{/if}
    {/if}
{/if}
<br />
{include file="orderforms/$carttpl/icheck.tpl"}
