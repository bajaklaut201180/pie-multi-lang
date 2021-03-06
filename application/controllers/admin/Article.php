<?php defined('BASEPATH') OR exit('No Direct Script Access Allowed');

class Article extends CI_Controller
{
    var $title = 'article';
    var $url = 'article';
    var $model = 'model_article';
    
    function __construct()
	{
		parent::__construct();
        checking_session();
	}
	
    function index()
    {
        $asset = array(
            'title'         => $this->title,
            'js'            => array('jquery.dataTables.min', 'dataTables.bootstrap.min', 'dataTables.responsive'),
            'css'           => array('dataTables.bootstrap', 'dataTables.responsive')
        );

        $this->load->model($this->model);
        $model_name = $this->model;
        
        $asset['article'] = $this->$model_name->get();
        
        $this->load->view('admin/template/header', $asset);
        $this->load->view('admin/template/top');
        $this->load->view('admin/' .$this->url .'/list_' .$this->url);
        $this->load->view('admin/template/footer');
	}
    
    public function add()
    {
        $this->load->library('upload');
        $asset = array(
            'title'     =>'Add ' .$this->title,
            'js'        =>array('ckeditor/ckeditor', /*'ckeditor/adapters/jquery'*/),
            'css'       =>array()
        ); 
        
        $this->form_validation->set_rules('name_banner', 'name_banner', 'required');
        
        if($this->form_validation->run()==FALSE)
        { 
            $this->load->view('admin/template/header', $asset);
            $this->load->view('admin/template/top');
            $this->load->view('admin/' .$this->url .'/add_' .$this->url);
            $this->load->view('admin/template/footer');
        }
        else
        {
            pre($this->input->post());
            $this->load->model($this->model);
            $model_name = $this->model;
            $this->$model_name->save($this->input->post());

            redirect(base_url('admin/' .$this->url));
        }    
    }
    
    public function view($item_id=false)
    {   
        $this->load->library('form_validation');
        $this->load->library('upload');
        $asset = array(
            'title'     =>'View ' .$this->title,
            'js'        =>array('ckeditor/adapters/jquery', 'ckeditor/ckeditor'),
            'css'       =>array()
        ); 
        
        $this->load->model($this->model);
        $model_name = $this->model;
        $check_banner = $this->$model_name->get($item_id);
        
        $asset['banner'] = $check_banner;
        
        $this->form_validation->set_rules('name_banner', 'name_banner', 'required');
        if($this->form_validation->run()==FALSE)
        {
            $this->load->view('admin/template/header', $asset);
            $this->load->view('admin/template/top');
            $this->load->view('admin/' .$this->url .'/view_' .$this->url);
            $this->load->view('admin/template/footer'); 
        }
        else
        {

            $this->load->model($this->model);
            $model_name = $this->model;
            $this->$model_name->save($this->input->post(), $this->input->post('id_banner')); 
            
            redirect(base_url('admin/' .$this->url)); 
            
        }  
    }
    
    
    public function delete($item_id)
    {

        $this->load->model($this->model);
        $model_name = $this->model;
        $delete = $this->$model_name->delete($item_id);
        if($delete)
        {
            redirect(base_url('admin/' .$this->url));
        }
        else
        {
            echo "delete function is failed";
        }
        
    }

    public function test()
    {

        
        
            $data = (json_decode($this->input->post('data'), true));
            $this->load->model($this->model);
            $model_name = $this->model;
            $return_model = $this->$model_name->save_multilanguage($data);
            pre($return_model);
            //echo json_encode($data);

            //redirect(base_url('admin/' .$this->url));
        
    }
}