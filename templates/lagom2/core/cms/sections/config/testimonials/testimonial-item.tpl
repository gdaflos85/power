<div
    class="testimonials-item{if $type == "type-3"} testimonials-single{/if}{if $style == "boxed"} is-boxed{elseif $style=="bordered"} is-bordered{elseif $style == "default"} testimonials-item-default{/if}">
    {if $type == "type-3"}
        <div class="testimonials-body">
        {/if}
    <div class="testimonials-title {if $type == "type-2" || $type == "type-1" || $type == "type-4"}d-flex {/if}{if $testimonial.date != ""}avatar-title{/if}">
            {if $testimonial.title}
                {if $type == "type-3"}<h4>{else}<p>{/if}{$testimonial.title}{if $type == "type-3"}</h4>{else}</p>{/if}
                {if $type == "type-3"}<span class="date">{$testimonial.date}</span>{/if}
            {/if}
            {if $type == "type-2" || $type == "type-1" || $type == "type-4"}
                <span class="date">{$testimonial.date}</span>
            {/if}
        </div>
        <div class="testimonials-desc">
            {$testimonial.description}
        </div>
        <div class="testimonials-details">
            {if $type != "type-3"}
                <div class="testimonials-avatar">
                    {if isset($testimonial.media)}
                        {include file="{$smarty.current_dir}/../../common/graphic.tpl"
                        graphic=$testimonial.media
                        type="media"
                        elementTitle=$testimonial.title
                        }
                    {/if}
                    <span>”</span>
                </div>
            {/if}
            <div class="testimonials-author">
        {if $type == "type-3"}<h5>{else}<span>{/if}{$testimonial.author}{if $type == "type-3"}</h5>{else}</span>{/if}{if $type != "type-3"}<br>{/if}
            {if $testimonial.domain_url}
                <a target="blank" href={$testimonial.domain_url}>{$testimonial.domain}</a>
            {else}
                <p>{$testimonial.domain}</p>
            {/if}
            </div>
        </div>
        {if $type == "type-3"}
        </div>
    {/if}
</div>