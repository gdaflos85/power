<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.general.capitalize_section_titles.title}
            {if isset($tooltips.settings.general.capitalize_section_titles.title)}
                {if isset($tooltips.settings.general.capitalize_section_titles.url) && $tooltips.settings.general.capitalize_section_titles.url != ""}
                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.general.capitalize_section_titles.url}' target='_blank'>Learn More</a>"}
                {else}
                    {assign var="popoverFooter" value=false}
                {/if}
                {include 
                    file="adminarea/includes/helpers/popover.tpl" 
                    popoverClasses="notification__popover"
                    popoverBody="{$tooltips.settings.general.capitalize_section_titles.title}"
                    popoverFooter="{$popoverFooter}"
                }
            {/if}
        </h6>
        <label>
            <div class="switch">
                <input type="hidden" name="settings[capitalize_section_titles]" value="disabled"/>
                <input class="switch__checkbox"
                        name="settings[capitalize_section_titles]" value="enabled"
                        type="checkbox" {if $settings['capitalize_section_titles'] != "disabled" } checked="checked" {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div> 
</div>