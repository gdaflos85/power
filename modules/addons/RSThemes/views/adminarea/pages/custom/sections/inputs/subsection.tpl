{if $sectionKey != 0}
            </div>
        </div>
    </div>
</div>
{/if}
<div class="widget__section section flex-1 {if $sectionKey == 0}m-t-0x{/if}">
    <div class="section__header top {if isset($sectionField['collapse']) && $sectionField['collapse']}collapsed" data-toggle="lu-collapse" data-target="#{$sectionField['name']}-{$sectionIndex}-{$sectionKey}{/if}">
        <h6 class="top__title">{$sectionField['label']}</h6>
        {if isset($sectionField['collapse']) && $sectionField['collapse']}
            <button type="button" class="top__toolbar btn btn--link">
                <span class="btn__text">Expand</span>
                <span class="btn__text">Hide</span>
                <i class="btn__icon ls ls-down"></i>
            </button>
        {/if}
    </div>
    <div class="section__content {if isset($sectionField['collapse']) && $sectionField['collapse']}collapse{/if}"  {if isset($sectionField['collapse']) && $sectionField['collapse']}id="{$sectionField['name']}-{$sectionIndex}-{$sectionKey}"{/if}>
        <div class="well">
            <div class="row">
   