{literal}
	<style>

		/* 
			Labels for Responsive Tables 
			----------------------------
		*/

		@media 
		only screen and (max-width: 760px),
		(min-device-width: 768px) and (max-device-width: 1024px)  {

			/* 	
				Labels for Responsive Table 1 - Client Homepage & Support Tickets Page - Open Support Tickets
				File: clientareahome.tpl, supportticketslist.tpl
				Table ID: homesupptick
			*/

			table#homesupptick td:nth-of-type(1):before { content: "{/literal}{$LANG.supportticketsdate}{literal}"; font-weight: bold; }
			table#homesupptick td:nth-of-type(2):before { content: "{/literal}{$LANG.supportticketsdepartment}{literal}"; font-weight: bold; }
			table#homesupptick td:nth-of-type(3):before { content: "{/literal}{$LANG.supportticketssubject}{literal}"; font-weight: bold; }
			table#homesupptick td:nth-of-type(4):before { content: "{/literal}{$LANG.supportticketsstatus}{literal}"; font-weight: bold; }
			table#homesupptick td:nth-of-type(5):before { content: "{/literal}{$LANG.supportticketsticketlastupdated}{literal}"; font-weight: bold; }
			
			
			/* 	
				Labels for Responsive Table 2 - Client Homepage Due Invoices
				File: clientareahome.tpl
				Table ID: homeinvdue
			*/
			
			
			table#homeinvdue tr.item td:nth-of-type(1):before { content: ""; font-weight: bold; }
			table#homeinvdue tr.item td:nth-of-type(2):before { content: "{/literal}{$LANG.invoicenumber}{literal}"; font-weight: bold; }
			table#homeinvdue tr.item td:nth-of-type(3):before { content: "{/literal}{$LANG.invoicesdatecreated}{literal}"; font-weight: bold; }
			table#homeinvdue tr.item td:nth-of-type(4):before { content: "{/literal}{$LANG.invoicesdatedue}{literal}"; font-weight: bold; }
			table#homeinvdue tr.item td:nth-of-type(5):before { content: "{/literal}{$LANG.invoicestotal}{literal}"; font-weight: bold; }
			table#homeinvdue tr.item td:nth-of-type(6):before { content: "{/literal}{$LANG.invoicesbalance}{literal}"; font-weight: bold; }
	
			
			/* 	
				Labels for Responsive Table 3 - My Produces & Services
				File: clientareaproducts.tpl
				Table ID: myproducts
			*/
			
			table#myproducts tr td:nth-of-type(1):before { content: ""; font-weight: bold; }
			table#myproducts tr td:nth-of-type(2):before { content: "{/literal}{$LANG.orderprice}{literal}"; font-weight: bold; }
			table#myproducts tr td:nth-of-type(3):before { content: "{/literal}{$LANG.orderbillingcycle}{literal}"; font-weight: bold; }
			table#myproducts tr td:nth-of-type(4):before { content: "{/literal}{$LANG.clientareahostingnextduedate}{literal}"; font-weight: bold; }
			table#myproducts tr td:nth-of-type(5):before { content: "{/literal}{$LANG.clientareastatus}{literal}"; font-weight: bold; }
	
			
			/* 	
				Labels for Responsive Table 4 - Affiliates Page, Your Referrals
				File: affiliates.tpl
				Table ID: affyouref
			*/
			
			table#affyouref td:nth-of-type(1):before { content: "{/literal}{$LANG.affiliatessignupdate}{literal}"; font-weight: bold; }
			table#affyouref td.nolabel:nth-of-type(1):before { content: ""; font-weight: bold; }
			table#affyouref td:nth-of-type(2):before { content: "{/literal}{$LANG.orderproduct}{literal}"; font-weight: bold; }
			table#affyouref td:nth-of-type(3):before { content: "{/literal}{$LANG.affiliatesamount}{literal}"; font-weight: bold; }
			table#affyouref td:nth-of-type(4):before { content: "{/literal}{$LANG.affiliatescommission}{literal}"; font-weight: bold; }
			table#affyouref td:nth-of-type(5):before { content: "{/literal}{$LANG.affiliatesstatus}{literal}"; font-weight: bold; }
			
			
			/* 	
				Labels for Responsive Table 5 - Domain pricing table
				File: bulkdomainchecker.tpl, bulkdomaintransfer.tpl, domainchecker.tpl
				Table ID: dompri
			*/
			
			table#dompri td:nth-of-type(1):before { content: "{/literal}{$LANG.domaintld}{literal}"; font-weight: bold; }
			table#dompri td:nth-of-type(2):before { content: "{/literal}{$LANG.domainminyears}{literal}"; font-weight: bold; }
			table#dompri td:nth-of-type(3):before { content: "{/literal}{$LANG.domainsregister}{literal}"; font-weight: bold; }
			table#dompri td:nth-of-type(4):before { content: "{/literal}{$LANG.domainstransfer}{literal}"; font-weight: bold; }
			table#dompri td:nth-of-type(5):before { content: "{/literal}{$LANG.domainsrenew}{literal}"; font-weight: bold; }

			
			/* 	
				Labels for Responsive Table 6 - Bulk Domain Checker Results
				File: bulkdomainchecker.tpl
				Table ID: buldomcheres
			*/

			table#buldomcheres td:nth-of-type(1):before { content: "{/literal}{$LANG.ordertitle}{literal}"; font-weight: bold; }
			table#buldomcheres td:nth-of-type(2):before { content: "{/literal}{$LANG.domainname}{literal}"; font-weight: bold; }
			table#buldomcheres td:nth-of-type(3):before { content: "{/literal}{$LANG.domainstatus}{literal}"; font-weight: bold; }
			table#buldomcheres td:nth-of-type(4):before { content: "{/literal}{$LANG.domainmoreinfo}{literal}"; font-weight: bold; }
	
		
			/* 	
				Labels for Responsive Table 7 - My Domains Listing
				File: clientareadomains.tpl
				Table ID: cliaredomlis
			*/
			
			table#cliaredomlis td:nth-of-type(1):before { content: ""; font-weight: bold; }
			table#cliaredomlis td:nth-of-type(2):before { content: "{/literal}{$LANG.clientareahostingdomain}{literal}"; font-weight: bold; }
			table#cliaredomlis td:nth-of-type(3):before { content: "{/literal}{$LANG.clientareahostingregdate}{literal}"; font-weight: bold; }
			table#cliaredomlis td:nth-of-type(4):before { content: "{/literal}{$LANG.clientareahostingnextduedate}{literal}"; font-weight: bold; }
			table#cliaredomlis td:nth-of-type(5):before { content: "{/literal}{$LANG.clientareastatus}{literal}"; font-weight: bold; }
			table#cliaredomlis td:nth-of-type(6):before { content: "{/literal}{$LANG.domainsautorenew}{literal}"; font-weight: bold; }


			/* 	
				Labels for Responsive Table 8 - Client Area Email History 
				File: clientareaemails.tpl
				Table ID: cliareemalis
			*/
		
			table#cliareemalis td:nth-of-type(1):before { content: "{/literal}{$LANG.clientareaemailsdate}{literal}"; font-weight: bold; }
			table#cliareemalis td:nth-of-type(2):before { content: "{/literal}{$LANG.clientareaemailssubject}{literal}"; font-weight: bold; }


			/* 	
				Labels for Responsive Table 9 - Client Area Invoices
				File: clientareainvoices.tpl
				Table ID: cliareinv
			*/

			table#cliareinv td:nth-of-type(1):before { content: "{/literal}{$LANG.invoicestitle}{literal}"; font-weight: bold; }
			table#cliareinv td:nth-of-type(2):before { content: "{/literal}{$LANG.invoicesdatecreated}{literal}"; font-weight: bold; }
			table#cliareinv td:nth-of-type(3):before { content: "{/literal}{$LANG.invoicesdatedue}{literal}"; font-weight: bold; }
			table#cliareinv td:nth-of-type(4):before { content: "{/literal}{$LANG.invoicestotal}{literal}"; font-weight: bold; }
			table#cliareinv td:nth-of-type(5):before { content: "{/literal}{$LANG.invoicesstatus}{literal}"; font-weight: bold; }


			/* 	
				Labels for Responsive Table 10 - Client Area Product Addons
				File: clientareaproductdetails.tpl
				Table ID: cliareproadd
			*/

			table#cliareproadd td:nth-of-type(1):before { content: "{/literal}{$LANG.clientareaaddon}{literal}"; font-weight: bold; }
			table#cliareproadd td:nth-of-type(2):before { content: "{/literal}{$LANG.clientareaaddonpricing}{literal}"; font-weight: bold; }
			table#cliareproadd td:nth-of-type(3):before { content: "{/literal}{$LANG.clientareahostingnextduedate}{literal}"; font-weight: bold; }
			table#cliareproadd td:nth-of-type(4):before { content: "{/literal}{$LANG.clientareastatus}{literal}"; font-weight: bold; }


			/* 	
				Labels for Responsive Table 11 - Client Area Quotes
				File: clientareaquotes.tpl
				Table ID: cliarequo
			*/
		
			table#cliarequo td:nth-of-type(1):before { content: "{/literal}{$LANG.quotenumber}{literal}"; font-weight: bold; }
			table#cliarequo td:nth-of-type(2):before { content: "{/literal}{$LANG.quotesubject}{literal}"; font-weight: bold; }
			table#cliarequo td:nth-of-type(3):before { content: "{/literal}{$LANG.quotedatecreated}{literal}"; font-weight: bold; }
			table#cliarequo td:nth-of-type(4):before { content: "{/literal}{$LANG.quotevaliduntil}{literal}"; font-weight: bold; }
			table#cliarequo td:nth-of-type(5):before { content: "{/literal}{$LANG.quotestage}{literal}"; font-weight: bold; }

		
			/* 	
				Labels for Responsive Table 12 - Downloads File List
				File: downloads.tpl, downloadscat.tpl
				Table ID: dowfillis
			*/
		
			table#dowfillis td:nth-of-type(1):before { content: ""; font-weight: bold; }
			table#dowfillis td:nth-of-type(2):before { content: "{/literal}{$LANG.clientareafilesfilename}{literal}"; font-weight: bold; }
			table#dowfillis td:nth-of-type(3):before { content: "{/literal}{$LANG.downloaddescription}{literal}"; font-weight: bold; }
			table#dowfillis td:nth-of-type(4):before { content: "{/literal}{$LANG.downloadsfilesize}{literal}"; font-weight: bold; }


			/* 	
				Labels for Responsive Table 13 - View Invoice - Transactions Table
				File: viewinvoice.tpl
				Table ID: viewinvotran
			*/
			
			table#viewinvotran td:nth-of-type(1):before { content: "{/literal}{$LANG.invoicestransdate}{literal}"; font-weight: bold; }
			table#viewinvotran td:nth-of-type(2):before { content: "{/literal}{$LANG.invoicestransgateway}{literal}"; font-weight: bold; }
			table#viewinvotran td:nth-of-type(3):before { content: "{/literal}{$LANG.invoicestransid}{literal}"; font-weight: bold; }
			table#viewinvotran td:nth-of-type(4):before { content: "{/literal}{$LANG.invoicestransamount}{literal}"; font-weight: bold; }
			table#viewinvotran td.nolabel:before { content: ""; font-weight: bold; }
			table#viewinvotran td.nolabel2:before { content: ""; font-weight: bold; }

		
			/* 	
				Labels for Responsive Table 14 - Flare Modern Order Form, Domain Suggestions
				File: orderforms/flare/domainoptions.tpl
				Table ID: domoptdomsug
			*/
	
			table#domoptdomsug td:nth-of-type(1):before { content: ""; font-weight: bold; }
			table#domoptdomsug td:nth-of-type(2):before { content: "{/literal}{$LANG.domainname}{literal}"; font-weight: bold; }
			table#domoptdomsug td:nth-of-type(3):before { content: "{/literal}{$LANG.clientarearegistrationperiod}{literal}"; font-weight: bold; }

		}

	</style>
{/literal}