{*TODO obsłuzyc dodawanie-edycje domen plus przenieść liste do jakeigoś osobnego widoku*}
{assign var="iconLocation" value="./../../../../../../assets/svg-icons"}
{if isset($sectionGroupField)}
    {if isset($sectionGroupInputValue) && is_countable($sectionGroupInputValue)}
        {assign var=newGroupItemPosition value=sizeof($sectionGroupInputValue) + 1} {*get the list size and add 1 to get the next position of the item*}
    {else}
        {assign var=newGroupItemPosition value=1}
    {/if}   
    {assign var=domains value=$sectionGroupInputValue}
    <div class="form-group">
        <label class="form-label">
            {$sectionGroupField['label']}
            <a href="#addNewDomainItemModal" class="btn btn--link btn--success m-l-a p-r-0x {if !isset($domains) || empty($domains)}is-hidden{/if}"
               data-add-new-item="domain"
               data-list-name="{$sectionGroupField['name']}"
               data-new-index=""
               data-new-position="{$newGroupItemPosition}"
               data-section="{$sectionIndex}"
               data-group="{$groupIndex}"
               data-toggle="lu-modal"
               data-backdrop="static"
               data-keyboard="false">
                <i class="btn__icon ls ls-plus"></i>
                <span class="btn__text">
                    Add New
                </span>
            </a>
        </label>
        {*TODO tu gdzieś dodać id grupy*}
        <ul class="sortableList list-page-manager list list--sortable {if empty($domains)}is-hidden{/if}"
            data-item-list="{$sectionGroupField['name']}"
            data-section="{$sectionIndex}"
            data-item-list-type="{$listType}">
            {if !empty($domains)}
                {foreach $domains as $key => $domain}
                    <li class="items-list list__item">
                        {*TODO długie imie wchodzi na opis*}
                        <div class="list__item-name">
                            {$domain['title']}
                        </div>
                        {*TODO długi opis zawija buttony edycji oraz usuwania *}
                        <div class="list__item-actions">
                            <a class="btn btn--icon btn--link btn--xs"
                               href="#editDomainItemModal"
                               data-edit-item
                               data-toggle="lu-modal"
                               data-backdrop="static"
                               data-keyboard="false"
                               data-key="{$domain['index']}"
                               data-position="{$domain['position']}"
                               data-section="{$sectionIndex}"
                               data-domain-id="{$domain['domain_id']}"
                            >
                                <i class="btn__icon ls ls-pen"></i>
                            </a>
                            <a class="deleteItem btn btn--icon btn--link btn--xs"
                               href="#deleteItemModal"
                               data-toggle="lu-modal"
                               data-backdrop="static"
                               data-delete-item
                               data-list-name="{$sectionGroupField['name']}"
                               data-index="{$domain['index']}"
                               data-section="{$sectionIndex}"
                            >
                                <i class="btn__icon lm lm-trash" data-toggle="lu-tooltip" data-title="Delete Item"></i>
                            </a>
                        </div>
                    </li>
                {/foreach}
            {/if}
        </ul>
        {*TODO tu gdzieś dodać id grupy*}
        <div class="msg msg--sm m-v-3x {if !empty($domains)}is-hidden{/if}" data-item-empty-list="{$sectionGroupField['name']}" data-section="{$sectionIndex}">
            <div class="msg__icon i-c-6x">
                {include file="$iconLocation/no-data.tpl"}
            </div>
            <div class="msg__body">
                <span class="msg__title">No items found</span>
                <div class="msg__actions">
                    <a href="#addNewDomainItemModal" class="btn btn--primary"
                       data-add-new-item="domain"
                       data-list-name="{$sectionGroupField['name']}"
                       data-new-index="1"
                       data-new-position="1"
                       data-section="{$sectionIndex}"
                       data-toggle="lu-modal"
                       data-backdrop="static"
                       data-keyboard="false">
                        <i class="btn__icon ls ls-plus"></i>
                        <span class="btn__text">Add new item</span>
                    </a>
                </div>
            </div>
        </div>
        <input type="hidden" data-section="{$sectionIndex}" data-list="{$sectionGroupField['name']}" data-group="{$groupIndex}"
               name="sections[{$sectionIndex}][lang][{$sectionField['name']}][groups][{$groupIndex}][fields][{$sectionGroupField['name']}]" value="">
    </div>
{else}
    {if isset($sectionFieldValue) && is_countable($sectionFieldValue)}
        {assign var=newPosition value=sizeof($sectionFieldValue) + 1}
    {else}
        {assign var=newPosition value=1}
    {/if}
    {assign var=domains value=$sectionFieldValue}
    <div class="section__field col-12">
        <div class="form-group">
            <label class="form-label">
                {$sectionField['label']}
                <a href="#addNewDomainItemModal" class="btn btn--link btn--sm m-l-a p-r-0x {if !isset($domains) || empty($domains)}is-hidden{/if}"
                   data-add-new-item="domain"
                   data-list-name="{$sectionField['name']}"
                   data-new-index=""
                   data-new-position="{$newPosition}"
                   data-section="{$sectionIndex}"
                   data-toggle="lu-modal"
                   data-backdrop="static"
                   data-keyboard="false">
                    <i class="btn__icon ls ls-plus"></i>
                    <span class="btn__text">
                    Add New
                </span>
                </a>
            </label>
            {include file='adminarea/pages/includes/sortable-list.tpl'
                items=$sectionFieldValue
                btnAddAction='addNewDomainItemModal'
                btnEditAction='editDomainItemModal'
                listType="tld-list"
            }
            <input type="hidden" data-section="{$sectionIndex}" data-list="{$sectionField['name']}"
                   name="sections[{$sectionIndex}][lang][{$sectionField['name']}]" value="">
        </div>
    </div>
{/if}


