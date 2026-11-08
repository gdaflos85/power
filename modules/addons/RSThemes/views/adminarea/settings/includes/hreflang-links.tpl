<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.general.enable_hreflang_links.title}
            {if isset($tooltips.settings.general.enable_hreflang_links.title)}
                {if isset($tooltips.settings.general.enable_hreflang_links.url) && $tooltips.settings.general.enable_hreflang_links.url != ""}
                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.general.enable_hreflang_links.url}' target='_blank'>Learn More</a>"}
                {else}
                    {assign var="popoverFooter" value=false}
                {/if}
                {include 
                    file="adminarea/includes/helpers/popover.tpl" 
                    popoverClasses="notification__popover"
                    popoverBody="{$tooltips.settings.general.enable_hreflang_links.title}"
                    popoverFooter="{$popoverFooter}"
                }
            {/if}
        </h6>
        <label>
            <div class="switch">
                <input type="hidden" name="settings[enable_hreflang_links]" value="hidden"/>
                <input class="switch__checkbox"
                        name="settings[enable_hreflang_links]" value="displayed"
                        type="checkbox" {if isset($settings['enable_hreflang_links']) && $settings['enable_hreflang_links'] == "displayed"} checked="checked" {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div> 
</div>