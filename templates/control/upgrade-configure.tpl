<div class="upgrade">
    {if !$serviceToBeUpgraded && $errorMessage}
        <div class="alert alert-warning">
            {$errorMessage}
        </div>
    {else}
        <div class="panel panel-info panel-service-being-upgraded">
            <div class="panel-heading">
                <h3 class="panel-title">{lang key="upgradeService.serviceBeingUpgraded"}</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-sm-9">
                        <h4>
                            {if $serviceToBeUpgraded->isService()}
                                {$serviceToBeUpgraded->product->productGroup->name} - {$serviceToBeUpgraded->product->name}
                            {else}
                                {$serviceToBeUpgraded->productAddon->name}
                            {/if}
                        </h4>

                        {if $serviceToBeUpgraded->domain}
                            {$serviceToBeUpgraded->domain}
                        {elseif $serviceToBeUpgraded->isAddon() && $serviceToBeUpgraded->service->domain}
                            {$serviceToBeUpgraded->service->domain}
                        {else}
                            {lang key="noDomain"}
                        {/if}
                    </div>
                    <div class="col-sm-3 text-right">
                        <a href="{$WEB_ROOT}/clientarea.php?action=productdetails&id={if $serviceToBeUpgraded->isService()}{$serviceToBeUpgraded->id}{elseif $serviceToBeUpgraded->isAddon()}{$serviceToBeUpgraded->service->id}{/if}" class="btn btn-info">
                            {lang key="manage"}
                        </a>
                    </div>
                </div>
            </div>

        </div>

        {if $errorMessage}
            <div class="alert alert-warning">
                {$errorMessage}
            </div>
        {/if}



        <div class="panel panel-default">


                <div class="panel-heading">
                    <h3 class="panel-title">{lang key="upgradeService.chooseNew"}</h3>
                </div>

            <div class="panel-body">



                <div class="products row">
                    {foreach $upgradeProducts as $key => $product}
                        <div class="column col-sm-{if count($upgradeProducts) >= 3}4{else}6{/if}">
                            <div class="product">
                                <div class="header">
                                    <h4>
                                        {$product->name}
                                    </h4>
                                    <p>{$product->description}</p>
                                </div>
                                {if $product->id == $serviceToBeUpgraded->productId}
                                    <div class="current">
                                        {lang key="upgradeService.currentProduct"}
                                    </div>
                                {/if}
                                {if $product->productKey == $recommendedProductKey}
                                    <div class="recommended">
                                        {lang key="upgradeService.recommended"}
                                    </div>
                                {/if}
                                <ul>
                                    {foreach $product->features as $label => $value}
                                        <li>
                                            <span>{$label}</span>

                                            {if is_bool($value)}
                                                <i class="fas fa-{if $value}check{else}times{/if}"></i>
                                            {else}
                                                {$value}
                                            {/if}
                                        </li>
                                    {/foreach}
                                </ul>
                                <div class="footer">
                                    <form method="post" action="{routePath('upgrade-add-to-cart')}">
                                        <input type="hidden" name="isproduct" value="{$isService}">
                                        <input type="hidden" name="serviceid" value="{$serviceToBeUpgraded->id}">
                                        <input type="hidden" name="productid" value="{$product->id}">
                                        {if $allowMultipleQuantities}
                                            <div class="text-right">
                                                <label class="control-label">{lang key='orderForm.qty'}</label>
                                                <input type="number" name="qty" min="{$minimumQuantity}" value="{$currentQuantity}" class="form-control input-inline input-inline-100">
                                            </div>
                                        {/if}
                                        <select name="billingcycle" class="form-control">
                                            {foreach $product->pricing()->allAvailableCycles() as $cycle}
                                                {if is_null($permittedBillingCycles) || in_array($cycle->cycle(), $permittedBillingCycles)}
                                                    <option value="{$cycle->cycle()}">
                                                        {if $cycle->isRecurring()}
                                                            {if $cycle->isYearly()}
                                                                {$cycle->cycleInYears()}
                                                            {else}
                                                                {$cycle->cycleInMonths()}
                                                            {/if}
                                                            -
                                                        {/if}
                                                        {$cycle->toFullString()}
                                                    </option>
                                                {/if}
                                            {/foreach}
                                        </select>
                                        <button type="submit"  id="btnUpgradeSelect-{$product->productKey}" class="btn btn-primary btn-3d btn-block"{if !$product->eligibleForUpgrade} disabled="disabled"{/if}>
                                            {lang key="upgradeService.select"}
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        {if count($upgradeProducts) >= 3 && (($key + 1) % 3 == 0)}
                            </div>
                            <div class="products row">
                        {/if}
                    {/foreach}
                </div>
            </div>
        </div>
    {/if}
</div>
