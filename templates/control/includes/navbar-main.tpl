{foreach $navbar as $item}
	{assign var=itMenuItemActive value="no"}
	{assign var=itMenuItemOpen value="no"}
	{if $loggedin}
		{if $item->getName() eq "Home"}
			{if $templatefile eq "clientareahome"}
				{assign var=itMenuItemActive value="yes"}
			{/if}
		{elseif $item->getName() eq "Services"}
			{if $templatefile eq "clientareaproducts" or $templatefile eq "clientareaproductdetails" or $templatefile eq "products" or $templatefile eq "addons"}
				{assign var=itMenuItemActive value="yes"}
				{assign var=itMenuItemOpen value="yes"}
			{elseif $filename eq "clientarea" and $smarty.get.action eq "productdetails"}
				{assign var=itMenuItemActive value="yes"}
				{assign var=itMenuItemOpen value="yes"}
			{/if}
		{elseif $item->getName() eq "Domains"}
			{if $templatefile eq "clientareadomains" or $templatefile eq "clientareadomaindetails" or $templatefile eq "clientareadomaincontactinfo" or $templatefile eq "clientareadomaindns" or $templatefile eq "clientareadomainemailforwarding" or $templatefile eq "clientareadomaingetepp" or $templatefile eq "clientareadomainregisterns" or $templatefile eq "domain-renewals" or $templatefile eq "adddomain" or $templatefile eq "domainregister" or $templatefile eq "domaintransfer" or $templatefile eq "bulkdomainmanagement" or $templatefile eq "clientareadomainaddons"}
				{assign var=itMenuItemActive value="yes"}
				{assign var=itMenuItemOpen value="yes"}
			{elseif $filename eq "index" and $smarty.get.m eq "DNSManager2"}
				{assign var=itMenuItemActive value="yes"}
				{assign var=itMenuItemOpen value="yes"}
			{elseif $filename eq "orderdomain"}
				{assign var=itMenuItemActive value="yes"}
				{assign var=itMenuItemOpen value="yes"}
			{/if}
		{elseif $item->getName() eq "Billing"}
			{if $templatefile eq "clientareainvoices" or $templatefile eq "clientareaquotes" or $templatefile eq "masspay" or $templatefile eq "clientareacreditcard" or $templatefile eq "clientareaaddfunds" or $templatefile eq "account-paymentmethods" or $templatefile eq "account-paymentmethods-manage"}
				{assign var=itMenuItemActive value="yes"}
				{assign var=itMenuItemOpen value="yes"}
			{/if}
		{elseif $item->getName() eq "Support"}
			{if $templatefile eq "supportticketslist" or $templatefile eq "viewticket" or $templatefile eq "announcements" or $templatefile eq "viewannouncement" or $templatefile eq "knowledgebase" or $templatefile eq "knowledgebasearticle" or $templatefile eq "knowledgebasecat" or $templatefile eq "downloads" or $templatefile eq "downloadscat" or $templatefile eq "serverstatus"}
				{assign var=itMenuItemActive value="yes"}
				{assign var=itMenuItemOpen value="yes"}
			{/if}
		{elseif $item->getName() eq "Open Ticket"}
			{if $templatefile eq "supportticketsubmit-stepone" or $templatefile eq "supportticketsubmit-steptwo" or $templatefile eq "supportticketsubmit-confirm"}
				{assign var=itMenuItemActive value="yes"}
			{/if}
		{elseif $item->getName() eq "Affiliates"}
			{if $templatefile eq "affiliates" or $templatefile eq "affiliatesignup"}
				{assign var=itMenuItemActive value="yes"}
			{/if}
		{elseif $item->getName() eq "pm-addon-overview"}
			{if $filename eq "index" and $smarty.get.m eq "project_management"}
				{assign var=itMenuItemActive value="yes"}
			{/if}
		{elseif $item->getName() eq "My Projects"}
			{if $filename eq "wbteampro"}
				{assign var=itMenuItemActive value="yes"}
			{/if}
        {elseif $item->getName() eq "Website Security"}
            {if strpos($templatefile, "store/") !== false}
                {assign var=itMenuItemActive value="yes"}
				{assign var=itMenuItemOpen value="yes"}
            {elseif $templatefile eq "managessl"}
                {assign var=itMenuItemActive value="yes"}
				{assign var=itMenuItemOpen value="yes"}
            {/if}
		{/if}
	{else}
		{if $item->getName() eq "Home"}
			{if $templatefile eq "homepage"}
				{assign var=itMenuItemActive value="yes"}
			{/if}
        {elseif $item->getName() eq "Store"}
            {if strpos($templatefile, "store/") !== false}
                {assign var=itMenuItemActive value="yes"}
				{assign var=itMenuItemOpen value="yes"}
            {elseif $templatefile eq "domainregister" or $templatefile eq "orderdomain" or $templatefile eq "domaintransfer" or $templatefile eq "products"}
                {assign var=itMenuItemActive value="yes"}
				{assign var=itMenuItemOpen value="yes"}
            {/if}
		{elseif $item->getName() eq "Announcements"}
			{if $templatefile eq "announcements" or $templatefile eq "viewannouncement"}
				{assign var=itMenuItemActive value="yes"}
			{/if}
		{elseif $item->getName() eq "Knowledgebase"}
			{if $templatefile eq "knowledgebase" or $templatefile eq "knowledgebasearticle" or $templatefile eq "knowledgebasecat"}
				{assign var=itMenuItemActive value="yes"}
			{/if}
		{elseif $item->getName() eq "Network Status"}
			{if $templatefile eq "serverstatus"}
				{assign var=itMenuItemActive value="yes"}
			{/if}
		{elseif $item->getName() eq "Affiliates"}
			{if $templatefile eq "affiliates" or $templatefile eq "affiliatesignup"}
				{assign var=itMenuItemActive value="yes"}
			{/if}
		{elseif $item->getName() eq "Contact Us"}
			{if $templatefile eq "contact"}
				{assign var=itMenuItemActive value="yes"}
			{/if}
		{/if}
	{/if}
    <li menuItemName="{$item->getName()}" class="{if $itMenuItemActive eq "yes"}active {/if}{if $itMenuItemOpen eq "yes"}open {/if}{if $item->hasChildren()}nav-dropdown{/if}{if $item->getClass()} {$item->getClass()}{/if}" id="{$item->getId()}">
    	<a {if $item->hasChildren()}href="#"{else}href="{$item->getUri()}"{/if}{if $item->getAttribute('target')} target="{$item->getAttribute('target')}"{/if}>
            {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;
			{elseif $item->getName() eq "Home"}<i class="fas fa-home fa-fw"></i>&nbsp;
			{elseif $item->getName() eq "Services"}<i class="fas fa-cube fa-fw"></i>&nbsp;
			{elseif $item->getName() eq "Domains"}<i class="fas fa-globe fa-fw"></i>&nbsp;
			{elseif $item->getName() eq "Billing"}<i class="fas fa-file-invoice fa-fw"></i>&nbsp;
			{elseif $item->getName() eq "Support"}<i class="fas fa-life-ring fa-fw"></i>&nbsp;
			{elseif $item->getName() eq "Open Ticket"}<i class="fas fa-comment fa-fw"></i>&nbsp;
			{elseif $item->getName() eq "Affiliates"}<i class="fas fa-users fa-fw"></i>&nbsp;
			{elseif $item->getName() eq "Announcements"}<i class="fas fa-bullhorn fa-fw"></i>&nbsp;
			{elseif $item->getName() eq "Knowledgebase"}<i class="fas fa-info-circle fa-fw"></i>&nbsp;
			{elseif $item->getName() eq "Network Status"}<i class="fas fa-tachometer-alt fa-fw"></i>&nbsp;
			{elseif $item->getName() eq "Contact Us"}<i class="fas fa-envelope fa-fw"></i>&nbsp;
			{elseif $item->getName() eq "pm-addon-overview"}<i class="fas fa-tasks fa-fw"></i>&nbsp;
            {elseif $item->getName() eq "My Projects"}<i class="fas fa-tasks fa-fw"></i>&nbsp;
			{elseif $item->getName() eq "Live-Help-Button"}<i class="fas fa-comments fa-fw"></i>&nbsp;
            {elseif $item->getName() eq "Store"}<i class="fas fa-shopping-basket fa-fw"></i>&nbsp;
            {elseif $item->getName() eq "Website Security"}<i class="fas fa-desktop fa-fw"></i>&nbsp;
			{else}<i class="fas fa-angle-right fa-fw"></i>&nbsp;
			{/if}
            {$item->getLabel()}
            {if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
        </a>
        {if $item->hasChildren()}
            <ul class="nav-sub">
            {foreach $item->getChildren() as $childItem}
				{assign var=itMenuChildItemActive value="no"}
				{if $loggedin}
					{if $childItem->getName() eq "My Services"}
						{if $filename eq "clientarea" and $smarty.get.action eq "services"}
							{assign var=itMenuChildItemActive value="yes"}
						{elseif $templatefile eq "clientareaproductdetails" and $modulename neq "licensing"}
							{assign var=itMenuChildItemActive value="yes"}
						{elseif $filename eq "clientarea" and $smarty.get.action eq "productdetails" and $modulename neq "licensing"}
							{assign var=itMenuChildItemActive value="yes"}
						{/if}
					{elseif $childItem->getName() eq "My Licenses"}
						{if $filename eq "clientarea" and $smarty.get.action eq "products" and $smarty.get.module eq "licensing"}
							{assign var=itMenuChildItemActive value="yes"}
						{elseif $templatefile eq "clientareaproductdetails" and $modulename eq "licensing"}
							{assign var=itMenuChildItemActive value="yes"}
						{/if}
					{elseif $childItem->getName() eq "Order New Services"}
						{if $templatefile eq "products"}
							{assign var=itMenuChildItemActive value="yes"}
						{/if}
					{elseif $childItem->getName() eq "View Available Addons"}
						{if $templatefile eq "addons"}
							{assign var=itMenuChildItemActive value="yes"}
						{/if}
					{elseif $childItem->getName() eq "My Domains"}
						{if $templatefile eq "clientareadomains" or $templatefile eq "clientareadomaindetails" or $templatefile eq "clientareadomaincontactinfo" or $templatefile eq "clientareadomaindns" or $templatefile eq "clientareadomainemailforwarding" or $templatefile eq "clientareadomaingetepp" or $templatefile eq "clientareadomainregisterns" or $templatefile eq "bulkdomainmanagement" or $templatefile eq "clientareadomainaddons"}
							{assign var=itMenuChildItemActive value="yes"}
						{/if}
					{elseif $childItem->getName() eq "Manage DNS"}
						{if $filename eq "index" and $smarty.get.m eq "DNSManager2"}
							{assign var=itMenuChildItemActive value="yes"}
						{/if}
					{elseif $childItem->getName() eq "Renew Domains"}
						{if $templatefile eq "domain-renewals"}
							{assign var=itMenuChildItemActive value="yes"}
						{/if}
					{elseif $childItem->getName() eq "Domain Search"}
						{if $templatefile eq "domainchecker" or $templatefile eq "bulkdomainchecker"}
							{assign var=itMenuChildItemActive value="yes"}
						{/if}
					{elseif $childItem->getName() eq "My Invoices"}
						{if $templatefile eq "clientareainvoices"}
							{assign var=itMenuChildItemActive value="yes"}
						{/if}
					{elseif $childItem->getName() eq "My Quotes"}
						{if $templatefile eq "clientareaquotes"}
							{assign var=itMenuChildItemActive value="yes"}
						{/if}
					{elseif $childItem->getName() eq "Mass Payment"}
						{if $templatefile eq "masspay"}
							{assign var=itMenuChildItemActive value="yes"}
						{/if}
					{elseif $childItem->getName() eq "Payment Methods"}
						{if $templatefile eq "account-paymentmethods" or $templatefile eq "account-paymentmethods-manage"}
							{assign var=itMenuChildItemActive value="yes"}
						{/if}
					{elseif $childItem->getName() eq "Add Funds"}
						{if $templatefile eq "clientareaaddfunds"}
							{assign var=itMenuChildItemActive value="yes"}
						{/if}
					{elseif $childItem->getName() eq "Tickets"}
						{if $templatefile eq "supportticketslist" or $templatefile eq "viewticket"}
							{assign var=itMenuChildItemActive value="yes"}
						{/if}
					{elseif $childItem->getName() eq "Announcements"}
						{if $templatefile eq "announcements" or $templatefile eq "viewannouncement"}
							{assign var=itMenuChildItemActive value="yes"}
						{/if}
					{elseif $childItem->getName() eq "Knowledgebase"}
						{if $templatefile eq "knowledgebase" or $templatefile eq "knowledgebasearticle" or $templatefile eq "knowledgebasecat"}
							{assign var=itMenuChildItemActive value="yes"}
						{/if}
					{elseif $childItem->getName() eq "Downloads"}
						{if $templatefile eq "downloads" or $templatefile eq "downloadscat"}
							{assign var=itMenuChildItemActive value="yes"}
						{/if}
					{elseif $childItem->getName() eq "Network Status"}
						{if $templatefile eq "serverstatus"}
							{assign var=itMenuChildItemActive value="yes"}
						{/if}
                    {elseif $childItem->getName() eq "Manage SSL Certificates"}
						{if $templatefile eq "managessl"}
							{assign var=itMenuChildItemActive value="yes"}
						{/if}
					{/if}
				{/if}
                {if $childItem->getName() eq "weebly"}
                    {if $templatefile eq "store/weebly/index"}
                        {assign var=itMenuChildItemActive value="yes"}
                    {/if}
                {elseif $childItem->getName() eq "spamexperts"}
                    {if $templatefile eq "store/spamexperts/index"}
                        {assign var=itMenuChildItemActive value="yes"}
                    {/if}
                {elseif $childItem->getName() eq "symantec"}
                    {if strpos($templatefile, "store/ssl") !== false}
                        {assign var=itMenuChildItemActive value="yes"}
                    {/if}
                {elseif $childItem->getName() eq "sitelock"}
                    {if strpos($templatefile, "store/sitelock/") !== false}
                        {assign var=itMenuChildItemActive value="yes"}
                    {/if}
				{elseif $childItem->getName() eq "codeguard"}
					{if strpos($templatefile, "store/codeguard") !== false}
						{assign var=itMenuChildItemActive value="yes"}
					{/if}
				{elseif $childItem->getName() eq "marketgoo"}
					{if strpos($templatefile, "store/marketgoo") !== false}
						{assign var=itMenuChildItemActive value="yes"}
					{/if}
				{elseif $childItem->getName() eq "sitelockvpn"}
					{if strpos($templatefile, "store/sitelockvpn/") !== false}
						{assign var=itMenuChildItemActive value="yes"}
					{/if}
                {elseif $childItem->getName() eq "Register a New Domain"}
						{if $templatefile eq "domainregister"}
							{assign var=itMenuChildItemActive value="yes"}
						{elseif $filename eq "orderdomain"}
							{assign var=itMenuChildItemActive value="yes"}
						{/if}
                {elseif $childItem->getName() eq "Transfer a Domain to Us"}
                    {if $templatefile eq "domaintransfer"}
                        {assign var=itMenuChildItemActive value="yes"}
                    {/if}
                {/if}
                {if strpos($childItem->getId(), "Primary_Navbar-Store-") !== false}
                    {if $childItem->getUri() eq $smarty.server.REQUEST_URI}
                        {assign var=itMenuChildItemActive value="yes"}
                    {/if}
                {/if}
                <li menuItemName="{$childItem->getName()}" class="{if $itMenuChildItemActive eq "yes"}active{/if}{if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}">
                    <a href="{$childItem->getUri()}"{if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if}>
                        {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                        {$childItem->getLabel()}
                        {if $childItem->hasBadge()}&nbsp;<span class="badge">{$childItem->getBadge()}</span>{/if}
                    </a>
                </li>
            {/foreach}
            </ul>
        {/if}
    </li>
{/foreach}
