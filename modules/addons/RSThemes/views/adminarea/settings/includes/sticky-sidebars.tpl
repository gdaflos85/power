<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title"> 
            {$lang.settings.section.layout.sticky_sidebars.title}
            {if isset($tooltips.settings.layout.sticky_sidebars.title)}
                {if isset($tooltips.settings.layout.sticky_sidebars.url) && $tooltips.settings.layout.sticky_sidebars.url != ""}
                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.layout.sticky_sidebars.url}' target='_blank'>Learn More</a>"}
                {else}
                    {assign var="popoverFooter" value=false}
                {/if}
                {include 
                    file="adminarea/includes/helpers/popover.tpl" 
                    popoverClasses="notification__popover"
                    popoverBody="{$tooltips.settings.layout.sticky_sidebars.title}"
                    popoverFooter="{$popoverFooter}"
                }
            {/if}
        </h6>
        <label>
            <div class="switch">
                <input type="hidden" name="settings[sticky_sidebars]" value="hidden" />
                <input 
                    class="switch__checkbox" 
                    name="settings[sticky_sidebars]" 
                    value="true" type="checkbox" 
                    {if $settings['sticky_sidebars']=="true" } checked="checked" {/if}
                > 
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div>
</div>