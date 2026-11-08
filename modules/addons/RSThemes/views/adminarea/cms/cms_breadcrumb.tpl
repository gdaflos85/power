<div class="has-dropdown dropdown-style-display">
    <a class="" href="" data-toggle="lu-dropdown" data-placement="bottom right">
        <span class="label label--info label--outline m-l-1x"><span class="text-faded">Display: </span> &nbsp;{$template->getActiveDisplay()->name}&nbsp;<i class="text-primary ls ls-caret"></i></span>
    </a>
    <div class="dropdown dropdown-styles" style="display: none" data-dropdown-menu data-url="">
        <div class="dropdown__arrow" data-arrow></div>

        <div class="dropdown__menu">
            <ul class="nav">
                {foreach $template->getDisplays() as $display}
                    <li class="nav__item {if $display->active}is-active{/if}">
                        <a class="nav__link display-activate" data-ajax-url="{$helper->url('Display@setActiveDisplay',['templateName' => $template->getMainName(), 'displayId' => $display->id, 'breadcrumb' => true])}">
                            <span class="nav__link-text">{$display->name}</span>
                            {if $display->active}<span class="nav__link-icon ls ls-check"></span>{/if}
                        </a>
                    </li>
                {/foreach}
            </ul>
        </div>
    </div>
</div>