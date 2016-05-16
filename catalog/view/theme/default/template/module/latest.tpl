<div class="box_category_home">
    <div class="box-content">
    <div class="box-product">
      <?php foreach ($categories as $category) { ?>
      <div>
                
		<div class="image">
			<a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" /></a>
		</div>
        
        <div class="name">
			<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
		</div>
	
      </div>
      <?php } ?>
    </div>
  </div>
</div>
