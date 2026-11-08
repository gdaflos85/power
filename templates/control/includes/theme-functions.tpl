{include file="$template/includes/theme-info.tpl"}
{strip}
{*
		Impressive Themes
		http://www.impressivethemes.net
		-------------------------------

		Theme Functions for Control Theme by Impressive Themes
		------------------------------------------------------

		We would advise customers not to make any changes to the
		file below. Configurable theme options can be found in the
		file theme-options.tpl.

		Should you require any further help or assistance, please
		contact customer support via our online support desk at:

		http://www.impressivethemes.net/support/contact

*}
{*
	1. 	if itPrimarySidebar = enabled or if itSecondarySidebar = enabled,
		work out whether or not there is a primary and/or secondary sidebar to display,
		and whether or not the sidebar layout is needed
	-----------------------------------------------------------------------------------
*}
		{if $itPrimarySidebar eq "enabled" || $itSecondarySidebar eq "enabled"}
{*
		1.1 is there a primary sidebar to display?
		------------------------------------------
*}
			{if $itPrimarySidebar eq "enabled"}
				{if $primarySidebar->hasChildren() && !$skipMainBodyContainer}
					{assign var=itShowSidebarPrimary value="yes" scope="global"}
				{/if}
			{/if}
{*
		1.2 is there a secondary sidebar to display?
		--------------------------------------------
*}
			{if $itSecondarySidebar eq "enabled"}
				{if $secondarySidebar->hasChildren()}
					{assign var=itShowSidebarSecondary value="yes" scope="global"}
				{/if}
			{/if}
{*
		1.3 should the sidebar layout be shown?
		---------------------------------------
*}
			{if !$inShoppingCart and ($itShowSidebarPrimary eq "yes" || $itShowSidebarSecondary eq "yes")}
				{assign var=itShowSidebarLayout value="yes" scope="global"}
			{/if}
		{/if}
{*
		1.4 disable sidebar display for certain pages
		---------------------------------------------
*}
		{if $templatefile eq "masspay"}
			{assign var=itShowSidebarLayout value="no" scope="global"}
		{/if}
{*
	2. For specified pages, show featured-content section above main-body section
	-----------------------------------------------------------------------------
*}
{*
		2.1.	clientareahome.tpl
		--------------------------
*}
		{if $templatefile eq "clientareahome"}
			{assign var=itFeaturedContent value="yes" scope="global"}
		{/if}
{*
	3. Work out if the left side bar / main nav should be shown or not
	------------------------------------------------------
*}
{*
		3.1.	should the left side bar / main nav be shown?
		-----------------------------------------------------
*}
		{if $loggedin}
			{assign var=itShowMainNav value="yes" scope="global"}
		{else}
			{if $itGuestNavDisplay eq "disabled"}
				{assign var=itShowMainNav value="no" scope="global"}
			{else}
				{assign var=itShowMainNav value="yes" scope="global"}
			{/if}
		{/if}
{*
		3.2.	how should the left side bar / main nav be displayed (full or mini)?
		----------------------------------------------------------------------------
*}
		{if $itShowMainNav eq "yes"}
			{assign var=itMainNavLoadState value="false" scope="global"}
			{if $itMainNavDefaultState eq "mini"}
				{assign var=itMainNavState value="mini" scope="global"}
			{/if}
			{if $itMainNavSaveState neq "disabled"}
				{assign var=itMainNavLoadState value="true" scope="global"}
			{/if}
			{if $itMainNavAutoMiniCart eq "enabled"}
				{if $inShoppingCart}
					{assign var=itMainNavState value="mini" scope="global"}
					{assign var=itMainNavLoadState value="false" scope="global"}
				{/if}
			{/if}
		{/if}
{*
	4. Set RTL text direction, if appropriate
	-----------------------------------------
*}
	{if $itTextDirection eq "rtl"}
		{assign var=itTextDirectionRTL value="enabled" scope="global"}
	{elseif $itTextDirection eq "auto"}
		{if $LANG.locale eq "ar_AR" or $LANG.locale eq "he_IL" or $LANG.locale eq "fa_IR"}
			{assign var=itTextDirectionRTL value="enabled" scope="global"}
		{else}
			{assign var=itTextDirectionRTL value="disabled" scope="global"}
		{/if}
	{else}
		{assign var=itTextDirectionRTL value="disabled" scope="global"}
	{/if}
{*
	5. Content wrapper for addons / custom modules
	----------------------------------------------
*}
{*
		5.1.	should the content wrapper be shown?
		-----------------------------------------------------
*}
        {if $templatefile neq "login"}
            {if $smarty.get.modop eq "custom" && $modulename neq "licensing"}
                {assign var=itShowContentWrapper value="yes" scope="global"}
            {elseif ($filename eq "index" and $smarty.get.m) and $smarty.get.m neq "project_management" and $smarty.get.m neq "DomainOrdersExtended"}
                {assign var=itShowContentWrapper value="yes" scope="global"}
            {elseif $templatefile eq "listavailabledomains" or $templatefile eq "listalldomains" or $templatefile eq "domainorder" or $templatefile eq "domaincategorysearch" or $templatefile eq "bulksearch"}
                {assign var=itShowContentWrapper value="yes" scope="global"}
            {elseif $templatefile eq "wbteampro"}
                {assign var=itShowContentWrapper value="yes" scope="global"}
            {else}
                {assign var=itShowContentWrapper value="no" scope="global"}
            {/if}
        {else}
            {assign var=itShowContentWrapper value="no" scope="global"}
        {/if}
{*
	6. Resource Ref
	-----------------------------------------
*}
	{if $itThemeDebug eq "enabled"}
		{assign var=itResourceRef value=$smarty.now scope="global"}
	{else if $itThemeVersion|substr:0:1 eq "%"}
		{assign var=itResourceRef value=$smarty.now scope="global"}
	{else}
		{assign var=itResourceRef value=$itThemeVersion scope="global"}
	{/if}
{*
	7. CSS File
	-----------------------------------------
*}
	{if $itColorScheme eq "custom"}
		{if $itCSSMin eq "enabled"}
			{assign var=itMainCSSFile value="$itColorSchemeCustomName.min.css" scope="global"}
		{else}
			{assign var=itMainCSSFile value="$itColorSchemeCustomName.css" scope="global"}
		{/if}
	{elseif $itColorScheme eq "blue"}
		{if $itCSSMin eq "enabled"}
			{assign var=itMainCSSFile value="main-blue.min.css" scope="global"}
		{else}
			{assign var=itMainCSSFile value="main-blue.css" scope="global"}
		{/if}
	{elseif $itColorScheme eq "blue-solid"}
		{if $itCSSMin eq "enabled"}
			{assign var=itMainCSSFile value="main-blue-solid.min.css" scope="global"}
		{else}
			{assign var=itMainCSSFile value="main-blue-solid.css" scope="global"}
		{/if}
	{elseif $itColorScheme eq "blue-white"}
		{if $itCSSMin eq "enabled"}
			{assign var=itMainCSSFile value="main-blue-white.min.css" scope="global"}
		{else}
			{assign var=itMainCSSFile value="main-blue-white.css" scope="global"}
		{/if}
	{elseif $itColorScheme eq "green-solid"}
		{if $itCSSMin eq "enabled"}
			{assign var=itMainCSSFile value="main-green-solid.min.css" scope="global"}
		{else}
			{assign var=itMainCSSFile value="main-green-solid.css" scope="global"}
		{/if}
	{elseif $itColorScheme eq "green-white"}
		{if $itCSSMin eq "enabled"}
			{assign var=itMainCSSFile value="main-green-white.min.css" scope="global"}
		{else}
			{assign var=itMainCSSFile value="main-green-white.css" scope="global"}
		{/if}
	{else}
		{if $itCSSMin eq "enabled"}
			{assign var=itMainCSSFile value="main.min.css" scope="global"}
		{else}
			{assign var=itMainCSSFile value="main.css" scope="global"}
		{/if}
	{/if}
{*
	End of Theme Functions File
	---------------------------
*}
{/strip}
