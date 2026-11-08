{if $itiCheckColor eq "aero"}
	<script>
	    jQuery('input.icheck').iCheck({
	        checkboxClass: 'icheckbox_flat-aero',
	        radioClass: 'iradio_flat-aero',
	        increaseArea: '20%'
	    });
        jQuery('input.addon-selector').iCheck({
	        checkboxClass: 'icheckbox_flat-aero',
	        radioClass: 'iradio_flat-aero',
	        increaseArea: '20%'
	    });
	</script>
{elseif $itiCheckColor eq "blue"}
	<script>
	    jQuery('input.icheck').iCheck({
	        checkboxClass: 'icheckbox_flat-blue',
	        radioClass: 'iradio_flat-blue',
	        increaseArea: '20%'
	    });
        jQuery('input.addon-selector').iCheck({
	        checkboxClass: 'icheckbox_flat-blue',
	        radioClass: 'iradio_flat-blue',
	        increaseArea: '20%'
	    });
	</script>
{elseif $itiCheckColor eq "green"}
	<script>
	    jQuery('input.icheck').iCheck({
	        checkboxClass: 'icheckbox_flat-green',
	        radioClass: 'iradio_flat-green',
	        increaseArea: '20%'
	    });
        jQuery('input.addon-selector').iCheck({
	        checkboxClass: 'icheckbox_flat-green',
	        radioClass: 'iradio_flat-green',
	        increaseArea: '20%'
	    });
	</script>
{elseif $itiCheckColor eq "grey"}
	<script>
	    jQuery('input.icheck').iCheck({
	        checkboxClass: 'icheckbox_flat-grey',
	        radioClass: 'iradio_flat-grey',
	        increaseArea: '20%'
	    });
        jQuery('input.addon-selector').iCheck({
	        checkboxClass: 'icheckbox_flat-grey',
	        radioClass: 'iradio_flat-grey',
	        increaseArea: '20%'
	    });
	</script>
{elseif $itCartiCheckColor eq "orange"}
	<script>
	    jQuery('input.icheck').iCheck({
	        checkboxClass: 'icheckbox_flat-orange',
	        radioClass: 'iradio_flat-orange',
	        increaseArea: '20%'
	    });
        jQuery('input.addon-selector').iCheck({
	        checkboxClass: 'icheckbox_flat-orange',
	        radioClass: 'iradio_flat-orange',
	        increaseArea: '20%'
	    });
	</script>
{elseif $itiCheckColor eq "pink"}
	<script>
	    jQuery('input.icheck').iCheck({
	        checkboxClass: 'icheckbox_flat-pink',
	        radioClass: 'iradio_flat-pink',
	        increaseArea: '20%'
	    });
        jQuery('input.addon-selector').iCheck({
	        checkboxClass: 'icheckbox_flat-pink',
	        radioClass: 'iradio_flat-pink',
	        increaseArea: '20%'
	    });
	</script>
{elseif $itiCheckColor eq "purple"}
	<script>
	    jQuery('input.icheck').iCheck({
	        checkboxClass: 'icheckbox_flat-purple',
	        radioClass: 'iradio_flat-purple',
	        increaseArea: '20%'
	    });
        jQuery('input.addon-selector').iCheck({
	        checkboxClass: 'icheckbox_flat-purple',
	        radioClass: 'iradio_flat-purple',
	        increaseArea: '20%'
	    });
	</script>
{elseif $itiCheckColor eq "red"}
	<script>
	    jQuery('input.icheck').iCheck({
	        checkboxClass: 'icheckbox_flat-red',
	        radioClass: 'iradio_flat-red',
	        increaseArea: '20%'
	    });
        jQuery('input.addon-selector').iCheck({
	        checkboxClass: 'icheckbox_flat-red',
	        radioClass: 'iradio_flat-red',
	        increaseArea: '20%'
	    });
	</script>
{elseif $itCartiCheckColor eq "yellow"}
	<script>
	    jQuery('input.icheck').iCheck({
	        checkboxClass: 'icheckbox_flat-yellow',
	        radioClass: 'iradio_flat-yellow',
	        increaseArea: '20%'
	    });
        jQuery('input.addon-selector').iCheck({
	        checkboxClass: 'icheckbox_flat-yellow',
	        radioClass: 'iradio_flat-yellow',
	        increaseArea: '20%'
	    });
	</script>
{elseif $itiCheckColor eq "black"}
	<script>
	    jQuery('input.icheck').iCheck({
	        checkboxClass: 'icheckbox_flat',
	        radioClass: 'iradio_flat',
	        increaseArea: '20%'
	    });
        jQuery('input.addon-selector').iCheck({
	        checkboxClass: 'icheckbox_flat',
	        radioClass: 'iradio_flat',
	        increaseArea: '20%'
	    });
	</script>
{else}
	{if $itColorScheme eq "blue" or $itColorScheme eq "blue-solid" or $itColorScheme eq "blue-white"}
		<script>
		    jQuery('input.icheck').iCheck({
		        checkboxClass: 'icheckbox_flat-blue',
		        radioClass: 'iradio_flat-blue',
		        increaseArea: '20%'
		    });
            jQuery('input.addon-selector').iCheck({
		        checkboxClass: 'icheckbox_flat-blue',
		        radioClass: 'iradio_flat-blue',
		        increaseArea: '20%'
		    });
		</script>
	{else}
		<script>
		    jQuery('input.icheck').iCheck({
		        checkboxClass: 'icheckbox_flat-green',
		        radioClass: 'iradio_flat-green',
		        increaseArea: '20%'
		    });
            jQuery('input.addon-selector').iCheck({
		        checkboxClass: 'icheckbox_flat-green',
		        radioClass: 'iradio_flat-green',
		        increaseArea: '20%'
		    });
		</script>
	{/if}
{/if}