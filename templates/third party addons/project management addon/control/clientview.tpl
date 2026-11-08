<link href="modules/addons/project_management/css/client.css" rel="stylesheet" type="text/css" />
<div class="projectmanagement">
	
	<div class="row">
		<div class="col-md-12">
			<div class="alert alert-warning">
				<div class="row">
					<div class="col-md-2">
						<h5>{$_lang.created}</h5>
						<p><strong>{$project.created}</strong></p>
					</div>
					<div class="col-md-2">
			            <h5>{$_lang.duedate}</h5>
			            <p><strong>{$project.duedate}</strong></p>
					</div>
					{if in_array('time',$features)}
						<div class="col-md-2">
							<h5>{$_lang.totaltime}</h5>
							<p><strong>{$project.totaltime}</strong></p>
						</div>
					{/if}
					{if in_array('staff',$features)}
						<div class="col-md-3">
							<h5>{$_lang.assignedto}</h5>
							<p><strong>{$project.adminname}</strong></p>
						</div>
					{/if}
					<div class="col-md-3">
			            <h5>{$_lang.status}</h5>
			            <p><strong>{$project.status}</strong></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
    {if $taskAddSuccess}
        {include file="$template/includes/alert.tpl" type="success" msg=$_lang.taskaddedsuccess textcenter=true}
    {/if}

    {if $fileUploadSuccess}
        {include file="$template/includes/alert.tpl" type="success" msg=$_lang.fileuploadsuccess textcenter=true}
    {/if}

    {if $fileUploadFailed}
        {include file="$template/includes/alert.tpl" type="danger" msg=$_lang.fileuploadfailed textcenter=true}
    {/if}

    {if $fileUploadDisallowed}
        {include file="$template/includes/alert.tpl" type="danger" msg=$_lang.fileuploaddisallowed textcenter=true}
    {/if}

    {if in_array('tasks', $features)}
        <div class="row">
            <div class="col-md-9">
	            <div class="panel panel-default">
		            <div class="panel-heading">
						<h3 class="panel-title">
							{if in_array('addtasks',$features)}
								<div class="pull-right">
									<a href="#" data-toggle="modal" data-target="#taskModal" class="btn btn-default btn-xs">
										<i class="fas fa-plus"></i> {$_lang.addtask}
									</a>
								</div>
							{/if}
							<i class="fas fa-tasks"></i>&nbsp; {$_lang.tasks}
						</h3>						
		            </div>
	                <table class="table table-striped">
	                    <thead>
	                        <tr>
	                            <th width="40" class="text-center">#</th>
	                            <th>{$_lang.taskdetail}</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        {foreach from=$tasks key=tasknum item=task}
	                            <tr>
	                                <td class="text-center">{$tasknum}</td>
	                                <td>
	                                    {$task.task}
	                                    {if $task.completed}
	                                        <span class="label label-danger">{$_lang.completed}</span>
	                                    {elseif $task.duein}
	                                        <span class="taskdue">{$task.duein}, {$task.duedate}</span>
	                                    {/if}
	                                    {if $task.times}
	                                        <table class="table table-striped table-bordered timedetailit" style="display: none; margin-top: 15px;">
	                                            <thead>
	                                                <tr>
	                                                    <th>{$_lang.starttime}</th>
	                                                    <th>{$_lang.stoptime}</th>
	                                                    <th>{$_lang.duration}</th>
	                                                </tr>
	                                            </thead>
	                                            <tbody>
	                                                {foreach from=$task.times item=time}
	                                                        <tr>
	                                                            <td>{$time.start}</td>
	                                                            {if $time.end}<td>{$time.end}</td>
	                                                            <td>{$time.duration}</td>
	                                                            {else}<td colspan="2">{$_lang.inprogress}</td>
	                                                            {/if}
	                                                        </tr>
	                                                {/foreach}
	                                                <tr>
	                                                    <td colspan="2"><strong>{$_lang.total}</strong></td>
	                                                    <td><strong>{$task.totaltime}</strong></td>
	                                                </tr>
	                                            </tbody>
	                                        </table>
	                                    {/if}
	                                </td>
	                            </tr>
	                        {/foreach}
	                    </tbody>
	                </table>
	            </div>
	            
                {include file="$template/includes/alert.tpl" type="info" msg=$_lang.projectguidance}
	            
            </div>
            <div class="col-md-3">
	            
    {/if}
	            <div class="panel panel-default">
		            <div class="panel-heading">
						<h3 class="panel-title">
							<i class="fas fa-comments"></i> {$_lang.associatedtickets}
						</h3>
		            </div>
		            <div class="list-group">
			            {foreach from=$tickets item=ticket}
				            <a href="viewticket.php?tid={$ticket.tid}&c={$ticket.c}" class="list-group-item">
					            #{$ticket.tid}
					            <br><small>{$ticket.title}</small>
				            </a>
		                {foreachelse}
		                    <span class="list-group-item">{$_lang.none}</span>
		                {/foreach}
		            </div>
	            </div>
	            
	            <div class="panel panel-default">
		            <div class="panel-heading">
						<h3 class="panel-title">
							<i class="fas fa-file-invoice"></i> {$_lang.associatedinvoices}
						</h3>
		            </div>
		            <div class="list-group">
						{foreach from=$invoices item=invoice}
				            <a href="viewinvoice.php?id={$invoice.id}" class="list-group-item">
					            {$LANG.invoicenumber}{$invoice.id}
					            {if $invoice.status eq "Paid"}
						            <label class="label label-success">{$invoice.status}</label>
		                        {elseif $invoice.status eq "Unpaid"}
						            <label class="label label-danger">{$invoice.status}</label>
		                        {else}
						            <label class="label label-default">{$invoice.status}</label>
		                        {/if}
					            <br><small>{$invoice.total}</small>
				            </a>
		                {foreachelse}
		                    <span class="list-group-item">{$_lang.none}</span>
		                {/foreach}
		            </div>
	            </div>

                {if in_array('time', $features)}
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fas fa-clock"></i> {$_lang.timetracking}</h3>
                        </div>
                        <div class="panel-body text-center">
                            <div class="totaltime">
                                {$project.totaltime}
                                <small>{$_lang.hours}</small>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <small>
                                <a href="#" onclick="showTimeLogs();return false">{$_lang.showhidetimelogs}</a>
                            </small>
                        </div>
                    </div>
                {/if}

                {if in_array('files', $features)}
                
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">
	                            <div class="pull-right">
									<a href="#" data-toggle="modal" data-target="#fileModal" class="btn btn-default btn-xs">
										<i class="fas fa-plus"></i> {$_lang.addfile}
									</a>
								</div>
	                            <i class="fas fa-cloud-download-alt"></i> {$_lang.fileuploads}
	                        </h3>
                        </div>
    		            <div class="list-group">
							{foreach from=$attachments key=attachnum item=attachment}                    
	                            <a href="modules/addons/project_management/project_management.php?action=dl&projectid={$project.id}&i={$attachnum}" class="list-group-item">
		                            <i class="fas fa-file"></i> 
						            {$attachment.filename}
					            </a>
			                {foreachelse}
			                    <span class="list-group-item">{$_lang.none}</span>
							{/foreach}
    		            </div>
                    </div>
            
                {/if}

    {if in_array('tasks', $features)}
            </div>
        </div>
    {/if}

</div>

{if in_array('addtasks',$features)}
		                	
	<!-- Add Task Modal : Start -->
	
	<form method="post" action="index.php?m=project_management&a=view">
    	<input type="hidden" name="id" value="{$project.id}" />

		<div class="modal fade" id="taskModal" tabindex="-1" role="dialog" aria-labelledby="taskModalLabel">
			<div class="modal-dialog model-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="taskModalLabel">{$_lang.addtask}</h4>
	      			</div>
		  			<div id="modal-load" class="modal-body modal-body-touch">
			  			<label class="control-label" for="newtask">{$_lang.taskdetail}</label>
						<input type="text" name="newtask" class="form-control">
	      			</div>
	      			<div class="modal-footer">
		      			<button type="submit" class="btn btn-primary btn-3d">
		                    {$_lang.add}
		                </button>
	      			</div>	
	      		</div>
	    	</div>
	  	</div>
	
    </form>
    
    <!-- Add Task Modal : End -->
{/if}

{if in_array('files', $features)}

	<!-- Upload File Modal : Start -->
	
	<form method="post" action="{$smarty.server.PHP_SELF}?m=project_management&a=view" enctype="multipart/form-data">
        <input type="hidden" name="id" value="{$project.id}" />
        <input type="hidden" name="upload" value="true" />
				     
	
		<div class="modal fade" id="fileModal" tabindex="-1" role="dialog" aria-labelledby="fileModalLabel">
			<div class="modal-dialog model-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="fileModalLabel">{$_lang.addfile}</h4>
	      			</div>
		  			<div id="modal-load" class="modal-body modal-body-touch">
						<input type="file" name="attachments[]" class="form-control" />
				        <small class="text-muted">
				            {$_lang.allowedExtensions}<br />
				            {$allowedExtensions}
				        </small>
	      			</div>
	      			<div class="modal-footer">
		      			<input type="submit" value="{$_lang.upload}" class="btn btn-primary btn-3d" />
	      			</div>	
	      		</div>
	    	</div>
	  	</div>
	
    </form>
	    
	<!-- Upload File Modal : End -->

{/if}

<script>
	function showTimeLogs() {
	    jQuery('.timedetailit').fadeToggle();
	}
</script>