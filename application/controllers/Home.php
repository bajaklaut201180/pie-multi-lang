<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
	* if multilanguage, extends the controller to MY_controller 
	* @see on folder core/MY_controller
	* set constructor to call a function load_lang() from MY_controller, 
 */

class Home extends MY_controller	
{
	public function __construct()
	{
		parent::__construct();

		// for multilanguage
		$this->load_lang();
	}

	public function index()
	{	
		// pagename picked from classname
		$data['page'] = strtolower(get_class($this));
		
		$this->load->model('model_article');
		$data['article'] = $this->model_article->get();

		$this->view('test', $data);
	}
}