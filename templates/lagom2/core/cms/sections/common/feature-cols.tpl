{if file_exists("{$smarty.current_dir}/overwrites/feature-cols.tpl")}
    {include file="{$smarty.current_dir}/overwrites/feature-cols.tpl"}  
{else}
    {* Cols desktop *}
    {if $featureColsDesktop == 1}
        {assign var="colDesktop" value="col-xl-12"}
    {elseif $featureColsDesktop == 2}
        {assign var="colDesktop" value="col-xl-6"}
    {elseif $featureColsDesktop == 3}
        {assign var="colDesktop" value="col-xl-4"}
    {elseif $featureColsDesktop == 4}
        {assign var="colDesktop" value="col-xl-3"}
    {elseif $featureColsDesktop == 5}
        {assign var="colDesktop" value="col-xl5"}
    {elseif $featureColsDesktop == 6}
        {assign var="colDesktop" value="col-xl-2"}
    {else}
        {assign var="colDesktop" value="col-xl-4"}
    {/if}

    {* cols tablet horizontal *}
    {if $featureColsTabH == 1}
        {assign var="colTabH" value="col-lg-12"}
    {elseif $featureColsTabH == 2}
        {assign var="colTabH" value="col-lg-6"}
    {elseif $featureColsTabH == 3}
        {assign var="colTabH" value="col-lg-4"}
    {elseif $featureColsTabH == 4}
        {assign var="colTabH" value="col-lg-3"}
    {elseif $featureColsTabH == 5}
        {assign var="colTabH" value="col-lg5"}
    {elseif $featureColsTabH == 6}
        {assign var="colTabH" value="col-lg-2"}
    {else}
        {assign var="colTabH" value="col-lg-4"}
    {/if}

    {* cols tablet vertical *}
    {if $featureColsTabV == 1}
        {assign var="colTabV" value="col-md-12"}
    {elseif $featureColsTabV == 2}
        {assign var="colTabV" value="col-md-6"}
    {elseif $featureColsTabV == 3}
        {assign var="colTabV" value="col-md-4"}
    {elseif $featureColsTabV == 4}
        {assign var="colTabV" value="col-md-3"}
    {elseif $featureColsTabV == 5}
        {assign var="colTabV" value="col-md5"}
    {elseif $featureColsTabV == 6}
        {assign var="colTabV" value="col-md-2"}
    {else}
        {assign var="colTabV" value="col-md-4"}
    {/if}

    {* cols tablet mobile *}
    {if $featureColsMob == 1}
        {assign var="colMob" value="col-12"}
    {elseif $featureColsMob == 2}
        {assign var="colMob" value="col-6"}
    {elseif $featureColsMob == 3}
        {assign var="colMob" value="col-4"}
    {elseif $featureColsMob == 4}
        {assign var="colMob" value="col-3"}
    {elseif $featureColsMob == 5}
        {assign var="colMob" value="col5"}
    {elseif $featureColsMob == 6}
        {assign var="colMob" value="col-2"}
    {else}
        {assign var="colMob" value="col-4"}
    {/if}

    {assign var="cols" value=[$colDesktop, $colTabH, $colTabV, $colMob] scope="parent"}
{/if}    