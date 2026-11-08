{extends file="adminarea/template/includes/header.tpl"} 

{block name="template-heading"}
    {include file="adminarea/template/includes/breadcrumb.tpl"}
{/block}

{block name="template-tabs"}
    {include file="adminarea/template/includes/tabs.tpl"} 
{/block}
{block name="template-content"}
    <div class="row row--eq-height">        
        <form action="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName()])}" method="POST">
            tu sobie zrób formularz
            {$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName()])}
            <input type="text" class="form-control" name="test" value="lorem ipsum">
            <button class="btn btn--success"><span class="btn__text">Save</span></button>
        </form>
    </div>
{/block}
















