<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Language extends CI_Controller 
{
	public function english()
	{
		$this->session->unset_userdata('lang');
		$this->session->set_userdata('lang', 'english');
		redirect('/', 'refresh');
	}

	public function indonesia()
	{
		$this->session->unset_userdata('lang');
		$this->session->set_userdata('lang', 'indonesia');
		redirect('/', 'refresh');
	}
}