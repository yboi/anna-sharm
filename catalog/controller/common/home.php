<?php  
class ControllerCommonHome extends Controller {
	public function index() {
		$this->language->load('common/header');
		
		//$this->document->setTitle($this->config->get('config_title'));
		//$this->document->setDescription($this->config->get('config_meta_description'));
		
		//ukr lang
		$this->document->setTitle( html_entity_decode($this->config->get('uk_title')) );
		$this->document->setDescription( html_entity_decode($this->config->get('uk_desc')) );

		$this->data['heading_title'] = $this->config->get('config_title');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/home.tpl';
		} else {
			$this->template = 'default/template/common/home.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
										
		$this->response->setOutput($this->render());
	}
}
?>