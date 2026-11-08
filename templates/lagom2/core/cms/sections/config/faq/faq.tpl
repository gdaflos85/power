<div class="site-section section-faq section-{$theme} {if $overlay} section-overlay{/if} {if $combined}section-combined{/if} {if $custom_class} {$custom_class}{/if}"
    id="{$sectionId}">
    {include file="{$smarty.current_dir}/../../common/anchor.tpl"}
    <div class="container">
        {if $caption}
            <p class="section-caption">{$caption|unescape:'html'}</p>
        {/if}
        {if $title}
            <h2 class="section-title">{$title|unescape:'html'}</h2>
        {/if}
        {if $subtitle}
            <div class="section-subtitle">{$subtitle|unescape:'html'}</div>
        {/if}
        <div class="section-content m-w-lg m-a">
            {if isset($list_group) && is_array($list_group) && $list_group|@count > 1 }
                {if $list_group['grouped'] !== '0'}
                    <div class="faq-tabs {* tabs *} content-slider" data-cms-content-slider>
                        <ul class="nav nav-tabs nav-tabs-slider content-slider-wrapper" data-content-slider-wrapper>
                            {foreach $list_group.groups key=key item=$group}
                                <li class="nav-item content-slider-item">
                                    <a class="nav-link {if $group@first}active{/if}"
                                        href="{if isset($group['group_name_tab_link'])}#tab-faq-{$group['group_name_tab_link']}-{$key}-{$sectionId}{else}#tab-faq-{strtolower($group['group_name']|replace:" ":"-"|replace:"&amp;":"and")}{/if}" 
                                        data-toggle="tab"
                                        role="tab" 
                                        {if $group@first}aria-selected="true" {else}aria-selected="false"{/if}
                                    >
                                        {$group['group_name']}
                                    </a>
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                {/if}
            {/if}
            {if isset($list_group) && is_array($list_group) && $list_group|@count > 1}
                {if $list_group['grouped'] == '1'}
                    <div class="faq-tab-content tab-content">
                {/if}
            {/if}
            {if isset($list_group.groups) && is_array($list_group.groups) && $list_group.groups|@count > 0}
                {foreach $list_group.groups key=key item=$group}
                    {if $group|@count > 1}
                        {if $list_group['grouped'] !== '0'}
                            <div class="tab-pane {if $group@first}active{/if}"
                                id="{if isset($group['group_name_tab_link'])}tab-faq-{$group['group_name_tab_link']}-{$key}-{$sectionId}{else}tab-faq-{strtolower($group['group_name']|replace:" ":"-"|replace:"&amp;":"and")}{/if}">
                        {/if}
                    {/if}
                    {if isset($group.fields.list) && is_array($group.fields.list) && $group.fields.list|@count > 0}
                        <div class="panel-faq-group{if $list_type == "accordion"} accordion{/if}"
                            {if $list_type == "accordion"}id="accordion-{$sectionId}-{$group['group_index']}" {/if}>
                            {foreach $group.fields.list as $item}
                                <div class="faq-item {if !$item@first || $list_type == "expanded"}collapsed{/if} {if $list_style == 'divided'} faq-item-divided{/if}{if $list_type == "expanded"} faq-item-expanded{/if}{if $list_style == 'boxed'} faq-item-boxed{/if}"
                                    role="button"{if $item@first}aria-expanded="true"{else}aria-expanded="false"{/if} id="faq-collapse-{$group['group_index']}-{$item.index}"
                                    {if $list_type == 'accordion'}data-toggle="collapse" {/if}
                                    data-target="#faq-{if isset($sectionId)}{$sectionId}-{/if}{if is_array($group) && isset($group['group_index'])}{$group['group_index']}{/if}-{if is_array($item) && isset($item['index'])}{$item['index']}{/if}">
                                    <div class="faq-item-top panel-heading">
                                        <h3 class="h5">{$item.title}</h3>
                                        {if $list_type == 'accordion'}
                                            <div class="accordion-icon">
                                                {include file="{$smarty.current_dir}/../../../../../assets/img/cms/accordion.tpl"}
                                            </div>
                                        {/if}
                                    </div>
                                    <div id="faq-{if isset($sectionId)}{$sectionId}-{/if}{if is_array($group) && isset($group['group_index'])}{$group['group_index']}{/if}-{if is_array($item) && isset($item['index'])}{$item['index']}{/if}"
                                        class="panel-collapse {if $list_type == 'accordion'}collapse{/if} {if $item@first}show{/if}"
                                        style="" {if $list_type == 'accordion'}data-parent="#accordion-{$sectionId}-{$group['group_index']}"
                                        {/if}>
                                        <div class="faq-item-bottom">
                                            {$item.description|unescape:'html'}
                                        </div>
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    {/if}
                    {if $list_group|@count > 1}
                        {if $list_group['grouped'] == '1'}
                            </div>
                        {/if}
                    {/if}
                {/foreach}
            {/if}
            {if isset($list_group) && is_array($list_group) && $list_group|@count > 1}
                {if $list_group['grouped'] == '1'}
                    </div>
                {/if}
            {/if}
        </div>
    </div>
</div>