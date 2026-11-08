<div class="mc-promo promo-banner promo-banner-rounded panel {$promotion->getClass()}" id="promo_{$product->productKey}">
    <div class="panel-body">
        <div class="icon-left">
            <a href="{routePath($promotion->getLearnMoreRoute())}">
                <img src="{$promotion->getImagePath()}">
            </a>
        </div>

        <div class="content">

            <h3>
                {$promotion->getHeadline()}
                {if $promotion->getLearnMoreRoute()}
                    <small><a href="{routePath($promotion->getLearnMoreRoute())}">Learn more...</a></small>
                {/if}
            </h3>
            <h4>{$promotion->getTagline()}</h4>

            {if $promotion->getDescription()}
                <p>{$promotion->getDescription()}</p>
            {/if}

            {if $promotion->hasFeatures()}
                <ul>
                    {assign "promotionFeatures" $promotion->getFeatures()}
                    {foreach $promotionFeatures as $key=>$feature}
                        <li class="{if $key < ($promotionFeatures|@count / 2)}left{else}right{/if}">
                            <i class="fas fa-check"></i> {$feature}
                        </li>
                    {/foreach}
                </ul>
            {/if}

            <div class="cta">
                <div class="price">
                    {if $product->isFree()}
                        {lang key="orderfree"}
                    {elseif $product->pricing()->first()}
                        {$product->pricing()->setQuantity($cartItem.qty)->first()->breakdownPrice()}
                    {/if}
                </div>
                <button type="button" class="btn btn-sm btn-add" data-product-key="{$product->productKey}">
                    <span class="text">
                        {lang key="addtocart"}
                    </span>
                    <span class="arrow">
                        <i class="fal fa-chevron-right"></i>
                    </span>
                </button>
            </div>

        </div>

    </div>
</div>
