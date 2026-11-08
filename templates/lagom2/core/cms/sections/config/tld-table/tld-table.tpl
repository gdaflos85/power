{* {assign var="includeDomainsTableScript" value=true scope="parent"}

{assign var=darkIcons value=false}
{if ($theme == "primary" || $theme == "secondary") && $tld_list_style != "boxed"}
    {assign var=darkIcons value=true}
{/if}
*}
<div class="site-section section-title-above section-features section-features-tlds section-{$theme} {if $overlay} section-overlay{/if} {if $combined}section-combined{/if} {if $custom_class} {$custom_class}{/if}">
    {include file="{$smarty.current_dir}/../../common/anchor.tpl"} 
    <div class="container {if $display_tlds_slider}container-slider{/if} {if $tlds_slider_type == "screen-slider"}full-screen-slider{/if}">
        {if $caption}
            <span class="section-caption">{$caption|unescape:'html'}</span>
        {/if}
        {if $title}
            <h2 class="section-title">{$title|unescape:'html'}</h2>
        {/if}
        {if $subtitle}
            <div class="section-subtitle">{$subtitle|unescape:'html'}</div>
        {/if}
        <div class="section-content section-tld-table">
            <div class="table-container dtTable {if $tld_table_style == "bordered"}is-bordered{elseif $tld_table_style == "boxed"}is-boxed{/if}">
                {if false}
                    <div class="tld-categories">
                        {assign var=firstCat value=$tldCategories|@key}
                        <select class="form-control " id="domain-filter">
                            {* <option value="All" selected>{lang key='all'}</option> *}
                            {foreach $tldCategories as $category => $count key=key}
                                {* <option value="{$category}" {if $category == $firstCat}{/if}>{lang key="domainTldCategory.$category" defaultValue=$category} ({$count})</option> *}
                                <option value="{$category}" {if $category == $firstCat}{/if}> ({$count})</option>
                            {/foreach}
                        </select>
                    </div>
                {/if}
                <table 
                    id="domains-table-{$sectionId}" 
                    class="table tld-table invisible" 
                    data-ajax-url="{$WEB_ROOT}/modules/addons/RSThemes/src/Api/clientApi.php?controller=Tld&method=getTldList&columns={if $show_register_column == "1"}register{/if}{if $show_transfer_column == "1"},transfer{/if}{if $show_renewal_column == "1"},renew{/if}{if $show_dns_management_column == "1"},dns_management{/if}{if $show_email_forwarding_column == "1"},email_forwarding{/if}{if $show_id_protection_column == "1"},idprot{/if}{if $show_dns_management_column == "1"},dns{/if}{if $show_email_forwarding_column == "1"},email{/if}" 
                    data-items-per-page="{$domains_per_page}"
                    data-items-currency-prefix=""
                    data-table-id="{$sectionId}"
                    data-lang-empty-table="{$LANG.norecordsfound}"
                    data-lang-info="{$LANG.tableshowing}"
                    data-lang-info-empty="{$LANG.tableempty}"
                    data-lang-info-filtered="{$LANG.tablefiltered}"
                    data-lang-lenght-menu="{$LANG.tablelength}"
                    data-lang-loading-records="{$LANG.tableloading}"
                    data-lang-paginate-first="{$LANG.tablepagesfirst}"
                    data-lang-paginate-last="{$LANG.tablepageslast}"
                    data-lang-paginate-next="{$LANG.tablepagesnext}"
                    data-lang-paginate-previous="{$LANG.tablepagesprevious}"
                    data-lang-search-tld="{$rslang->trans('tld.search_tlds')}"

                >
                    <thead>
                        <tr>
                            <th>{$rslang->trans('tld.tld')}<span class="sorting-arrows"></span></th> 
                            {if $show_register_column == "1"}
                                <th>{$LANG.domainsregister}<span class="sorting-arrows"></span></th>
                            {/if}    
                            {if $show_transfer_column == "1"}
                                <th>{$LANG.domainrenewalprice}<span class="sorting-arrows"></span></th>
                            {/if}
                            {if $show_renewal_column == "1"}    
                                <th>{$LANG.domainstransfer}<span class="sorting-arrows"></span></th>
                            {/if}
                            {if $show_dns_management_column == "1"}
                                <th>{$LANG.domaindnsmanagement}<span class="sorting-arrows"></span></th>
                            {/if}
                            {if $show_email_forwarding_column == "1"}
                                <th>{$LANG.domainemailforwarding}<span class="sorting-arrows"></span></th>
                            {/if}
                            {if $show_id_protection_column == "1"}    
                                <th>{$LANG.domainidprotection}<span class="sorting-arrows"></span></th>
                            {/if}    
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
                <div class="loader loader-table-domains ">
                    {include file="{$smarty.current_dir}/../../../../../includes/common/loader.tpl"}  
                </div>
            </div> 
        </div>    
        {if $buttons} 
            <div class="section-actions">
                <div class="section-actions-buttons">
                    {foreach $buttons as $button}
                        {include file="{$smarty.current_dir}/../../common/button.tpl"}
                    {/foreach}
                </div>
            </div>
        {/if}
    </div>   
</div> 