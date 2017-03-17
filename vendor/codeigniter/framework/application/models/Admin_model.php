<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|
|	Used Table : user_admin
|
*/

class Admin_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
    }

	public function user ($action = "")
	{

		switch($action) {
			case "insert" :
				echo ("insert:");
				break;
			case "update" :
				echo ("update:");
				break;
			case "delete" :
				echo ("delete:");
				break;
			default :
				echo ("select:");
		}

	}

	public function map ($action = "")
	{

		switch($action) {
			case "insert" :
				break;
			case "update" :
				break;
			case "delete" :
				break;
			default :
				//select
				echo ("select:");
		}

	}

	function adminPasswdChk($data)
	{
		$pswd = $data['pswd'];
		$query = $this->db->get_where('user_admin', array('uid' => 'admin'),0,1);

		foreach ($query->result() as $row) {
			if(password_verify($pswd, base64_decode($row->pswd))) {
				return true;
			}
		}

		return false;
	}

	function adminSessionChk()
	{

	}

}
