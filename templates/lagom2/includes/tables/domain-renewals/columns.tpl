/* Cell Checbkox */
{ldelim}
    data: null,
    name: "domain",
    className: "cell-domain",
    "render": function (data, row){
        var text = '',
            collapseButton = '<button type="button" class="btn-table-collapse"></button>',

        text = collapseButton + data.domain;
        return text;
    }
{rdelim},

{ldelim}
    data: null,
    name: "expiryDate",
    className: "cell-date",
    "render": function (data, row){
        var text = '',
            date = data.normalisedExpiryDate,
            tooltip = '';

        if (!data.beforeRenewLimit && data.daysUntilExpiry > 0){ldelim}
            tooltip = `<i data-toggle="tooltip" class="ls ls-info-circle tooltip-icon" title="{lang key='domainRenewal.expiringIn'}"></i>`;
            tooltip = tooltip.replace(':days', data.daysUntilExpiry);
        {rdelim}
        else if (data.daysUntilExpiry === 0){ldelim}
             tooltip = `<i data-toggle="tooltip" class="ls ls-info-circle tooltip-icon" title="{lang key='expiresToday'}"></i>`;
        {rdelim}
        else if (data.beforeRenewLimit){ldelim}
            tooltip = `<i data-toggle="tooltip" class="ls ls-info-circle tooltip-icon" title="{lang key='domainRenewal.maximumAdvanceRenewal'}"></i>`;
            tooltip = tooltip.replace(':days', data.beforeRenewLimitDays);
        {rdelim}
        else {ldelim}
            tooltip = `<i data-toggle="tooltip" class="ls ls-info-circle tooltip-icon" title="{lang key='domainRenewal.expiredDaysAgo'}"></i>`;
            let value = data.daysUntilExpiry*-1
            tooltip = tooltip.replace(':days', value);
        {rdelim}

        text = date + tooltip;
        return text;
    }
{rdelim},

{ldelim}
    data: null,
    name: "daysUntilExpiry",
    className: "cell-actions",
    "render": function (data, row){
        var text = '',
            select = '',
            button = '',
            inCartDisplayAdd = '',
            inCartDisplayAdded = 'w-hidden',
            inCartDisplayClass = 'btn-primary-faded';

        if (data.inCart){
            inCartDisplayAdd = 'w-hidden';
            inCartDisplayAdded = '';
            inCartDisplayClass = 'btn-primary';
        }
        if ((data.pastGracePeriod && data.pastRedemptionGracePeriod) || data.renewalOptions.length == 0 || data.beforeRenewLimit){ldelim}{rdelim}
        else{ldelim}
            select = `<select class="form-control form-control-sm select-renewal-pricing" id="renewalPricing`+data.id+`">`;
            
            data.renewalOptions.forEach((option) => {
                select += `<option value="`+option.period+`">`+option.period+` {lang key='orderyears'} @ `+option.rawRenewalPrice+`</option>`;
            });
            select += `</select>`;
        {rdelim}

        if ((!data.eligibleForRenewal || data.beforeRenewLimit || (data.pastGracePeriod && data.pastRedemptionGracePeriod))){ldelim}{rdelim}
            if (!data.eligibleForRenewal){ldelim}
                if (data.freeDomainRenewal){ldelim}
                    button = `<span class="label label-info">{lang key='domainRenewal.freeWithService'}</span>`;
                {rdelim}
                else {ldelim}
                    button = `<span class="label label-info">{lang key='domainRenewal.unavailable'}</span>`;
                {rdelim}
            {rdelim}
            else if (data.pastGracePeriod && data.pastRedemptionGracePeriod) {ldelim}
                button = `<span class="label label-info">{lang key='domainrenewalspastgraceperiod'}</span>`;
            {rdelim}
            else if (data.beforeRenewLimit){ldelim}
                button = `<span class="label label-info">{lang key='domainRenewal.maximumAdvanceRenewal'}</span>`;
                button = button.replace(':days', data.beforeRenewLimitDays);
            {rdelim}
        else {ldelim}
            button = `<button class="btn btn-sm `+inCartDisplayClass+` btn-add-renewal-to-cart" data-domain-id=`+data.id+` id=renewDomain`+data.id+`>
                        <div class="loader loader-button">
                            <div class="spinner spinner-sm">
                                <div class="rect1"></div>
                                <div class="rect2"></div>
                                <div class="rect3"></div>
                                <div class="rect4"></div>
                                <div class="rect5"></div>
                            </div>        
                        </div>
                        <span class="to-add `+inCartDisplayAdd+`">{lang key='addtocart'}</span>
                        <span class="added `+inCartDisplayAdded+`">{lang key='domaincheckeradded'}</span>
                    </button>`;
        {rdelim}

        text = `<div class="cell-action-container">`+select + button+`</div>`;
        return text;
    }
{rdelim},