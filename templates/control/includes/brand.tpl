<!-- Show navbar brand -->
{if $itBrandDisplay eq "enabled"}
    {if $itBrandType eq "logo" && $itBrandLogoUrl}
        <a class="logo" href="{$WEB_ROOT}/index.php"><img alt="{$companyname}" src="{$itBrandLogoUrl}"></a>
    {else}
        {if $itBrandText}
            <a class="logo logotext" href="{$WEB_ROOT}/index.php">{$itBrandText}</a>
        {else}
            <a class="logo logotext" href="{$WEB_ROOT}/index.php">{$companyname}</a>
        {/if}
    {/if}
{/if}