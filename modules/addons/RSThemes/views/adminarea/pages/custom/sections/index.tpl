{if !$sType}
    <input name="language" value="{$language}" type="hidden">
{/if}
{if $pageSections}
    {foreach $pageSections as $sectionIndex => $pageSection}
        {if $counterStart}{$sectionIndex = $sectionIndex + $counterStart}{/if}
        {include file='adminarea/pages/custom/sections/section.tpl'}
    {/foreach}
{/if}    
<button
    type="button"
    class="btn btn--secondary btn--block order-max m-t-3x {if !$pageSections}is-hidden{/if}"
    data-toggle="lu-modal"
    data-target="#modalAddNewSection"
    data-section-add
    {if isset($sType)}data-section-type="{$sType}"{/if} 
    data-section-header-btn
    data-order="{if $pageSections}{sizeof($pageSections) + 1}{else}1{/if}"
    data-index="{if $pageSections}{if $counterStart}{sizeof($pageSections) + $counterStart}{else}{sizeof($pageSections)}{/if}{else}0{/if}"
    data-language="{$language}"
>
    <i class="btn__icon ls ls-plus"></i>
    <span class="btn__text">{$lang.general.add_new}</span>
</button>

<div class="section__body panel {if $pageSections}is-hidden{/if}" data-no-sections>
    <div class="section__builder">
        <div class="builder__icon text-center">
            <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M12.3856 16.4751L27.0847 1.80041C29.4918 -0.600136 33.393 -0.600136 35.8001 1.80041L38.1943 4.19069C40.6017 6.59403 40.6017 10.492 38.1943 12.8928L23.425 27.6375C22.3476 28.7132 20.8866 29.3177 19.3628 29.3177H11.9949C11.1658 29.3177 10.4995 28.6359 10.5202 27.8084L10.7051 20.3855C10.7421 18.9155 11.3436 17.5154 12.3856 16.4751ZM36.1082 6.27339L33.7151 3.88424C32.4599 2.63246 30.425 2.63246 29.1704 3.88368L27.9611 5.09096L34.899 12.0173L36.1088 10.8095C37.3632 9.55845 37.3632 7.5263 36.1082 6.27339ZM32.8128 14.1L25.8749 7.17369L14.4719 18.5578C13.9651 19.0638 13.6726 19.7447 13.6545 20.4592L13.5059 26.3705L19.3629 26.3723C20.0113 26.3723 20.6365 26.1472 21.1339 25.7402L21.339 25.5548L32.8128 14.1ZM18.6696 0.0759835C19.4843 0.0759835 20.1448 0.735339 20.1448 1.54869C20.1448 2.29427 19.5898 2.91044 18.8698 3.00796L18.6696 3.0214H11.3155C6.35587 3.0214 3.14341 6.30596 2.95873 11.4067L2.95032 11.8753V28.2008C2.95032 33.4173 6.00656 36.8485 10.8685 37.0458L11.3155 37.0548H28.6712C33.6431 37.0548 36.8458 33.7773 37.0299 28.6701L37.0383 28.2008V20.2914C37.0383 19.478 37.6988 18.8187 38.5135 18.8187C39.2603 18.8187 39.8775 19.3727 39.9752 20.0916L39.9886 20.2914V28.2008C39.9886 34.9991 35.6752 39.779 29.1313 39.9927L28.6712 40.0002H11.3155C4.67062 40.0002 0.206456 35.3745 0.00697185 28.6718L0 28.2008V11.8753C0 5.08376 4.32451 0.297515 10.8562 0.0834665L11.3155 0.0759835H18.6696Z" fill="#1062FE"/>
            </svg>
        </div>
        <h5 class="builder__title">No Sections Created</h5>
        <p class="p-md builder__desc text-center m-b-4x">Please use bellow button to start adding new sections to this page, or follow our <span class="form-label__counter label-docs"><a href="#" class="btn--link btn--xs p-0x">documentation</a></span>.</p>
        <div class="builder__actions">
            <a 
                class="btn btn--secondary" 
                href="#" 
                data-toggle="lu-modal" 
                data-target="#modalAddNewSection" 
                data-section-add
                {if isset($sType)}data-section-type="{$sType}"{/if} 
                data-order="1" 
                data-index="{if isset($counterStart) && $counterStart}{$counterStart}{else}1{/if}">
                <i class="btn__icon ls ls-plus"></i>
                <span class="btn__text m-l-0x">Add New Section</span>
            </a>
        </div>
    </div>
</div>