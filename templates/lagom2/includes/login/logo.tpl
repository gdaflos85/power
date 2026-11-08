{if file_exists("templates/$template/includes/login/overwrites/logo.tpl")}

     {include file="{$template}/includes/login/overwrites/logo.tpl"}  

{else}

    {if !$sidebarLogo}

    <div class="login-header">

    {/if}

        {* Logo Color - Choose correct logo color, based on the page tempalte *}

        {if ($RSThemes.pages[$templatefile].name == 'sidebar' && $loginSidebarStyle !='default' && ($loginSidebarStyle == 'primary'  || $loginSidebarStyle == 'secondary' || ($loginSidebarStyle == 'default' && $loginBgStyle != 'default')) && $sidebarLogo) || (($loginBgStyle == 'primary'  || $loginBgStyle == 'secondary') && !$sidebarLogo && $RSThemes.pages[$templatefile].name != 'sidebar') || $RSThemes.styles.vars.futuristic}

            {assign var=logoVersion value=$RSThemes.logo_inverse}

        {else}

            {assign var=logoVersion value=$RSThemes.logo}

        {/if}

        {if $RCLogo}

            <a class="logo" href="{if $lagom_logo_url}{$lagom_logo_url}{else}{$WEB_ROOT}/index.php{/if}"><img src="{$RCLogo}" alt="{$companyname}" ></a>

        {elseif $MBLogo}

            <a class="logo" href="{if $lagom_logo_url}{$lagom_logo_url}{else}{$WEB_ROOT}/index.php{/if}"><img src="{$MBLogo}" alt="{$companyname}" ></a>

        {else}

            {* Fallback - check if specific logo version is uploaded in Branding section*}

            {if $display_mode_switcher.enabled && $RSThemes.styles.name != "futuristic"}

                <a class="logo logo-login" logo-login-light-mode="{$WEB_ROOT}{$logoVersion}" logo-login-dark-mode="{$WEB_ROOT}{$RSThemes.logo_inverse}" href="{if $lagom_logo_url}{$lagom_logo_url}{else}{$WEB_ROOT}/index.php{/if}"><img class="logo-login-img" src="{$WEB_ROOT}{if $display_mode_switcher.dark}{$RSThemes.logo_inverse}{else}{$logoVersion}{/if}" title="{$companyname}" alt="{$companyname}"/></a>

            {elseif $logoVersion}

                <a class="logo" href="{if $lagom_logo_url}{$lagom_logo_url}{else}{$WEB_ROOT}/index.php{/if}"><img src="{$WEB_ROOT}{$logoVersion}" title="{$companyname}" alt="{$companyname}"/></a>

            {elseif $RSThemes.logo_inverse}

                <a class="logo" href="{if $lagom_logo_url}{$lagom_logo_url}{else}{$WEB_ROOT}/index.php{/if}"><img src="{$WEB_ROOT}{$RSThemes.logo_inverse}" title="{$companyname}" alt="{$companyname}"/></a>

            {elseif $RSThemes.logo}

                <a class="logo" href="{if $lagom_logo_url}{$lagom_logo_url}{else}{$WEB_ROOT}/index.php{/if}"><img src="{$WEB_ROOT}{$RSThemes.logo}" title="{$companyname}" alt="{$companyname}"/></a>

            {elseif $assetLogoPath}

                <a class="logo" href="{if $lagom_logo_url}{$lagom_logo_url}{else}{$WEB_ROOT}/index.php{/if}"><img src="{$assetLogoPath}" title="{$companyname}" alt="{$companyname}"/></a>

            {else}

                <a href="{if $lagom_logo_url}{$lagom_logo_url}{else}{$WEB_ROOT}/index.php{/if}" class="logo logo-text">{$companyname}</a>

            {/if}

        {/if}

    {if !$sidebarLogo}  

    </div>

    {/if}

{/if}