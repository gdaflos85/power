{if isset($requiredExtenstion) && $requiredExtenstion}
    <div class="media__item media__item--thumb {if isset($type) && $type=="predefined"}media__item--horizontal{/if}{if isset($comingsoon) && $comingsoon}media__item--comingsoon{/if} {if isset($requiredExtenstion) && $requiredExtenstion}media__item--extensionrequired{/if}" data-media-item="{$name}">
{else}
    <label class="media__item media__item--thumb {if isset($type) && $type=="predefined"}media__item--horizontal{/if}{if isset($comingsoon) && $comingsoon}media__item--comingsoon{/if}" data-media-item="{$name}">
{/if}
    <div class="media__item-icon" data-label="Soon" data-ex-required="Extension Required">
        {if isset($thumb) && $thumb}
            <img src="{$whmcsURL}/templates/{$themeName}/core/cms/sections/config/{$slug}/{$thumb}" alt="{$name}">
        {else}
            <img src="{$helper->img('placeholders/placeholder.png')}" alt="{$name}">
        {/if}
    </div>
    <input class="media__item-input media-icon" type="radio" name="{$inputName}" value="{$value}" {if isset($checked) && $checked}checked{/if}>          
    <span class="media__item-border"></span>
    <span class="media__item-label"></span>
    <div class="media__item-footer">
        <span class="media__item-name">{$name}</span>
        {if isset($originalName) && $originalName}
            <span class="media__item-type">{$originalName}</span>
        {/if}    
    </div> 
    {if isset($requiredExtenstion) && $requiredExtenstion}
        <div class="media__item-info">
            <p class="p-xs text-center">This section requires <b>{$cms_docs->modal['new_section'][$requiredExtenstion]['title']}</b> extension</p>
            <a class="btn btn--xs btn--primary" href="{$cms_docs->modal['new_section'][$requiredExtenstion]['url']}" target="_blank">Learn More</a>
        </div>
    {/if}                       
{if isset($requiredExtenstion) && $requiredExtenstion}
    </div>
{else}
    </label>
{/if}