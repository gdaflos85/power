/* Add RSThemes Submenu under Addons -> RSThemes*/

$(document).ready(function(){
   
    let rsthemes = $('head').find('[data-lagom-client-theme-addon]'),
        extensions = $('head').find('[data-lagom-client-theme-extensions]'),
        extensionLink = rsthemes.data('lagom-client-theme-extension-link');
    
    let rsthemesLink = $('[id="Menu-Addons-RS Themes"]'),
        rsthemesHref = rsthemesLink[0].href,
        extensionsLinks = '',
        addonLinks = '';
    if (rsthemes.length){
        if (extensions.length){
            var extensionsList = extensions.data('lagom-client-theme-extensions');
            if (extensionsList.length){
                const headerElement = `<li class="dropdown-header">
                    <a href="${extensionLink}">Lagom Extensions <i class="fas always pull-right fa-arrow-right"></i></a>
                </li>`;
                const items = extensionsList.map(item => {
                    return `<li><a href="${item.url}">${item.name}</a></li>`;
                }).join('');
                extensionsLinks = headerElement + items;
            }
        }
        var rsthemesList = rsthemes.data('lagom-client-theme-addon');
        if (rsthemesList.length){
            const headerAddonElement = `<li class="dropdown-header">
                <a href="${rsthemesHref}">Open Addon <i class="fas always pull-right fa-arrow-right"></i></a>
            </li>`;
            const itemsAddon = rsthemesList.map(item => {
                return `<li><a href="${item.url}">${item.name}</a></li>`;
            }).join('');
            addonLinks = headerAddonElement + itemsAddon;
        }

    
        rsthemesLink.closest('li').addClass('has-dropdown expand');
        let dropdownList = `<ul class="rsthemes-dropdown">
            ${addonLinks}
            ${extensionsLinks}
            <style>
                .rsthemes-dropdown {
                    padding-top: 0!important;
                }
                .rsthemes-dropdown .dropdown-header{
                    border-bottom: 1px solid #E9EAEC;
                    height: auto!important;
                    background: #F7F7F8;
                    margin-bottom: 4px!important;
                }
                
                .rsthemes-dropdown .dropdown-header a{
                    font-size: 14px;
                    line-height: 24px;
                    padding-top: 4px;
                    padding-bottom: 4px;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                }
            </style>
        </ul>`;
        $(dropdownList).insertAfter(rsthemesLink);
    }
});