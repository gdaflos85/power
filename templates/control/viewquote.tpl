<!DOCTYPE html>
<!-- Load theme options -->
{include file="$template/includes/theme-options.tpl"}
<!-- Load theme functions -->
{include file="$template/includes/theme-functions.tpl"}
{if $itTextDirectionRTL eq "enabled"}
	<html dir="rtl">
{else}
	<html>
{/if}
	<head>
		<meta charset="{$charset}" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>{$companyname} - {$LANG.quotenumber}{$id}</title>
		<!-- Font Awesome -->
        <link href="{$WEB_ROOT}/assets/css/fontawesome-all.min.css" rel="stylesheet">
		<!-- Styling -->
		<link rel="stylesheet" href="{assetPath file=$itMainCSSFile}?v={$itResourceRef}">
		<!-- Invoice/Quote CSS -->
		{if $itCSSMin eq "enabled"}
			<link href="{assetPath file='invoice.min.css'}" rel="stylesheet">
		{else}
			<link href="{assetPath file='invoice.css'}" rel="stylesheet">
		{/if}
		{if $itTextDirectionRTL eq "enabled"}
			<!-- Load Bootstrap RTL theme -->
			{if $itCSSMin eq "enabled"}
				<link rel="stylesheet" href="{assetPath file='bootstrap-rtl.min.css'}">
			{else}
				<link rel="stylesheet" href="{assetPath file='bootstrap-rtl.css'}">
			{/if}
		{/if}
		{assetExists file="custom.css"}
			<!-- Custom Styling -->
			<link href="{$__assetPath__}" rel="stylesheet">
		{/assetExists}
		<!-- JS -->
		{if $itJSMin eq "enabled"}
			<script src="{assetPath file='scripts.min.js'}?v={$itResourceRef}"></script>
		{else}
			<script src="{assetPath file='scripts.js'}?v={$itResourceRef}"></script>
		{/if}
	</head>
	<body class="invoice">
		<section id="main-menu">
			<nav id="nav" class="navbar navbar-invoice navbar-default navbar-fixed-top" role="navigation">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-inv-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						{if $stage eq "Delivered" || $stage eq "On Hold"}
							<button type="button" class="navbar-toggle" class="btn btn-sm btn-success" data-toggle="modal" data-target="#acceptQuoteModal"><i class="fas fa-check-circle"></i> {$LANG.quoteacceptbtn}</button>
						{/if}
						<!-- Display brand -->
						<span class="navbar-brand">{$LANG.quotenumber}{$id}</span>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="bs-inv-navbar-collapse-1">
						<p class="navbar-text inv-status visible-md visible-lg">{$LANG.quotestage}:
							<strong>
								{if $stage eq "Delivered"}
									<span class="unpaid">{$LANG.quotestagedelivered}</span>
								{elseif $stage eq "Accepted"}
									<span class="paid">{$LANG.quotestageaccepted}</span>
								{elseif $stage eq "On Hold"}
									<span class="refunded">{$LANG.quotestageonhold}</span>
								{elseif $stage eq "Lost"}
									<span class="cancelled">{$LANG.quotestagelost}</span>
								{elseif $stage eq "Dead"}
									<span class="collections">{$LANG.quotestagedead}</span>
								{/if}
							</strong>
						</p>
						{if $stage eq "Delivered" || $stage eq "On Hold"}
							<p class="navbar-text visible-md visible-lg">{$LANG.actions}:
								<button type="button" class="btn btn-sm btn-success" data-toggle="modal" data-target="#acceptQuoteModal"><i class="fas fa-check-circle"></i> {$LANG.quoteacceptbtn}</button>
							</p>
						{/if}
						<ul class="nav navbar-nav navbar-right">
							<li><a href="javascript:window.print()"><i class="fas fa-print"></i>&nbsp;&nbsp;{$LANG.print}</a></li>
							<li><a href="dl.php?type=q&amp;id={$quoteid}"><i class="fas fa-file-download"></i>&nbsp;&nbsp;{$LANG.invoicesdownload}</a></li>
							<li><a href="clientarea.php?action=quotes"><i class="fas {if $itTextDirectionRTL eq "enabled"}fa-arrow-circle-right{else}fa-arrow-circle-left{/if}"></i>&nbsp;&nbsp;{$LANG.invoicesbacktoclientarea}</a></li>

						</ul>
					</div><!-- /.navbar-collapse -->
				</div>
			</nav>
		</section>
		<div class="container-fluid invoice-container">
			{if $invalidQuoteIdRequested}
				{include file="$template/includes/panel.tpl" type="danger" headerTitle=$LANG.error bodyContent=$LANG.invoiceserror bodyTextCenter=true}
			{else}
				<div class="row">
					<div class="col-sm-7">
						{if $logo}
							<p><img src="{$logo}" title="{$companyname}" /></p>
						{else}
							<h2>{$companyname}</h2>
						{/if}
						<address class="small-text">
							{$payto}
						</address>
					</div>
					<div class="col-sm-5 text-center">
						<h3 class="pull-right">{$LANG.quotenumber}{$id}</h3>
					</div>
				</div>
				<hr>
				{if $agreetosrequired}
					{include file="$template/includes/panel.tpl" type="danger" headerTitle=$LANG.error bodyContent=$LANG.ordererroraccepttos bodyTextCenter=true}
				{/if}
				<div class="row">
					<div class="col-xs-6">
						<strong>{$LANG.quoterecipient}:</strong>
						<address class="small-text">
							{if $clientsdetails.companyname}{$clientsdetails.companyname}<br />{/if}
							{$clientsdetails.firstname} {$clientsdetails.lastname}<br />
							{$clientsdetails.address1}<br />
							{if $clientsdetails.address2}{$clientsdetails.address2}<br />{/if}
							{$clientsdetails.city}<br />
							{$clientsdetails.state}<br />
							{$clientsdetails.postcode}<br />
							{$clientsdetails.country}
							{if $customfields}
							<br /><br />
							{foreach from=$customfields item=customfield}
							{$customfield.fieldname}: {$customfield.value}<br />
							{/foreach}
							{/if}
						</address>
					</div>
					<div class="col-xs-6 text-right">
						<strong>{$LANG.quotedatecreated}:</strong><br />
						<span class="small-text">
							{$datecreated}<br /><br />
						</span>
						<strong>{$LANG.quotevaliduntil}:</strong><br />
						<span class="small-text">
							{$validuntil}<br /><br />
						</span>
						<strong>{$LANG.quotestage}:</strong><br />
						<span class="small-text">
							{if $stage eq "Delivered"}
								<span class="unpaid">{$LANG.quotestagedelivered}</span>
							{elseif $stage eq "Accepted"}
								<span class="paid">{$LANG.quotestageaccepted}</span>
							{elseif $stage eq "On Hold"}
								<span class="refunded">{$LANG.quotestageonhold}</span>
							{elseif $stage eq "Lost"}
								<span class="cancelled">{$LANG.quotestagelost}</span>
							{elseif $stage eq "Dead"}
								<span class="collections">{$LANG.quotestagedead}</span>
							{/if}
						</span>
					</div>
				</div>
				<br />
				{if $proposal}
					{include file="$template/includes/panel.tpl" type="warning" headerTitle=$LANG.quoteproposal bodyContent=$proposal}
				{/if}
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title"><strong>{$LANG.quotelineitems}</strong></h3>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-condensed">
								<thead>
									<tr>
										<td><strong>{$LANG.invoicesdescription}</strong></td>
										<td class="text-right"><strong>{$LANG.quotediscountheading}</strong></td>
										<td width="20%" class="text-right"><strong>{$LANG.invoicesamount}</strong></td>
									</tr>
								</thead>
								<tbody>
									{foreach from=$quoteitems item=item}
										<tr>
											<td>{$item.description}{if $item.taxed} *{/if}</td>
											<td class="text-right">{if $item.discountpc > 0}{$item.discount} ({$item.discountpc}%){else} - {/if}</td>
											<td class="text-right">{$item.amount}</td>
										</tr>
									{/foreach}
									<tr>
										<td colspan="2" class="total-row text-right"><strong>{$LANG.invoicessubtotal}</strong></td>
										<td class="total-row text-right">{$subtotal}</td>
									</tr>
									{if $taxrate}
										<tr>
											<td colspan="2" class="total-row text-right"><strong>{$taxrate}% {$taxname}</strong></td>
											<td class="total-row text-right">{$tax}</td>
										</tr>
									{/if}
									{if $taxrate2}
										<tr>
											<td colspan="2" class="total-row text-right"><strong>{$taxrate2}% {$taxname2}</strong></td>
											<td class="total-row text-right">{$tax2}</td>
										</tr>
									{/if}
									<tr>
										<td colspan="2" class="total-row text-right"><strong>{$LANG.quotelinetotal}</strong></td>
										<td class="total-row text-right">{$total}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				{if $notes}
					{include file="$template/includes/panel.tpl" type="info" headerTitle=$LANG.invoicesnotes bodyContent=$notes}
				{/if}
				{if $taxrate}
					<p>* {$LANG.invoicestaxindicator}</p>
				{/if}
			{/if}
		</div>
		<!-- Quote Accept Modal -->
		<form method="post" action="viewquote.php?id={$quoteid}&amp;action=accept">
			<div class="modal fade" id="acceptQuoteModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title">{$LANG.quoteacceptbtn}</h4>
						</div>
						<div class="modal-body">
							<p>{$LANG.quoteacceptagreetos}</p>
							<p>
								<label class="checkbox-inline" id="quoteAcceptAgreeTos">
									<input type="checkbox" name="agreetos" />
									{$LANG.ordertosagreement} <a id="toslink" href="{$tosurl}" target="_blank">{$LANG.ordertos}</a>
								</label>
							</p>
							<small>{$LANG.quoteacceptcontractwarning}</small>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default pull-right" data-dismiss="modal">{$LANG.cancel}</button>
							<button type="submit" class="btn btn-success btn-3d pull-left"><i class="fas fa-check-circle"></i> {$LANG.quoteacceptbtn}</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</body>
</html>
