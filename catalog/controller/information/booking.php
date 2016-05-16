<?php 
class ControllerInformationBooking extends Controller {
	private $error = array(); 
	    
  	public function index() {
		$this->language->load('information/booking');

    	$this->document->setTitle($this->language->get('heading_title'));  
	 
    	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->hostname = $this->config->get('config_smtp_host');
			$mail->username = $this->config->get('config_smtp_username');
			$mail->password = $this->config->get('config_smtp_password');
			$mail->port = $this->config->get('config_smtp_port');
			$mail->timeout = $this->config->get('config_smtp_timeout');				
			$mail->setTo($this->config->get('config_email'));
			/*$mail->setTo('test@leohostel.lviv.ua');*/
			
			$mail->setFrom($this->request->post['email']);
	  		$mail->setSender($this->request->post['name']);
	  		
			$mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
			
			$room_type='';
			switch ($this->request->post['room_type']) {
				case '4rooms':
					$room_type=$this->language->get('entry_roomtype0');
					break;
				case '6rooms':
					$room_type=$this->language->get('entry_roomtype1');
					break;
				case '8rooms':
					$room_type=$this->language->get('entry_roomtype2');
					break;
				case '10rooms':
					$room_type=$this->language->get('entry_roomtype3');
					break;					
			}
					
	  		$mail->setText(strip_tags(html_entity_decode(
				   $this->language->get('entry_datein').'  '.$this->request->post['datefrom']."\r\n".
				   $this->language->get('entry_dateout').'  '.$this->request->post['dateto']."\r\n".
				   $this->language->get('entry_roomtype').'  '.$room_type."\r\n".
				   $this->language->get('entry_place_count').'  '.$this->request->post['place_count']."\r\n".
				   $this->language->get('entry_name').'  '.$this->request->post['name']."\r\n".
				   $this->language->get('entry_surname').'  '.$this->request->post['surname']."\r\n".
				   $this->language->get('text_telephone').'  '.$this->request->post['telephone']."\r\n".
				   $this->language->get('entry_email').'  '.$this->request->post['email']."\r\n".
				   $this->language->get('entry_country').'  '.$this->request->post['country']."\r\n".
				   $this->language->get('entry_city').'  '.$this->request->post['city']."\r\n".
				   $this->language->get('text_address').'  '.$this->request->post['address']."\r\n".
				   $this->language->get('entry_adinfo').'  '.$this->request->post['adinfo'], ENT_QUOTES, 'UTF-8')));
      		$mail->send();

	  		$this->redirect($this->url->link('information/booking/success'));
    	}

      	$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),        	
        	'separator' => false
      	);

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('information/booking'),
        	'separator' => $this->language->get('text_separator')
      	);	
			
    	$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['lang_value'] = $this->language->get('text_lang_value');
    	$this->data['text_location'] = $this->language->get('text_location');
		$this->data['text_contact'] = $this->language->get('text_contact');
		$this->data['text_address'] = $this->language->get('text_address');
    	$this->data['text_telephone'] = $this->language->get('text_telephone');
    	$this->data['text_fax'] = $this->language->get('text_fax');

    	$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_surname'] = $this->language->get('entry_surname');
		
		
    	$this->data['entry_email'] = $this->language->get('entry_email');
    	$this->data['entry_enquiry'] = $this->language->get('entry_enquiry');
		$this->data['entry_send_quechen'] = $this->language->get('entry_send_quechen');
		$this->data['entry_captcha'] = $this->language->get('entry_captcha');

		$this->data['entry_datein'] = $this->language->get('entry_datein');
		$this->data['entry_dateout'] = $this->language->get('entry_dateout');
		
		$this->data['entry_roomtype'] = $this->language->get('entry_roomtype');
		$this->data['entry_roomtype0'] = $this->language->get('entry_roomtype0');
		$this->data['entry_roomtype1'] = $this->language->get('entry_roomtype1');
		$this->data['entry_roomtype2'] = $this->language->get('entry_roomtype2');
		$this->data['entry_roomtype3'] = $this->language->get('entry_roomtype3');
		$this->data['entry_place_count'] = $this->language->get('entry_place_count');
		$this->data['entry_country'] = $this->language->get('entry_country');
		$this->data['entry_country0'] = $this->language->get('entry_country0');
		$this->data['entry_country1'] = $this->language->get('entry_country1');
		$this->data['entry_country2'] = $this->language->get('entry_country2');
		$this->data['entry_country3'] = $this->language->get('entry_country3');
		$this->data['entry_country4'] = $this->language->get('entry_country4');
		$this->data['entry_country5'] = $this->language->get('entry_country5');
		$this->data['entry_country6'] = $this->language->get('entry_country6');
		$this->data['entry_city'] = $this->language->get('entry_city');
		$this->data['entry_adinfo'] = $this->language->get('entry_adinfo');

		if (isset($this->error['name'])) {
    		$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = '';
		}
		
		if (isset($this->error['surname'])) {
    		$this->data['error_surname'] = $this->error['surname'];
		} else {
			$this->data['error_surname'] = '';
		}
		
		if (isset($this->error['email'])) {
			$this->data['error_email'] = $this->error['email'];
		} else {
			$this->data['error_email'] = '';
		}		
		
		if (isset($this->error['enquiry'])) {
			$this->data['error_enquiry'] = $this->error['enquiry'];
		} else {
			$this->data['error_enquiry'] = '';
		}		
		
 		if (isset($this->error['captcha'])) {
			$this->data['error_captcha'] = $this->error['captcha'];
		} else {
			$this->data['error_captcha'] = '';
		}	

    	$this->data['button_continue'] = $this->language->get('button_continue');
    
		$this->data['action'] = $this->url->link('information/booking');
		$this->data['store'] = $this->config->get('config_name');
    	$this->data['address'] = nl2br($this->config->get('config_address'));
    	$this->data['telephone'] = $this->config->get('config_telephone');
    	$this->data['fax'] = $this->config->get('config_fax');
    	
		if (isset($this->request->post['name'])) {
			$this->data['name'] = $this->request->post['name'];
		} else {
			$this->data['name'] = $this->customer->getFirstName();
		}
		
		if (isset($this->request->post['surname'])) {
			$this->data['surname'] = $this->request->post['surname'];
		} else {
			$this->data['surname'] = '';
		}

		if (isset($this->request->post['datefrom'])) {
			$this->data['datefrom'] = $this->request->post['datefrom'];
		} else {
			$this->data['datefrom'] = '';
		}
		
		if (isset($this->request->post['dateto'])) {
			$this->data['dateto'] = $this->request->post['dateto'];
		} else {
			$this->data['dateto'] = '';
		}
		
		if (isset($this->request->post['email'])) {
			$this->data['email'] = $this->request->post['email'];
		} else {
			$this->data['email'] = $this->customer->getEmail();
		}
		
		if (isset($this->request->post['enquiry'])) {
			$this->data['enquiry'] = $this->request->post['enquiry'];
		} else {
			$this->data['enquiry'] = '';
		}
		
		if (isset($this->request->post['captcha'])) {
			$this->data['captcha'] = $this->request->post['captcha'];
		} else {
			$this->data['captcha'] = '';
		}		

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/booking.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/information/booking.tpl';
		} else {
			$this->template = 'default/template/information/contact.tpl';
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

  	public function success() {
		$this->language->load('information/booking');

		$this->document->setTitle($this->language->get('heading_title')); 

      	$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
        	'separator' => false
      	);

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('information/booking'),
        	'separator' => $this->language->get('text_separator')
      	);	
		
    	$this->data['heading_title'] = $this->language->get('heading_title');

    	$this->data['text_message'] = $this->language->get('text_message');

    	$this->data['button_continue'] = $this->language->get('button_continue');

    	$this->data['continue'] = $this->url->link('common/home');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/success.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/success.tpl';
		} else {
			$this->template = 'default/template/common/success.tpl';
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
	
  	private function validate() {
	
	   	/*if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 32)) {
      		$this->error['name'] = $this->language->get('error_name');
    	}
		
		if ((utf8_strlen($this->request->post['surname']) < 3) || (utf8_strlen($this->request->post['surname']) > 32)) {
      		$this->error['surname'] = $this->language->get('error_surname');
    	}

    	if (!preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
      		$this->error['email'] = $this->language->get('error_email');
    	}

    	if ((utf8_strlen($this->request->post['enquiry']) < 10) || (utf8_strlen($this->request->post['enquiry']) > 3000)) {
      		$this->error['enquiry'] = $this->language->get('error_enquiry');
    	}

    	if (empty($this->session->data['captcha']) || ($this->session->data['captcha'] != $this->request->post['captcha'])) {
      		$this->error['captcha'] = $this->language->get('error_captcha');
    	}*/
		
		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}  	  
  	}

	public function captcha() {
		$this->load->library('captcha');
		
		$captcha = new Captcha();
		
		$this->session->data['captcha'] = $captcha->getCode();
		
		$captcha->showImage();
	}	
}
?>
