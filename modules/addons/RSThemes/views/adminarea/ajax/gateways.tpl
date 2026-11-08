{assign var="iconsPath" value="./../../../../../../templates/{$themeName}/assets/svg-icon"}
{assign var="ilustrationPath" value="./../../../../../../templates/{$themeName}/assets/svg-gateways"}

{foreach $template->getAllGateways() as $key => $illustration}
    {assign var=illustrationName value="/"|explode:$illustration['name']}
    <label 
        class="media__item" 
        data-media-item="{$illustration['name']} {if isset($illustration['tags'] && is_array($illustration['tags']))}{foreach $illustration['tags'] as $tag} {$tag}{/foreach}{/if}" 
        data-toggle="lu-tooltip" 
        data-title="{$illustrationName|@end}"
    >
        <div class="media__item-icon">
            {include file="{$illustration.path}"}
        </div>
        <input class="media__item-input lagom-icon" type="radio" name="item[gateways]" value="{$illustration['name']}">
        <span class="media__item-border"></span>
        <span class="media__item-label"></span>
    </label>
{/foreach}
{include file="./../includes/media/no-data.tpl"}