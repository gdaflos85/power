const SELECTORS = {
    container: '[data-media-container]',
    input: '[data-media-search]',
    list: '[data-media-list]',
    item: '[data-media-item]',
    noData: '[data-media-no-data]',
};

class mediaSearch{
    constructor(container){
        this.container = container;
        this.input = this.container.find(SELECTORS.input);
        this.list = this.container.find(SELECTORS.list);
        this.item = this.container.find(SELECTORS.item);
        this.noData = this.container.find(SELECTORS.noData);
        this.bindEvents();
        this.timeout = null;
    }
    bindEvents(){  
        $(this.input).on('input', this.searchMedia.bind(this));
    }

    searchMedia(){
        let that = this,
            filter = this.input[0].value.toUpperCase();
        clearTimeout(this.timeout);
        this.timeout = setTimeout(function() {
            $(that.item).each(function(){
                let value = $(this)[0].attributes['data-media-item'].value;
                if (value.toUpperCase().indexOf(filter) > -1) {
                    $(this)[0].classList.remove('is-hidden');
                }
                else{
                    $(this)[0].classList.add('is-hidden');
                }
            });
            that.toggleNoData();
        }, 250);
    }
    toggleNoData(){
        let items = $(this.list).find('.media__item:visible').length,
            that = this;
        if (items === 0){
            that.noData[0]?.classList.remove('is-hidden');
        }
        else{  
            if (that.noData.length){
                that.noData[0]?.classList.add('is-hidden');
            }
        }   
    }
}


$(document).ready(function(){
    $('[data-media-container]').each(function () {
        new mediaSearch($(this));
    }); 
});  