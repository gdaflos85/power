<div class="site-section section-legal section-{$theme}{if $custom_class} {$custom_class}{/if}">
	<div class="container">
		<div class="section-body">
			{if $sidebar}
				<div class="section-sidebar">
					<ul class="nav nav-v nav-legal">
						{foreach $sidebar as $item}
						<li class="nav-item">
							<a 
								href="{if $item.custom_url}{if $item.custom_url|substr:0:1 == "/"}{$WEB_ROOT}{/if}{$item.custom_url}{elseif $item.whmcs_page}{$WEB_ROOT}{if $item.url|substr:0:1 != "/"}/{/if}{$item.url}{/if}" 
								{if $item.target_blank == "1"}target="_blank"{/if} 
								class="nav-link{if $item.custom_classes} {$item.custom_classes}{/if}">
								{if $item.show_icon == "1" }	
									<i class="{$item['font-icon']}"></i>
								{/if}
								<span>{$item.link_text}</span>
							</a>
						</li>
						{/foreach}
					</ul>
				</div>
			{/if}
			<div class="section-content">
				{$main_content|unescape:"html"}
			</div>
		</div>
	</div>
</div>