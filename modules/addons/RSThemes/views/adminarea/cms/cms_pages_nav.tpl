<li class="nav__item {if $smarty.get.tab == 'promotion'} is-active {/if}">
    <a class="nav__link" data-toggle="lu-tab" data-change-hash="true" href="#pages-promotion">
        <span class="nav__link-text">{$lang.breadcrumb.promotion}</span>
    </a>
</li>
<div class="nav__header p-0x text-faded p-4">
    {$lang.general.settings}
</div>
<li class="nav__item {if $smarty.get.tab == 'section'} is-active {/if}">
    <a class="nav__link" data-toggle="lu-tab" data-change-hash="true" href="#settings-sections">
        <span class="nav__link-text">{$lang.breadcrumb.sections}</span>
    </a>
</li>
<li class="nav__item {if $smarty.get.tab == 'media'} is-active {/if}">
    <a class="nav__link" data-toggle="lu-tab" data-change-hash="true" href="#settings-media">
        <span class="nav__link-text">{$lang.breadcrumb.media}</span>
    </a>
</li>
<li class="nav__item {if $smarty.get.tab == 'sitemap'} is-active {/if}">
    <a class="nav__link" data-toggle="lu-tab" data-change-hash="true" href="#settings-sitemap">
        <span class="nav__link-text">{$lang.breadcrumb.sitemap}</span>
    </a>
</li>
<li class="nav__item {if $smarty.get.tab == 'optimization'} is-active {/if}">
    <a class="nav__link" data-toggle="lu-tab" data-change-hash="true" href="#settings-optimization">
        <span class="nav__link-text">Optimize</span>
    </a>
</li>
<li class="nav__item {if $smarty.get.tab == 'export-import'} is-active {/if}">
    <a class="nav__link" data-toggle="lu-tab" data-change-hash="true" href="#settings-export-import">
        <span class="nav__link-text">Export/Import</span>
    </a>
</li>