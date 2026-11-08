<div class="row">
	<div class="col-md-6 col-md-offset-3">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">{$LANG.oops}!</h3>
			</div>
			<div class="panel-body">
                <div class="alert alert-danger">
					<p>{$LANG.subaccountpermissiondenied}</p>
				</div>
                {if !empty($allowedpermissions)}
                    <p>{$LANG.subaccountallowedperms}</p>
                    <ul>
                        {foreach $allowedpermissions as $permission}
                            <li>{$permission}</li>
                        {/foreach}
                    </ul>
                            </div>
                        </div>
                    </div>
                {/if}
                <p>{$LANG.subaccountcontactmaster}</p>
            </div>
            <div class="panel-footer">
                <a href="javascript:history.go(-1)" class="btn btn-primary btn-3d">
                    <i class="fas fa-arrow-circle-left"></i>
                    {$LANG.goback}
                </a>
                <a href="index.php" class="btn btn-default pull-right res-left">
                    <i class="fas fa-home"></i>
                    {$LANG.returnhome}
                </a>
            </div>
        </div>
    </div>
</div>
