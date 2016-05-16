<?php if (false && count($languages) > 1) { ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
  <div id="language">
	<a href="skype:leotel.hotel" class="skype" title="skype">	 </a>
	<a href="http://www.facebook.com/leohostel.lviv" target="_blank" class="facebook" title="www.facebook.com">	 </a>
	<a href="http://vk.com/leohostel.lviv" target="_blank" class="vk" title="www.vk.com">	 </a>
	
    <?php foreach ($languages as $language) { ?>
    &nbsp;<img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" onClick="$('input[name=\'language_code\']').attr('value', '<?php echo $language['code']; ?>').submit(); $(this).parent().parent().submit();" />
    <?php } ?>
    <input type="hidden" name="language_code" value="" />
    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
  </div>
</form>
<?php } ?>

<?php if(count($languages) > 1): ?>
<div id="language">
	<a href="skype:leotel.hotel" class="skype" title="skype">	 </a>
	<a href="http://www.facebook.com/leohostel.lviv" target="_blank" class="facebook" title="www.facebook.com">	 </a>
	<a href="http://vk.com/leohostel.lviv" target="_blank" class="vk" title="www.vk.com">	 </a>
	
<?php
	$rewrites = $this->url->getRewrites();
	$urlclass = false;
	
	foreach($rewrites as $rewrite) {
		if(get_class($rewrite) == 'ControllerCommonSeoUrl') {
			$urlclass = $rewrite;
			break;
		}
	}
	
	if($urlclass) {
		$lang = $urlclass->lang;
		$language_id = $this->config->get('config_language_id');	
		
		foreach($languages as $language) {
			$this->config->set('config_language_id', $language['id']);
			$urlclass->lang = $language['code'];
			$get = $this->request->get;
			
			$route = empty($get['route']) ? 'common/home' : $get['route'];
			unset($get['route']);
			unset($get['_route_']);
			$query = http_build_query($get);
			
			$ssl = empty($this->request->server['HTTPS']) ? 'NONSSL' : 'SSL';
			$link = $this->url->link($route, $query, $ssl);
?>
&nbsp;<a href="<?php echo $link; ?>"><img style="border: none;" src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" /></a>
<?php
		}
		
		$this->config->set('config_language_id', $language_id);
		$urlclass->lang = $lang;
	}
?>
</div>
<?php endif; ?>
