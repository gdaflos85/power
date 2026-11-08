<div class="app-main__top">
    <div class="container">
        <div class="top">
            {* CMS - Pages *}
            {if isset($type) && $type === 'custom_page'}
                <div class="top__toolbar">
                    {include file="adminarea/includes/breadcrumb/button-back.tpl" link=$helper->url('Template@pages',['templateName'=>$template->getMainName(), 'tab' => 'website'])}
                </div>
                <div class="top__content">
                    <div class="top__title">
                        <h1 class="top__title-text">
                            <ul class="top__title-text breadcrumb breadcrumb--angle-separator ">
                                <li class="breadcrumb__item">
                                    <a class="breadcrumb__item-text" href="{$helper->url('Template@pages',['templateName'=>$template->getMainName()])}">
                                        {$lang.breadcrumb.pages}
                                    </a>
                                </li>
                                {if $pageType == "promo"}
                                    <li class="breadcrumb__item">
                                        <a class="breadcrumb__item-text" href="{$helper->url('Template@pages',['templateName'=>$template->getMainName(), 'tab' => 'promotion'])}">
                                            Promotion
                                        </a>
                                    </li>
                                {else}
                                    <li class="breadcrumb__item">
                                        <a class="breadcrumb__item-text" href="{$helper->url('Template@pages',['templateName'=>$template->getMainName(), 'tab' => 'website'])}">
                                            {$lang.breadcrumb.website}
                                        </a>
                                    </li>
                                {/if}
                                
                                {if isset($customPage)}
                                    <li class="breadcrumb__item breadcrumb__item--page">
                                        <span class="breadcrumb__item-text">
                                            {$customPage->display_name}
                                        </span>
                                    </li>
                                {else}
                                    <li class="breadcrumb__item">
                                        <span class="breadcrumb__item-text">
                                            {$lang.breadcrumb.new_page}
                                        </span>
                                    </li>
                                {/if}
                            </ul>
                        </h1>
                    </div>
                </div>
                {if isset($customPage)}
                    <div class="top__toolbar">
                        <a href="{$whmcsURL}/{if isset($customPage->url) && !$isHomepage}{$customPage->url}{/if}" class="btn btn--primary" target="_blank">
                            <span class="btn__icon lm lm-search"></span>
                            <span class="btn__text">Preview</span>
                        </a>
                    </div>
                {/if}                                                               
            {* CMS - Sections *}
            {elseif isset($type) && $type == 'section'}
                <div class="top__toolbar">
                    {include file="adminarea/includes/breadcrumb/button-back.tpl" link=$helper->url('Template@pages',['templateName'=>$template->getMainName(), 'tab' => 'section'])}
                </div>
                <div class="top__content">
                    <div class="top__title">
                        <h1 class="top__title-text">
                            <ul class="top__title-text breadcrumb breadcrumb--angle-separator ">
                                <li class="breadcrumb__item">
                                    <a class="breadcrumb__item-text" href="{$helper->url('Template@pages',['templateName'=>$template->getMainName()])}">
                                        {$lang.breadcrumb.pages}
                                    </a>
                                </li>
                                <li class="breadcrumb__item">
                                    <a class="breadcrumb__item-text" href="{$helper->url('Template@pages',['templateName'=>$template->getMainName(), 'tab' => 'section'])}">
                                        {$lang.breadcrumb.sections}
                                    </a>
                                </li>
                                {if isset($newSection)}
                                    <li class="breadcrumb__item">
                                        <span class="breadcrumb__item-text">
                                            {$lang.breadcrumb.new_section}
                                        </span>
                                    </li>
                                {/if}
                                {if isset($section)}
                                    <li class="breadcrumb__item">
                                        <span class="breadcrumb__item-text">
                                            {$section->name}
                                        </span>
                                    </li>
                                {/if}
                            </ul>
                        </h1>
                    </div>
                </div>
            {/if}  
        </div>
    </div>     
</div>    