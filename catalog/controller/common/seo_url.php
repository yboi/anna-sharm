<?php
class ControllerCommonSeoUrl extends Controller {

	public $lang = '';
	public function index() {
		$this->lang = $this->config->get('config_language'); // ua ru en
		
		$codemy='';
		if(!empty($this->request->post['language_code'])) {
			if ($this->request->post['language_code'] == 'ua'){
				$codemy='/';
			} else {
				$codemy=$this->request->post['language_code'];
				$codemy = '/'. $codemy . '/';
			}
		}
			
		
		if(!empty($this->request->post['redirect']) && !empty($this->request->post['language_code']) && $this->request->post['language_code'] != $this->lang) {
			$this->request->post['redirect'] = preg_replace('~/' . preg_quote($this->lang, '~') . '/~', $codemy, $this->request->post['redirect']);				
		}
		// Add rewrite to url class
		if ($this->config->get('config_seo_url')) {
			$this->url->addRewrite($this);
		}
		
		// Decode URL
		if (isset($this->request->get['_route_'])) {
			$this->request->get['_route_'] = rtrim($this->request->get['_route_'], '/');
			$parts = explode('/', $this->request->get['_route_']);
						
			if(!empty($parts[0])) {
				global $languages;
				$code='';
				$code = trim($parts[0]); // має бути ua ru en			
				//echo $code . '+++++++++++++++++++++++++++<br/>';
				
				if ( strlen($code)!=2 ) {
					$code = 'ua';
				}
				
				/*if ( ((string)$code !='ru') || ((string)$code !='en') ) {
					$code = 'ua';
				}*/
				//echo $code . '+++++++++++++++++++++++++++<br/>';
				//$code = str_replace('1', '', $code);
				//echo $code . '+++++++++++++++++++++++++++<br/>';
				
				if(!empty($this->request->post['redirect']) && !empty($this->request->post['language_code']) && $this->request->post['language_code'] != $this->lang) {
					$this->request->post['redirect'] = preg_replace('~/' . preg_quote($this->lang, '~') . '/~', $codemy, $this->request->post['redirect']);				
				}
				
				if($code != $this->lang && strlen($code) == 2 && !isset($this->request->post['language_code'])) {
					if(isset($languages[$code])) {
						$l = $languages[$code];
						
						$this->config->set('config_language_id', $l['language_id']);
						$this->config->set('config_language', $l['code']);
						
						$this->session->data['language'] = $l['code'];
						setcookie('language', $l['code'], time() + 60 * 60 * 24 * 30, '/', $this->request->server['HTTP_HOST']);
						$this->lang = $l['code'];
						
						$language = new Language($languages[$code]['directory']);
						$language->load($languages[$code]['filename']);	
						$this->registry->set('language', $language);
					}
				}
				
				if( (strlen($code) == 2) && ($code!='ua')) {
					array_shift($parts);
					if(empty($parts)){
						$parts = array('common' , 'home');
					}
				}
			}
			
			
			
			$override = false;
			if(count($parts) > 1) {
				$temp_path = $parts[0] . '/' . $parts[1];
			} else {
				$temp_path = false;
			}
			
			//echo $temp_path . '++++++$temp_path<br/>';
			
			if($temp_path && is_file(DIR_APPLICATION . 'controller/' . str_replace('../', '', $temp_path) . '.php')) {
				$override = implode('/', $parts);
				$parts = array();
			}
			
			foreach ($parts as $part) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($part) . "'");
				
				if ($query->num_rows) {
					$url = explode('=', $query->row['query']);
					
					if ($url[0] == 'product_id') {
						$this->request->get['product_id'] = $url[1];
					}
					
					if ($url[0] == 'category_id') {
						if (!isset($this->request->get['path'])) {
							$this->request->get['path'] = $url[1];
						} else {
							$this->request->get['path'] .= '_' . $url[1];
						}
					}	
					
					if ($url[0] == 'manufacturer_id') {
						$this->request->get['manufacturer_id'] = $url[1];
					}
					
					if ($url[0] == 'information_id') {
						$this->request->get['information_id'] = $url[1];
					}	
				} else {
					$this->request->get['route'] = 'error/not_found';	
				}
			}
			
			if (isset($this->request->get['product_id'])) {
				$this->request->get['route'] = 'product/product';
			} elseif (isset($this->request->get['path'])) {
				$this->request->get['route'] = 'product/category';
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$this->request->get['route'] = 'product/manufacturer/product';
			} elseif (isset($this->request->get['information_id'])) {
				$this->request->get['route'] = 'information/information';
			}
			
			if($override) $this->request->get['route'] = $override;
			
			if (isset($this->request->get['route'])) {
				return $this->forward($this->request->get['route']);
			}
		}
	}
	
	public function rewrite($link) {
		if ($this->config->get('config_seo_url')) {
			$url_data = parse_url(str_replace('&amp;', '&', $link));
		
			$url = ''; 
			
			$data = array();
			
			parse_str($url_data['query'], $data);
			
			foreach ($data as $key => $value) {
				if (isset($data['route'])) {
					if (($data['route'] == 'product/product' && $key == 'product_id') || (($data['route'] == 'product/manufacturer/product' || $data['route'] == 'product/product') && $key == 'manufacturer_id') || ($data['route'] == 'information/information' && $key == 'information_id')) {
						$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = '" . $this->db->escape($key . '=' . (int)$value) . "'");
					
						if ($query->num_rows) {
							$url .= '/' . $query->row['keyword'];
							
							unset($data[$key]);
						}					
					} elseif ($key == 'path') {
						$categories = explode('_', $value);
						
						foreach ($categories as $category) {
							$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = 'category_id=" . (int)$category . "'");
					
							if ($query->num_rows) {
								$url .= '/' . $query->row['keyword'];
							}							
						}
						
						unset($data[$key]);
					}
				}
			}

			if(!$url && !empty($data['route'])){
				parse_str($url_data['query'], $data);
				$url = '/' . $data['route'];
			}
				
			if ($url) {
				if($url == '/common/home') $url = '/';
				unset($data['route']);
			
				$query = '';
			
				if ($data) {
					foreach ($data as $key => $value) {
						$query .= '&' . $key . '=' . $value;
					}
					
					if ($query) {
						$query = '?' . trim($query, '&');
					}
				}
				
				//echo '<br/>' . $this->lang . '+++++++++++++++$this->lang';
				if($this->lang == 'ua') {
					$language = '';
				} else {
					$language = '/' . $this->lang; ///////////link 
				}
			
				global $languages;
				if(count($languages) == 1) {
					$language = '';
				}
				return $url_data['scheme'] . '://' . $url_data['host'] . (isset($url_data['port']) ? ':' . $url_data['port'] : '') . str_replace('/index.php', '', $url_data['path']) . $language . $url . $query;
			} else {
				return $link;
			}
		} else {
			return $link;
		}		
	}	
}
?>