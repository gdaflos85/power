<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.layout.affixed_navigation.title}
            {if isset($tooltips.settings.layout.affixed_navigation.title)}
                {if isset($tooltips.settings.layout.affixed_navigation.url) && $tooltips.settings.layout.affixed_navigation.url != ""}
                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.layout.affixed_navigation.url}' target='_blank'>Learn More</a>"}
                {else}
                    {assign var="popoverFooter" value=false}
                {/if}
                {include 
                    file="adminarea/includes/helpers/popover.tpl" 
                    popoverClasses="notification__popover"
                    popoverBody="{$tooltips.settings.layout.affixed_navigation.title}"
                    popoverFooter="{$popoverFooter}"
                }
            {/if}
        </h6>
        <label>
            <div class="switch">
                <input type="hidden" name="settings[show_affixed_navigation]" value="disabled"/>
                <input class="switch__checkbox"
                        name="settings[show_affixed_navigation]" value="enabled"
                        type="checkbox" {if $settings['show_affixed_navigation'] == "enabled"} checked="checked" {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div>
</div>