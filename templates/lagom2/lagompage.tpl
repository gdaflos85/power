{if $templatefile == "homepage"}
    {$pageClass = $templatefile}
{else}
    {$pageClass = $currentUrl|replace:"/":""}
    {if $pageClass|strstr:"?"}
        {$pageClass = "?"|explode:$pageClass}
        {$pageClass = $pageClass[0]}
    {/if}
{/if}

<div class="site site-cms-{$pageClass}">
    {foreach $pageContent key=key item=section}
        {if !empty($section['html'])}
            {$section['html']}
        {else}
            {foreach $section['variables'] as $name => $value}
                {assign var=$name value=$value}
            {/foreach}
            {include file=$section['template'] sectionId=$key}
        {/if}
    {/foreach}
</div>