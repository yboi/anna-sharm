<?php
class ControllerModuleMainPageSeo extends Controller {
		$this->load->model('setting/setting');
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		if (isset($this->request->post['uk_title'])) {
}