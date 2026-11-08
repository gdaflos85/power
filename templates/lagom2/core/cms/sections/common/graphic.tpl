{if file_exists("{$smarty.current_dir}/overwrites/graphic.tpl")}
    {include file="{$smarty.current_dir}/overwrites/graphic.tpl"}  
{else}
    {if $type == 'illustration'}
        {if $iconType != "modern" && $graphic|strstr:"/modern/"}
            {$graphic = $graphic|replace:'modern/':''}
        {/if}
        {include file="{$smarty.current_dir}/../../../../assets/svg-illustrations/$graphic"}
    {else if $type == 'media'}
        {if ((isset($activeScheme) && $activeScheme != 'default' || $forceDarkMode) && !$hasDarkMode) || $styleName == "futuristic"}
            {$schemePath = '/'}
            {$graphicTemp = '.'|explode:$graphic}
            {if is_array($graphicTemp)}
                {$graphicExt = ".`$graphicTemp|@end`"}
                {$graphicName = $graphic|replace:$graphicExt:""}
                {$currentDirTemp = '/core/'|explode:$smarty.current_dir}
                {if $styleName == "futuristic" || $forceDarkMode}
                    {if $activeScheme == "default" || ($activeScheme == "gray" && $styleName == "futuristic")}
                        {$graphicDir = "`$currentDirTemp[0]`/assets/img/page-manager/lagom-color-schemes/dark/`$graphicName``$graphicExt`"}
                    {else}
                        {$graphicDir = "`$currentDirTemp[0]`/assets/img/page-manager/lagom-color-schemes/dark/`$graphicName`-`$activeScheme``$graphicExt`"}
                    {/if}
                {else}
                    {$graphicDir = "`$currentDirTemp[0]`/assets/img/page-manager/lagom-color-schemes/`$graphicName`-`$activeScheme``$graphicExt`"}
                {/if}
                {if $graphicDir|strstr:"&amp;"}
                    {$graphicDir = $graphicDir|replace:"&amp;":"&"}
                {/if}
                {if file_exists($graphicDir)}
                    {if $styleName == "futuristic" || $forceDarkMode}
                        {if $activeScheme == "default" || ($activeScheme == "gray" && $styleName == "futuristic")}
                            {$graphic = "lagom-color-schemes/dark/`$graphicName``$graphicExt`"}
                        {else}
                            {$graphic = "lagom-color-schemes/dark/`$graphicName`-`$activeScheme``$graphicExt`"}
                        {/if}
                    {else}
                        {$graphic = "lagom-color-schemes/`$graphicName`-`$activeScheme``$graphicExt`"}
                    {/if}
                {else}
                    {$graphicDir = "`$currentDirTemp[0]`/assets/img/page-manager/lagom-color-schemes/`$graphicName`-`$activeScheme``$graphicExt`"}
                    {if file_exists($graphicDir)}
                        {if $styleName == "futuristic" || $forceDarkMode}
                            {if $activeScheme == "default" || ($activeScheme == "gray" && $styleName == "futuristic")}
                                {$graphic = "lagom-color-schemes/`$graphicName``$graphicExt`"}
                            {else}
                                {$graphic = "lagom-color-schemes/`$graphicName`-`$activeScheme``$graphicExt`"}
                            {/if}
                        {else}
                            {$graphic = "lagom-color-schemes/`$graphicName`-`$activeScheme``$graphicExt`"}
                        {/if}
                    {/if}
                {/if}
            {/if}
        {elseif $hasDarkMode} {* if dark mode switcher is enabled *}
            {$schemePath = '/'}
            {$graphicTemp = '.'|explode:$graphic}
            {if is_array($graphicTemp)}
                {$graphicExt = ".`$graphicTemp|@end`"}
                {$graphicName = $graphic|replace:$graphicExt:""}
                {$currentDirTemp = '/core/'|explode:$smarty.current_dir}
                {* light grapgic directory - checked if active scheme is not default*}
                {if $activeScheme != 'default'}
                    {$lightGraphicDir = "`$currentDirTemp[0]`/assets/img/page-manager/lagom-color-schemes/`$graphicName`-`$activeScheme``$graphicExt`"}
                {/if}
               
                {* dark graphic directory*}
                {if $activeScheme == "default"}
                    {$darkGraphicDir = "`$currentDirTemp[0]`/assets/img/page-manager/lagom-color-schemes/dark/`$graphicName``$graphicExt`"}
                {else}
                    {$darkGraphicDir = "`$currentDirTemp[0]`/assets/img/page-manager/lagom-color-schemes/dark/`$graphicName`-`$activeScheme``$graphicExt`"}
                {/if}
                
                {if $darkGraphicDir|strstr:"&amp;"}
                    {$darkGraphicDir = $darkGraphicDir|replace:"&amp;":"&"}
                {/if}

                {* check if dark graphic exist and assign correct src*}
                {if file_exists($darkGraphicDir)}
                    {if $activeScheme == "default"}
                        {$darkGraphic = "lagom-color-schemes/dark/`$graphicName``$graphicExt`"}
                    {else}
                        {$darkGraphic = "lagom-color-schemes/dark/`$graphicName`-`$activeScheme``$graphicExt`"}
                    {/if}
                {/if}

                {* check if ligth graphic exist and assign correct src *}
                {if $lightGraphicDir|strstr:"&amp;"}
                    {$lightGraphicDir = $lightGraphicDir|replace:"&amp;":"&"}
                {/if}
                {if file_exists($lightGraphicDir)}
                    {$lightGraphic = "lagom-color-schemes/`$graphicName`-`$activeScheme``$graphicExt`"}
                {else}
                    {$lightGraphic = $graphic}
                {/if}
            {/if}
        {/if}   
        {if $hasDarkMode && $styleName != "futuristic"}
            <img 
                class="lazy-switch-mode" 
                data-light-src="{$WEB_ROOT}/templates/{$template}/assets/img/page-manager/{$lightGraphic}" 
                {if $darkGraphic}
                    data-dark-src="{$WEB_ROOT}/templates/{$template}/assets/img/page-manager/{$darkGraphic}"
                {/if}
                alt="{if $title || $caption || $elementTitle}{if isset($pageSeoTitle)}{$pageSeoTitle|unescape:'html'|strip_tags} - {/if}{if $elementTitle && $elementTitle != ""}{$elementTitle|unescape:'html'|strip_tags}{else}{if $title}{$title|unescape:'html'|strip_tags}{elseif $caption}{$caption|unescape:'html'|strip_tags}{/if}{/if}{/if}">
        {else}
            <img 
                class="lazyload" data-src="{$WEB_ROOT}/templates/{$template}/assets/img/page-manager/{$graphic}" 
                alt="{if $title || $caption || $elementTitle}{if isset($pageSeoTitle)}{$pageSeoTitle|unescape:'html'|strip_tags} - {/if}{if $elementTitle && $elementTitle != ""}{$elementTitle|unescape:'html'|strip_tags}{else}{if $title}{$title|unescape:'html'|strip_tags}{elseif $caption}{$caption|unescape:'html'|strip_tags}{/if}{/if}{/if}">
        {/if} 
    {else if $type == 'icon'}
        {if $theme == "primary" || $theme == "secondary"}
            {include file="{$smarty.current_dir}/../../../../assets/svg-icon/$graphic" onDark=true}
        {else}
            {include file="{$smarty.current_dir}/../../../../assets/svg-icon/$graphic"}
        {/if}
    {/if}
{/if}