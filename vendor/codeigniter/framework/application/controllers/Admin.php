<?php
defined('BASEPATH') OR exit('No direct script access allowed');

// Shortcuts for simpler usage
use \Monolog\Logger;
use \Monolog\Formatter\LineFormatter;
use \Monolog\Handler\StreamHandler;

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
		$this->root->sview("admin/info");
	}

	public function db($method="")
	{
		$data['method'] = $method;
		$this->root->sview("admin/db", $data);
	}

	public function map()
	{
		$this->root->sview("admin/map");
	}

/*
 * ########################################
 *				Example	[exam]
 * ########################################
 */

	public function monolog() {
		// Common logger
		$log = new Logger('files');

		// Line formatter without empty brackets in the end
		$formatter = new LineFormatter(null, null, false, true);

		// Debug level handler
		$debugHandler = new StreamHandler('./log/debug.log', Logger::DEBUG);
		$debugHandler->setFormatter($formatter);

		// Error level handler
		$errorHandler = new StreamHandler('./log/error.log', Logger::ERROR);
		$errorHandler->setFormatter($formatter);

		// This will have both DEBUG and ERROR messages
		$log->pushHandler($debugHandler);

		// This will have only ERROR messages
		$log->pushHandler($errorHandler);

		// The actual logging
		$log->debug('I am debug');
		$log->error('I am error', array('productId' => 123));
	}

	public function animation()
	{
		$this->root->sview("admin/example/animation");
	}

	public function generate_hash()
	{
		$data["pswd"] = $this->input->post("pswd")?:"null";
		$data["hash"] = base64_encode(password_hash($data["pswd"], PASSWORD_DEFAULT, ['cost'=>12]));
		$this->root->sview('admin/example/generate_hash', $data);
	}

	public function restful()
	{
		$this->root->sview("admin/example/restful");
	}

	public function dragndrop_upload()
	{
		$this->root->sview("admin/example/dragndrop_upload");
	}

	public function socket_alert()
	{
		$this->root->sview("admin/example/socket_alert");
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
