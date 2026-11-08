<div class="site-section section-sides section-key-features section-graphic section-graphic-title-above section-graphic-{$features_graphic_type} section-graphic-{$features_graphic_position} section-{$theme} {if $overlay} section-overlay{/if} {if $combined}section-combined{/if} {if $custom_class} {$custom_class}{/if} lagom-animation lagom-animation-fadeinbottom">
    {include file="{$smarty.current_dir}/../../common/anchor.tpl"} 
    {* {if $title_position == "above" && ($caption || $title || $subtitle) && $graphic_type != "type-3"} *}
        <div class="container container-title {if $feature.fields.graphic.type == "illustration"} container-type-1{/if}">
            {if $caption}
                <span class="section-caption">{$caption|unescape:'html'}</span>
            {/if}
            {if $title}
                <h2 class="section-title">{$title|unescape:'html'}</h2>
            {/if}
            {if $subtitle}
                <div class="section-subtitle">{$subtitle|unescape:'html'}</div>
            {/if}
            {if $features_list_type == "tabs"}
                <div class="tabs content-slider" data-cms-content-slider>
                    <ul class="nav nav-tabs nav-tabs-slider content-slider-wrapper m-b-0x" data-content-slider-wrapper>
                        {foreach $key_features.groups key=key item=feature}
                            <li class="nav-item content-slider-item">
                                <a class="nav-link multitab-link {if $feature@first} active{/if}"
                                id="key-feature-{$sectionId}-{$key}"
                                onclick="changeMultitab(this, 'graphic-{$sectionId}-{$key}', 'feature-{$sectionId}-{$key}');"
                            >                        
                                    {$feature.group_name}
                                </a>
                            </li>
                        {/foreach}
                    </ul>
                </div>
            {/if}
        </div>
    {* {/if} *}
    
    <div class="container container-default">
        {if $features_list_type == "default"}
            <div class="section-content">
                <div class="nav list-group-cms list-group-cms-key-features list-group-cms-{$features_list_style}"
                    role="tablist"
                >
                    {foreach $key_features.groups key=key item=feature}
                        <div class="list-group-cms-item {if $feature@first} active{/if}"
                            id="tab-feature-{$sectionId}-{$key}"
                            data-toggle="tab" 
                            href="#graphic-{$sectionId}-{$key}" 
                            role="tab" 
                            aria-controls="graphic-{$sectionId}-{$key}" 
                            aria-selected="{if $feature@first}true{else}false{/if}"
                        >
                            <div class="list-group-cms-item-top {if $feature.fields.list_desc != "" && $feature.fields.list_desc != " ..." && $feature.fields.list_desc != " " && $features_list_type != "default"}m-b-0{/if}">
                                <div class="list-group-cms-item-heading">
                                    {$feature.group_name|unescape:'html'}
                                </div>
                                <div class="list-group-cms-item-accordion-icon accordion">
                                    {* <div class="accordion-icon">
                                        {include file="{$smarty.current_dir}/../../../../../assets/img/cms/accordion.tpl"}
                                    </div> *}
                                </div>
                            </div>
                            <div class="list-group-cms-item-body" {if $type == "Collapse"}data-slide-desc{/if}>                                       
                                {if $feature.fields.list_desc}
                                    <div class="list-group-cms-item-text">
                                        {$feature.fields.list_desc|unescape:'html'}
                                    </div>
                                {/if}
                                {if $feature.fields.list_buttons}
                                    <div class="list-group-cms-item-actions m-t-1x">
                                        {foreach $feature.fields.list_buttons as $button}
                                            {include file="{$smarty.current_dir}/../../common/button.tpl" keyFeaturesButton="true"}
                                        {/foreach}
                                    </div>
                                {/if}
                            </div>
                        </div>
                    {/foreach}
                </div>
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
        {elseif $features_list_type == "accordion"}
            <div class="section-content" id="accordion-{$sectionId}">
                <ul class="nav nav-tabs content-slider-wrapper hidden">
                    {foreach $key_features.groups key=key item=feature}
                        <li class="nav-item content-slider-item">
                            <a class="nav-link {if $feature@first} active{/if}"
                                id="link-feature-{$sectionId}-{$key}"
                                data-toggle="tab" 
                                href="#graphic-{$sectionId}-{$key}" 
                                role="tab" 
                                aria-controls="graphic-{$sectionId}-{$key}" 
                                aria-selected="{if $feature@first} true{else} false{/if}"
                            >                        
                                {$feature.group_name}
                            </a>
                        </li>
                    {/foreach}
                </ul>
                <div class="nav list-group-cms list-group-cms-accordion list-group-cms-key-features tab-content list-group-cms-{$features_list_style}">
                    {foreach $key_features.groups key=key item=feature}
                        <div class="list-group-cms-item tab-pane {if $feature@first} active{/if}"
                        >
                            <div class="list-group-cms-item-top {if $feature@first}collapse{else}collapsed{/if}" 
                                id="key-top-{$sectionId}-{$key}"
                                role="button"
                                data-toggle="collapse" 
                                data-target="#key-collapse-{$sectionId}-{$key}" 
                                aria-expanded="{if $feature@first}true{else}false{/if}" 
                                aria-controls="key-collapse-{$sectionId}-{$key}"
                                data-graphic-type="section-graphic-{if $feature.fields.graphic.type == "media"}type-2{else}type-1{/if}"
                                onclick="$('#link-feature-{$sectionId}-{$key}').trigger('click');setActiveAccordion(this);"
                            >
                                <div class="list-group-cms-item-heading">
                                    {$feature.group_name|unescape:'html'}
                                </div>
                                <div class="list-group-cms-item-accordion-icon accordion">
                                    <div class="accordion-icon">
                                        {include file="{$smarty.current_dir}/../../../../../assets/img/cms/accordion.tpl"}
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-cms-item-body collapse {if $feature@first}show{/if}"
                                id="key-collapse-{$sectionId}-{$key}" 
                                aria-labelledby="key-top-{$sectionId}-{$key}" 
                                data-parent="#accordion-{$sectionId}"
                            >    
                                <div>
                                    {if $feature.fields.list_desc}
                                        <div class="list-group-cms-item-text">
                                            {$feature.fields.list_desc|unescape:'html'}
                                        </div>
                                    {/if}
                                    {if $feature.fields.list_buttons}
                                        <div class="list-group-cms-item-actions">
                                            {foreach $feature.fields.list_buttons as $button}
                                                {include file="{$smarty.current_dir}/../../common/button.tpl"}
                                            {/foreach}
                                        </div>
                                    {/if}
                                </div>                                   
                            </div>
                        </div>
                    {/foreach}
                </div>
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
        {elseif $features_list_type == "tabs"}
            <div class="section-content section-key-features-content">
                <div class="tab-content">
                    {foreach $key_features.groups key=key item=feature}
                        <div class="tab-pane {if $feature@first} active{/if}"
                            id="feature-{$sectionId}-{$key}"
                            role="tabpanel"
                            aria-labelledby="feature-{$sectionId}-{$key}"
                            data-animation-css
                        >
                            {if $feature.fields.list_desc}
                                <div class="section-desc">
                                    {$feature.fields.list_desc|unescape:'html'}
                                </div>
                            {/if}
                            {if $feature.fields.list_buttons}
                                <div class="section-actions">
                                    <div class="section-actions-buttons">
                                        {foreach $feature.fields.list_buttons as $button}
                                            {include file="{$smarty.current_dir}/../../common/button.tpl"}
                                        {/foreach}
                                    </div>
                                </div>
                            {/if}
                        </div>
                    {/foreach}
                </div>
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
        {/if}
        <div class="section-background  {if $features_graphic_type == "type-2"}background-type-2{/if}{if $features_list_type == "tabs"} section-background-tabs{/if}">
            <div class="tab-content">
                {foreach $key_features.groups key=key item=feature}
                    {if $feature.fields.graphic.graphic}
                        <div class="section-graphic tab-pane {if $feature@first} show active{else}is-animated{/if}"
                            id="graphic-{$sectionId}-{$key}"
                            role="tabpanel"
                            aria-labelledby="feature-{$sectionId}-{$key}"
                            data-animation-css
                        >
                            {include file="{$smarty.current_dir}/../../common/graphic.tpl" 
                                graphic=$feature.fields.graphic.graphic
                                type=$feature.fields.graphic.type
                                elementTitle=$feature.group_name
                            }
                        </div>
                    {/if} 
                {/foreach}
            </div>
            <div class="section-shape" id="section-shape-tab-{$sectionId}">
                {include file="{$smarty.current_dir}/../../../../../assets/svg-illustrations/cms/section-shape.tpl"}
            </div>
        </div>
    </div>
    {literal}
        <script>
            function handleClick(event){
                event.stopPropagation();
            }
            function setActiveAccordion(element) {
                var parentElement = element.parentNode;

                parentElement.classList.add("active");

                var siblings = Array.from(parentElement.parentNode.children).filter(function(child) {
                    return child !== parentElement && child.classList.contains("list-group-cms-item");
                });
                siblings.forEach(function(sibling) {
                    sibling.classList.remove("active");
                });

            }
            function findAncestorWithClass(element, className) {
                while (element && !element.classList.contains(className)) {
                    element = element.parentNode;
                }
                return element;
            }
            function changeMultitab(element, tabOne, tabTwo){
                var parentElement = element.parentNode;
                var parentAncestor = parentElement.parentNode;
                var tabOneElement = document.querySelector('#' + tabOne);
                var tabTwoElement = document.querySelector('#' + tabTwo);

                var siblingsParent = Array.from(parentAncestor.children).filter(function(child) {
                    return child !== parentElement && child.classList.contains("content-slider-item");
                });
                var siblingsTabOne = Array.from(tabOneElement.parentNode.children).filter(function(child) {
                    return child !== tabOneElement && child.classList.contains("tab-pane");
                });
                var siblingsTabTwo = Array.from(tabTwoElement.parentNode.children).filter(function(child) {
                    return child !== tabTwoElement && child.classList.contains("tab-pane");
                });

                siblingsParent.forEach(function(sibling) {
                    sibling.children[0].classList.remove('active');
                });
                siblingsTabOne.forEach(function(sibling) {
                    sibling.classList.remove("active");
                });

                siblingsTabTwo.forEach(function(sibling) {
                    sibling.classList.remove("active");
                });

                tabOneElement.classList.add('show', 'active');
                tabTwoElement.classList.add('show', 'active');
                element.classList.add('active');

            }
        </script>
    {/literal}
</div> 
