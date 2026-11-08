{if !$display_billing_cycle}
    {if isset($price_calculation) && $price_calculation == "lowest"}
        {$displayBestPrice = true}
    {else}
        {$displayFirstAvailableCycle = true}
    {/if}
{/if}
{include file="{$smarty.current_dir}/../../common/feature-cols.tpl" featureColsDesktop=$cols_desktop featureColsTabH=$cols_tab_h featureColsTabV=$cols_tab_v featureColsMob='1'}

{* {if isset($package_slider) && $package_slider != "" && $display_package_slider && $type != "horizontal"}
    {$sliderOn = true}
    {if $package_slider == "all"}
        {$package_slider = "desktop,tab-h,tab-v,mob"}
        {$slider = ","|explode:$package_slider}
    {else}
        {$slider = ","|explode:$package_slider}
    {/if}
{/if} *}
<div class="site-section section-compare-packages section-compare-packages-{$style} section-compare-packages-{$type} section-{$theme} {if $overlay} section-overlay{/if} {if $combined}section-combined{/if} {if $custom_class} {$custom_class}{/if}">
    {include file="{$smarty.current_dir}/../../common/anchor.tpl"} 
    <div class="container container-title">
		{if $caption}
			<span class="section-caption">{$caption|unescape:'html'}</span>
		{/if}
        {if $title}
            <h2 class="section-title">{$title|unescape:'html'}</h2>
        {/if}
        {if $subtitle}
            <div class="section-subtitle">{$subtitle|unescape:'html'}</div>
        {/if}
	<div class="section-content section-content-packages {if $disable_sticky_header == '1'} header-disabled {/if}" data-compare-id="{$sectionId}" data-sticky-header-container 
		data-slides="[{$cols_desktop}, {$cols_tab_h}, {$cols_tab_v}, 1]">
			{* {if count($compare_plans['groups']) > 1}
				<div class="tabs content-slider--horizontal content-slider--free-mode" >
					<ul class="nav nav-lg nav-tabs nav-tabs-slider content-slider-wrapper">
						{foreach from=$compare_plans['groups'] key=key item=$group}
							<li class="content-slider-item nav-item">
								<a class="nav-link {if $group@first}active{/if}" data-multitab data-multitab-target="#tab-{strtolower($group['group_name']|replace:" ":"-"|replace:"/":"-")}" href='#tab-compare-{strtolower($group['group_name']|replace:" ":"-"|replace:"/":"-")}' data-toggle="tab" data-plan-tab>
									{$group['group_name']|unescape:'html'}
								</a>
							</li>
						{/foreach}
					</ul>
				</div>
			{/if} *}
			{if is_array($products_group['groups']) && count($products_group['groups']) > 1 || $display_billing_cycle}
				<div class="tabs-multiple-container {if $tabs_style == "boxed" && is_array($products_group['groups']) && count($products_group['groups']) > 1}tabs-boxed-container{/if} {if is_array($products_group['groups']) && count($products_group['groups']) <= 1}no-tabs {/if}{if $display_billing_cycle && ($billing_cycle|@count > 1 || $billing_cycle.0 == 'all')}has-billing-cycle{/if}">
					{if is_array($products_group['groups']) && count($products_group['groups']) > 1}
						<div class="tabs content-slider {if $tabs_style == "boxed"}tabs-boxed {if count($products_group['groups']) <= 2}tabs-boxed-dual{/if}{/if}"  data-cms-content-slider>
							<ul class="nav nav-lg nav-tabs nav-tabs-slider content-slider-wrapper {if $tabs_style == "boxed"}nav-tabs-boxed{/if}" data-content-slider-wrapper>
								{foreach from=$products_group['groups'] key=key item=$group}
									<li class="content-slider-item nav-item">
										<a 
											class="nav-link {if $group@first}active{else}tab-not-clicked{/if}" 
											data-product-group-change="{$key}" 
											data-multitab 
											data-multitab-target="{if isset($group['group_name_tab_link'])}#tab-compare-{$group['group_name_tab_link']}-{$key}-{$sectionId}{else}#tab-compare-{strtolower($group['group_name']|replace:" ":"-"|replace:"/":"-"|replace:"&amp;":"and")}-{$sectionId}{/if}" 
											href='{if isset($group['group_name_tab_link'])}#tab-{$group['group_name_tab_link']}-{$key}-{$sectionId}{else}#tab-{strtolower($group['group_name']|replace:" ":"-"|replace:"/":"-"|replace:"&amp;":"and")}-{$sectionId}{/if}' 
											data-toggle="tab"  
											data-animation-init
											data-plan-tab
										>
											{if $tabs_style == "boxed"}
												<span class="check-sign"><i class="ls ls-check"></i></span>
											{/if}
											<div class="nav-link-graphic">
												{if $group['fields']['graphic']['type'] && $group['fields']['graphic']['type'] == "font-icon"}
													<i class="{$group['fields']['graphic']['graphic']}"></i>
												{elseif $group['fields']['graphic']['type'] && ($group['fields']['graphic']['type'] == "icon" || $group['fields']['graphic']['type'] == "media")}
													{include file="{$smarty.current_dir}/../../common/graphic.tpl" graphic=$group['fields']['graphic']['graphic'] type=$group['fields']['graphic']['type']}
												{/if}
											</div>
											<span class="nav-link-text">{$group['group_name']|unescape:'html'}</span>
										</a>
									</li>
								{/foreach}
							</ul>
						</div>
					{/if}
					{if $display_billing_cycle}  
						
						{$pricingCycles = ['monthly' => ['6','monthly'], 'quarterly' => ['5','quarterly'], 'semiannually' => ['4','semiannually'], 'annually' => ['3','annually'], 'biennially' => ['2','biennially'], 'triennially' => ['1','triennially']]}
						{if $reverse_billing_cycle_order == "1"}
							{$pricingCycles = array_reverse($pricingCycles)}
						{/if}
						{$choosenCycles = false}
						{if $billing_cycle[0] != "all"}
							{$choosenCycles = true}
						{/if}
						
						{if is_array($products_group['groups']) && count($products_group['groups']) > 0}
							{foreach $products_group['groups'] key=groupKey item=$group}
								{foreach from=$group['fields']['products_list'] key=key item=$product}             
									{if isset($product['product']['price']['tabs'])}                       
										{foreach from=$product['product']['price']['tabs'] key=tabKey item=$tab}
											{if $tab.price != "-1" && $tab.discount.percentage != "0"}
												{if $tabKey == 'monthly'}
													{append 'discountMonthly' $tab.discount.percentage index=$key}
													{append 'discountTabsTemp' $discountMonthly index=$tabKey}  
												{/if}
												{if $tabKey == 'quarterly'}
													{append 'discountQuarterly' $tab.discount.percentage index=$key}
													{append 'discountTabsTemp' $discountQuarterly index=$tabKey}
												{/if}
												{if $tabKey == 'semiannually'}                                                
													{append 'discountSemiannually' $tab.discount.percentage index=$key}
													{append 'discountTabsTemp' $discountSemiannually index=$tabKey}
												{/if}
												{if $tabKey == 'annually'}
													{append 'discountAnnually' $tab.discount.percentage index=$key}
													{append 'discountTabsTemp' $discountAnnually index=$tabKey}
												{/if}
												{if $tabKey == 'biennially'}
													{append 'discountBiennially' $tab.discount.percentage index=$key}
													{append 'discountTabsTemp' $discountBiennially index=$tabKey}
												{/if}
												{if $tabKey == 'triennially'}
													{append 'discountTriennially' $tab.discount.percentage index=$key}
													{append 'discountTabsTemp' $discountTriennially index=$tabKey}
												{/if}
											{/if}
										{/foreach} 
									{/if}    
								{/foreach}
								{append 'discountTabs' $discountTabsTemp index=$groupKey}
							{/foreach}
						{/if} 
						<div class="product-billing-switcher {if $billing_cycle|@count == 1 && $billing_cycle.0 != 'all'} hidden{/if}">
							<div class="btn-group {if is_array($products_group['groups']) && count($products_group['groups']) > 1} hidden{else} hidden-md hidden-sm hidden-xs{/if}" role="group">
								{if $choosenCycles}     
									{if $reverse_billing_cycle_order == "1"}  
										{$reverse_billing_cycle = array_reverse($billing_cycle)}
									{/if}
									{foreach from=$pricingCycles|@array_reverse:true key=key item=$cycle}
										{if $key|in_array:$billing_cycle}
										{if $reverse_billing_cycle_order == "1"}
											{$firstAvailableCycle = $reverse_billing_cycle[0]}
										{else}
											{$firstAvailableCycle = $billing_cycle[0]}
										{/if}
											{$switchActive = false}
											{$discount = false}
											{$dataDiscount = false}
											{if $firstAvailableCycle == $key}
												{$switchActive = "active"}
											{/if}
											{if isset($discountTabs) && is_array($discountTabs) && isset($discountTabs[0][$cycle[1]])}
												{$discount = min($discountTabs[0][$cycle[1]])}
											{/if}
											{if is_array($products_group['groups']) && count($products_group['groups']) > 1 && isset($discountTabs) && is_array($discountTabs)}
												{$dataDiscount = $discountTabs}
											{/if}
											{include 
												file="{$smarty.current_dir}/../../common/package/cycle-switcher-button.tpl"
												cycle=$cycle[0]
												active=$switchActive
												name=$cycle[1]
												discount=$discount
												dataDiscount=$dataDiscount
											}  
										{/if}
									{/foreach}
								{else}
									{foreach from=$pricingCycles|@array_reverse:true key=key item=$cycle}
										{$switchActive = false}
										{$discount = false}
										{$dataDiscount = false}
										{if $cycle@first}
											{$firstAvailableCycle = $key}
											{$switchActive = "active"}
										{/if}
										{if isset($discountTabs) && is_array($discountTabs) && isset($discountTabs[0][$cycle[1]])}
											{$discount = min($discountTabs[0][$cycle[1]])}
										{/if}
										{if is_array($products_group['groups']) && count($products_group['groups']) > 1 && isset($discountTabs) && is_array($discountTabs)}
											{$dataDiscount = $discountTabs}
										{/if}
										
										{include 
											file="{$smarty.current_dir}/../../common/package/cycle-switcher-button.tpl"
											cycle=$cycle[0]
											active=$switchActive
											name=$cycle[1]
											discount=$discount
											dataDiscount=$dataDiscount
										}   
									{/foreach} 
								{/if}  
							</div>
							<div class="btn-dropdown">
								<span class="{if is_array($products_group['groups']) && count($products_group['groups']) > 1}{else} visible-md visible-sm visible-xs{/if}">{$LANG.orderbillingcycle}</span>
								<div class="dropdown dropdown-cycle-switcher {if is_array($products_group['groups']) && count($products_group['groups']) > 1}{else} visible-md visible-sm visible-xs{/if}">
									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
										<span id="cycle-text">
											<span class="btn-text">
												<span class="btn-text">
													{if $firstAvailableCycle eq "monthly"}
														{$LANG.orderpaymenttermmonthly}
													{elseif $firstAvailableCycle eq "quarterly"}
														{$LANG.orderpaymenttermquarterly}
													{elseif $firstAvailableCycle eq "semiannually"}
														{$LANG.orderpaymenttermsemiannually}
													{elseif $firstAvailableCycle eq "annually"}
														1-{$LANG.orderForm.year}
													{elseif $firstAvailableCycle eq "biennially"}
														2-{$LANG.orderForm.years}
													{elseif $firstAvailableCycle eq "triennially"}
														3-{$LANG.orderForm.years}
													{/if}
												</span> 
											</span>
											
											<label 
												class="label label-xs label-save {if isset($discountTabs) && is_array($discountTabs) && isset($discountTabs[0][$firstAvailableCycle])}{else}hidden{/if}"
												{if is_array($products_group['groups']) && count($products_group['groups']) > 1 && isset($discountTabs) && is_array($discountTabs)}
												
													data-change-discount='[{foreach from=$discountTabs key=key item=$d}"{if isset($d[$firstAvailableCycle]) && is_array($d[$firstAvailableCycle])}{min($d[$firstAvailableCycle])}{else}0{/if}"{if !$d@last},{/if}{/foreach}]'
												{/if}
											>
												{$rslang->trans('packages.save')}&nbsp;
												<span data-change-discount-value>
													{if isset($discountTabs[0][$firstAvailableCycle])}
														{min($discountTabs[0][$firstAvailableCycle])}
													{/if}
												</span>%
											</label>
										</span>
										<i class="ls ls-caret"></i>
									</button>
									<div class="dropdown-menu {if is_array($products_group['groups']) && count($products_group['groups']) > 1}dropdown-menu-right{/if}">
										{if $choosenCycles}                                    
											{if $reverse_billing_cycle_order == "1"}
												{$reverse_billing_cycle = array_reverse($billing_cycle)}
											{/if}
											{foreach from=$pricingCycles|@array_reverse:true key=key item=$cycle}
												{if $key|in_array:$billing_cycle}
													{if $reverse_billing_cycle_order == "1"}
														{$firstAvailableCycle = $reverse_billing_cycle[0]}
													{else}
														{$firstAvailableCycle = $billing_cycle[0]}
													{/if}
													{$switchActive = false}
													{$discount = false}
													{$dataDiscount = false}
													{if $firstAvailableCycle == $key}
														{$switchActive = "active"}
													{/if}
													{if isset($discountTabs) && is_array($discountTabs) && isset($discountTabs[0][$cycle[1]])}
														{$discount = min($discountTabs[0][$cycle[1]])}
													{/if}
													{if is_array($products_group['groups']) && count($products_group['groups']) > 1 && isset($discountTabs) && is_array($discountTabs)}
														{$dataDiscount = $discountTabs}
													{/if}

													{include 
														file="{$smarty.current_dir}/../../common/package/cycle-switcher-button.tpl"
														cycle=$cycle[0]
														active=$switchActive
														name=$cycle[1]
														class="dropdown-item"
														discount=$discount
														dataDiscount=$dataDiscount
													}  
												{/if}
											{/foreach}
										{else}
											{foreach from=$pricingCycles|@array_reverse:true key=key item=$cycle}
												{$switchActive = false}
												{$discount = false}
												{$dataDiscount = false}
												{if $cycle@first}
													{$firstAvailableCycle = $key}
													{$switchActive = "active"}
												{/if}
												{if isset($discountTabs) && is_array($discountTabs) && isset($discountTabs[0][$cycle[1]])}
													{$discount = min($discountTabs[0][$cycle[1]])}
												{/if}
												{if is_array($products_group['groups']) && count($products_group['groups']) > 1 && isset($discountTabs) && is_array($discountTabs)}
													{$dataDiscount = $discountTabs}
												{/if}
			
												{include 
													file="{$smarty.current_dir}/../../common/package/cycle-switcher-button.tpl"
													cycle=$cycle[0]
													active=$switchActive
													name=$cycle[1]
													class="dropdown-item"
													discount=$discount
													dataDiscount=$dataDiscount
												}   
											{/foreach} 
										{/if}  
									</div>
								</div>
							</div>
						</div> 
					{/if}
				</div>
			{/if}
			{if is_array($products_group['groups']) && count($products_group['groups']) > 0}
				<div class="tab-content" >
					{foreach $products_group['groups'] key=key item=$group}
						<div class="tab-pane {if $group@first}active{/if}" id='{if isset($group['group_name_tab_link'])}tab-{$group['group_name_tab_link']}-{$key}-{$sectionId}{else}tab-{strtolower($group['group_name']|replace:" ":"-"|replace:"/":"-"|replace:"&amp;":"and")}-{$sectionId}{/if}'>
							{if $disable_sticky_header != '1'}
								<div class="section-header-sticky plan" data-js-plan-container data-section-header-sticky>
									<div class="plan-header-sticky" data-js-plan data-plan-header-sticky>
										<div class="container {if is_array($group['fields']['products_list']) && $group['fields']['products_list']|@count > 4} section-fade {/if}" data-plan-header-sticky-container>
											<div class="swiper-collapse-headers" data-plan-header-swiper-collapse-headers-wrapper></div>
											<div class="swiper-inner-wrapper" data-plan-header-swiper-inner-wrapper>
												<div class="swiper-container swiper-container-sticky" data-js-plan-slider>
													<div class="plan__wrapper swiper-wrapper swiper-wrapper-compare plan-wrapper" {if is_array($group['fields']['products_list']) && $group['fields']['products_list']|@count == 3} data-slide-width='["308.67", "308.67", "333", "200", "180"]' {/if} {if is_array($group['fields']['products_list']) && $group['fields']['products_list']|@count > 3} data-slide-width='["232", "232", "232", "232", "180"]' {/if} data-plan-header-swiper-wrapper>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							{/if}
							<div class="section-main-wrapper" data-js-plan-container {if $type == 'expanded'}data-expanded-container{/if}>
								<div class="loader section-loader" data-plan-loader>
									{include file="{$smarty.current_dir}/../../../../../includes/common/loader.tpl"}  
								</div>
								<div class="section-main-plan" data-js-plan>
									<div class="hidden" data-sticky-header>
										<span data-sticky-header-top>
											{$rslang->trans('packages.choose_your_plan')}
										</span>
										<span data-sticky-header-bottom><a href="javascript:void(Tawk_API.toggle())">{$rslang->trans('packages.chat_with_expert')}</a></span>
									</div>
									<div class="slider-nav " data-js-plan-nav>
										<a class="js-previous-plan is-disabled" data-js-plan-prev>
											<i class="ls ls-left"></i>
											{$rslang->trans('product_comparison.previous_package')}
										</a>
										<a class="js-next-plan" data-js-plan-next>
											{$rslang->trans('product_comparison.next_package')}
											<i class="ls ls-right"></i>
										</a>
									</div>
									<div class="compare-plans" id="plan1" data-js-plan-slider-wrapper>
										{if is_array($group['fields']['comparison_table']) && count($group['fields']['comparison_table']) > 0}
											<div class="plan-sticky visibility-hidden-md" data-plan-sticky="" ></div>
										{/if}
										<div class="package-background visibility-hidden-md" data-package-background></div>
										<div class="package package-header-primary package-compare package-compare-first visibility-hidden-md" data-package>
											<div class="package-header package-desc-center" data-package-header>
												{if $group['fields']['header_title']}
													<h5 class="m-b-0">{$group['fields']['header_title']|unescape:'html'}</h5>
												{else}
													<h5 class="m-b-0">{$rslang->trans('product_comparison.compare_features')}</h5>
												{/if}
											</div>
										</div>
										<div class="mobile-slider swiper-container visibility-hidden-md" data-js-plan-slider>
											<div class="swiper-wrapper swiper-wrapper-compare plan-wrapper d-flex flex-nowrap">
												{foreach from=$group['fields']['products_list'] key=key item=$product}
													<div class="swiper-slide {foreach $cols as $col} {$col}{/foreach} {$smarty.foreach.item.last} swiper-slide-compare" {if is_array($group['fields']['products_list']) && $group['fields']['products_list']|@count == 3} data-slide-width='["308.67", "308.67", "333", "200", "200"]' {/if} {if is_array($group['fields']['products_list']) && $group['fields']['products_list']|@count > 3} data-slide-width='["232", "232", "232", "232", "180"]' {/if}>
														{if isset($product['product']) && is_array($product['product']) && count($product['product']) > 0}
															{include file="{$smarty.current_dir}/../../common/package-compare.tpl" 
																product=$product 
																productStyle=$style                            
																productType=$type
																productSize=$size
																featureSlider=$sliderOn
																productCustomClasses=$package_custom_classes
																theme=$darkIcons
															}   
														{/if}   
													</div>
												{/foreach}									
											</div>
										</div>
									</div>
								</div>
								{foreach from=$group['fields']['comparison_table'] key=key item=$comparison name=comparisonForEach}
									<div class="section-collapse {if !$comparison.type}section-collapse-no-title{/if}" data-compare-packages-collapse>
										{if $comparison.type}
											{if $type == 'expanded'}
												<div class="section-collapse-item" role="button" id="collapse-item-{$key}" data-target="#compare-{if isset($group['group_name_tab_link'])}collapse-{$group['group_name_tab_link']}-{$key}-{$sectionId}{else}tab-{strtolower($group['group_name']|replace:" ":"-"|replace:"/":"-"|replace:"&amp;":"and")}-{$sectionId}{/if}-1" data-js-plan-container data-compare-packages-item>
											{else}
												<div class="section-collapse-item collapsed" role="button" id="collapse-item-{$key}" data-toggle="collapse" data-target="#compare-{if isset($group['group_name_tab_link'])}collapse-{$group['group_name_tab_link']}-{$key}-{$sectionId}{else}tab-{strtolower($group['group_name']|replace:" ":"-"|replace:"/":"-"|replace:"&amp;":"and")}-{$sectionId}{/if}-1"
												aria-expanded="false" aria-controls="compare-{if isset($group['group_name_tab_link'])}collapse-{$group['group_name_tab_link']}-{$key}-{$sectionId}{else}tab-{strtolower($group['group_name']|replace:" ":"-"|replace:"/":"-"|replace:"&amp;":"and")}-{$sectionId}{/if}-1" data-js-plan-container data-compare-packages-item>
											{/if}

										{else}
											<div class="section-collapse-item glued" role="button" data-js-plan-container data-compare-packages-item aria-expanded='true'>
										{/if}
											{if $comparison.type}
												<div class="collapse-item-top h5" data-compare-packages-header id="header-{$sectionId}-{$key}">
													{if $comparison.show_icon && $comparison.show_icon == '1'}
														<div class="collapse-item-graphic">
															{if $comparison.media}
																{include file="{$smarty.current_dir}/../../common/graphic.tpl" graphic=$comparison.media type='media'}
															{elseif $comparison.icon}
																{include file="{$smarty.current_dir}/../../common/graphic.tpl" graphic=$comparison.icon type='icon'}
															{elseif $comparison['font-icon']}
																<i class="{$comparison['font-icon']}"></i>
															{/if}
														</div> 
													{/if}
													{if $comparison['category-title']}
														<div class="collapse-item-title">{$comparison['category-title']}</div> 
													{/if}
													{if $type != 'expanded'}
														<div class="accordion-icon" data-icon-collapse>
															{include file="{$smarty.current_dir}/../../../../../assets/img/cms/accordion.tpl"}
														</div>
													{/if}
												</div>
											{/if}
											<div data-collapse-top data-collapse-top-{$sectionId}-{$key} data-collapse="{$key}"></div>
											{if $comparison.type}
												{if $type == 'expanded'}
													<div class="collapse-item-content" id="compare-{if isset($group['group_name_tab_link'])}collapse-{$group['group_name_tab_link']}-{$key}-{$sectionId}{else}tab-{strtolower($group['group_name']|replace:" ":"-"|replace:"/":"-"|replace:"&amp;":"and")}-{$sectionId}{/if}-1">
												{else}
													<div class="collapse-item-content collapse" id="compare-{if isset($group['group_name_tab_link'])}collapse-{$group['group_name_tab_link']}-{$key}-{$sectionId}{else}tab-{strtolower($group['group_name']|replace:" ":"-"|replace:"/":"-"|replace:"&amp;":"and")}-{$sectionId}{/if}-1">
												{/if}
											{else}
												<div class="collapse-item-content">
											{/if}
												<div class="collapse-item-packages" id="plan1" data-js-plan>
													<div class="package package-compare package-compare-first package-collapse">
														<div class="package-body-compare">
															{foreach from=$comparison.features key=key item=$feature}
																<div class="compare-item" data-compare-category="{$key}" data-compare-item-{$key}>
																	<span class="compare-item-text">
																		{$feature.feature_name|unescape:'html'}
																	</span>
																	{if $feature.show_hint && $feature.hint != ""}
																		<span class="tooltip-icon" data-toggle="tooltip" data-title="{$feature.hint}" data-placement="right">
																			{if file_exists("{$smarty.current_dir}/../../../../../assets/img/cms/comparison/custom/tooltip-info.png")}
																				<img src="{$WEB_ROOT}/templates/{$template}/assets/img/cms/comparison/custom/tooltip-info.png" alt="Hint" />
																			{elseif file_exists("{$smarty.current_dir}/../../../../../assets/img/cms/comparison/custom/tooltip-info.svg")}
																				{include file="{$smarty.current_dir}/../../../../../assets/img/cms/comparison/custom/tooltip-info.svg"}
																			{elseif file_exists("{$smarty.current_dir}/../../../../../assets/img/cms/comparison/custom/tooltip-info.tpl")}
																				{include file="{$smarty.current_dir}/../../../../../assets/img/cms/comparison/custom/tooltip-info.tpl"}
																			{elseif file_exists("{$smarty.current_dir}/../../../../../assets/img/cms/comparison/tooltip-info.tpl")}
																				{include file="{$smarty.current_dir}/../../../../../assets/img/cms/comparison/tooltip-info.tpl"}
																			{/if}
																		</span> 
																	{/if}
																</div>
															{/foreach}
														</div>
													</div>
													<div class="mobile-slider swiper-container" data-js-plan-slider>
														<div class="swiper-wrapper plan-wrapper swiper-wrapper-compare d-flex flex-nowrap">
															{foreach from=$group['fields']['products_list'] key=key item=$product}
																<div class="swiper-slide {foreach $cols as $col} {$col}{/foreach}">
																	<div class="package package-compare package-collapse {if $smarty.foreach.foo.last}last-package{/if}">				
																		<div class="package-body-compare">
																			{foreach from=$comparison.features key=key item=$featureProd}
																				{assign var=prodFeatures value=$featureProd.product|json_decode:true}
																				<div class="compare-item" data-compare-item-{$key}>
																					{if $prodFeatures["id_"|cat:$product.product_id]['icon'] && file_exists("{$smarty.current_dir}/../../../../../assets/img/cms/comparison/custom/{$prodFeatures["id_"|cat:$product.product_id]['icon']}.png")}
																						<img src="{$WEB_ROOT}/templates/{$template}/assets/img/cms/comparison/custom/{$prodFeatures["id_"|cat:$product.product_id]['icon']}.png" alt="{$prodFeatures["id_"|cat:$product.product_id]['icon']|capitalize}" />
																					{elseif $prodFeatures["id_"|cat:$product.product_id]['icon'] && file_exists("{$smarty.current_dir}/../../../../../assets/img/cms/comparison/custom/{$prodFeatures["id_"|cat:$product.product_id]['icon']}.svg")}
																						{include file="{$smarty.current_dir}/../../../../../assets/img/cms/comparison/custom/{$prodFeatures["id_"|cat:$product.product_id]['icon']}.svg"}
																					{elseif $prodFeatures["id_"|cat:$product.product_id]['icon'] && file_exists("{$smarty.current_dir}/../../../../../assets/img/cms/comparison/custom/{$prodFeatures["id_"|cat:$product.product_id]['icon']}.tpl")}
																						{include file="{$smarty.current_dir}/../../../../../assets/img/cms/comparison/custom/{$prodFeatures["id_"|cat:$product.product_id]['icon']}.tpl"}
																					{elseif $prodFeatures["id_"|cat:$product.product_id]['icon'] && file_exists("{$smarty.current_dir}/../../../../../assets/img/cms/comparison/{$prodFeatures["id_"|cat:$product.product_id]['icon']}.tpl")}
																						{include file="{$smarty.current_dir}/../../../../../assets/img/cms/comparison/{$prodFeatures["id_"|cat:$product.product_id]['icon']}.tpl"}
																					{/if}
																					{if $prodFeatures["id_"|cat:$product.product_id]['feature']}
																						<span class="compare-item-text">
																							{$prodFeatures["id_"|cat:$product.product_id]['feature']|unescape:'html'}
																						</span>
																					{/if}
																				</div>
																			{/foreach}	
																		</div>
																	</div>
																</div>
															{/foreach}	
														</div>
													</div>
												</div>
											</div>
											{if !$comparison.type && $type != "expanded"}
												<div data-plan-sticky-bottom class="static"></div>
											{/if}
											{if $smarty.foreach.comparisonForEach.last}
												<div data-plan-sticky-bottom class="static"></div>
											{/if}
											<div data-collapse-bottom data-collapse-bottom-{$sectionId}-{$key}></div>
										</div>
									</div>
								{/foreach}	
							</div>
						</div>
					{/foreach}
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