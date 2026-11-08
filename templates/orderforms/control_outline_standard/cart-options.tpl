{strip}
{*
		Impressive Themes
		http://www.impressivethemes.net
		-------------------------------

		"Control_Outline_Standard" Cart Template Options for Control Theme by Impressive Themes
		---------------------------------------------------------------------------------------

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
    	{assign var=itCartSidebarDisplayMode value="permanent" scope="global"}

    {* 1.4. Sidebar Show / Hide Method - slide / squash *}
    	{assign var=itCartSidebarDisplayMethod value="slide" scope="global"}

{* 2. Configure Product Page }

	{* 2.1. Configure Product Page: Order Summary Display Position - bottom / side *}
    	{assign var=itCartConfProdOrderSummaryDisplayMethod value="bottom" scope="global"}

	{* 2.2. Configure Product Page: Order Summary Auto Scroll (only applies if Display Position = side) - enabled / disabled *}
    	{assign var=itCartConfProdOrderSummaryAutoScroll value="enabled" scope="global"}

{* 3. iCheck Color Scheme *}

	{* 3.1.	Select color scheme for iCheck checkbox and radio inputs - default / black / grey / red / orange / green / yellow / blue / pink / aero / purple *}
		{assign var=itCartiCheckColor value="default" scope="global"}

{* 4. View Cart Page Style *}

	{* 4.1.	Select view cart page style - updated / original  *}
		{assign var=itCartViewCartStyle value="updated" scope="global"}

{* 5. Configure Number of Products Shown Per Row *}

	{* 5.1.	Configure the number of products shown per row on the view products page, between 1 and 4 - 1 / 2 / 3 / 4 *}
		{assign var=itCartNumberProductsPerRow value="2" scope="global"}

	{* 5.2.	Configure the number of addons shown per row on the view available addons page, between 1 and 4 - 1 / 2 / 3 / 4 *}
		{assign var=itCartNumberAddonsPerRow value="1" scope="global"}

{* 6. Domain Renewals Page *}

    {* 6.1. Domain Renewals Page: Order Summary Display Position - bottom / side *}
    	{assign var=itCartDomRenewOrderSummaryDisplayMethod value="bottom" scope="global"}

	{* 6.2. Domain Renewals Page: Order Summary Auto Scroll (only applies if Display Position = side) - enabled / disabled *}
    	{assign var=itCartDomRenewOrderSummaryAutoScroll value="enabled" scope="global"}

{* 7. WHMCS Feature Highlights *}

	{* 7.1. Products Page: Support WMMCS Feature Highlights in Product Descriptions - enabled / disabled *}
		{assign var=itCartFeatureHighlights value="enabled" scope="global"}

{/strip}
