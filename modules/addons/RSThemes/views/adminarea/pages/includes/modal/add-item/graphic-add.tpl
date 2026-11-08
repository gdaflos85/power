<div class="modal modal--lg modal--media" id="addGraphicModal" data-add-new-graphic-modal>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <h4 class="top__title h6">Choose Graphic {include file="adminarea/includes/helpers/docs.tpl" link=$cms_docs->modal['item']['add_edit']['graphic']}</h4>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link cancel__item" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <form
                id="addNewGraphicForm"
                data-add-new-graphic-form
                data-ajax-url="{$helper->url('CustomPage@getGraphicItem',['templateName' => $template->getMainName()])}"
                data-assets-url="{$whmcsURL}/templates/{$themeName}/assets" enctype="multipart/form-data"
                data-load-icons-url="{$whmcsURL}/modules/addons/RSThemes/src/Api/clientApi.php?controller=Icon&method=renderTabs&items="
            >
                <div class="modal__body">
                    {include file="adminarea/pages/includes/modal/tabs.tpl" type='graphic-add'}
                    <input type="hidden" name="item[graphic_name]" data-graphic-name value=""/>
                    <input type="hidden" name="item[section]" data-graphic-section-index value=""/>
                    <input type="hidden" name="item[group]" data-graphic-group-index value=""/>
                </div>
                <div class="modal__actions">
                    <button class="btn btn--primary" type="submit" form="addNewGraphicForm" data-add-new-graphic-btn>
                        <span class="btn__text">Add Selected</span>
                        <span class="btn__preloader preloader"></span>
                    </button>
                    <a class="btn btn--default btn--outline cancel__item" data-dismiss="lu-modal">
                        <span class="btn__text">Cancel</span>
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
