<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>

<?php echo $content_bottom; ?>


<div id="flashcontent" style="text-align: center; margin: 10px 0px;"> 
 To view virtual tour properly, Flash Player 9.0.28 or later version is needed. 
 Please download the latest version of <a href="http://www.adobe.com/go/getflashplayer" target="_blank">Flash Player</a> and install it on your computer.
 </div> 
  
 <script type="text/javascript"> 
 // <![CDATA[ 
 var so = new SWFObject("twviewer.swf", "sotester", "600", "400", "9.0.0", "#FFFFFF"); 
 so.addParam("allowNetworking", "all"); 
 so.addParam("allowScriptAccess", "always"); 
 so.addParam("allowFullScreen", "true"); 
 so.addParam("scale", "noscale"); 
 //<!-%% Share Mode %%->
 so.addVariable("lwImg", "resources/salon_ves_sykon3_load2.swf"); 
 so.addVariable("lwBgColor", "255,71,71,71"); 
 so.addVariable("lwBarBgColor", "255,255,255,255"); 
 so.addVariable("lwBarColor", "255,71,71,71"); 
 so.addVariable("lwBarBounds", "51,349,504,25"); 
 so.addVariable("lwlocation", "0"); 
 so.addVariable("lwShowLoadingPercent", "false"); 
 so.addVariable("lwTextColor", "255,0,0,0"); 
 so.addVariable("iniFile", "config_salon_ves_sykon3.bin"); 
 so.addVariable("progressType", "1"); 
 so.addVariable("swfFile", "resources/salon_ves_sykon3_load1.swf"); 
 so.addVariable("href", location.href); 
 so.write("flashcontent"); 
 // ]]> 
 </script> 

</div>
<?php echo $footer; ?>