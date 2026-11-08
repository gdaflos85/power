{if file_exists("templates/$template/includes/common/overwrites/logo.tpl")}

    {include file="{$template}/includes/common/overwrites/logo.tpl"}  

{else}

   {* Logo Color - Choose correct logo color, based on the page tempalte *}

   

   {* Left Nav *}

   {if $RSThemes.layouts.templateLayout ==  'left-nav' && !$footerLogo && !$isTopNav}

       {if $leftNavStyle == 'default' && !$RSThemes.styles.vars.futuristic}

           {if $RSThemes.logoSquare}

               {assign var=logoVersion value=$RSThemes.logoSquare}

           {else}

               {assign var=logoVersion value=$RSThemes.logo}

           {/if}

       {else}

           {if $RSThemes.logoSquareInverse}

               {assign var=logoVersion value=$RSThemes.logoSquareInverse}

           {elseif $RSThemes.logoSquare}

               {assign var=logoVersion value=$RSThemes.logoSquare}

           {elseif $RSThemes.logo_inverse}

               {assign var=logoVersion value=$RSThemes.logo_inverse}

           {elseif $RSThemes.logo}

               {assign var=logoVersion value=$RSThemes.logo}

           {/if}

       {/if}

   {* Left Nav Wide *}    

   {elseif $RSThemes.layouts.templateLayout ==  'left-nav-wide' && !$footerLogo && !$isTopNav}

       {if $leftNavStyle == 'default' && !$RSThemes.styles.vars.futuristic}

           {assign var=logoVersion value=$RSThemes.logo}

       {else}   

           {if $RSThemes.logo_inverse}

               {assign var=logoVersion value=$RSThemes.logo_inverse}

           {else}

               {assign var=logoVersion value=$RSThemes.logo}     

           {/if}

       {/if}

   {* Top Nav *}    

   {else}

       {if ((isset($RSThemes.styles.vars.futuristic) && $RSThemes.styles.vars.futuristic && $RSThemes.logo_inverse) || ($topNavStyle != "default" && $RSThemes.logo_inverse)  && !$footerLogo|| ($extendedFooterStyle != "default" && $extendedFooterStyle != "gray" && $RSThemes.logo_inverse && $footerLogo) || (isset($LagomPromotionLogo) && $LagomPromotionLogo == "dark" && $RSThemes.logo_inverse)) && (!isset($LagomPromotionLogo) || $LagomPromotionLogo != "light")}

           {assign var=logoVersion value=$RSThemes.logo_inverse} 

       {elseif isset($RSThemes.logo)}

           {assign var=logoVersion value=$RSThemes.logo}

       {/if}

   {/if}

   {* Mobile Logo *}

   {if (isset($RSThemes.styles.vars.futuristic) && $RSThemes.styles.vars.futuristic && $RSThemes.logo_inverse) || ($topNavStyle != "default" && $RSThemes.logo_inverse && (($RSThemes.layouts.templateLayout != 'left-nav' && $RSThemes.layouts.templateLayout != 'left-nav-wide') || $isTopNav))}

       {assign var=logoMobileVersion value=$RSThemes.logo_inverse}

   {elseif isset($RSThemes.logo)}

       {assign var=logoMobileVersion value=$RSThemes.logo}

   {/if}

   {if isset($RCLogo) && $RCLogo}

       <a class="{if $customClass}{$customClass} {/if}{if $RSThemes.layouts.vars.type == "condensed" && !$ignoreMobileVersion}visible-xs visible-sm visible-md{/if} logo" href="{if $lagom_logo_url}{$lagom_logo_url}{else}{$WEB_ROOT}/index.php{/if}"><img src="{$RCLogo}" alt="{$companyname}"></a>

   {elseif isset($MBLogo) && $MBLogo}

       <a class="{if $customClass}{$customClass} {/if}{if $RSThemes.layouts.vars.type == "condensed" && !$ignoreMobileVersion}visible-xs visible-sm visible-md{/if} logo" href="{if $lagom_logo_url}{$lagom_logo_url}{else}{$WEB_ROOT}/index.php{/if}"><img src="{$MBLogo}" alt="{$companyname}"></a>

   {elseif isset($logoVersion) && $logoVersion}

       {if $display_mode_switcher.enabled && $RSThemes.styles.name != "futuristic"}

            {* Dark Mode Src  *}

                {if ($footerLogo && $display_mode_switcher.dark && $RSThemes.logo_inverse) && (!isset($LagomPromotionLogo) || $LagomPromotionLogo != "light")}

                        {assign var=darkModeSrc value=$RSThemes.logo_inverse}

                {elseif $footerLogo && $display_mode_switcher.dark && $RSThemes.logo}

                        {assign var=darkModeSrc value=$RSThemes.logo}

                {else}

                    {if $RSThemes.layouts.templateLayout == 'left-nav' && isset($RSThemes.logoSquareInverse)}

                        {assign var=darkModeSrc value=$RSThemes.logoSquareInverse}

                    {elseif $RSThemes.layouts.templateLayout == 'left-nav' && isset($RSThemes.logoSquare)}

                        {assign var=darkModeSrc value=$RSThemes.logoSquare}

                    {elseif isset($RSThemes.logo_inverse) && (!isset($LagomPromotionLogo) || $LagomPromotionLogo != "light")}

                        {assign var=darkModeSrc value=$RSThemes.logo_inverse}

                    {else}

                        {assign var=darkModeSrc value=$logoVersion}

                    {/if}

                {/if}

            {*Dark Mode Start Src *}

                {if ($footerLogo && $display_mode_switcher.dark && $RSThemes.logo_inverse) && (!isset($LagomPromotionLogo) || $LagomPromotionLogo != "light")}

                    {assign var=darkModeStartSrc value=$RSThemes.logo_inverse}

                {elseif $footerLogo && $display_mode_switcher.dark && $RSThemes.logo}

                    {assign var=darkModeStartSrc value=$RSThemes.logo}

                {else}

                    {if $display_mode_switcher.dark && (isset($RSThemes.logo_inverse) || isset($RSThemes.logoSquareInverse))}

                        {if $RSThemes.layouts.templateLayout == 'left-nav' && isset($RSThemes.logoSquareInverse)}

                            {assign var=darkModeStartSrc value=$RSThemes.logoSquareInverse}

                        {elseif $RSThemes.layouts.templateLayout == 'left-nav' && isset($RSThemes.logoSquare)}

                            {assign var=darkModeStartSrc value=$RSThemes.logoSquare}

                        {elseif isset($RSThemes.logo_inverse) && (!isset($LagomPromotionLogo) || $LagomPromotionLogo != "light")}

                            {assign var=darkModeStartSrc value=$RSThemes.logo_inverse}

                        {else}

                            {assign var=darkModeStartSrc value=$logoVersion}

                        {/if}

                    {else}

                        {assign var=darkModeStartSrc value=$logoVersion}

                    {/if}

                {/if}

            <a class="{if $customClass}{$customClass}{/if} logo {if $logoMobileVersion && !$ignoreMobileVersion} hidden-sm hidden-xs hidden-md{/if}" href="{if $lagom_logo_url}{$lagom_logo_url}{else}{$WEB_ROOT}/index.php{/if}" logo-light-mode="{$WEB_ROOT}{$logoVersion}" logo-dark-mode="{$WEB_ROOT}{$darkModeSrc}">

                <img class="logo-img" title="{$companyname}" alt="{$companyname}" src="{$WEB_ROOT}{$darkModeStartSrc}">

            </a>

            {if $logoMobileVersion && !$ignoreMobileVersion}

                <a class="logo visible-xs visible-sm visible-md" href="{if $lagom_logo_url}{$lagom_logo_url}{else}{$WEB_ROOT}/index.php{/if}" logo-light-mode="{$WEB_ROOT}{$logoVersion}" logo-dark-mode="{$WEB_ROOT}{if $RSThemes.layouts.templateLayout == 'left-nav' && isset($RSThemes.logoSquareInverse)}{$RSThemes.logoSquareInverse}{elseif isset($RSThemes.logo_inverse)}{$RSThemes.logo_inverse}{else}{$logoVersion}{/if}">

                    <img class="logo-img" title="{$companyname}" alt="{$companyname}" src="{$WEB_ROOT}{if $display_mode_switcher.dark && (isset($RSThemes.logo_inverse) || isset($RSThemes.logoSquareInverse))}{if $RSThemes.layouts.templateLayout == 'left-nav' && isset($RSThemes.logoSquareInverse)}{$RSThemes.logoSquareInverse}{elseif $RSThemes.layouts.templateLayout == 'left-nav' && isset($RSThemes.logoSquare)}{$RSThemes.logoSquare}{elseif isset($RSThemes.logo_inverse)}{$RSThemes.logo_inverse}{else}{$logoVersion}{/if}{else}{$logoVersion}{/if}">

                </a>

            {/if}

       {else}

           <a class="{if $customClass}{$customClass} {/if}logo{if $logoMobileVersion && !$ignoreMobileVersion} hidden-sm hidden-xs hidden-md{/if}" href="{if $lagom_logo_url}{$lagom_logo_url}{else}{$WEB_ROOT}/{/if}"><img src="{$WEB_ROOT}{$logoVersion}" title="{$companyname}" alt="{$companyname}"/></a>

           {if $logoMobileVersion && !$ignoreMobileVersion}

               <a class="logo visible-xs visible-sm visible-md" href="{if $lagom_logo_url}{$lagom_logo_url}{else}{$WEB_ROOT}/{/if}"><img src="{$WEB_ROOT}{$logoMobileVersion}" title="{$companyname}" alt="{$companyname}"/></a>

           {/if}

       {/if}

   {elseif $assetLogoPath}

       <a class="{if $customClass}{$customClass} {/if}logo {if $RSThemes.layouts.vars.type == "condensed" && !$ignoreMobileVersion}visible-xs visible-sm visible-md{/if}" href="{if $lagom_logo_url}{$lagom_logo_url}{else}{$WEB_ROOT}/{/if}"><img src="{$assetLogoPath}" title="{$companyname}" alt="{$companyname}"/></a>

   {else}

       <a class="{if $customClass}{$customClass} {/if}logo logo-text {if $RSThemes.layouts.vars.type == "condensed" && !$ignoreMobileVersion}visible-xs visible-sm visible-md{/if}" href="{if $lagom_logo_url}{$lagom_logo_url}{else}{$WEB_ROOT}/{/if}">{$companyname}</a>

   {/if}

{/if}