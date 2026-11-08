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
		<title>{$companyname} - {$pagetitle}</title>
        <!-- Font Awesome -->
        <link href="{$WEB_ROOT}/assets/css/fontawesome-all.min.css" rel="stylesheet">
		<!-- Styling -->
		<link rel="stylesheet" href="{assetPath file=$itMainCSSFile}?v={$itResourceRef}">
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
		<script>var whmcsBaseUrl = "{$WEB_ROOT}";</script>
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
						{if $status eq "Unpaid" || $status eq "Draft"}
							<button type="button" class="navbar-toggle" data-toggle="modal" data-target="#payInvoiceModal"><i class="fas fa-check-circle"></i> {$LANG.invoicespaynow}</button>
						{/if}
						<!-- Display brand -->
						<span class="navbar-brand">{$pagetitle}</span>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="bs-inv-navbar-collapse-1">
						<p class="navbar-text inv-status visible-md visible-lg">{$LANG.invoicesstatus}:
							<strong>
								{if $status eq "Draft"}
									<span class="draft">{$LANG.invoicesdraft}</span>
								{elseif $status eq "Unpaid"}
									<span class="unpaid">{$LANG.invoicesunpaid}</span>
								{elseif $status eq "Paid"}
									<span class="paid">{$LANG.invoicespaid}</span>
								{elseif $status eq "Refunded"}
									<span class="refunded">{$LANG.invoicesrefunded}</span>
								{elseif $status eq "Cancelled"}
									<span class="cancelled">{$LANG.invoicescancelled}</span>
								{elseif $status eq "Collections"}
									<span class="collections">{$LANG.invoicescollections}</span>
                                {elseif $status eq "Payment Pending"}
                                    <span class="paid">{$LANG.invoicesPaymentPending}</span>
								{/if}
							</strong>
						</p>
						{if $status eq "Unpaid" || $status eq "Draft"}
							<p class="navbar-text visible-md visible-lg">{$LANG.actions}:
								<button type="button" class="btn btn-sm btn-success" data-toggle="modal" data-target="#payInvoiceModal"><i class="fas fa-check-circle"></i> {$LANG.invoicespaynow}</button>
							</p>
						{/if}
						<ul class="nav navbar-nav navbar-right">
							<li><a href="javascript:window.print()"><i class="fas fa-print"></i>&nbsp;&nbsp;{$LANG.print}</a></li>
							<li><a href="dl.php?type=i&amp;id={$invoiceid}"><i class="fas fa-file-download"></i>&nbsp;&nbsp;{$LANG.invoicesdownload}</a></li>
							<li><a href="clientarea.php?action=invoices"><i class="fas {if $itTextDirectionRTL eq "enabled"}fa-arrow-circle-right{else}fa-arrow-circle-left{/if}"></i>&nbsp;&nbsp;{$LANG.invoicesbacktoclientarea}</a></li>
						</ul>
					</div><!-- /.navbar-collapse -->
				</div>
			</nav>
		</section>
		<div class="container-fluid invoice-container">
			{if $invalidInvoiceIdRequested}
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
                            {if $taxCode}<br />{$taxIdLabel}: {$taxCode}{/if}
						</address>
					</div>
					<div class="col-sm-5 text-center">
						<h3 class="pull-right">{$pagetitle}</h3>
					</div>
				</div>
				<hr>
				{if $paymentSuccessAwaitingNotification}
                    {include file="$template/includes/panel.tpl" type="success" headerTitle=$LANG.success bodyContent=$LANG.invoicePaymentSuccessAwaitingNotify bodyTextCenter=true}
                {elseif $paymentSuccess}
					{include file="$template/includes/panel.tpl" type="success" headerTitle=$LANG.success bodyContent=$LANG.invoicepaymentsuccessconfirmation bodyTextCenter=true}
				{elseif $pendingReview}
					{include file="$template/includes/panel.tpl" type="info" headerTitle=$LANG.success bodyContent=$LANG.invoicepaymentpendingreview bodyTextCenter=true}
				{elseif $paymentFailed}
					{include file="$template/includes/panel.tpl" type="danger" headerTitle=$LANG.error bodyContent=$LANG.invoicepaymentfailedconfirmation bodyTextCenter=true}
				{elseif $offlineReview}
					{include file="$template/includes/panel.tpl" type="info" headerTitle=$LANG.success bodyContent=$LANG.invoiceofflinepaid bodyTextCenter=true}
				{/if}
				<div class="row">
					<div class="col-xs-6">
						<strong>{$LANG.invoicesinvoicedto}:</strong>
						<address class="small-text">
							{if $clientsdetails.companyname}{$clientsdetails.companyname}<br />{/if}
							{$clientsdetails.address1}<br />
							{if $clientsdetails.address2}{$clientsdetails.address2}<br />{/if}
							{$clientsdetails.city}<br />
							{$clientsdetails.state}<br />
							{$clientsdetails.postcode}<br />
							{$clientsdetails.country}
                            {if $clientsdetails.tax_id}
                                <br />{$taxIdLabel}: {$clientsdetails.tax_id}
                            {/if}
							{if $customfields}
							<br /><br />
							{foreach from=$customfields item=customfield}
							{$customfield.fieldname}: {$customfield.value}<br />
							{/foreach}
							{/if}
						</address>
					</div>
					<div class="col-xs-6 text-right">
						<strong>{$LANG.invoicesdatecreated}:</strong><br />
						<span class="small-text">
							{$date}<br /><br />
						</span>
						<strong>{$LANG.invoicesstatus}:</strong><br />
						<span class="small-text">
							{if $status eq "Draft"}
								<span class="draft">{$LANG.invoicesdraft}</span>
							{elseif $status eq "Unpaid"}
								<span class="unpaid">{$LANG.invoicesunpaid}</span>
							{elseif $status eq "Paid"}
								<span class="paid">{$LANG.invoicespaid}</span>
							{elseif $status eq "Refunded"}
								<span class="refunded">{$LANG.invoicesrefunded}</span>
							{elseif $status eq "Cancelled"}
								<span class="cancelled">{$LANG.invoicescancelled}</span>
							{elseif $status eq "Collections"}
								<span class="collections">{$LANG.invoicescollections}</span>
                            {elseif $status eq "Payment Pending"}
                                <span class="paid">{$LANG.invoicesPaymentPending}</span>
							{/if}
							<br /><br />
						</span>
						{if $status neq "Unpaid"}
							<strong>{$LANG.paymentmethod}:</strong><br />
							<span class="small-text" data-role="paymethod-info">
								{$paymentmethod}{if $paymethoddisplayname} ({$paymethoddisplayname}){/if}
							</span>
						{/if}
					</div>
				</div>
				<br />
				{if $notes}
					{include file="$template/includes/panel.tpl" type="info" headerTitle=$LANG.invoicesnotes bodyContent=$notes}
				{/if}
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title"><strong>{$LANG.invoicelineitems}</strong></h3>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-condensed">
								<thead>
									<tr>
										<td><strong>{$LANG.invoicesdescription}</strong></td>
										<td width="20%" class="text-right"><strong>{$LANG.invoicesamount}</strong></td>
									</tr>
								</thead>
								<tbody>
									{foreach from=$invoiceitems item=item}
										<tr>
											<td>{$item.description}{if $item.taxed eq "true"} *{/if}</td>
											<td class="text-right">{$item.amount}</td>
										</tr>
									{/foreach}
									<tr>
										<td class="total-row text-right"><strong>{$LANG.invoicessubtotal}</strong></td>
										<td class="total-row text-right">{$subtotal}</td>
									</tr>
									{if $taxname}
										<tr>
											<td class="total-row text-right"><strong>{$taxrate}% {$taxname}</strong></td>
											<td class="total-row text-right">{$tax}</td>
										</tr>
									{/if}
									{if $taxname2}
										<tr>
											<td class="total-row text-right"><strong>{$taxrate2}% {$taxname2}</strong></td>
											<td class="total-row text-right">{$tax2}</td>
										</tr>
									{/if}
									<tr>
										<td class="total-row text-right"><strong>{$LANG.invoicescredit}</strong></td>
										<td class="total-row text-right">{$credit}</td>
									</tr>
									<tr>
										<td class="total-row text-right"><strong>{$LANG.invoicestotal}</strong></td>
										<td class="total-row text-right">{$total}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				{if $taxrate}
					<p>* {$LANG.invoicestaxindicator}</p>
				{/if}
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title"><strong>{$LANG.invoicestransactions}</strong></h3>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-condensed">
								<thead>
									<tr>
										<td class=""><strong>{$LANG.invoicestransdate}</strong></td>
										<td class=""><strong>{$LANG.invoicestransgateway}</strong></td>
										<td class=""><strong>{$LANG.invoicestransid}</strong></td>
										<td class="text-right"><strong>{$LANG.invoicestransamount}</strong></td>
									</tr>
								</thead>
								<tbody>
									{foreach from=$transactions item=transaction}
										<tr>
											<td>{$transaction.date}</td>
											<td>{$transaction.gateway}</td>
											<td>{$transaction.transid}</td>
											<td class="text-right">{$transaction.amount}</td>
										</tr>
									{foreachelse}
										<tr>
											<td class="text-center" colspan="4">{$LANG.invoicestransnonefound}</td>
										</tr>
									{/foreach}
									<tr>
										<td class="text-right" colspan="3"><strong>{$LANG.invoicesbalance}</strong></td>
										<td class="text-right">{$balance}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			{/if}
		</div>
		<div class="container">
			<!-- Pay Invoice Modal -->
			<div class="modal fade" id="payInvoiceModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title">{$LANG.invoicespaynow}</h4>
						</div>
						<div class="modal-body">
							{if $manualapplycredit}
								<div class="panel panel-success">
									<div class="panel-heading">
										<h3 class="panel-title"><strong>{$LANG.invoiceaddcreditapply}</strong></h3>
									</div>
									<div class="panel-body">
										<form method="post" action="{$smarty.server.PHP_SELF}?id={$invoiceid}">
											<input type="hidden" name="applycredit" value="true" />
											{$LANG.invoiceaddcreditdesc1} <strong>{$totalcredit}</strong>. {$LANG.invoiceaddcreditdesc2}. {$LANG.invoiceaddcreditamount}:
											<div class="row">
												<div class="col-md-6">
													<br />
													<div class="input-group">
														<input type="text" name="creditamount" value="{$creditamount}" class="form-control input-group" />
														<span class="input-group-btn">
															<input type="submit" value="{$LANG.invoiceaddcreditapply}" class="btn btn-success" id="btnInvoiceAddCreditApply" />
														</span>
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
								<p class="text-center">{$LANG.or}</p>
							{/if}
							<div class="panel panel-success">
								<div class="panel-heading">
									<h3 class="panel-title"><strong>{$LANG.paymentmethod}</strong></h3>
								</div>
								<div class="panel-body">
									<div class="row">
										<div class="col-md-6">
											{if $status eq "Unpaid" && $allowchangegateway}
												<form method="post" id="gatewayform" action="{$smarty.server.PHP_SELF}?id={$invoiceid}" class="form-inline">
													{$gatewaydropdown}
												</form>

											{else}
												{$paymentmethod}{if $paymethoddisplayname} ({$paymethoddisplayname}){/if}
											{/if}
											<br/>
										</div>
										<div class="col-md-6">
											{if $status eq "Unpaid" || $status eq "Draft"}
												<div id="pay-container" class="payment-btn-container" align="center">
													{$paymentbutton}
												</div>
											{/if}
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="fullpage-overlay" class="hidden">
			<div class="outer-wrapper">
				<div class="inner-wrapper">
					<img src="{$WEB_ROOT}/assets/img/overlay-spinner.svg">
					<br>
					<span class="msg"></span>
				</div>
			</div>
		</div>
		<script>
			$('#payInvoiceModal').on('show.bs.modal', function (event) {

				 $("select[name='gateway']").removeAttr( "onchange" );
				 $("select[name='gateway']").attr( "onchange", "bgsubmit();" )

			});
			function bgsubmit() {
				$("#pay-container").html('<img src="templates/{$template}/img/loading.gif" style="display: block; margin: 10px auto;" />');
				$.post( "{$smarty.server.PHP_SELF}?id={$invoiceid}", $( "#gatewayform" ).serialize() )
				.done(function() {
					window.location = "{$smarty.server.PHP_SELF}?id={$invoiceid}&action=paynow";
				});
			}
		</script>
        {if $smarty.get.action eq "paynow"}
            <script type="text/javascript">
                $(window).on('load',function(){
                    $('#payInvoiceModal').removeClass('fade');
                    $('#payInvoiceModal').modal('show');
                    $('#payInvoiceModal').addClass('fade');
                });
            </script>

        {/if}
	</body>
</html>
