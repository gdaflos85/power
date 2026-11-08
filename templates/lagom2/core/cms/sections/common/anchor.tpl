{if file_exists("{$smarty.current_dir}/overwrites/anchor.tpl")}
    {include file="{$smarty.current_dir}/overwrites/anchor.tpl"}  
{else}
    {if isset($section_anchor) && $section_anchor != ""}
        <span class="anchor-target" id="{$section_anchor}"></span>
    {/if}    
{/if}