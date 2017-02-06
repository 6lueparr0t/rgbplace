<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|
|	Used Table : maker_admin
|
*/

class Dev_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
    }

	public function adminPasswdChk($data)
	{
		$pswd = $data['pswd'];
		$query = $this->db->get_where('maker_admin', array('uid' => 'admin'),0,1);

		foreach ($query->result() as $row) {
			if(password_verify($pswd, base64_decode($row->pswd))) {
				return true;
			}
		}

		return false;
	}

	public function adminSessionChk()
	{

	}

}
