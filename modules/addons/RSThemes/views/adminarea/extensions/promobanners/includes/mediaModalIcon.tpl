<div id="mediaGalleryIcon" class="modal modal--lg">
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <h4 class="top__title text-default">Media Manager</h4>

                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body has-scroll p-t-1x">
                <ul class="nav nav--h nav--tabs m-b-2x">
                    <li class="nav__item is-active">
                        <a class="nav__link" data-toggle="lu-tab" href="#lagom-default-pagination-icons" data-media-predefined data-media-load>
                            <span>SVG Illustrations</span>
                        </a>
                    </li>
                    <li class="nav__item">
                        <a class="nav__link" data-toggle="lu-tab" href="#custom-pagination-icons" data-media-predefined data-media-load>
                            <span>Custom Icons</span>
                        </a>
                    </li>
                </ul>
                <div class="tab-content">  
                    <div class="tab-pane tab-pane--predefined-icons is-active" id="lagom-default-pagination-icons" data-media-container>
                        <div class="media__search input-group">
                            <i class="input-group__addon lm lm-search"></i>
                            <input type="text" class="form-control" placeholder="Search" data-media-search>
                        </div>
                        <div class="media">
                            <div class="media__list has-scroll" data-media-list>
                                {if !empty($extension->getDirContents('lagom-icons'))}
                                    {foreach from=$extension->getDirContents('lagom-icons') key=k item=defaultMedia}
                                        <label data-media-item="{$defaultMedia['filename']}" data-toggle="lu-tooltip" data-title="{$defaultMedia['filename']}.tpl" data-icon="{$defaultMedia['filename']}" data-type="default" class="media__item media__item--manager {if $defaultMedia['filename'] eq $extension->getSlideConfig()->slide_pagination_icon}is-active{/if}">
                                            <div class="media__item-icon" data-icon-name="{$defaultMedia['filename']}.tpl">
                                                {if file_exists("{$extension->assets_path()}/svg-icon/{$defaultMedia['filename']}.tpl")}
                                                    {include file="{$extension->assets_path()}/svg-icon/{$defaultMedia['filename']}.tpl"}
                                                {/if}
                                            </div>
                                            <span class="media__item-border"></span>
                                            <span class="media__item-label"><span class="truncate hidden">{$defaultMedia['filename']}.tpl</span></span>
                                        </label>
                                    {/foreach}
                                    {include file="adminarea/includes/media/no-data.tpl"}
                                {else}
                                    {include file="adminarea/includes/media/no-data.tpl" startEmpty=true}
                                {/if}
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane tab-pane--media" id="custom-pagination-icons" data-media-container>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="media__search input-group">
                                    <i class="input-group__addon lm lm-search"></i>
                                    <input type="text" class="form-control" placeholder="Search" data-media-search>
                                </div>
                                <div class="media">
                                    <div class="media__list has-scroll" data-media-list>
                                        {if !empty($extension->getDirContents('custom'))}
                                            {foreach from=$extension->getDirContents('custom') key=k item=defaultMedia}
                                                <label data-media-item="{$defaultMedia['filename']}.{$defaultMedia['ext']}" data-toggle="lu-tooltip" data-title="{$defaultMedia['filename']}.tpl" data-src="{$defaultMedia['filename']}.{$defaultMedia['ext']}" data-type="custom" class="media__item media__item--lg media__item--manager {if $extension->getSlideConfig()->slide_icon_custom eq $defaultMedia['fullName']}is-active{/if}">
                                                    <div class="media__item-icon" data-icon-name="{$defaultMedia['filename']}.{$defaultMedia['ext']}">
                                                        <img class="" src="{$whmcsURL}/templates/{$extension->template->getMainName()}/core/extensions/PromoBanners/uploads/{$defaultMedia['filename']}.{$defaultMedia['ext']}" alt="{$defaultMedia['filename']}">
                                                    </div>
                                                    <span class="media__item-border"></span>
                                                    <span class="media__item-label"><span class="truncate hidden">{$defaultMedia['filename']}.{$defaultMedia['ext']}</span></span>
                                                </label>
                                            {/foreach}
                                            {include file="adminarea/includes/media/no-data.tpl"}
                                        {else}
                                            {include file="adminarea/includes/media/no-data.tpl" startEmpty=true}
                                        {/if}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal__actions">
                <button data-type="" data-image="" id="mediaButton" class="btn btn--primary" onclick="changeImageMediaIcon(this)">
                    <span class="btn__text">Save changes!</span>
                    <span class="btn__preloader preloader"></span>
                </button>
                <button data-dismiss="lu-modal" aria-label="Close" class="btn btn--outline btn--default">
                    <span class="btn__text">Cancel</span>
                </button>
            </div>
        </div>
    </div>
</div>

{literal}
    <script>
        var objectImageIcon = {
            imageName: '',
            imageFullPath: '',
            imageType: '',
            imageContent: '',
            imageFileName: ''
        };

        $('#mediaGalleryIcon .media__item--manager').on('click', function (e) {
            $('#mediaGalleryIcon').find('.media__item--manager').removeClass('is-active');
            $(this).addClass('is-active');

            objectImageIcon.imageFullPath = $(this).find('img').attr('src');
            objectImage.imageContent = $(this).find('.media__item-icon').html();
            objectImage.imageFileName = $(this).find('.media__item-icon').data('icon-name');

            if($(this).data('type') === 'default'){
                objectImageIcon.imageName = $(this).data('icon');
                $('#tmpPaginationIcon').val('')
            }else{
                $('#tmpDefaultIcon').val('');
                objectImageIcon.imageName = $(this).data('src');
            }
            objectImageIcon.imageType = $(this).data('type');
        });

        function changeImageMediaIcon(el){
            $(el).addClass('is-loading is-disabled');
            $('.widget--image-homepage .widget__content').html(objectImage.imageContent);
            $('.widget--image-homepage .widget__actions .truncate').html(objectImage.imageContent);
            if(objectImageIcon.imageType === 'custom'){
                $('#tmpPaginationIcon').val(objectImageIcon.imageName);
            }else{
                $('#tmpDefaultIcon').val(objectImageIcon.imageName);
            }
            $('#tmpPaginationIconText').html(objectImageIcon.imageName);

            setTimeout(function(){
                $('#paginationIcon').attr('src', objectImageIcon.imageFullPath);
                $(el).removeClass('is-loading is-disabled');
                $('#mediaGalleryIcon').modal('hide');
            }, 300);

        }
    </script>
{/literal}
