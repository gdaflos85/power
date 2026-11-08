{extends file="adminarea/includes/layout.tpl"} 

{block name="template-heading"}
    {include file="adminarea/extensions/emailstyle/includes/breadcrumb.tpl"}
{/block}

{block name="template-tabs"}
    {include file="adminarea/extensions/emailstyle/includes/tabs.tpl"} 
{/block}

{block name="template-content"}
    {if $extension->isActive()}
        <div class="section">
            <form id="emailSettings" method="POST" action="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName()])}" class="form neg-m-b-2x black-label">
                <div class="d-flex">
                    <div class="app-main__sidebar">
                        <div class="tabs tabs--block m-w-200">
                            <div class="tabs__nav" data-options="navStorage:localStorage; localStorageId:custom-slider-23; slideToClickedSlide: true;">
                                <ul class="nav nav--tabs custom-nav-styles">
                                    <div class="nav__header p-0x">Categories</div>
                                    <li class="nav__item is-active">
                                        <a class="nav__link" data-toggle="lu-tab" data-change-hash="true" href="#tabls-1">
                                            <span class="nav__link-text">General</span>
                                        </a>
                                    </li>
                                    <li class="nav__item">
                                        <a class="nav__link" data-toggle="lu-tab" data-change-hash="true" href="#tabls-2">
                                            <span class="nav__link-text">Social Links</span>
                                        </a>
                                    </li>
                                    <li class="nav__item">
                                        <a class="nav__link" data-toggle="lu-tab" data-change-hash="true" href="#tabls-3">
                                            <span class="nav__link-text">Footer</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="app-main__content">
                        <div class="tabs__body">
                            <div class="tab-content">
                                <div class="tab-pane is-active" id="tabls-1">
                                    <div class="section">
                                        <div class="section__header">
                                            <h3 class="section__title">
                                                General
                                                {include file="adminarea/includes/helpers/docs.tpl" link='https://lagom.rsstudio.net/docs/v2/settings.html#general'}
                                            </h3>
                                        </div>
                                        <div class="section__body panel">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="form-label">
                                                            Header text
                                                            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip='header text'}
                                                        </label>
                                                        <textarea placeholder="Header Text" class="form-control" name="header_text" rows="4">{$extension->getConfig('header_text')}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group m-b-0x">
                                                        <label class="form-label">
                                                            Header link text
                                                            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip='header link text'}
                                                        </label>
                                                        <textarea class="form-control" placeholder="Header link text" name="header_link_text" rows="4">{$extension->getConfig('header_link_text')}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group d-flex m-t-3x p-0x hidden">
                                                <span class="form-label text-default form-text m-b-0x m-r-6x">
                                                    RTL Support
                                                    {include file="adminarea/includes/helpers/tooltip.tpl" tooltip='rtl support'}
                                                </span>
                                                <label>
                                                    <div class="switch switch--primary">
                                                        <input class="switch__checkbox" name="rtl" type="checkbox" {if $extension->getConfig('rtl') == '1'}checked{/if} value="1">
                                                        <span class="switch__container"><span class="switch__handle"></span></span>
                                                    </div>
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="tab-pane" id="tabls-2">
                                    <div class="section">
                                        <div class="section__header">
                                            <h3 class="section__title">
                                                Social Links
                                                {include file="adminarea/includes/helpers/docs.tpl" link='https://lagom.rsstudio.net/docs/v2/settings.html#general'}
                                            </h3>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="panel panel--collapse">
                                                    <div class="collapse-toggle">
                                                        <h6 class="top__title">Facebook</h6>
                                                        <label>
                                                            <div class="switch" data-toggle="lu-collapse" data-target="#facebookLink" aria-expanded="true">
                                                                <input class="switch__checkbox" name="facebook_active" type="checkbox" {if $extension->getConfig('facebook_active') == '1'}checked{/if} value="1">
                                                                <span class="switch__container"><span class="switch__handle"></span></span>
                                                            </div>
                                                        </label>
                                                    </div>
                                                    <div class="collapse social-email-links {if $extension->getConfig('facebook_active') == '1'}show{/if}" id="facebookLink">
                                                        <div class="form-group p-3x">
                                                            <input name="facebook" value="{$extension->getConfig('facebook')}" class="form-control" type="text" placeholder="Facebook Link">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel panel--collapse">
                                                    <div class="collapse-toggle">
                                                        <h6 class="top__title">Twitter</h6>
                                                        <label>
                                                            <div class="switch" data-toggle="lu-collapse" data-target="#twitterLink" aria-expanded="true">
                                                                <input class="switch__checkbox" type="checkbox" name="twitter_active" {if $extension->getConfig('twitter_active') == '1'}checked{/if} value="1">
                                                                <span class="switch__container"><span class="switch__handle"></span></span>
                                                            </div>
                                                        </label>
                                                    </div>
                                                    <div class="collapse social-email-links {if $extension->getConfig('twitter_active') == '1'}show{/if}" id="twitterLink">
                                                        <div class="form-group p-3x">
                                                            <input name="twitter" value="{$extension->getConfig('twitter')}" class="form-control" type="text" placeholder="Twitter link">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel panel--collapse">
                                                    <div class="collapse-toggle">
                                                        <h6 class="top__title">Linkedin</h6>
                                                        <label>
                                                            <div class="switch" data-toggle="lu-collapse" data-target="#linkedinLink" aria-expanded="true">
                                                                <input class="switch__checkbox" type="checkbox" name="linkedin_active" {if $extension->getConfig('linkedin_active') == '1'}checked{/if} value="1">
                                                                <span class="switch__container"><span class="switch__handle"></span></span>
                                                            </div>
                                                        </label>
                                                    </div>
                                                    <div class="collapse social-email-links {if $extension->getConfig('linkedin_active') == '1'}show{/if}" id="linkedinLink">
                                                        <div class="form-group p-3x">
                                                            <input value="{$extension->getConfig('linkedin')}" name="linkedin" class="form-control" type="text" placeholder="LinkedIn Link">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel panel--collapse">
                                                    <div class="collapse-toggle">
                                                        <h6 class="top__title">Youtube</h6>
                                                        <label>
                                                            <div class="switch" data-toggle="lu-collapse" data-target="#youtubeLink" aria-expanded="true">
                                                                <input class="switch__checkbox" type="checkbox" name="youtube_active" {if $extension->getConfig('youtube_active') == '1'}checked{/if} value="1">
                                                                <span class="switch__container"><span class="switch__handle"></span></span>
                                                            </div>
                                                        </label>
                                                    </div>
                                                    <div class="collapse social-email-links {if $extension->getConfig('youtube_active') == '1'}show{/if}" id="youtubeLink">
                                                        <div class="form-group p-3x">
                                                            <input value="{$extension->getConfig('youtube')}" name="youtube" class="form-control" type="text" placeholder="YouTube Link">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel panel--collapse">
                                                    <div class="collapse-toggle">
                                                        <h6 class="top__title">Instagram</h6>
                                                        <label>
                                                            <div class="switch" data-toggle="lu-collapse" data-target="#instagramLink" aria-expanded="true">
                                                                <input class="switch__checkbox" type="checkbox" name="instagram_active" {if $extension->getConfig('instagram_active') == '1'}checked{/if} value="1">
                                                                        <span class="switch__container"><span class="switch__handle"></span></span>
                                                            </div>
                                                        </label>
                                                    </div>
                                                    <div class="collapse social-email-links {if $extension->getConfig('instagram_active') == '1'}show{/if}" id="instagramLink">
                                                        <div class="form-group p-3x">
                                                            <input value="{$extension->getConfig('instagram')}" name="instagram" class="form-control" type="text" placeholder="Instagram Link">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabls-3">
                                    <div class="section">
                                        <div class="section__header">
                                            <h3 class="section__title">
                                                Copyright
                                                {include file="adminarea/includes/helpers/docs.tpl" link='https://lagom.rsstudio.net/docs/v2/settings.html#general'}
                                            </h3>
                                        </div>
                                        <div class="section__body panel">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group m-b-0x">
                                                        <label class="form-label">
                                                            Copyright Text
                                                            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip='copyright text'}
                                                        </label>
                                                        <textarea class="form-control" name="footer_text" rows="3" placeholder="Footer copy text">{$extension->getConfig('footer_text')}</textarea>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="section">
                                        <div class="section__header">
                                            <h3 class="section__title">
                                                Links
                                                {include file="adminarea/includes/helpers/docs.tpl" link='https://lagom.rsstudio.net/docs/v2/settings.html#general'}
                                            </h3>
                                        </div>
                                        <div class="section__body">

                                            <div class="panel panel--collapse">
                                                <div class="collapse-toggle">
                                                    <h6 class="top__title">Link #1</h6>
                                                    <label>
                                                        <div class="switch" data-toggle="lu-collapse" data-target="#link_1" aria-expanded="true">
                                                            <input name="footer_link_1_active" class="switch__checkbox" type="checkbox" {if $extension->getConfig('footer_link_1_active') == '1'}checked{/if} value="1">
                                                            <span class="switch__container"><span class="switch__handle"></span></span>
                                                        </div>
                                                    </label>
                                                </div>
                                                <div class="collapse d-flex social-email-links p-3x {if $extension->getConfig('footer_link_1_active') == '1'}show{/if}" id="link_1">
                                                    <div class="form-group p-0x">
                                                        <label class="form-label">
                                                            Name
                                                            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip='name text'}
                                                        </label>
                                                        <input value="{$extension->getConfig('footer_link_1_name')}" name="footer_link_1_name" class="form-control" type="text" placeholder="Link name">
                                                    </div>
                                                    <div class="form-group p-0x">
                                                        <label class="form-label">
                                                            URL
                                                            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip='url text'}
                                                        </label>
                                                        <input value="{$extension->getConfig('footer_link_1_url')}" name="footer_link_1_url" class="form-control" type="text" placeholder="Link url">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel panel--collapse">
                                                <div class="collapse-toggle">
                                                    <h6 class="top__title">Link #2</h6>
                                                    <label>
                                                        <div class="switch" data-toggle="lu-collapse" data-target="#link_2" aria-expanded="true">
                                                            <input name="footer_link_2_active" class="switch__checkbox" type="checkbox" {if $extension->getConfig('footer_link_2_active') == '1'}checked{/if} value="1">
                                                            <span class="switch__container"><span class="switch__handle"></span></span>
                                                        </div>
                                                    </label>
                                                </div>
                                                <div class="collapse d-flex social-email-links p-3x {if $extension->getConfig('footer_link_2_active') == '1'}show{/if}" id="link_2">
                                                    <div class="form-group p-0x">
                                                        <label class="form-label">
                                                            Name
                                                            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip='name text'}
                                                        </label>
                                                        <input value="{$extension->getConfig('footer_link_2_name')}" name="footer_link_2_name" class="form-control" type="text" placeholder="Link name">
                                                    </div>
                                                    <div class="form-group p-0x">
                                                        <label class="form-label">
                                                            URL
                                                            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip='url text'}
                                                        </label>
                                                        <input value="{$extension->getConfig('footer_link_2_url')}" name="footer_link_2_url" class="form-control" type="text" placeholder="Link url">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel panel--collapse">
                                                <div class="collapse-toggle">
                                                    <h6 class="top__title">Link #3</h6>
                                                    <label>
                                                        <div class="switch" data-toggle="lu-collapse" data-target="#link_3" aria-expanded="true">
                                                            <input name="footer_link_3_active" class="switch__checkbox" type="checkbox" {if $extension->getConfig('footer_link_3_active') == '1'}checked{/if} value="1">
                                                            <span class="switch__container"><span class="switch__handle"></span></span>
                                                        </div>
                                                    </label>
                                                </div>
                                                <div class="collapse d-flex social-email-links p-3x {if $extension->getConfig('footer_link_3_active') == '1'}show{/if}" id="link_3">
                                                    <div class="form-group p-0x">
                                                        <label class="form-label">
                                                            Name
                                                            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip='name text'}
                                                        </label>
                                                        <input value="{$extension->getConfig('footer_link_3_name')}" name="footer_link_3_name" class="form-control" type="text" placeholder="Link name">
                                                    </div>
                                                    <div class="form-group p-0x">
                                                        <label class="form-label">
                                                            URL
                                                            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip='url text'}
                                                        </label>
                                                        <input value="{$extension->getConfig('footer_link_3_url')}" name="footer_link_3_url" class="form-control" type="text" placeholder="Link url">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel panel--collapse">
                                                <div class="collapse-toggle">
                                                    <h6 class="top__title">Link #4</h6>
                                                    <label>
                                                        <div class="switch" data-toggle="lu-collapse" data-target="#link_4" aria-expanded="true">
                                                            <input name="footer_link_4_active" class="switch__checkbox" type="checkbox" {if $extension->getConfig('footer_link_4_active') == '1'}checked{/if} value="1">
                                                            <span class="switch__container"><span class="switch__handle"></span></span>
                                                        </div>
                                                    </label>
                                                </div>
                                                <div class="collapse d-flex social-email-links p-3x {if $extension->getConfig('footer_link_4_active') == '1'}show{/if}" id="link_4">
                                                    <div class="form-group p-0x">
                                                        <label class="form-label">
                                                            Name
                                                            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip='name text'}
                                                        </label>
                                                        <input value="{$extension->getConfig('footer_link_4_name')}" name="footer_link_4_name" class="form-control" type="text" placeholder="Link name">
                                                    </div>
                                                    <div class="form-group p-0x">
                                                        <label class="form-label">
                                                            URL
                                                            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip='url text'}
                                                        </label>
                                                        <input value="{$extension->getConfig('footer_link_4_url')}" name="footer_link_4_url" class="form-control" type="text" placeholder="Link url">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel panel--collapse">
                                                <div class="collapse-toggle">
                                                    <h6 class="top__title">Link #5</h6>
                                                    <label>
                                                        <div class="switch" data-toggle="lu-collapse" data-target="#link_5" aria-expanded="true">
                                                            <input name="footer_link_5_active" class="switch__checkbox" type="checkbox" {if $extension->getConfig('footer_link_5_active') == '1'}checked{/if} value="1">
                                                            <span class="switch__container"><span class="switch__handle"></span></span>
                                                        </div>
                                                    </label>
                                                </div>
                                                <div class="collapse d-flex social-email-links p-3x {if $extension->getConfig('footer_link_5_active') == '1'}show{/if}" id="link_5">
                                                    <div class="form-group p-0x">
                                                        <label class="form-label">
                                                            Name
                                                            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip='name text'}
                                                        </label>
                                                        <input value="{$extension->getConfig('footer_link_5_name')}" name="footer_link_5_name" class="form-control" type="text" placeholder="Link name">
                                                    </div>
                                                    <div class="form-group p-0x">
                                                        <label class="form-label">
                                                            URL
                                                            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip='url text'}
                                                        </label>
                                                        <input value="{$extension->getConfig('footer_link_5_url')}" name="footer_link_5_url" class="form-control" type="text" placeholder="Link url">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        {else}
        <div class="section">
            <h4 class="section__description">Extension is disabled, click bellow button to activate</h4>
        </div>
    {/if}
    <script>
        {literal}
        $(document).ready(function () {
            $('#emailSettings').on('submit', function (e) {
                e.preventDefault();
                var datastring = $("#emailSettings").serialize();
                $.ajax({
                    type: "POST",
                    url: {/literal} "{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName()])}" {literal} ,
                    data: datastring,
                    dataType: "json",
                    success: function(data) {
                        console.log(data.status);
                        if(data.status === 'OK'){
                            $('#ajaxAlert').fadeIn();
                            setTimeout(function () {
                                $('#ajaxAlert').fadeOut();
                                $('#emailPreviewIframe')[0].contentWindow.location.reload(true);
                                $('#saveChangesButton').removeClass('is-loading is-disabled');
                            }, 1200)
                        }
                    },
                    error: function(err) {
                        console.log(err);
                    }
                });
            });
        });
        {/literal}
    </script>
{/block}

{block name="template-actions"}
    {if $extension->isActive()}
    <div class="app-main__actions">
        <div class="container">
            <button id="saveChangesButton" onclick="$('#emailSettings').submit(); $(this).addClass('is-loading is-disabled')" class="btn btn--primary" type="submit">
                <span class="btn__text">Save Changes</span>
                <span class="btn__preloader preloader"></span>
            </button>
            <button class="btn btn--default btn--outline btn--plain" type="submit">Cancel</button>
        </div>
    </div>
    {/if}
{/block}