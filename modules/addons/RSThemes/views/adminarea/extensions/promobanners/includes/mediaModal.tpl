<div id="addGraphicModal" class="modal modal--lg modal--media" data-add-new-graphic-modal>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <h6 class="top__title text-default">Media Manager</h6>

                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body has-scroll p-t-1x">
                <ul class="nav nav--h nav--tabs m-b-2x">
                    <li class="nav__item is-active">
                        <a class="nav__link" data-toggle="lu-tab" href="#lagom-default-icons" data-media-predefined data-media-load>
                            <span>SVG Illustrations</span>
                        </a>
                    </li>
                    <li class="nav__item">
                        <a class="nav__link" data-toggle="lu-tab" href="#custom-icons" data-media-predefined data-media-load>
                            <span>Custom Icons</span>
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane tab-pane--predefined-illustrations is-active" data-media-container id="lagom-default-icons">
                        <div class="media__search input-group">
                            <i class="input-group__addon lm lm-search"></i>
                            <input type="text" class="form-control" placeholder="Search" data-media-search>
                        </div>
                        <div class="media">
                            <div class="media__list has-scroll" data-media-list>
                                {if !empty($extension->getDirContents())}
                                    {foreach from=$extension->getDirContents() key=k item=defaultMedia}
                                        <label data-media-item="{$defaultMedia['filename']}.{$defaultMedia['ext']}" data-toggle="lu-tooltip" data-title="{$defaultMedia['filename']}.tpl" data-icon="{$defaultMedia['filename']}" data-type="default" class="media__item media__item--manager {if $extension->getSlideConfig()->slide_icon eq $defaultMedia['filename'] && strlen($extension->getSlideConfig()->slide_icon_custom) < 1}is-active{/if}">
                                            <div class="media__item-icon">
                                                {if file_exists("{$extension->assets_path()}/svg-illustrations/products/modern/{$defaultMedia['filename']}.tpl")}
                                                    {include file="{$extension->assets_path()}/svg-illustrations/products/modern/{$defaultMedia['filename']}.tpl"}
                                                    <img class="is-hidden" src="{$whmcsURL}/templates/lagom2/assets/svg-illustrations/products/modern/{$defaultMedia['filename']}.tpl">
                                                {/if}
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
                    <div class="tab-pane tab-pane--media" data-media-container id="custom-icons">
                        <div class="media__search input-group">
                            <i class="input-group__addon lm lm-search"></i>
                            <input type="text" class="form-control" placeholder="Search" data-media-search>
                        </div>
                        <div class="media">
                            <div class="media__list has-scroll" data-media-list>
                                {if !empty($extension->getDirContents('custom'))}
                                    {foreach from=$extension->getDirContents('custom') key=k item=defaultMedia}
                                        <label data-media-item="{$defaultMedia['filename']}.{$defaultMedia['ext']}" data-toggle="lu-tooltip" data-title="{$defaultMedia['filename']}.tpl" data-src="{$defaultMedia['filename']}.{$defaultMedia['ext']}" data-type="custom" class="media__item media__item--lg media__item--manager {if $extension->getSlideConfig()->slide_icon_custom eq $defaultMedia['fullName']}is-active{/if}">
                                            <div class="media__item-icon">
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
            <div class="modal__actions">
                <button data-image="" id="mediaButton" class="btn btn--primary" onclick="changeImageMedia(this)">
                    <span class="btn__text">Save Changes</span>
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
        var objectImage = {
            imageName: '',
            imageFullPath: '',
            imageType: '',
            imageContent: '',
            imageFileName: ''
        };

        $('#addGraphicModal .media__item--manager').on('click', function(e) {
            $('#addGraphicModal').find('.media__item--manager').removeClass('is-active');
            $(this).addClass('is-active');
            objectImage.imageFullPath = $(this).find('img').attr('src');
            objectImage.imageContent = $(this).find('.media__item-icon').html();
            objectImage.imageFileName = $(this).find('.media__item-label .truncate').html();
            if($(this).data('type') === 'default'){
                objectImage.imageName = $(this).data('icon');
            }else{
                objectImage.imageName = $(this).data('src');
            }
            objectImage.imageType = $(this).data('type');
            console.log(objectImage.imageType);
        });

        function changeImageMedia(el){;
            $(el).addClass('is-loading is-disabled');
            $('.widget--image-advanced .widget__content').html(objectImage.imageContent);
            $('.widget--image-advanced .widget__actions .truncate').html(objectImage.imageFileName);
            if(objectImage.imageType  !== 'default'){
                $('#promotionIconPrev').html("<img class='promo-slider-custom-icon' src='"+objectImage.imageFullPath+"'>");
                $('#tmpImage').val(objectImage.imageName);
                $('#customGraphicRadio').prop('checked' , true).trigger('change');
                $('#backgroundSwitch').prop('checked', true).trigger('change');
                $('#banner-style').collapse('show');
                $('#backgroundSwitchLabel').attr('disabled', true);
            }else{
                $.ajax({
                url: '../templates/lagom2/assets/svg-illustrations/products/modern/'+objectImage.imageName+'.tpl',
                }).done(function(data){
                    $('#promotionIconPrev').html(data);
                });
                $('#tmpIcon').val(objectImage.imageName);
                $('#tmpImage').val('');
                $('#predefinedLagomIcon').prop('checked',true).trigger('change');
                $('#backgroundSwitchLabel').attr('disabled', false);
            }
            setTimeout(function(){
                $('#promo-slide-1-bg-image,.promo-slider-custom-icon,#editPrev').attr('src', objectImage.imageFullPath);
                $(el).removeClass('is-loading is-disabled');
                $('#addGraphicModal').modal('hide');
            }, 300);
        }
    </script>
{/literal}
