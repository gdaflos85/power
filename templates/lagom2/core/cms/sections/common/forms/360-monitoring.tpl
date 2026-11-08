{if file_exists("{$smarty.current_dir}/overwrites/360-monitoring.tpl")}
    {include file="{$smarty.current_dir}/overwrites/360-monitoring.tpl"}  
{else}
    <form 
        action="{routePath('cart-threesixtymonitoring-site-check')}" 
        id="frmSiteCheck"
    >
        {if $captcha}
            <script>
                {$captcha->getPageJs()}
            </script>
        {/if}
        <div class="search-group search-group-lg search-group-combined has-shadow {if $customClass}{$customClass}{/if}">
            <div class="search-field" data-custom-tooltip data-placement="top" title="Please enter URL" data-trigger="manual">
                <input 
                    class="form-control" 
                    type="text" 
                    name="url"
                    placeholder="www.example.com"
                />
                <div class="search-field-icon">
                    {if file_exists("templates/$template/assets/svg-icon/custom/search-field-icon.tpl")}
                        {include file="{$smarty.current_dir}/../../../../../assets/svg-icon/custom/search-field-icon.tpl"}
                    {else}
                        <i class="lm lm-search"></i>
                    {/if}  
                </div>
            </div>

            <div class="dropdown dropup" data-select-dropdown  data-custom-tooltip data-placement="top" title="Please select location" data-trigger="manual">
                <div class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="true">
                    <input name="probe_id" id="" type="hidden" data-select-dropdown-value value="">
                    <div class="tld-select">
                        <span data-select-dropdown-value-view>
                            <b>Select location</b>
                        </span>
                        <b class="caret"></b>
                    </div>
                </div>
                <div class="dropdown-menu dropdown-menu-search pull-right">
                    <div class="dropdown-menu-items has-scroll" data-select-dropdown-list>
                        {* {foreach from=$registertlds item=listtld}
                            <div class="dropdown-menu-item {if $tld == $listtld}active{elseif $registertlds[0] == $listtld}active{/if}" data-value="{$listtld}">
                                <a class="">{$listtld}</a>
                            </div>	
                        {/foreach} *}
                        <div class="dropdown-menu-item" data-value="60e81944f401963e610a0623">
                            <a class="">Nuremberg, DE</a>
                        </div>
                        <div class="dropdown-menu-item" data-value="61162681cac0b5844220bbdb">
                            <a class="">Helsinki, FI</a>
                        </div>
                        <div class="dropdown-menu-item" data-value="61162c08cac0b5844220bbdc">
                            <a class="">Falkenstein, DE</a>
                        </div>
                        <div class="dropdown-menu-item" data-value="61162c38cac0b5844220bbdd">
                            <a class="">Falkenstein #2, DE</a>
                        </div>
                        <div class="dropdown-menu-item" data-value="61162c72cac0b5844220bbde">
                            <a class="">Falkenstein #3, DE</a>
                        </div>
                        <div class="dropdown-menu-item" data-value="61162d5acac0b5844220bbdf">
                            <a class="">Helsinki #2, FI</a>
                        </div>
                        <div class="dropdown-menu-item" data-value="61165c3bcac0b5844220bbe0">
                            <a class="">Nuremberg, DE</a>
                        </div>
                        <div class="dropdown-menu-item" data-value="616441aff8e2232e0d58907f">
                            <a class="">New York, US</a>
                        </div>
                        <div class="dropdown-menu-item" data-value="616448a8ba7169082b506849">
                            <a class="">Los Angeles, US</a>
                        </div>
                        <div class="dropdown-menu-item" data-value="61644bc8f8e2232e0d5893aa">
                            <a class="">Atlanta, US</a>
                        </div>
                        <div class="dropdown-menu-item" data-value="61644bd3ba7169082b5069a8">
                            <a class="">Chicago, US</a>
                        </div>
                        <div class="dropdown-menu-item" data-value="61644bd7f0478a0c9846b751">
                            <a class="">Dallas, US</a>
                        </div>
                        <div class="dropdown-menu-item" data-value="61644bd8f8e2232e0d5893de">
                            <a class="">London, UK</a>
                        </div>
                        <div class="dropdown-menu-item" data-value="61644bdcf8e2232e0d5893df">
                            <a class="">Mexico City, MX</a>
                        </div>
                        <div class="dropdown-menu-item" data-value="61644bdcf8e2232e0d5893e0">
                            <a class="">Paris, FR</a>
                        </div>
                        <div class="dropdown-menu-item" data-value="61644bdfba7169082b5069da">
                            <a class="">Silicon Valley, US</a>
                        </div>
                        <div class="dropdown-menu-item" data-value="61644be3f0478a0c9846b771">
                            <a class="">Tokyo, JP</a>
                        </div>
                        <div class="dropdown-menu-item" data-value="6164669cf8e2232e0d589bc8">
                            <a class="">Toronto, CA</a>
                        </div>
                        <div class="dropdown-menu-item" data-value="616466a0f0478a0c9846be1b">
                            <a class="">Amsterdam, NL</a>
                        </div>
                        <div class="dropdown-menu-item" data-value="616466a3ba7169082b50723a">
                            <a class="">Miami, US</a>
                        </div>
                        <div class="dropdown-menu-item" data-value="616466a5f0478a0c9846be1c">
                            <a class="">Seattle, US</a>
                        </div>
                        <div class="dropdown-menu-item" data-value="616466aaba7169082b50723b">
                            <a class="">Singapore, SG</a>
                        </div>
                        <div class="dropdown-menu-item" data-value="616466aaf8e2232e0d589bc9">
                            <a class="">Stockholm, SE</a>
                        </div>
                        <div class="dropdown-menu-item" data-value="616466aeba7169082b50723c">
                            <a class="">Sydney, AU</a>
                        </div>
                        <div class="dropdown-menu-item" data-value="61fb935e26fcf0158b834562">
                            <a class="">Ashburn, US</a>
                        </div>
                    </div>
                    <div class="dropdown-menu-item dropdown-menu-no-data">
                        <span class="text-info text-large">
                            {$LANG.norecordsfound}
                        </span>
                    </div>                                             
                </div>
            </div>

            <div class="search-group-btn">
                <button 
                    type="submit" 
                    class="btn btn-primary {if $captcha && $captcha->isEnabled() && $captcha->isEnabledForForm($captchaForm)}{$captcha->getButtonClass($captchaForm)}{/if}" 
                >
                    <span>Check</span>
                    <div class="loader hidden" >
                        {include file="{$smarty.current_dir}/../../../../../includes/common/loader.tpl" classes="spinner-sm spinner-light"}  
                    </div>
                </button>
            </div>
        </div>
    </form>
    {include file="{$smarty.current_dir}/../modals/360-monitoring-modal.tpl"}
{/if}