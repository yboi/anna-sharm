<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ampliacao/css/jqzoom.css" />
<script src="catalog/view/javascript/jquery/ampliacao/jqzoom.pack.1.0.1.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/ampliacao/jquery.jqzoom1.0.1.js" type="text/javascript"></script>
<script type="text/javascript"><!--
$(document).ready(function(){
var options =
{
showEffect:'show',
hideEffect:'fadeout',
fadeoutSpeed: 'slow',
title:true,
lens:false,
zoomWidth: 450,
zoomHeight: 450
}
$(".jqzoom").jqzoom(options);
});


//--></script>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
  <?php if (isset($news_info)) { ?>
    <div class="box-news" <?php if ($image) { echo 'style="min-height: ' . $min_height . 'px;"'; } ?>>
      <?php if ($image) { ?>
        <!-- <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="thickbox jqzoom" rel="fancybox"><img align="right" style="border: none; margin-left: 10px;" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a> -->
      <?php } ?>
	  
 	  <?php if ($image) { ?>
		<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="colorbox"> <img align="right" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
      <?php } ?>

      <?php echo $description; ?>
    </div>
    <div class="buttons">
      <div class="right"><a onclick="location='<?php echo $news; ?>'" class="button"><span><?php echo $button_news; ?></span></a></div>
    </div>
  <?php } elseif (isset($news_data)) { ?>
    <?php foreach ($news_data as $news) { ?>
      <div class="box-news">
        <h3 style="margin-top: 5px;"><?php echo $news['title']; ?></h3>
        <?php echo $news['description']; ?> <a href="<?php echo $news['href']; ?>"><?php echo $text_read_more; ?></a></p>
        <p><b><?php echo $text_date_added; ?></b>&nbsp;<?php echo $news['date_added']; ?></p>
      </div>
    <?php } ?>
  <?php } ?>
  </div>
</div>
</div>
<?php echo $footer; ?>

<script type="text/javascript"><!--
$('.colorbox').colorbox({
	overlayClose: true,
	opacity: 0.5
});
//--></script>