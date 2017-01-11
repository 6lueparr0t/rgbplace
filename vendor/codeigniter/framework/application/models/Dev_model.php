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

		$sql = "SELECT uid, pswd FROM maker_admin WHERE uid = ?";
		$query = $this->db->query( $sql, array('admin') );

		if ($query->num_rows()!=1) return false;

		foreach ($query->result() as $row) {
			if(password_verify($pswd, $row->pswd)) {
				return true;
			}
		}

		return false;
	}

	public function adminSessionChk()
	{

	}

}
