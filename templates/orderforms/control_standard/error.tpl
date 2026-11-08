<!--main content start-->
<section id="main-content" class="cart">
	<!-- Display page title -->
	<div class="row">
		<div class="col-md-12">
			<!--breadcrumbs start -->
			{include file="$template/includes/breadcrumb.tpl"}
			<!--breadcrumbs end -->
			<h1 class="h1">{$LANG.thereisaproblem}</h1>
		</div>
	</div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-danger">
                <div class="panel-heading">
                    <h3 class="panel-title">	
                        {$errortitle}
                    </h3>
                </div>
                <div class="panel-body">
                    <p>{$errormsg}</p>
                </div>
                <div class="panel-footer">
                    <a href="javascript:history.go(-1)" class="btn btn-default">
                        <i class="fas fa-arrow-left"></i>&nbsp;
                        {$LANG.problemgoback}
                    </a>
                </div>
            </div>
        </div>
    </div>		
</section>