<div class="app-main__top">
    <div class="container">
        <div class="top">
            <div class="top__toolbar">
                <a class="btn btn--default btn--outline btn--icon btn--rounded btn--mob-link" href="{$helper->url('Template@extensions',['templateName'=>$template->getMainName()])}">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M19 12H5" stroke="#393D45" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                        <path d="M12 19L5 12L12 5" stroke="#393D45" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                    </svg>                
                </a>
            </div>
            <div class="top__content">
                <div class="top__title">
                    <h1 class="top__title-text">
                        <ul class="top__title-text breadcrumb breadcrumb--angle-separator">
                            <li class="breadcrumb__item"><a href="{$helper->url('Template@extensions',['templateName'=>$template->getMainName()])}" class="breadcrumb__item-text">Extensions</a></li>
                            <li class="breadcrumb__item"><span class="breadcrumb__item-text">CMS</span></li>
                        </ul>
                    </h1>
                    {if $extension->isActive()}
                        <span class="label label--outline label--success m-l-2x">Active</span>
                    {/if}
                </div>
            </div>
            <div class="top__toolbar">
                <div class="has-dropdown">
                    <a class="btn btn--default btn--outline" href="" data-toggle="lu-dropdown" data-placement="bottom right">
                        <span class="btn__text">Actions</span>
                        <span class="caret m-l-1x" data-arrow-target></span>
                    </a>
                    <div class="dropdown" data-dropdown-menu>
                        <div class="dropdown__arrow" data-arrow></div>
                        <div class="dropdown__menu">
                            <ul class="nav">
                                {if $extension->isActive()}
                                    <li class="nav__item">
                                        <a class="nav__link" href="#" data-toggle="lu-modal" data-target="#deactivateModal">
                                            <span class=" nav__link-icon  lm lm-close"></span>
                                            <span class="nav__link-text">Deactivate</span>
                                        </a>
                                    </li>
                                {else}
                                    <li class="nav__item hidden">
                                        <a class="nav__link" href="{$extension->getLink('activate')}">
                                            <span class=" nav__link-icon lm lm-check"></span>
                                            <span class="nav__link-text">Activate</span>
                                        </a>
                                    </li>
                                {/if}
                                <li class="nav__item">
                                    <a class="nav__link" href="https://rsstudio.net/my-account/submitticket.php?step=2&deptid=2" target="_blank">
                                        <span class="nav__link-icon lm lm-denied""></span>
                                        <span class="nav__link-text">Report Bug</span>
                                    </a>
                                </li>
                                <li class="nav__divider"></li>
                                <li class="nav__item">
                                    <a class="nav__link" href="https://lagom.rsstudio.net/docs/" target="_blank">
                                        <span class="nav__link-icon lm lm-book"></span>
                                        <span class="nav__link-text">Docs</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="activateModal">
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <h4 class="top__title h6 m-b-0x">Before activate</h4>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon zmdi zmdi-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body">
                <p class="p-1">Warning, enable backup before activation !</p>
                <div class="text-center">
                    <a href="{$extension->getLink('activate')}" class="btn btn--xlg btn--success">
                        <span class="btn__text">Activate</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal modal--hero" id="deactivateModal">
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <div class="top__title type-4 text-danger"><i class="ls ls-exclamation-circle m-r-2x"></i>Deactivate Extension</div>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon zmdi zmdi-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body">
                <p>Deactivate will stop all functions provided by specific  Lagom theme <br> extension.</p>
                <div class="form-check">
                    <label>
                        <input onchange="deleteSwitch(this)" type="checkbox" name="deleteAll" id="delete" class="form-checkbox">
                        &nbsp;<span class="form-indicator"></span>
                        <span class="form-text" style="padding-top: 12px;">Clear all data used by this extension: images, files, database entries etc.
                            <span class="font-weight-bold">Removed data cannot be restored!</span></span>
                    </label>
                </div>
            </div>
            <div class="modal__actions">
                <a id="deactivateSwitch" href="{$extension->getLink('deactivate')}" class="btn btn--danger">
                    <span class="btn__text">Yes, Deactivate</span>
                </a>
                <button data-dismiss="lu-modal" aria-label="Close" type="button" class="btn btn--default btn--outline"><span class="btn__text">No</span></button>
            </div>
        </div>
    </div>
</div>

<script>
    {literal}
    function deleteSwitch(el) {
        if($(el).is(':checked')){
            $('#deactivateSwitch').attr('href', '{/literal}{$extension->getLink('deactivate')}&delete=1{literal}')
        }else{
            $('#deactivateSwitch').attr('href', '{/literal}{$extension->getLink('deactivate')}{literal}')
        }
    }
    {/literal}
</script>
