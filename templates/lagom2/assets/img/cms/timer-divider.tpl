<div class="timer-divider">
    {if $timer_size == "sm"}
        {assign var=dot_size value="3"}
        {assign var=circle value="1.5"}
    {elseif $timer_size == "xs"}
        {assign var=dot_size value="2"}
        {assign var=circle value="1"}
    {else}
        {assign var=dot_size value="4"}
        {assign var=circle value="2"}
    {/if}
    <svg width="{$dot_size}" height="{$dot_size}" viewBox="0 0 {$dot_size} {$dot_size}" fill="none" xmlns="http://www.w3.org/2000/svg"><circle cx="{$circle}" cy="{$circle}" r="{$circle}" fill="var(--gray-base)"/></svg>
    <svg width="{$dot_size}" height="{$dot_size}" viewBox="0 0 {$dot_size} {$dot_size}" fill="none" xmlns="http://www.w3.org/2000/svg"><circle cx="{$circle}" cy="{$circle}" r="{$circle}" fill="var(--gray-base)"/></svg>
</div>
