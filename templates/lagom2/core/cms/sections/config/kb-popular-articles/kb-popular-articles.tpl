<div class="site-section section-kb-articles section-{$theme}{if $custom_class} {$custom_class}{/if}">
    {include file="{$smarty.current_dir}/../../common/anchor.tpl"} 
    <div class="container">
        {if $title}
            <h2 class="section-title">{$title|unescape:'html'}</h2>
        {/if}
        {if $subtitle}
            <div class="section-subtitle">{$subtitle|unescape:'html'}</div>
        {/if}
        <div class="section-content m-w-lg m-a">
            {if isset($kbMostViews) && is_array($kbMostViews)}
                <div class="list-group {if $list_style == "Boxed"}list-group-boxed{elseif $list_style == "Bordered"}list-group-bordered{/if} has-icon">
                    {foreach from=$kbMostViews item=kbarticle}
                        <a href="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}" class="list-group-item has-icon">
                            <div class="list-group-item-body">
                                <span class="list-group-item-heading">{$kbarticle.title}</span>
                            </div>
                            <i class="list-group-item-icon ls ls-right"></i>
                        </a>
                    {/foreach}
                </div>
            {/if}
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