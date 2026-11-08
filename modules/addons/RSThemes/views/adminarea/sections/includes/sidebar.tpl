<div class="block__sidebar block__sidebar--md is-sticky">
    <div class="section">
        <h3 class="section__title">Section Settings</h3>
        <div class="section__body">
            <div class="widget panel overflow-visible">
                <label class="widget__top top">
                    <div class="top__title">
                        General
                    </div>
                </label>
                <div class="widget__body">
                    <div class="widget__content">
                        <div class="form-group m-b-0x">
                            <label class="form-label">Section Type</label>
                            <div class="form-group">
                                <select class="form-control is-readonly" name="type" readonly>
                                    {foreach $sectionTypes as $sectionType}                                        
                                        <option value="{$sectionType['slug']}" {if $sectionType['slug'] === $section['type']['slug'] || $sectionType['slug'] === $section['slug']} selected {/if}>{$sectionType['name']}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="block__loader preloader-container">
    <div class="preloader preloader--lg"></div>
</div>