<?php
class ModelCatalogInformation extends Model {
	public function addInformation($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "information SET sort_order = '" . (int)$this->request->post['sort_order'] . "', status = '" . (int)$data['status'] . "'");

		$information_id = $this->db->getLastId(); 
			
		foreach ($data['information_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "information_description SET information_id = '" . (int)$information_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', seotitle = '" . $this->db->escape($value['seotitle']) . "', seodescription = '" . $this->db->escape($value['seodescription']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
		
		$store_id=0;
		$this->db->query("INSERT INTO " . DB_PREFIX . "information_to_store SET information_id = '" . (int)$information_id . "', store_id = '" . (int)$store_id . "'");
			

		if (isset($data['information_layout'])) {
			foreach ($data['information_layout'] as $store_id => $layout) {
				if ($layout) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "information_to_layout SET information_id = '" . (int)$information_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}

		
		//start_inf_img
		if (isset($data['information_image'])) {

				foreach ($data['information_image'] as $information_image) {

					$img_desc_l = "";
					foreach ($information_image['image_desc'] as $pr_img_l  => $pr_img_desc)
						$img_desc_l = $img_desc_l . '\r' . $pr_img_l . '\n' . $pr_img_desc;

					$this->db->query("INSERT INTO " . DB_PREFIX . "information_image SET information_id = '" . (int)$information_id . "', image = '" . $this->db->escape(html_entity_decode($information_image['image'], ENT_QUOTES, 'UTF-8')) . "', sort_order = '" . (int)$information_image['sort_order'] . "', image_desc = '" . $this->db->escape($img_desc_l) . "'");
			}
		}
		//end_inf_img	
			
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'information_id=" . (int)$information_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
		
		$this->cache->delete('information');
	}
	
	public function editInformation($information_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "information SET sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "' WHERE information_id = '" . (int)$information_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "information_description WHERE information_id = '" . (int)$information_id . "'");
					
		foreach ($data['information_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "information_description SET information_id = '" . (int)$information_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', seotitle = '" . $this->db->escape($value['seotitle']) . "', seodescription = '" . $this->db->escape($value['seodescription']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "information_to_store WHERE information_id = '" . (int)$information_id . "'");
		
		$store_id=0;
		$this->db->query("INSERT INTO " . DB_PREFIX . "information_to_store SET information_id = '" . (int)$information_id . "', store_id = '" . (int)$store_id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "information_to_layout WHERE information_id = '" . (int)$information_id . "'");

		if (isset($data['information_layout'])) {
			foreach ($data['information_layout'] as $store_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "information_to_layout SET information_id = '" . (int)$information_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}

		//start_inf_img
		$this->db->query("DELETE FROM " . DB_PREFIX . "information_image WHERE information_id = '" . (int)$information_id . "'");
		
		if (isset($data['information_image'])) {
				foreach ($data['information_image'] as $information_image) {

					$img_desc_l = "";
					foreach ($information_image['image_desc'] as $pr_img_l  => $pr_img_desc)
						$img_desc_l = $img_desc_l . '\r' . $pr_img_l . '\n' . $pr_img_desc;

					$this->db->query("INSERT INTO " . DB_PREFIX . "information_image SET information_id = '" . (int)$information_id . "', image = '" . $this->db->escape(html_entity_decode($information_image['image'], ENT_QUOTES, 'UTF-8')) . "', sort_order = '" . (int)$information_image['sort_order'] . "', image_desc = '" . $this->db->escape($img_desc_l) . "'");

			}
		}
		//end_inf_img
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'information_id=" . (int)$information_id. "'");
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'information_id=" . (int)$information_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
		
		$this->cache->delete('information');
	}
	
	public function deleteInformation($information_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "information WHERE information_id = '" . (int)$information_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "information_description WHERE information_id = '" . (int)$information_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "information_to_store WHERE information_id = '" . (int)$information_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "information_to_layout WHERE information_id = '" . (int)$information_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'information_id=" . (int)$information_id . "'");
		//start_inf_img
		$this->db->query("DELETE FROM " . DB_PREFIX . "information_image WHERE information_id = '" . (int)$information_id . "'");
		//end_inf_img

		$this->cache->delete('information');
	}	

	public function getInformation($information_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'information_id=" . (int)$information_id . "') AS keyword FROM " . DB_PREFIX . "information WHERE information_id = '" . (int)$information_id . "'");
		
		return $query->row;
	}
		
	public function getInformations($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "information i LEFT JOIN " . DB_PREFIX . "information_description id ON (i.information_id = id.information_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";
		
			$sort_data = array(
				'id.title',
				'i.sort_order'
			);		
		
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY id.title";	
			}
			
			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}
		
			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}		

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}	
			
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}	
			
			$query = $this->db->query($sql);
			
			return $query->rows;
		} else {
			$information_data = $this->cache->get('information.' . (int)$this->config->get('config_language_id'));
		
			if (!$information_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "information i LEFT JOIN " . DB_PREFIX . "information_description id ON (i.information_id = id.information_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY id.title");
	
				$information_data = $query->rows;
			
				$this->cache->set('information.' . (int)$this->config->get('config_language_id'), $information_data);
			}	
	
			return $information_data;			
		}
	}
	
	public function getInformationDescriptions($information_id) {
		$information_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "information_description WHERE information_id = '" . (int)$information_id . "'");

		foreach ($query->rows as $result) {
			$information_description_data[$result['language_id']] = array(
				'title'       => $result['title'],
				'seotitle'       => $result['seotitle'],
				'seodescription'       => $result['seodescription'],
				'description' => $result['description']
			);
		}
		
		return $information_description_data;
	}
	
	public function getInformationStores($information_id) {
		$information_store_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "information_to_store WHERE information_id = '" . (int)$information_id . "'");

		foreach ($query->rows as $result) {
			$information_store_data[] = $result['store_id'];
		}
		
		return $information_store_data;
	}

	//start_inf_img
	public function getInformationImages($information_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "information_image WHERE information_id = '" . (int)$information_id . "' order by sort_order");
		
		return $query->rows;
	}
	//end_inf_img
	
	public function getInformationLayouts($information_id) {
		$information_layout_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "information_to_layout WHERE information_id = '" . (int)$information_id . "'");
		
		foreach ($query->rows as $result) {
			$information_layout_data[$result['store_id']] = $result['layout_id'];
		}
		
		return $information_layout_data;
	}
		
	public function getTotalInformations() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "information");
		
		return $query->row['total'];
	}	
	
	public function getTotalInformationsByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "information_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}	
}
?>