{strip}

{*
		Impressive Themes
		https://www.impressivethemes.net
		-------------------------------

		Theme Options for Control Theme by Impressive Themes
		----------------------------------------------------

		Please refer to the theme documentation available at the
		following url before making any changes to this file:

		https://www.impressivethemes.net/support/documentation/control-whmcs-theme-documentation


		Should you require any further help or assistance, please
		contact customer support via our online support desk at:

		https://www.impressivethemes.net/support/contact
*}

{* 1. Main Nav Bar and Brand Display Options *}

	{* 1.1.	Enable or Disable Navbar Brand Display - enabled / disabled *}
		{assign var=itBrandDisplay value="enabled" scope="global"}

	{* 1.2.	Specify Navbar Brand Type - text / logo *}
		{assign var=itBrandType value="text" scope="global"}

	{* 1.3.	Specify Navbar Brand Logo Url (if applicable) - eg. https://www.yoursite.com/logo.png *}
		{assign var=itBrandLogoUrl value="" scope="global"}

	{* 1.4.	Specify Navbar Brand Custom Text (if applicable) - eg. Your Company *}
		{assign var=itBrandText value="" scope="global"}

	{* 1.5.	Enable or Disable Breadcrumb Dispay - enabled / disabled *}
		{assign var=itBreadcrumbDisplay value="enabled" scope="global"}

	{* 1.6. Enable or Disable Cart Icon Display on Desktop View- enabled / disabled *}
		{assign var=itCartIconDisplayDesktop value="enabled" scope="global"}

	{* 1.7. Enable or Disable Cart Icon Display on Mobile View- enabled / disabled *}
		{assign var=itCartIconDisplayMobile value="enabled" scope="global"}

	{* 1.8. Enable or Disable Notifications Icon Display on Desktop View - enabled / disabled *}
		{assign var=itNotificationsIconDisplayDesktop value="enabled" scope="global"}

	{* 1.9. Enable or Disable Notifications Icon Display on Mobile View - enabled / disabled *}
		{assign var=itNotificationsIconDisplayMobile value="enabled" scope="global"}

	{* 1.10. Enable or Disable NavBar Language Icon Display on Desktop View - enabled / disabled *}
		{assign var=itLanguageIconDisplayDesktop value="disabled" scope="global"}

	{* 1.11. Enable or Disable NavBar Language Icon Display on Mobile View - enabled / disabled *}
		{assign var=itLanguageIconDisplayMobile value="disabled" scope="global"}

	{* 1.12. Enable or Disable Footer Language Icon Display - enabled / disabled *}
		{assign var=itLanguageIconDisplayFooter value="enabled" scope="global"}

	{* 1.13. Enable or Disable Main Nav Display for Guests (Non-Logged In Users) - enabled / disabled *}
		{assign var=itGuestNavDisplay value="enabled" scope="global"}

	{* 1.14. Main Nav Default State - full / mini *}
		{assign var=itMainNavDefaultState value="full" scope="global"}

	{* 1.15. Remember Main Nav State Between Pages - enabled / disabled *}
		{assign var=itMainNavSaveState value="enabled" scope="global"}

	{* 1.16. Auto Minimize Main Nav On Cart Pages - enabled / disabled *}
		{assign var=itMainNavAutoMiniCart value="disabled" scope="global"}

{* 2. Sidebar Options *}

	{* 2.1.	Enable or Disable Primary Sidebar Display - enabled / disabled *}
		{assign var=itPrimarySidebar value="enabled" scope="global"}

	{* 2.2.	Enable or Disable Secondary Sidebar Display - enabled / disabled *}
		{assign var=itSecondarySidebar value="enabled" scope="global"}

{* 3. Color Scheme / Style Options  *}

	{* 3.1	Define color scheme / style to be used - green / green-solid / green-white / blue / blue-solid / blue-white / custom *}
		{assign var=itColorScheme value="blue-solid" scope="global"}

	{* 3.2	If custom color scheme, specify file name - eg. for my-color-scheme.css / my-color-scheme.min.css enter "my-color-scheme" *}
		{assign var=itColorSchemeCustomName value="" scope="global"}

	{* 3.3	Main content max-width - enabled / disabled *}
		{assign var=itMainContentMaxWidth value="disabled" scope="global"}

	{* 3.4	Main content max-width value - eg. 800px / 75% *}
		{assign var=itMainContentMaxWidthValue value="" scope="global"}

	{* 3.5	Select color scheme for iCheck checkbox and radio inputs - default / black / grey / red / orange / green / yellow / blue / pink / aero / purple *}
		{assign var=itiCheckColor value="default" scope="global"}

{* 4. Text Direction *}

	{* 4.1	Specify Text Direction - ltr / rtl / auto *}
		{assign var=itTextDirection value="auto" scope="global"}

{* 5. Resource Minification *}

	{* 5.1	Enable or Disable use of minified CSS - enabled / disabled *}
		{assign var=itCSSMin value="enabled" scope="global"}

	{* 5.2	Enable or Disable use of minified JS - enabled / disabled *}
		{assign var=itJSMin value="enabled" scope="global"}

{* 6. Domain/Product SSL Status Icons & Information *}

	{* 6.1	Enable or Disable SSL Status Icons on Client Area Products Page (clientareaproducts.tpl)- enabled / disabled *}
		{assign var=itSSLStatusClientareaproducts value="enabled" scope="global"}

	{* 6.2	Enable or Disable SSL Status Icon & Information on Client Area Product Details Page (clientareaproductdetails.tpl)- enabled / disabled *}
		{assign var=itSSLStatusClientareaproductdetails value="enabled" scope="global"}

	{* 6.3	Enable or Disable SSL Status Icons on Client Area Domains Page (clientareadomains.tpl)- enabled / disabled *}
		{assign var=itSSLStatusClientareadomains value="enabled" scope="global"}

	{* 6.4	Enable or Disable SSL Status Icons on Client Area Domain Details Page (clientareadomaindetails.tpl)- enabled / disabled *}
		{assign var=itSSLStatusClientareadomaindetails value="enabled" scope="global"}

	{* 6.5	Custom SSL Purchase Url (leave blank for default)- eg. https://www.yoursite.com/cart.php?gid=2 *}
		{assign var=itSSLCustomPurchaseUrl value="" scope="global"}

{* 7. Client Area Home Page Options *}

	{* 7.1	Enable or Disable Spotlight TLDs on Client Area Home Page - enabled / disabled *}
		{assign var=itHomeSpotlightTLDs value="enabled" scope="global"}

{* 8. Theme Debug Options *}

	{* 8.1	Enable or Disable Theme Debug Mode - enabled / disabled *}
		{assign var=itThemeDebug value="disabled" scope="global"}

{/strip}
