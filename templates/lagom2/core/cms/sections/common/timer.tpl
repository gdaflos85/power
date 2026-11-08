
<div class="timer {if $timer_size}timer-{$timer_size}{/if} timer-{$timer_style} is-loading" {if $time_display == "synchronized"}data-time-counter {if $start_date_timer}data-start-date="{$start_date_timer}"{/if} data-end-date="{$end_date_timer}" {else if $countdown_type == "synchronized"}data-time-counter {if $start_date_timer}data-start-date="{$start_date_timer}"{/if} data-end-date="{$end_date_timer}"{else}data-time-cycle-counter data-start-date="{$start_date_timer}" {if $end_date_timer}data-end-date="{$end_date_timer}"{/if} {/if} data-timer-timezone="{$timezone}" data-action-after="{$action_after}">
    <div class="timer-box is-{$timer_style}" data-days>
        <div class="timer-box-num"><div class="timer-box-num-text">00</div></div>
        <div class="timer-box-label">{$rslang->trans('time.days')}</div>
        <div class="timer-box-label timer-box-label-short">{$rslang->trans('time.days')}</div>
        <div class="timer-loader">
            <div class="loader loader-ring"> 
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
    </div>
    {include file="{$smarty.current_dir}/../../../../assets/img/cms/timer-divider.tpl" timer_size=$timer_size}
    <div class="timer-box is-{$timer_style}" data-hours>
        <div class="timer-box-num"><div class="timer-box-num-text">00</div></div>
        <div class="timer-box-label">{$rslang->trans('time.hours')}</div>
        <div class="timer-box-label timer-box-label-short">{$rslang->trans('time.hours_short')}</div>
        <div class="timer-loader">
            <div class="loader loader-ring"> 
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
    </div>
    {include file="{$smarty.current_dir}/../../../../assets/img/cms/timer-divider.tpl" timer_size=$timer_size}
    <div class="timer-box is-{$timer_style}" data-minutes>
        <div class="timer-box-num"><div class="timer-box-num-text">00</div></div>
        <div class="timer-box-label">{$rslang->trans('time.minutes')}</div>
        <div class="timer-box-label timer-box-label-short">{$rslang->trans('time.minutes_short')}</div>
        <div class="timer-loader">
            <div class="loader loader-ring"> 
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
    </div>
    {include file="{$smarty.current_dir}/../../../../assets/img/cms/timer-divider.tpl" timer_size=$timer_size}
    <div class="timer-box is-{$timer_style}" data-seconds>
        <div class="timer-box-num"><div class="timer-box-num-text">00</div></div>
        <div class="timer-box-label">{$rslang->trans('time.seconds')}</div>
        <div class="timer-box-label timer-box-label-short">{$rslang->trans('time.seconds_short')}</div>
        <div class="timer-loader">
            <div class="loader loader-ring"> 
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
    </div>
</div>