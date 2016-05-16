<?php  
class ControllerModuleImagePreview extends Controller {
	protected function index() {
		$this->language->load('module/imagepreview');
		
		$this->document->addScript('catalog/view/javascript/jquery/jquery.jatt.js');
		
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/imagepreview.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/imagepreview.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/imagepreview.css');
		}

      	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['enable_sticky'] = (bool)html_entity_decode($this->config->get('enable_sticky'));
		$this->data['direction'] = html_entity_decode($this->config->get('preview_direction'));
		$this->data['speed'] = html_entity_decode($this->config->get('preview_speed'));
		$this->data['zindex'] = html_entity_decode($this->config->get('preview_zindex'));
		$this->data['bgcolor'] = html_entity_decode($this->config->get('preview_bgcolor'));
		$this->data['titlecolor'] = html_entity_decode($this->config->get('preview_titlecolor'));
		$this->data['width'] = html_entity_decode($this->config->get('preview_width'));
		$this->data['height'] = html_entity_decode($this->config->get('preview_height'));
		
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/imagepreview.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/imagepreview.tpl';
		} else {
			$this->template = 'default/template/module/imagepreview.tpl';
		}
		
		$this->render();
	}
}
?>