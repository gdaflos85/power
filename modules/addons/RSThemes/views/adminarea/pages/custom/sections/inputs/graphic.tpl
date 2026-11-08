{assign var="iconsPath" value="./../../../../../../../../../templates/{$themeName}/assets/svg-icon"}
{assign var="illustrationsPath" value="./../../../../../../../../../templates/{$themeName}/assets/svg-illustrations"}

{assign var="imagesPath" value="{$whmcsURL}/templates/{$themeName}/assets/img"}

{assign var="filedir" value="/modules/addons"|explode:$smarty.current_dir}

{if isset($sectionGroupField)}
    <div class="form-group {if $sectionGroupField['grouped_only_visible']}grouped-only-visible{/if}">
        <label class="form-label">
            {$sectionGroupField['label']}
            {if $sectionGroupField['tooltip']}
                {if isset($sectionGroupField['tooltip_url']) && $sectionGroupField['tooltip_url'] != ""}
                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$sectionGroupField['tooltip_url']}' target='_blank'>Learn More</a>"}
                {else}
                    {assign var="popoverFooter" value=false}
                {/if}
                {include 
                    file="adminarea/includes/helpers/popover.tpl" 
                    popoverClasses="notification__popover"
                    popoverBody="{$sectionGroupField['tooltip']}"
                    popoverFooter="{$popoverFooter}"
                }
            {/if}
        </label>
        <div class="media media--xs media--field {if isset($sectionGroupField['graphic_types']) && $sectionGroupField['graphic_types'] == "icons"}media--icon{/if}" data-graphic-container="{$sectionGroupField['name']}" data-section="{$sectionIndex}" data-group="{$groupIndex}">
            <a 
                class="media__upload {if isset($sectionGroupInputValue['graphic']) && !empty($sectionGroupInputValue['graphic'])}is-hidden{/if}"
                data-add-new-graphic
                data-graphic-name="{$sectionGroupField['name']}"
                data-section="{$sectionIndex}"
                data-group="{$groupIndex}"
                {if isset($sectionGroupField['graphic_types']) && $sectionGroupField['graphic_types'] == "icons"}
                    href="#addGraphicIconModal"
                {else}
                    href="#addGraphicModal"
                {/if}
                data-toggle="lu-modal"
                data-backdrop="static"
                data-keyboard="false"
            >
                <div class="media__upload-content">
                    <span class="media__title">No graphic assigned</span>
                    <span class="btn btn--sm btn--link">
                        <span class="btn__icon">
                            <svg width="13" height="12" viewBox="0 0 13 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <g clip-path="url(#clip0_6693_2419)">
                                    <path d="M12.35 7.64999L9.85004 5.14999C9.80515 5.10216 9.75093 5.06404 9.69073 5.03798C9.63053 5.01192 9.56563 4.99847 9.50004 4.99847C9.43444 4.99847 9.36954 5.01192 9.30934 5.03798C9.24914 5.06404 9.19493 5.10216 9.15003 5.14999L5.50003 8.78999L3.85003 7.14999C3.80514 7.10216 3.75093 7.06404 3.69073 7.03798C3.63053 7.01192 3.56563 6.99847 3.50003 6.99847C3.43444 6.99847 3.36954 7.01192 3.30934 7.03798C3.24914 7.06404 3.19493 7.10216 3.15003 7.14999L0.650035 9.64999C0.601998 9.69464 0.563835 9.74884 0.538002 9.80912C0.512168 9.8694 0.499236 9.93442 0.500035 9.99999V11.5C0.500035 11.6326 0.552713 11.7598 0.646482 11.8535C0.74025 11.9473 0.867427 12 1.00003 12H12C12.1326 12 12.2598 11.9473 12.3536 11.8535C12.4474 11.7598 12.5 11.6326 12.5 11.5V7.99999C12.5008 7.93442 12.4879 7.8694 12.4621 7.80912C12.4362 7.74884 12.3981 7.69464 12.35 7.64999Z" fill="#1062FE"/>
                                    <path d="M4.5 4C5.60457 4 6.5 3.10457 6.5 2C6.5 0.89543 5.60457 0 4.5 0C3.39543 0 2.5 0.89543 2.5 2C2.5 3.10457 3.39543 4 4.5 4Z" fill="#1062FE"/>
                                </g>
                                <defs>
                                    <clipPath id="clip0_6693_2419">
                                    <rect width="12" height="12" fill="white" transform="translate(0.5)"/>
                                    </clipPath>
                                </defs>
                            </svg>
                        </span>
                        <span class="btn__text">Assign graphic</span>
                    </span>
                </div>
            </a>
            <div class="media__content {if !isset($sectionGroupInputValue['graphic']) || empty($sectionGroupInputValue['graphic'])}is-hidden{/if}" data-graphic-content>
             
                {if isset($sectionGroupInputValue['graphic']) && !empty($sectionGroupInputValue['graphic'])}
                    <div class="media__body" data-graphic-image>
                        {if $sectionGroupInputValue['type'] == "icon"}
                            {if file_exists("{$filedir[0]}/templates/{$themeName}/assets/svg-icon/{$sectionGroupInputValue['graphic']}")}
                                {include file="{$iconsPath}/{$sectionGroupInputValue['graphic']}"}
                            {/if}
                        {elseif $sectionGroupInputValue['type'] == "illustration"}
                            {if file_exists("{$filedir[0]}/templates/{$themeName}/assets/svg-illustrations/{$sectionGroupInputValue['graphic']}")}
                                {include file="{$illustrationsPath}/{$sectionGroupInputValue['graphic']}"}
                            {/if}
                        {elseif $sectionGroupInputValue['type'] == "media"}
                            <img src="{$imagesPath}/page-manager/{$sectionGroupInputValue['graphic']}" alt="{$sectionGroupInputValue['graphic']}">
                        {elseif $sectionGroupInputValue['type'] == "font-icon"}
                            <i class="{$sectionGroupInputValue['graphic']}"></i>    
                        {/if}
                    </div>
                    <div class="media__footer">
                        {assign var="graphicName" value="/"|explode:$sectionGroupInputValue['graphic']}
                        <span class="media__name"
                            {if isset($sectionGroupField['graphic_types']) && $sectionGroupField['graphic_types'] == "icons"}
                                href="#editGraphicIconModal"
                            {else}
                                 href="#editGraphicModal" 
                            {/if}
                            data-edit-graphic
                            data-toggle="lu-modal" 
                            data-backdrop="static" 
                            data-keyboard="false" 
                            data-group="{$groupIndex}"
                            data-graphic-name="{$sectionGroupField['name']}"
                            {if $sectionGroupInputValue['type'] == "icon"}
                                data-icon="{$sectionGroupInputValue['graphic']}"
                            {elseif $sectionGroupInputValue['type'] == "illustration"}
                                data-illustration="{$sectionGroupInputValue['graphic']}"
                            {elseif $sectionGroupInputValue['type'] == "media"}
                                data-media="{$sectionGroupInputValue['graphic']}"
                            {elseif $sectionGroupInputValue['type'] == "font-icon"}
                                data-font-icon="{$sectionGroupInputValue['graphic']}"
                            {/if}
                            data-section="{$sectionIndex}" 
                            data-graphic-title
                            >{$graphicName|@end}</span>
                        <span 
                            class="btn btn--icon btn--link btn--xs" 
                            {if isset($sectionGroupField['graphic_types']) && $sectionGroupField['graphic_types'] == "icons"}
                                href="#editGraphicIconModal"
                            {else}
                                 href="#editGraphicModal" 
                            {/if}
                            data-edit-graphic
                            data-toggle="lu-modal" 
                            data-backdrop="static" 
                            data-keyboard="false" 
                            data-group="{$groupIndex}"
                            data-graphic-name="{$sectionGroupField['name']}"
                            {if $sectionGroupInputValue['type'] == "icon"}
                                data-icon="{$sectionGroupInputValue['graphic']}"
                            {elseif $sectionGroupInputValue['type'] == "illustration"}
                                data-illustration="{$sectionGroupInputValue['graphic']}"
                            {elseif $sectionGroupInputValue['type'] == "media"}
                                data-media="{$sectionGroupInputValue['graphic']}"
                            {elseif $sectionGroupInputValue['type'] == "font-icon"}
                                data-font-icon="{$sectionGroupInputValue['graphic']}"    
                            {/if}
                            data-section="{$sectionIndex}" 
                        >
                            <i class="btn__icon ls ls-edit"></i>
                        </span>
                        <a 
                            class="deleteItem btn btn--icon btn--link btn--xs" 
                            href="#deleteGraphicModal" 
                            data-toggle="lu-modal" 
                            data-backdrop="static" 
                            data-delete-graphic
                            data-group="{$groupIndex}"
                            data-graphic-name="{$sectionGroupField['name']}"
                            data-section="{$sectionIndex}"  
                        >
                            <i class="btn__icon lm lm-trash"></i>
                        </a>
                    </div>
                {/if}
            </div>
            <input type="hidden" data-section="{$sectionIndex}" data-group="{$groupIndex}" data-graphic="{$sectionGroupField['name']}" data-graphic-type name="sections[{$sectionIndex}][lang][{$sectionField['name']}][groups][{$groupIndex}][fields][{$sectionGroupField['name']}][type]" value="{$sectionGroupInputValue['type']}">
            <input type="hidden" data-section="{$sectionIndex}" data-group="{$groupIndex}" data-graphic="{$sectionGroupField['name']}" data-graphic-name name="sections[{$sectionIndex}][lang][{$sectionField['name']}][groups][{$groupIndex}][fields][{$sectionGroupField['name']}][graphic]" value="{$sectionGroupInputValue['graphic']}">
        </div>
    </div>
{else}
    <div class="section__field col-12">
        <div class="form-group">
            <label class="form-label">
                {$sectionField['label']}
                {if $sectionField['tooltip']}
                    {if isset($sectionField['tooltip_url']) && $sectionField['tooltip_url'] != ""}
                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$sectionField['tooltip_url']}' target='_blank'>Learn More</a>"}
                    {else}
                        {assign var="popoverFooter" value=false}
                    {/if}
                    {include 
                        file="adminarea/includes/helpers/popover.tpl" 
                        popoverClasses="notification__popover"
                        popoverBody="{$sectionField['tooltip']}"
                        popoverFooter="{$popoverFooter}"
                    }
                {/if}
            </label>
            <div class="media media--xs media--field m-t-0x" data-graphic-container="{$sectionField['name']}" data-section="{$sectionIndex}">
                <a
                    class="media__upload {if isset($sectionFieldValue['graphic']) && !empty($sectionFieldValue['graphic'])}is-hidden{/if}"
                    data-add-new-graphic
                    data-graphic-name="{$sectionField['name']}"
                    data-section="{$sectionIndex}"
                    href="#addGraphicModal"
                    data-toggle="lu-modal"
                    data-backdrop="static"
                    data-keyboard="false"
                >
                    <div class="media__upload-content">
                        <span class="media__title">No graphic assigned</span>
                        <span class="btn btn--sm btn--link">
                            <span class="btn__icon">
                                <svg width="13" height="12" viewBox="0 0 13 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <g clip-path="url(#clip0_6693_2419)">
                                        <path d="M12.35 7.64999L9.85004 5.14999C9.80515 5.10216 9.75093 5.06404 9.69073 5.03798C9.63053 5.01192 9.56563 4.99847 9.50004 4.99847C9.43444 4.99847 9.36954 5.01192 9.30934 5.03798C9.24914 5.06404 9.19493 5.10216 9.15003 5.14999L5.50003 8.78999L3.85003 7.14999C3.80514 7.10216 3.75093 7.06404 3.69073 7.03798C3.63053 7.01192 3.56563 6.99847 3.50003 6.99847C3.43444 6.99847 3.36954 7.01192 3.30934 7.03798C3.24914 7.06404 3.19493 7.10216 3.15003 7.14999L0.650035 9.64999C0.601998 9.69464 0.563835 9.74884 0.538002 9.80912C0.512168 9.8694 0.499236 9.93442 0.500035 9.99999V11.5C0.500035 11.6326 0.552713 11.7598 0.646482 11.8535C0.74025 11.9473 0.867427 12 1.00003 12H12C12.1326 12 12.2598 11.9473 12.3536 11.8535C12.4474 11.7598 12.5 11.6326 12.5 11.5V7.99999C12.5008 7.93442 12.4879 7.8694 12.4621 7.80912C12.4362 7.74884 12.3981 7.69464 12.35 7.64999Z" fill="#1062FE"/>
                                        <path d="M4.5 4C5.60457 4 6.5 3.10457 6.5 2C6.5 0.89543 5.60457 0 4.5 0C3.39543 0 2.5 0.89543 2.5 2C2.5 3.10457 3.39543 4 4.5 4Z" fill="#1062FE"/>
                                    </g>
                                    <defs>
                                        <clipPath id="clip0_6693_2419">
                                        <rect width="12" height="12" fill="white" transform="translate(0.5)"/>
                                        </clipPath>
                                    </defs>
                                </svg>
                            </span>
                            <span class="btn__text">Assign graphic</span>
                        </span>
                    </div>
                </a>
                <div class="media__content {if !isset($sectionFieldValue['graphic']) || empty($sectionFieldValue['graphic'])}is-hidden{/if}" data-graphic-content>
                    {if isset($sectionFieldValue['graphic']) && !empty($sectionFieldValue['graphic'])}
                        <div class="media__body" data-graphic-image>
                            {if $sectionFieldValue['type'] == "icon"}
                                {if file_exists("{$filedir[0]}/templates/{$themeName}/assets/svg-icon/{$sectionFieldValue['graphic']}")}
                                    {include file="{$iconsPath}/{$sectionFieldValue['graphic']}"}
                                {/if}
                            {elseif $sectionFieldValue['type'] == "illustration"}
                                {if file_exists("{$filedir[0]}/templates/{$themeName}/assets/svg-illustrations/{$sectionFieldValue['graphic']}")}
                                    {include file="{$illustrationsPath}/{$sectionFieldValue['graphic']}"}
                                {/if} 
                            {elseif $sectionFieldValue['type'] == "media"}
                                <img src="{$imagesPath}/page-manager/{$sectionFieldValue['graphic']}" alt="{$sectionFieldValue['graphic']}">
                            {/if}
                        </div>
                        <div class="media__footer">
                            {assign var="graphicName" value="/"|explode:$sectionFieldValue['graphic']}
                            <span 
                                class="media__name" 
                                data-graphic-title
                                href="#editGraphicModal" 
                                data-edit-graphic
                                data-toggle="lu-modal" 
                                data-backdrop="static" 
                                data-keyboard="false" 
                                data-graphic-name="{$sectionField['name']}"
                                {if $sectionFieldValue['type'] == "icon"}
                                    data-icon="{$sectionFieldValue['graphic']}"
                                {elseif $sectionFieldValue['type'] == "illustration"}
                                    data-illustration="{$sectionFieldValue['graphic']}"
                                {elseif $sectionFieldValue['type'] == "media"}
                                    data-media="{$sectionFieldValue['graphic']}"
                                {/if}
                                data-section="{$sectionIndex}"
                            >
                                {$graphicName|@end}
                            </span>
                            <span 
                                class="btn btn--icon btn--link btn--xs" 
                                href="#editGraphicModal" 
                                data-edit-graphic
                                data-toggle="lu-modal" 
                                data-backdrop="static" 
                                data-keyboard="false" 
                                data-graphic-name="{$sectionField['name']}"
                                {if $sectionFieldValue['type'] == "icon"}
                                    data-icon="{$sectionFieldValue['graphic']}"
                                {elseif $sectionFieldValue['type'] == "illustration"}
                                    data-illustration="{$sectionFieldValue['graphic']}"
                                {elseif $sectionFieldValue['type'] == "media"}
                                    data-media="{$sectionFieldValue['graphic']}"
                                {/if}
                                data-section="{$sectionIndex}" 
                            >
                                <i class="btn__icon ls ls-edit" data-toggle="lu-tooltip" data-title="Edit Item"></i>
                            </span>
                            <a 
                                class="deleteItem btn btn--icon btn--link btn--xs" 
                                href="#deleteGraphicModal" 
                                data-toggle="lu-modal" 
                                data-backdrop="static" 
                                data-delete-graphic
                                data-graphic-name="{$sectionField['name']}"
                                data-section="{$sectionIndex}"  
                            >
                                <i class="btn__icon ls ls-trash" data-toggle="lu-tooltip" data-title="Remove Item"></i>
                            </a>
                        </div>
                    {/if}
                </div>
                <input type="hidden" data-section="{$sectionIndex}" data-graphic="{$sectionField['name']}" data-graphic-type
                    name="sections[{$sectionIndex}][lang][{$sectionField['name']}][type]" value="{if isset($sectionFieldValue['type'])}{$sectionFieldValue['type']}{/if}">
                <input type="hidden" data-section="{$sectionIndex}" data-graphic="{$sectionField['name']}" data-graphic-name
                    name="sections[{$sectionIndex}][lang][{$sectionField['name']}][graphic]" value="{if isset($sectionFieldValue['type'])}{$sectionFieldValue['graphic']}{/if}">
            </div>
        </div>
    </div>
{/if}