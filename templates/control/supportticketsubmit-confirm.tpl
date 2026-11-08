<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">{$LANG.navopenticket}</h3>
			</div>
			<div class="panel-body">
				<div class="alert alert-success">
					<p><strong>{$LANG.supportticketsticketcreated} <a class="alert-link" id="ticket-number" href="viewticket.php?tid={$tid}&amp;c={$c}">#{$tid}</a></strong></p>
				</div>
				<p>{$LANG.supportticketsticketcreateddesc}</p>
			</div>
			<div class="panel-footer">
				<a href="viewticket.php?tid={$tid}&amp;c={$c}" class="btn btn-primary btn-3d res-100">
					{$LANG.continue}
					<i class="fas fa-arrow-circle-right"></i>
				</a>
			</div>
		</div>
	</div>
</div>