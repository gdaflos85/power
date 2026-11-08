<div class="row">
    <div class="col-md-6 col-md-offset-3">
        {include file="$template/includes/flashmessage.tpl"}
        <div class="panel panel-default">
            {if $accounts->count() == 0}
                <div class="panel-heading">
                    <h3 class="panel-title">{lang key="switchAccount.noneFound"}</h3>
                </div>
                <div class="panel-body">
                   <p>{lang key="switchAccount.createInstructions"}</p>
                   <p>
                       <a href="{routePath('cart-index')}" class="btn btn-default">
                           {lang key="shopNow"}
                       </a>
                   </p>
               </div>
           {else}
               <div class="panel-heading">
                   <h3 class="panel-title">{lang key="switchAccount.choose"}</h3>
               </div>
               <div class="select-account list-group">
                   {foreach $accounts as $account}
                       <a href="#" data-id="{$account->id}" class="list-group-item{if $account->status == 'Closed'} disabled{/if}">
                           {$account->displayName}
                           {if $account->authedUserIsOwner()}
                               <span class="label label-info pull-right">{lang key="clientOwner"}</span>
                           {/if}
                           {if $account->status == 'Closed'}
                               <span class="label label-default pull-right">{$account->status}</span>
                           {/if}
                       </a>
                   {/foreach}
               </div>
           {/if}
       </div>
   </div>
</div>

<form method="post" action="{routePath('user-accounts')}">
    <input type="hidden" name="id" value="" id="inputSwitchAcctId">
</form>

<script>
    $(document).ready(function() {
        $('.select-account a').click(function(e) {
            e.preventDefault();
            $('#inputSwitchAcctId').val($(this).data('id'))
                .parent('form').submit();
        });
    });
</script>
