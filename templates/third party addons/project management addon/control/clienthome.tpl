{include file="$template/includes/tablelist.tpl" tableName="ProjectsList"}

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">{$LANG.clientareaprojects}</h3>
			</div>
			<div class="panel-body">
				<div class="table-container clearfix">
				    <table id="tableProjectsList" class="table table-list">
				        <thead>
				            <tr>
				                <th>{$_lang.title}</th>
				                <th>{$_lang.created}</th>
				                <th>{$_lang.duedate}</th>
				                <th>{$_lang.status}</th>
				                <th>{$_lang.lastmodified}</th>
				            </tr>
				        </thead>
				        <tbody>
                            {foreach $projects as $project}
				                <tr>
									<td><a href="?m=project_management&a=view&id={$project.id}"><strong>{$project.title}</strong></a></td>
				                    <td><span class="hidden">{$project.normalisedCreated}</span>{$project.created}</td>
				                    <td><span class="hidden">{$project.normalisedDueDate}</span>{$project.duedate}</td>
				                    <td><span class="label status pm-status-{$project.status|strtolower|replace:' ':''}">{$project.status}</span></td>
				                    <td><span class="hidden">{$project.normalisedLastModified}</span>{$project.lastmodified}</td>
				                </tr>
				            {/foreach}
				        </tbody>
				    </table>
				</div>
			</div>
		</div>
	</div>
</div>