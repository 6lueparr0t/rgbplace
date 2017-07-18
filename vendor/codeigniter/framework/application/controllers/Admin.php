<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		redirect("/");
	}

/*
 * ########################################
 *				Admin [admin]
 * ########################################
 */

	public function info()
	{
		$this->rgb->sview("admin/info");
	}

	public function database($method="")
	{
		$data['method'] = $method;
		$this->rgb->sview("admin/database", $data);
	}

/*
 * ########################################
 *				Example	[exam]
 * ########################################
 */

	public function animation()
	{
		$this->rgb->sview("admin/example/animation");
	}

	public function generate_hash()
	{
		$data["pswd"] = $this->input->post("pswd")?:"null";
		$data["hash"] = base64_encode(password_hash($data["pswd"], PASSWORD_DEFAULT, ['cost'=>12]));
		$this->rgb->sview('admin/example/generate_hash', $data);
	}

	public function restful()
	{
		$this->rgb->sview("admin/example/restful");
	}

	public function dragndrop_upload()
	{
		$this->rgb->sview("admin/example/dragndrop_upload");
	}

/*
 * ########################################
 *					Process
 * ########################################
 */

	public function upload()
	{
		/*   
		 *        //Original Upload Code
		 *
		 *        $config['upload_path'] = './upload';
		 *        $config['allowed_types'] = 'gif|png|jpg|jpeg|bmp';
		 *        //$config['file_name'] = "{$link}_{$count}";
		 *        //$config['max_size'] = '10240';
		 *
		 *        $this->load->library('upload', $config);
		 *
		 *        if(!$this->upload->do_upload())
		 *        {
		 *            $error = $this->upload->display_errors();
		 *            echo ('<script>alert("'.strip_tags($error).'");</script>');
		 *            redirect('/', 'refresh');
		 *        } else {
		 *            $data = $this->upload->data();
		 *        }
		 *
		 *        echo json_encode($data);
		 */

		$this->load->library('upload');
		$files = $_FILES;
		$data = [];
		$count = count($_FILES['userfile']['name']);
		for($i=0; $i<$count; $i++) {
			$_FILES['userfile']['name']= $files['userfile']['name'][$i];
			$_FILES['userfile']['type']= $files['userfile']['type'][$i];
			$_FILES['userfile']['tmp_name']= $files['userfile']['tmp_name'][$i];
			$_FILES['userfile']['error']= $files['userfile']['error'][$i];
			$_FILES['userfile']['size']= $files['userfile']['size'][$i];

			$config['upload_path'] = './upload';
			$config['allowed_types'] = 'gif|png|jpg|jpeg|bmp|txt';
			//$config['max_size']      = '102400';
			//$config['file_name'] = "{$link}_{$count}";

			$this->load->library('upload', $config);
			$this->upload->initialize($config);
			if(!$this->upload->do_upload())
			{
				array_push($data, $this->upload->display_errors());
			} else {
				array_push($data, $this->upload->data());
			}
		}

		echo json_encode($data);
	}
}
