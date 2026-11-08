<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.general.dark_mode.title}
            {if isset($tooltips.settings.general.dark_mode.title)}
                {if isset($tooltips.settings.general.dark_mode.url) && $tooltips.settings.general.dark_mode.url != ""}
                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.general.dark_mode.url}' target='_blank'>Learn More</a>"}
                {else}
                    {assign var="popoverFooter" value=false}
                {/if}
                {include 
                    file="adminarea/includes/helpers/popover.tpl" 
                    popoverClasses="notification__popover"
                    popoverBody="{$tooltips.settings.general.dark_mode.title}"
                    popoverFooter="{$popoverFooter}"
                }
            {/if}
        </h6>
        <label>
            <div class="switch collapsed" data-toggle="lu-collapse" data-target="#mode-switcher" aria-expanded="true">
                <input type="hidden" name="settings[display_mode_switcher]" value="0"/>
                <input class="switch__checkbox mode-display"
                        name="settings[display_mode_switcher]" value="1"
                        type="checkbox" {if $settings['display_mode_switcher']} checked {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div>
    <div class="collapse {if $settings['display_mode_switcher']} show {/if}" id="mode-switcher">
        <div class="p-3x">
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group p-0x m-b-2x">
                        <label class="form-text ">
                            {$lang.settings.section.general.dark_mode.label}
                            {if isset($tooltips.settings.general.dark_mode.display_type.title)}
                                {if isset($tooltips.settings.general.dark_mode.display_type.url) && $tooltips.settings.general.dark_mode.display_type.url != ""}
                                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.general.dark_mode.display_type.url}' target='_blank'>Learn More</a>"}
                                {else}
                                    {assign var="popoverFooter" value=false}
                                {/if}
                                {include 
                                    file="adminarea/includes/helpers/popover.tpl" 
                                    popoverClasses="notification__popover"
                                    popoverBody="{$tooltips.settings.general.dark_mode.display_type.title}"
                                    popoverFooter="{$popoverFooter}"
                                }
                            {/if}
                        </label>
                        <select class="form-control" name="settings[display_mode_type]" data-mode-switcher>
                            <option value="switcher">Switcher (Light/Dark)</option>
                            <option value="force" {if $settings['display_mode_type'] == "force"}selected{/if}>Force Dark Mode</option>
                        </select>
                        <span class="form-feedback form-feedback-md form-feedback-danger form-feedback--icon">{$lang.settings.section.general.dark_mode.info}</span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group m-b-0x p-0x">
                        <label class="form-text">
                            {$lang.settings.section.general.dark_mode.default_mode}
                            {if isset($tooltips.settings.general.dark_mode.default_mode.title)}
                                {if isset($tooltips.settings.general.dark_mode.default_mode.url) && $tooltips.settings.general.dark_mode.default_mode.url != ""}
                                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips.settings.general.dark_mode.default_mode.url}' target='_blank'>Learn More</a>"}
                                {else}
                                    {assign var="popoverFooter" value=false}
                                {/if}
                                {include 
                                    file="adminarea/includes/helpers/popover.tpl" 
                                    popoverClasses="notification__popover"
                                    popoverBody="{$tooltips.settings.general.dark_mode.default_mode.title}"
                                    popoverFooter="{$popoverFooter}"
                                }
                            {/if}
                        </label>
                        <select class="form-control" name="settings[display_mode_default]" data-mode-switcher>
                            <option value="light">Light</option>
                            <option value="dark" {if $settings['display_mode_default'] == "dark"}selected{/if}>Dark</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>    
    </div>
</div> 
