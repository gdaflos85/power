{strip}
{*
		Impressive Themes
		http://www.impressivethemes.net
		-------------------------------

		"Control_Compare" Cart Template Options for Control Theme by Impressive Themes
		------------------------------------------------------------------------------

		Please refer to the theme documentation available at the
		following url before making any changes to this file:

		http://www.impressivethemes.net/support/documentation/control-whmcs-theme-documentation

		Should you require any further help or assistance, please
		contact customer support via our online support desk at:

		http://www.impressivethemes.net/support/contact
*}

{* 1. Sidebar Display *}

	{* 1.1.	Enable or Disable Secondary Sidebar Display on Cart Pages - enabled / disabled *}
		{assign var=itCartSidebarDisplay value="enabled" scope="global"}

	{* 1.2. Enable or Disable Mobile Friendly Secondary Sidebar Display on Cart Pages on Small Screen Sizes - enabled / disabled *}
    	{assign var=itCartSidebarMobileDisplay value="enabled" scope="global"}

    {* 1.3. Sidebar Display Mode - permanent / showhide *}
    	{assign var=itCartSidebarDisplayMode value="showhide" scope="global"}

    {* 1.4. Sidebar Show / Hide Method - slide / squash *}
    	{assign var=itCartSidebarDisplayMethod value="slide" scope="global"}

{* 2. Configure Number of Products Shown Per Row *}

	{* 2.1.	Configure the number of products shown per row on the view products page, between 1 and 6 - 1 / 2 / 3 / 4 / 5 / 6 *}
		{assign var=itCartNumberProductsPerRow value="4" scope="global"}

{* 3. WHMCS Feature Highlights *}

	{* 3.1. Products Page: Support WMMCS Feature Highlights in Product Descriptions - enabled / disabled *}
		{assign var=itCartFeatureHighlights value="enabled" scope="global"}

{/strip}
