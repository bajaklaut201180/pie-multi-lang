<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
	* @property CI_config $config
	* @property CI_session $session
*/

class MY_controller extends CI_Controller 
{

	function __construct() 
	{
		parent::__construct();
	}

	protected function load_lang()
	{
		if($this->uri->segment(1) == 'id' || $this->uri->segment(1) == 'en' || $this->uri->segment(1) == 'ch') {
			$this->session->set_userdata('lang', $this->uri->segment(1));
			// redirect(base_url());
		} else {
			// default language
			if($this->session->userdata('lang') == false) $this->session->set_userdata('lang', 'en');
		}
		
		if($this->session->userdata('lang') == 'id') {
			$language = 'indonesia';
			$lang = 'id';
		}elseif($this->session->userdata('lang') == 'en') {
			$language = 'english';
			$lang = 'en';
		}else{
			$language = 'china';
			$lang = 'ch';
		}

		$this->config->set_item('language', $language);
		$this->session->set_userdata('lang', $lang);
		$this->lang->load('menu', $language);
	}

	
	function view($main_containt, $data = null)
	{
		//$this->load->view('template/header');
		//$this->load->view('template/top');
		$this->load->view($main_containt, $data);
		//$this->load->view('template/footer');
	}
}