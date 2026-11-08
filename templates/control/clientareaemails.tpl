<div class="modal fade" id="emailModal" tabindex="-1" role="dialog" aria-labelledby="emailModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="emailModalLabel">...</h4>
        <div id="attachments-list"></div>
      </div>
      <div class="modal-body modal-body-touch" style="padding: 0; height: calc(100vh - 250px); min-height: calc(100vh - 250px);
    -webkit-overflow-scrolling: touch;">
       	<img src="templates/{$template}/img/loading.gif" style="display: block; margin: 10px auto;" />
	  </div>
      <div class="modal-footer">
	  	<div class="btn-group">
			<button type="button" id="printButton" class="btn btn-default">{$LANG.print}</button>
			<button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.supportticketsclose}</button>
		</div>
      </div>
    </div>
  </div>
</div>
<!-- End Modal: emailModal  -->
{include file="$template/includes/tablelist.tpl" tableName="EmailsList" noSortColumns="-1"}
<script type="text/javascript">
	jQuery(document).ready( function ()
	{
		var table = $('#tableEmailsList').DataTable();
		{if $orderby == 'date'}
			table.order(0, '{$sort}');
		{elseif $orderby == 'subject'}
			table.order(1, '{$sort}');
		{/if}
		table.draw();
	});
</script>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">{$LANG.clientareaemails}</h3>
			</div>
			<div class="panel-body">
				<div class="table-container clearfix">
					<table id="tableEmailsList" class="table table-bordered table-hover table-list" width="100%">
						<thead>
							<tr>
								<th>{$LANG.clientareaemailsdate}</th>
								<th>{$LANG.clientareaemailssubject}</th>
								<th>&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							{foreach from=$emails item=email}
							<tr>
								<td><span class="hidden">{$email.normalisedDate}</span>{$email.date}</td>
								<td>{$email.subject}{if $email.attachmentCount > 0} <i class="fal fa-paperclip"></i>{/if}</td>
								<td>
                                    <button type="button" class="btn btn-primary btn-3d btn-sm btn-block" data-toggle="modal" data-target="#emailModal" data-ref="{$email.id}" data-subj="{$email.subject}" data-date="{$email.date}" data-attachments-count="{$email.attachmentCount}">
                                        {$LANG.emailviewmessage}
                                    </button>
								</td>
							</tr>
							{/foreach}
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$('#emailModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var email = button.data('ref') // Extract info from data-* attributes
	  var subject = button.data('subj')
	  var date = button.data('date')
      var attachmentCount = button.data('attachments-count')
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
      modal.find('.modal-title').html('{$LANG.clientareaemailssubject}: ' + subject + '<br/><small>{$LANG.clientareaemailsdate|escape:"javascript"}: ' + date + '</small>')
	  modal.find('.modal-body').html('<iframe name="msgcontent" id="msgcontent" src="" width="100%" height="100%" style="display:block;" frameborder="0"></iframe>')
	  $('iframe').attr("src",'{$WEB_ROOT}/viewemail.php?id=' + email + '&internal=yes');
      if (attachmentCount > 0) {
          modal.find('#attachments-list').load('{$WEB_ROOT}/viewemail.php?id=' + email + '&internal=attachments #attachments');
      }
    });
	$('#emailModal').on('hide.bs.modal', function (event) {
	  var modal = $(this)
	  modal.find('.modal-title').text('...')
	  modal.find('.modal-body').html('<img src="templates/{$template}/img/loading.gif" style="display: block; margin: 10px auto;" />')
      modal.find('#attachments-list').html('')
	});
	$('#printButton').on('click',function (){
	   //call print method
	   msgcontent.focus();
	   msgcontent.print();
	});
</script>
