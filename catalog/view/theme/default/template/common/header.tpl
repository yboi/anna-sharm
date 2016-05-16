<?php 
if($_SERVER['REQUEST_URI'] == "/") {   
	if ($this->config->get('config_language_id')!=2){ //треба перевіряти лише для головної сторінки, для всіх інших сторінок перевірка і автоматичне встановлення української мови є в seo_url.php
		//echo $this->config->get('config_language_id') . 'lang_id_BEFORE<br/>';
		$this->config->set('config_language_id', 2);
		$this->config->set('config_language', 'ua');
		// мови ua id=2 (основна мова сайту)   ru id=3   en id=4
		//$page = $_SERVER['PHP_SELF'];
		//$sec = '0';
		//header('Refresh: 0; url=/');
		//echo $this->config->get('config_language_id') . 'lang_id_after<br/>';
		//$urlclass->lang = 'ua';
		header("Location: /TeST_TEST2013",TRUE,302);
		exit();	
	}
}

if($_SERVER['REQUEST_URI'] == "/TeST_TEST2013") {   
		header("Location: /",TRUE,301);
		exit();	
}

if( strstr($_SERVER['HTTP_HOST'], 'www') ) {
	header("Location: http://anna-sharm.com/",TRUE,301);
	exit();
}

if( ($_SERVER['REQUEST_URI'] == "/index.php") || ($_SERVER['REQUEST_URI'] == "/index.html") || ($_SERVER['REQUEST_URI'] == "/index.htm") ) {
	header("Location: /",TRUE,301);
	exit();
}
?> 



<?php if (isset($_SERVER['HTTP_USER_AGENT']) && !strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE 6')) echo '<?xml version="1.0" encoding="UTF-8"?>'. "\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" xml:lang="<?php echo $lang; ?>">
<head>
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/news.css" />

<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>

<!-- <script type="text/javascript" src="catalog/view/javascript/jquery-1.4.4.min.js"></script>

<script type="text/javascript" src="catalog/view/javascript/jquery-ui-1.8.21.custom.min.js"></script> -->

<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen" />
<script type="text/javascript" src="catalog/view/javascript/jquery/tabs.js"></script>
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<script type="text/javascript" src="catalog/view/javascript/swfobject.js"></script>

<script type="text/javascript" src="catalog/view/javascript/calendar_<?php echo $lang_value; ?>.js"></script>

<script type="text/javascript" src="catalog/view/javascript/jquery-ui-i18n.js"></script> 

<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
DD_belatedPNG.fix('.slideshow .nivo-controlNav a');
</script>
<![endif]-->
<?php echo $google_analytics; ?>
</head>
<body>
<div id="container">

<div id="containerIN">

<!-- <div id="header">
  <?php if ($logo) { ?>
  <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
  <?php } ?>
  <?php echo $language; ?>
  <?php echo $currency; ?>
	
  	
	
</div> -->
<?php if ($categories) { ?>
	<div id="menu">
	  <ul>
	  
		<li><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a></li>
		
		<?php foreach ($categories as $category) { ?>
		<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
		  <?php if ($category['children']) { ?>
		  <div>
			<?php for ($i = 0; $i < count($category['children']);) { ?>
			<ul>
			  <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
			  <?php for (; $i < $j; $i++) { ?>
			  <?php if (isset($category['children'][$i])) { ?>
			  <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
			  <?php } ?>
			  <?php } ?>
			</ul>
			<?php } ?>
		  </div>
		  <?php } ?>
		</li>
		<?php } ?>
		
		<!-- <li><a href="<?php echo $booking; ?>" class="bron"><?php echo $text_bronyvannia; ?></a></li> -->
		<li><a href="<?php echo $contact; ?>"><?php echo $text_contacts; ?></a></li>
		
	  </ul>
	</div>
<?php } ?>

<script type="text/javascript">
	$('#menu > ul > li > a').each(function () {if (this.href == location.href) this.className = 'selected';});
</script>

<div id="notification"></div>
