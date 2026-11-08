{include file="./cart-options.tpl"}
{if $itJSMin eq "enabled"}
	<script src="{assetPath file='scripts.min.js'}?v={$itResourceRef}"></script>
{else}
	<script src="{assetPath file='scripts.js'}?v={$itResourceRef}"></script>
{/if}
<script>
jQuery(document).ready(function () {
    jQuery('#btnSlideSidebar').click(function () {
        if (jQuery('.cart-sidebar').is(":visible")) {
            jQuery('.cart-main-column').css('right','0');
            jQuery('.cart-sidebar').fadeOut();
            jQuery('#btnSlideSidebar').html('<i class="fas fa-arrow-circle-left"></i> {$LANG.showMenu}');
        } else {
            jQuery('.cart-sidebar').fadeIn();
            jQuery('.cart-main-column').css('right','300px');
            jQuery('#btnSlideSidebar').html('<i class="fas fa-arrow-circle-right"></i> {$LANG.hideMenu}');
        }
    });
    jQuery('#btnSlideSidebarRTL').click(function () {
        if (jQuery('.cart-sidebar').is(":visible")) {
            jQuery('.cart-main-column').css('left','0');
            jQuery('.cart-sidebar').fadeOut();
            jQuery('#btnSlideSidebarRTL').html('<i class="fas fa-arrow-circle-left"></i> {$LANG.showMenu}');
        } else {
            jQuery('.cart-sidebar').fadeIn();
            jQuery('.cart-main-column').css('left','300px');
            jQuery('#btnSlideSidebarRTL').html('<i class="fas fa-arrow-circle-right"></i> {$LANG.hideMenu}');
        }
    });
    jQuery('#btnSquashSidebar').click(function () {
        if (jQuery('.cart-sidebar-squash').is(":visible")) {
            jQuery('#internal-content').removeClass('col-md-9');
            jQuery('#internal-content').addClass('col-md-12');
            jQuery('.cart-sidebar-squash').fadeOut();
            jQuery('#btnSquashSidebar').html('<i class="fas fa-arrow-circle-left"></i> {$LANG.showMenu}');
        } else {
            jQuery('.cart-sidebar-squash').fadeIn();
            jQuery('#internal-content').removeClass('col-md-12');
            jQuery('#internal-content').addClass('col-md-9');
            jQuery('#btnSquashSidebar').html('<i class="fas fa-arrow-circle-right"></i> {$LANG.hideMenu}');
        }
    });
});
</script>
