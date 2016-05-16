<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  
  <!-- <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div> -->
  
  <?php if( ($information_id!=41) && ($information_id!=39) )  { ?>
	<?php echo $description; ?>
  <?php } ?>
  
  <?php if ($images) { ?> 
  
	<div id="gallery">
		<ul>
		<?php foreach ($images as $image) { ?>  <!--вміст title використовується для підпису фотографій в colorbox-->
			<li>
				<a href="<?php echo $image['popup']; ?>" title="<?php echo $image['image_desc']; ?>" class="colorbox" rel="colorbox">
					<img src="<?php echo $image['thumb']; ?>" title="<?php echo $image['image_desc']; ?>" alt="<?php echo $image['image_desc']; ?>" id="image" />
				</a>
				<div>
					<a style="" href="<?php echo $image['popup']; ?>" title="<?php echo $image['image_desc']; ?>">
						<?php echo $image['image_desc']; ?> 
					</a>
				</div>
			</li>  
		<?php } ?>	
		</ul>
    </div>
	
	<div class="pagination"><?php echo $pagination; ?></div>
  <?php } ?>
  
  <?php if( ($information_id==41) || ($information_id==39) )  { ?>
	<?php echo $description; ?>
  <?php } ?>
  
  
  <?php echo $content_bottom; ?>
  
</div>
  
  <!--start_inf_img-->
 <script type="text/javascript"><!--
$('#carousel_inf ul').jcarousel({
	vertical: false,
	visible: 5,
	scroll: 3,
	auto: 5, // затримка між прокоуткою 5 сек.
	wrap: 'last' // умова автоматичного перехочу на перший малюнок.
});
//--></script>
  <script type="text/javascript"><!--
$('.colorbox').colorbox({
	overlayClose: true,
	opacity: 0.5
});
//--></script>
<!--end_inf_img-->
  
<?php echo $footer; ?>