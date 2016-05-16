<?php 
class ControllerInformationInformation extends Controller {
	public function index() {  
    	$this->language->load('information/information');
		
		$this->load->model('catalog/information');
		
		$this->data['breadcrumbs'] = array();
		
      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
        	'separator' => false
      	);
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}
		
		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->config->get('config_catalog_limit');
		}
		
		if (isset($this->request->get['information_id'])) {
			$information_id = $this->request->get['information_id'];
		} else {
			$information_id = 0;
		}
		
		$information_info = $this->model_catalog_information->getInformation($information_id);
   		
		if ($information_info) {
	  		
			if($information_info['seotitle']){
				$this->document->setTitle($information_info['seotitle']); 
			} else {
				$this->document->setTitle($information_info['title']); 
			}
			
			$this->document->setDescription($information_info['seodescription']);

      		$this->data['breadcrumbs'][] = array(
        		'text'      => $information_info['title'],
				'href'      => $this->url->link('information/information', 'information_id=' .  $information_id),      		
        		'separator' => $this->language->get('text_separator')
      		);		
						
      		$this->data['heading_title'] = $information_info['title'];
      		
      		$this->data['button_continue'] = $this->language->get('button_continue');
			
			$this->data['description'] = html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8');
			$this->data['information_id'] = $information_info['information_id'];
			
			//start_inf_img
			$this->load->model('tool/image');
			
			$this->document->addScript('catalog/view/javascript/jquery/jquery.jcarousel.min.js');
			
			if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/carousel.css')) {
				$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/carousel.css');
			} else {
				$this->document->addStyle('catalog/view/theme/default/stylesheet/carousel.css');
			}
			
			$this->data['images'] = array();

			$data = array(
				'information_id' => $this->request->get['information_id'], 
				'start'          => ($page - 1) * $limit,
				'limit'          => $limit
			);
			
			$information_total = $this->model_catalog_information->getInformationImagesCount($data); 
															   			
			$results = $this->model_catalog_information->getInformationImages($data);
			
			foreach ($results as $result) {

				if ($result['image']=='') $result['image'] = 'no_image.jpg';
	

				$img_arrs = explode('\r', $result['image_desc']); 
			
					$img_d = ""; 

					foreach ($img_arrs as $img_ar) { 
						$img_arrs2 = explode('\n', $img_ar); 
						if(isset($img_arrs2[0]) && isset($img_arrs2[1]))
						{
							if ($img_arrs2[0] == $this->config->get('config_language_id')) $img_d = $img_arrs2[1];
						} 
					}


				$this->data['images'][] = array(
					'popup' => $this->model_tool_image->resize($result['image'],600,700),
					'thumb' => $this->model_tool_image->resize($result['image'],165,220),
					'image_desc' => $img_d

				);
			}	
			//end_inf_img
      		
			$pagination = new Pagination();
			$pagination->total = $information_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = $this->url->link('information/information', 'information_id=' .  $information_id . '&page={page}');   
					
			$this->data['pagination'] = $pagination->render();
			
			
			$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/information.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/information/information.tpl';
			} else {
				$this->template = 'default/template/information/information.tpl';
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
    	} else {
      		$this->data['breadcrumbs'][] = array(
        		'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('information/information', 'information_id=' . $information_id),
        		'separator' => $this->language->get('text_separator')
      		);
				
	  		$this->document->setTitle($this->language->get('text_error'));
			
      		$this->data['heading_title'] = $this->language->get('text_error');

      		$this->data['text_error'] = $this->language->get('text_error');

      		$this->data['button_continue'] = $this->language->get('button_continue');

      		$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
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
	
	public function info() {
		$this->load->model('catalog/information');
		
		if (isset($this->request->get['information_id'])) {
			$information_id = $this->request->get['information_id'];
		} else {
			$information_id = 0;
		}      
		
		$information_info = $this->model_catalog_information->getInformation($information_id);

		if ($information_info) {
			$output  = '<html dir="ltr" lang="en">' . "\n";
			$output .= '<head>' . "\n";
			$output .= '  <title>' . $information_info['title'] . '</title>' . "\n";
			$output .= '  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' . "\n";
			$output .= '</head>' . "\n";
			$output .= '<body>' . "\n";
			$output .= '  <h1>' . $information_info['title'] . '</h1>' . "\n";
			$output .= html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8') . "\n";
			$output .= '  </body>' . "\n";
			$output .= '</html>' . "\n";			

			$this->response->setOutput($output);
		}
	}
}
?>