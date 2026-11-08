<div class="sidebar-collapsed visible-xs visible-sm clearfix">

    <div class="pull-left form-inline">
        <form>
            <select class="form-control custom-select" onchange="selectChangeNavigate(this)">
                {assign var='hasCurrent' value=false}
                {foreach $secondarySidebar as $optgroup}
                    <optgroup label="{$optgroup->getLabel()}">
                        {foreach $optgroup->getChildren() as $child}
                        <option menuItemName="{$child->getName()}" value="{$child->getUri()}" class="list-group-item" {if $child->isCurrent()}selected="selected"{/if}>
                           {$child->getLabel()}

                           {if $child->hasBadge()}
                               ({$child->getBadge()})
                           {/if}
                        </option>
                        {if !$hasCurrent and $child->isCurrent()}
                           {assign var='hasCurrent' value=true}
                        {/if}
                        {/foreach}
                    </optgroup>
                {/foreach}
                {if !$hasCurrent}
                    <option value="" class="list-group-item" selected=""selected>- {lang key="cartchooseanothercategory"} -</option>
                {/if}
            </select>
        </form>
    </div>

    {if !$loggedin && $currencies}
        <div class="pull-right form-inline">
            <form method="post" action="cart.php{if $action}?a={$action}{if $domain}&domain={$domain}{/if}{elseif $gid}?gid={$gid}{/if}">
                <select name="currency" onchange="submit()" class="form-control">
                    <option value="">{$LANG.choosecurrency}</option>
                    {foreach from=$currencies item=listcurr}
						<option value="{$listcurr.id}"{if $listcurr.id == $currency.id} selected{/if}>{$listcurr.code}</option>
                    {/foreach}
                </select>
            </form>
        </div>
    {/if}

</div>
