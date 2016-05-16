        <script type="text/javascript">
 		$(document).ready(function(){
			$.preview();
  		});
		(function($) {
		$.preview = function(){
			var addRel = function(selector) {
    			$(selector).each(function() {
					var imgsrc = $(this).find("img").attr('src').replace("80x80","500x500");
					var imgalt = $(this).find("img").attr('alt');
					$(this).addClass("screenshot<?php if ($enable_sticky) { ?> sticky<?php } ?>");
        			$(this).attr("rel", function() { 
    					return "" + imgsrc; 
					}); 
        			$(this).attr("title", function() { 
    					return "" + imgalt; 
					}); 
    			});

			};
			addRel("div.image a");
			$.jatt({
			direction: '<?php echo (!($direction) ? n : $direction ); ?>',
			followMouse: true,
			zIndex: <?php echo (!($zindex) ? 1000 : $zindex ); ?>,
			speed: <?php echo (!($speed) ? 300 : $speed ); ?>
			});
		};
		})($);
		</script>
        <style type="text/css">
		#preview {background-color:<?php echo (!($bgcolor) ? '#000' : $bgcolor ); ?>;color:<?php echo (!($titlecolor) ? '#fff' : $titlecolor ); ?>}
		#preview img{ width:<?php echo (!($width) ? '300px' : $width ); ?>; height:<?php echo (!($height) ? '300px' : $height ); ?> }
		</style>
        
        