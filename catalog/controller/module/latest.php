<?php
class ControllerModuleLatest extends Controller {
	protected function index($setting) {
		$this->language->load('module/category');
		$this->load->model('tool/image');		
    	$this->data['heading_title'] = $this->language->get('heading_title');
		
									
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		
		$this->data['categories'] = array();
					
		$categories = $this->model_catalog_category->getCategories(0);
		
		foreach ($categories as $category) {
			$children_data = array();
			
			$children = $this->model_catalog_category->getCategories($category['category_id']);
			
			$image = empty($category['image']) ? 'no_image.jpg' : $category['image'];
            $thumb = $this->model_tool_image->resize($image, 150, 150);

			$this->data['categories'][] = array(
				'category_id' => $category['category_id'],
				'name'        => $category['name'],
				'thumb'    => $thumb,
				'children'    => $children_data,
				'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
			);				
			
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/latest.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/latest.tpl';
		} else {
			$this->template = 'default/template/module/latest.tpl';
		}

		$this->render();
  	}
}
?>