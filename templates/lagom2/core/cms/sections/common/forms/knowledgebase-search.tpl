{if file_exists("{$smarty.current_dir}/overwrites/knowledgebase-search.tpl")}
    {include file="{$smarty.current_dir}/overwrites/knowledgebase-search.tpl"}  
{else}
    <form 
        role="form" method="post" action="{routePath('knowledgebase-search')}"
    >
        {if $captcha}
            <script>
                {$captcha->getPageJs()}
            </script>
        {/if}
        <div class="domain-search-input search-group search-group-lg search-group-combined has-shadow {if $customClass}{$customClass}{/if}">
            <div class="search-field"  data-custom-tooltip data-placement="top" title="Please search phrase" data-trigger="manual">
                <input class="form-control" type="text" id="inputKnowledgebaseSearch" name="search" placeholder="{$LANG.howcanwehelp}" />
                <div class="search-field-icon">
                    {if file_exists("templates/$template/assets/svg-icon/custom/search-field-icon.tpl")}
                        {include file="{$smarty.current_dir}/../../../../../assets/svg-icon/custom/search-field-icon.tpl"}
                    {else}
                        <i class="lm lm-search"></i>
                    {/if}  
                </div>
            </div>
            <div class="search-group-btn">
                <button class="btn btn-primary" type="submit" id="btnKnowledgebaseSearch">{$LANG.search}</button>
            </div>
        </div>
    </form>
{/if}