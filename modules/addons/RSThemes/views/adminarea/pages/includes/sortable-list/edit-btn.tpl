<a
    {* common *}
    class="{$classes}"
    href="#{$btnEditAction}"
    data-edit-item
    data-toggle="lu-modal"
    data-backdrop="static"
    data-keyboard="false"
    data-section="{$sectionIndex}"
    
    {if isset($groupIndex)}
        data-list-name="{$sectionGroupField['name']}"
    {else}
        data-list-name="{$sectionField['name']}"
    {/if}
    
    data-key="{$item['index']}"
    data-position="{$item['position']}"

    {*Icon types*}
    {if isset($item['icon'])}
        data-icon="{$item['icon']}"
    {/if}
    {if isset($item['font-icon'])}
        data-font-icon="{$item['font-icon']}"
    {/if}
    {if isset($item['media'])}
        data-media="{$item['media']}"
    {/if}
    {if isset($item['font-icon'])}
        data-font-icon="{$item['font-icon']}"
    {/if}
    {if isset($item['illustration'])}
        data-illustration="{$item['illustration']}"
    {/if}

    {* item / products / groups*}
    {if isset($item['title'])}
        data-title="{$item['title']|escape:"html"}"
    {/if}
    {if isset($item['description'])}
        data-description="{$item['description']|escape:"html"}"
    {/if}

    {* products / groups*}
    {if isset($item['show_icon'])}
        data-show-icon="{$item['show_icon']}"
    {/if}
    {if isset($item['group_id'])}
        data-group_id="{$item['group_id']}"
        {if isset($item['whmcs_page'])}
            data-whmcs-page='{$item['whmcs_page']}'
        {/if}
    {/if}
    {if isset($item['product_id'])}
        data-product_id="{$item['product_id']}"
    {/if}

    {if $item['custom_description']}
        data-custom_description = "{$item['custom_description']|escape:"html"}"
    {/if}
    {if $item['custom_price_before']}
        data-custom_price_before = "{$item['custom_price_before']}"
    {/if}
    {if $item['custom_price_after']}
        data-custom_price_after = "{$item['custom_price_after']}"
    {/if}
    {if $item['custom_price_label']}
        data-custom_price_label = "{$item['custom_price_label']}"
    {/if}
    {if $item['custom_multi_price']}
        data-custom_multi_price = '{$item['custom_multi_price']}'
    {/if}
    {* testimonials*}
    {if isset($item['author'])}
        data-author="{$item['author']}"
    {/if}
    {if isset($item['domain'])}
        data-domain="{$item['domain']}"
    {/if}
    {if isset($item['domain_url'])}
        data-domain-url="{$item['domain_url']}"
    {/if}
    {if isset($item['date'])}
        data-date="{$item['date']}"
    {/if}

    {* buttons *}
    {if isset($item['text'])}
        data-text="{$item['text']}"
    {/if}
    {if isset($item['type'])}
        data-type="{$item['type']}"
    {/if}
    {if isset($item['style'])}
        data-style="{$item['style']}"
    {/if}
    {if isset($item['size'])}
        data-size="{$item['size']}"
    {/if}
    {if isset($item['link_type'])}
        data-link-type="{$item['link_type']}"
    {/if}
    {if isset($item['link_type']) && $item['link_type'] == 'custom-url'}
        data-custom-url="{$item['custom_url']}"
    {/if}
    {if isset($item['link_type']) && $item['link_type'] == 'whmcs-page'}
        data-whmcs-page='{$item['whmcs_page']}'
        data-url="{$item['url']}"
    {/if}
    {if isset($item['link_type']) && $item['link_type'] == 'whmcs-product'}
        data-whmcs-product='{$item['whmcs_product']}'
    {/if}
    {if isset($item['link_type']) && $item['link_type'] == 'homepage'}
        data-custom-url="/"
    {/if}
    {if isset($item['link_text'])}
        data-link-text="{$item['link_text']}"
    {/if}
    {if isset($item['custom_classes'])}
        data-custom-classes="{$item['custom_classes']}"
    {/if}
    {if isset($item['target_blank'])}
        data-target-blank="{$item['target_blank']}"
    {/if}
    {if isset($item['show_link'])}
        data-show-link="{$item['show_link']}"
    {/if}

    {* group *}
    {if isset($groupIndex)}
        data-group="{$groupIndex}"
    {/if}

    {* domains *}
    {if isset($item['domain_id'])}
        data-domain-id="{$item['domain_id']}"
    {/if}

    {* locations *}
    {if isset($item['location'])}
        data-location="{$item['location']}"
    {/if}
    {if isset($item['location_status'])}
        data-location-status="{$item['location_status']}"
    {/if}
    {if isset($item['location_position_top'])}
        data-location-position-top="{$item['location_position_top']}"
    {/if}
    {if isset($item['location_position_left'])}
        data-location-position-left="{$item['location_position_left']}"
    {/if}

    {* promocodes *}
    {if isset($item['apply_promocode'])}
        data-apply-promocode="{$item['apply_promocode']}"
    {/if}
     {if isset($item['promocode'])}
        data-promocode="{$item['promocode']}"
    {/if}

    {* promotion manager *}
    {if isset($item['slide_id'])}
        data-slide-id="{$item['slide_id']}"
    {/if}
    
    {if isset($showModalIconsTabs)} data-show-modal-icon='{if !$showModalIconsTabs}false{else}true{/if}'{/if}
    {if isset($showModalLinks)}data-show-modal-link="{if !$showModalLinks}false{else}true{/if}"{/if}
    {if isset($showModalStatsField) && $showModalStatsField}data-show-modal-stats{/if}
    {if isset($item['stat'])}
        data-stats="{$item['stat']|escape:"html"}"
    {/if}
    {if isset($sidebarType) && $sidebarType}data-list-sidebar-type{/if}
>
    {if $type == "placeholder"}
        <i class="btn__icon ls ls-edit" data-toggle="lu-tooltip" data-title="Add Icon"></i>
    {else}
        <i class="btn__icon ls ls-edit" data-toggle="lu-tooltip" data-title="Edit Item"></i>
    {/if}
</a>
