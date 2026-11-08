<div class="app-main__nav">
    <div class="container">
        <ul class="nav nav--md nav--h nav--tabs">
            <li class="nav__item {if !$extension->isActive()}is-disabled{/if} {if ($smarty.get.exaction == 'settings' || !isset($smarty.get.exaction)) && $extension->isActive()} is-active{/if}">
                <a class="nav__link" href="{$helper->url('Template@extension',['templateName' => $template->getMainName(), 'extension' => $extension->getLinkName(), 'exaction'=>'settings'])}">
                    <span class="nav__link-text">Info</span>
                </a>
            </li>
            <li class="nav__item {if !$extension->isActive()}is-disabled{/if} {if $smarty.get.exaction == 'config' && $extension->isActive()}is-active{/if}">
                <a class="nav__link" href="{$helper->url('Template@extension',['templateName' => $template->getMainName(), 'extension' => $extension->getLinkName(), 'exaction' => 'config'])}">
                        <span class="nav__link-text">Settings</span>
                </a>
            </li>
        </ul>
    </div>
</div>
