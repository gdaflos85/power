{if file_exists("{$smarty.current_dir}/overwrites/tld.tpl")}
    {include file="{$smarty.current_dir}/overwrites/tld.tpl"} 
{else}
    {$renewTypes = ['transfer_renewal', 'register_renewal', 'renewal']}
    {include file="{$smarty.current_dir}/feature-cols.tpl"}
    <div class="{foreach $cols as $col} {$col}{/foreach}{if $displaySlider}{if $tldSliderType == "screen-slider"} screen-slider-item{else} content-slider-item{/if}{/if}">
        <div class="feature feature-tld feature-tld-{$tldLayout} {if $tldSize == "small"} feature-sm{elseif $tldSize == "extra-small"} feature-xs{/if}{if $tldStyle == 'boxed'} is-boxed{elseif $tldStyle == 'bordered'} is-bordered{/if}  {if $tld.custom_classes} {$tld.custom_classes}{/if}{if $tldCustomClasses} {$tldCustomClasses}{/if}">
            <div class="feature-body">
                <div class="feature-content">
                    <div class="feature-title">
                        {$tld.domain.tld|replace:".":"<span>.</span>"}
                        {if $tldLayout != "center"}
                            {if strstr($tldPricing, 'register') && $tld.domain.discount_price.register}
                                <span class="label label-xs label-save">{$rslang->trans('packages.save')}&nbsp;{$tld.domain.discount_percent.register|round:0}%</span>
                            {elseif strstr($tldPricing, 'transfer') && $tld.domain.discount_price.transfer}
                                <span class="label label-xs label-save">{$rslang->trans('packages.save')}&nbsp;{$tld.domain.discount_percent.transfer|round:0}%</span>
                            {elseif $tld.domain.price.renew && $tld.domain.discount_price.renew}
                                <span class="label label-xs label-save">{$rslang->trans('packages.save')}&nbsp;{$tld.domain.discount_percent.renewal|round:0}%</span>
                            {/if}
                        {/if}
                    </div>
                    <div class="feature-footer">
                        <div class="feature-desc">
                            <span class="feature-tld-price">
                                {if strstr($tldPricing, 'register')}
                                    {if $tld.domain.discount_price.register}
                                        {formatCurrency($tld.domain.discount_price.register, $WHMCSCurrency.suffix)|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}/{if $tld.domain.yearlyCycle.register == "1"}{$LANG.pricingCycleShort.annually}{else}{$tld.domain.yearlyCycle.register}{$LANG.pricingCycleShort.biennially|replace:"2":""}{/if}
                                    {elseif $tld.domain.price.register}
                                        {formatCurrency($tld.domain.price.register, $WHMCSCurrency.suffix)|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}/{if $tld.domain.yearlyCycle.register == "1"}{$LANG.pricingCycleShort.annually}{else}{$tld.domain.yearlyCycle.register}{$LANG.pricingCycleShort.biennially|replace:"2":""}{/if}
                                    {else}
                                        -
                                    {/if}        
                                {elseif strstr($tldPricing, 'transfer')}
                                    {if $tld.domain.discount_price.transfer}
                                        {formatCurrency($tld.domain.discount_price.transfer, $WHMCSCurrency.suffix)|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}/{if $tld.domain.yearlyCycle.transfer == "1"}{$LANG.pricingCycleShort.annually}{else}{$tld.domain.yearlyCycle.transfer}{$LANG.pricingCycleShort.biennially|replace:"2":""}{/if}
                                    {elseif $tld.domain.price.transfer}
                                        {formatCurrency($tld.domain.price.transfer, $WHMCSCurrency.suffix)|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}/{if $tld.domain.yearlyCycle.transfer == "1"}{$LANG.pricingCycleShort.annually}{else}{$tld.domain.yearlyCycle.transfer}{$LANG.pricingCycleShort.biennially|replace:"2":""}{/if}
                                    {else}
                                        -
                                    {/if}
                                {elseif $tld.domain.price.renew}
                                    {if $tld.domain.discount_price.renew}
                                        {formatCurrency($tld.domain.discount_price.renew, $WHMCSCurrency.suffix)|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}/{if $tld.domain.yearlyCycle.renew == "1"}{$LANG.pricingCycleShort.annually}{else}{$tld.domain.yearlyCycle.renew}{$LANG.pricingCycleShort.biennially|replace:"2":""}{/if}
                                    {elseif $tldPricing == "renewal"}
                                        {formatCurrency($tld.domain.price.renew, $WHMCSCurrency.suffix)|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}/{if $tld.domain.yearlyCycle.renew == "1"}{$LANG.pricingCycleShort.annually}{else}{$tld.domain.yearlyCycle.renew}{$LANG.pricingCycleShort.biennially|replace:"2":""}{/if}
                                    {else}
                                        -
                                    {/if}
                                {/if}
                                {if strstr($tldPricing, 'register') && $tld.domain.discount_price.register}
                                    <span class="feature-tld-discount"><span class="feature-tld-old-price">{formatCurrency($tld.domain.price.register, $WHMCSCurrency.suffix)|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}/{if $tld.domain.yearlyCycle.register == "1"}{$LANG.pricingCycleShort.annually}{else}{$tld.domain.yearlyCycle.register}{$LANG.pricingCycleShort.biennially|replace:"2":""}{/if}</span>{if $tldLayout == "center"}<span class="label label-xs label-save">{$rslang->trans('packages.save')}&nbsp;{$tld.domain.discount_percent.register|round:0}%</span>{/if}</span>
                                {elseif strstr($tldPricing, 'transfer') && $tld.domain.discount_price.transfer}
                                    <span class="feature-tld-discount"><span class="feature-tld-old-price">{formatCurrency($tld.domain.price.transfer, $WHMCSCurrency.suffix)|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}/{if $tld.domain.yearlyCycle.transfer == "1"}{$LANG.pricingCycleShort.annually}{else}{$tld.domain.yearlyCycle.transfer}{$LANG.pricingCycleShort.biennially|replace:"2":""}{/if}</span>{if $tldLayout == "center"}<span class="label label-xs label-save">{$rslang->trans('packages.save')}&nbsp;{$tld.domain.discount_percent.transfer|round:0}%</span>{/if}</span>
                                {elseif $tld.domain.price.renew && $tld.domain.discount_price.renew}    
                                    <span class="feature-tld-discount"><span class="feature-tld-old-price">{formatCurrency($tld.domain.price.renew, $WHMCSCurrency.suffix)|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}/{if $tld.domain.yearlyCycle.renew == "1"}{$LANG.pricingCycleShort.annually}{else}{$tld.domain.yearlyCycle.renew}{$LANG.pricingCycleShort.biennially|replace:"2":""}{/if}</span>{if $tldLayout == "center"}<span class="label label-xs label-save">{$rslang->trans('packages.save')}&nbsp;{$tld.domain.discount_percent.renewal|round:0}%</span>{/if}</span>
                                {/if}
                            </span>
                            {if in_array($tldPricing, $renewTypes) && $tld.domain.price.renew}
                                <span class="feature-tld-renewal">
                                    {if $tld.domain.discount_price.renew}
                                        {$rslang->trans('tld.renewal_at')} {formatCurrency($tld.domain.discount_price.renew)|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}/{if $tld.domain.yearlyCycle.renew == "1"}{$LANG.pricingCycleShort.annually}{else}{$tld.domain.yearlyCycle.renew}{$LANG.pricingCycleShort.biennially|replace:"2":""}{/if}
                                    {else}
                                        {$rslang->trans('tld.renewal_at')} {formatCurrency($tld.domain.price.renew)|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}/{if $tld.domain.yearlyCycle.renew == "1"}{$LANG.pricingCycleShort.annually}{else}{$tld.domain.yearlyCycle.renew}{$LANG.pricingCycleShort.biennially|replace:"2":""}{/if}
                                    {/if}
                                </span>
                            {/if}
                        </div>
                        <div class="feature-actions">
                            {if $linkedPage|strstr:"?"}{$dir_sign = "&"}{else}{$dir_sign = "?"}{/if}
                            {if $tldSize == "extra-small"}
                                <a href="{if $linkedPage == "none" || !$linkedPage || $linkedPage == "`$WEB_ROOT`/none"}#{else}{$linkedPage}{/if}{if $tld.domain.promocode}{$dir_sign}promocode={$tld.domain.promocode}{/if}" {if !($linkedPage == "none" || !$linkedPage || $linkedPage == "`$WEB_ROOT`/none")}data-btn-loader{/if} {if $linkedPage == "none" || !$linkedPage || $linkedPage == "`$WEB_ROOT`/none"}data-domain-box="{$tld.domain.tld}"{/if} {if $tld.domain.promocode} data-tld-promo="&promocode={$tld.domain.promocode}"{/if} class="btn btn-link btn-sm flex-row-reverse">
                                    <div class="btn-icon">
                                        <i class="ls ls-arrow-right"></i> 
                                    </div>
                                    <div class="btn-text">
                                        {if strstr($tldPricing, 'register')}
                                            {$rslang->trans('tld.register_now')}
                                        {elseif strstr($tldPricing, 'transfer')}
                                            {$rslang->trans('tld.transfer_now')}
                                        {else}
                                            {$rslang->trans('tld.renew_now')}
                                        {/if}
                                    </div>
                                    {if !($linkedPage == "none" || !$linkedPage || $linkedPage == "`$WEB_ROOT`/none")}
                                        <div class="loader loader-button hidden">
                                            <div class="spinner spinner-sm">
                                                <div class="rect1"></div>
                                                <div class="rect2"></div>
                                                <div class="rect3"></div>
                                                <div class="rect4"></div>
                                                <div class="rect5"></div>
                                            </div>
                                        </div>
                                    {/if}
                                </a>
                            {else}
                                <a href="{if $linkedPage == "none" || !$linkedPage || $linkedPage == "`$WEB_ROOT`/none"}#{else}{$linkedPage}{/if}{if $tld.domain.promocode}{$dir_sign}promocode={$tld.domain.promocode}{/if}" {if !($linkedPage == "none" || !$linkedPage || $linkedPage == "`$WEB_ROOT`/none")}data-btn-loader{/if} {if $linkedPage == "none" || !$linkedPage || $linkedPage == "`$WEB_ROOT`/none"}data-domain-box="{$tld.domain.tld}"{/if} {if $tld.domain.promocode} data-tld-promo="&promocode={$tld.domain.promocode}"{/if} class="btn btn-primary {if $tldSize == "small"}btn-sm{/if}">
                                    <span class="btn-text">
                                        {if strstr($tldPricing, 'register')}
                                            {$rslang->trans('tld.register_now')}
                                        {elseif strstr($tldPricing, 'transfer')}
                                            {$rslang->trans('tld.transfer_now')}
                                        {else}
                                            {$rslang->trans('tld.renew_now')}
                                        {/if}
                                    </span>
                                    {if !($linkedPage == "none" || !$linkedPage || $linkedPage == "`$WEB_ROOT`/none")}
                                        <div class="loader loader-button hidden">
                                            <div class="spinner spinner-sm">
                                                <div class="rect1"></div>
                                                <div class="rect2"></div>
                                                <div class="rect3"></div>
                                                <div class="rect4"></div>
                                                <div class="rect5"></div>
                                            </div>
                                        </div>
                                    {/if}
                                </a>
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/if}    
