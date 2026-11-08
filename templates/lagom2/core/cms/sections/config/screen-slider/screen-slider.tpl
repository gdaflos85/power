<div class="site-section section-screen-slider section-{$theme}{if $custom_class} {$custom_class}{/if}">
    {include file="{$smarty.current_dir}/../../common/anchor.tpl"} 
    <div class="container">
        {if $title}
            <h2 class="section-title">{$title|unescape:'html'}</h2>
        {/if}
        {if $subtitle}
            <p class="section-subtitle">{$subtitle|unescape:'html'}</p>
        {/if}
        {if $slides}
            <div class="section-content">
                <div class="content-slider screen-slider" data-screen-slider-simple>   
                    <div class="content-slider-wrapper screen-slider-wrapper" data-screen-slider-wrapper>
                        {foreach $slides as $slide}     
                            <div class="screen-slider-item" style="width: {if $slide_width == 0}auto{else}{$slide_width}px{/if}; height:{if $slide_height == 0}auto{else}{$slide_height}px{/if};">
                                <div class="screen">
                                    {if $slide.icon || $slide.media}
                                        <div class="screen-image">
                                            {if isset($slide.icon)}
                                                {include file="{$smarty.current_dir}/../../common/graphic.tpl" 
                                                    graphic=$slide.icon
                                                    type="icon"
                                                }
                                            {else}
                                                {include file="{$smarty.current_dir}/../../common/graphic.tpl" 
                                                    graphic=$slide.media
                                                    type="media"
                                                    elementTitle=$slide.title
                                                }
                                            {/if}
                                        </div>
                                    {/if}
                                    {if $slide.title || $slide.description}
                                        <div class="screen-content">
                                            {if $slide.title}
                                                <h4 class="screen-title">{$slide.title|unescape:'html'}</h4>
                                            {/if}
                                            {if $slide.description && $slide.description !== ' '}
                                                <p class="screen-desc">
                                                    {$slide.description|unescape:'html'}
                                                </p>
                                            {/if}
                                        </div>
                                    {/if}
                                </div>
                            </div>
                        {/foreach}
                    </div>
                    <div class="screen-slider-nav">
                        <div data-prev-slide>
                            <svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M24 12H3" stroke="#52399E" stroke-width="4" stroke-linecap="round" stroke-linejoin="round" />
                                <path d="M13 22L3 12L13 2" stroke="#52399E" stroke-width="4" stroke-linecap="round"
                                    stroke-linejoin="round" />
                            </svg>
                        </div>
                        <div data-next-slide>
                            <svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M2 12H23" stroke="#52399E" stroke-width="4" stroke-linecap="round" stroke-linejoin="round" />
                                <path d="M13 22L23 12L13 2" stroke="#52399E" stroke-width="4" stroke-linecap="round"
                                    stroke-linejoin="round" />
                            </svg>
                        </div>
                    </div>
                </div>
            </div>    
        {/if}
        {if $buttons} 
            <div class="section-actions">
                <div class="section-actions-buttons">
                    {foreach $buttons as $button}
                        {include file="{$smarty.current_dir}/../../common/button.tpl"}
                    {/foreach}
                </div>
            </div>
        {/if}
    </div>   
</div> 