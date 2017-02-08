<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|
|	Used Table : maker_*
|
*/

class Sign_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
    }

	public function userCheck($data)
	{
		$uid = $data['uid'];
		$pswd= $data['pswd'];

		$query = $this->db->get_where('maker_admin', ['uid' => $uid], 0, 1);

		foreach ($query->result() as $row) {
			if(password_verify($pswd, $row->pswd)) {
				//fail count init
				return true;
			}
		}

		//fail count up
		return false;
	}

	public function adminCheck($data)
	{
		$uid = explode("@", $data['uid']);
		$pswd= $data['pswd'];

		$query = $this->db->get_where('maker_admin', ['uid' => $uid[0], 'name' => $uid[1]], 0, 1);

		foreach ($query->result() as $row) {
			if(password_verify($pswd, base64_decode($row->pswd))) {
				//fail count init
				return true;
			}
		}

		//fail count up
		return false;
	}

	public function sessionChk()
	{

	}

}
