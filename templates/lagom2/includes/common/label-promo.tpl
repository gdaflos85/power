
    <span class="main-header-label-promo label label-savings">
        <span>
            <i class="promo-discount-icon">
                {include file="$template/assets/img/promocode-label-icon.svg"}
            </i>
            <b>{$hasPromoInCart}&nbsp;</b>
            <span class="promo-label-desc">{$rslang->trans('promocode.header_label')}</span>
            <i class="promo-info-icon" data-toggle="tooltip" title="{$rslang->trans('promocode.header_tooltip')}">
                {include file="$template/assets/img/promocode-label-info-icon.svg"}
            </i>
        </span>
    </span>
