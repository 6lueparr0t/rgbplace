<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|
|	Used Table : user_*
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

		$query = "SELECT * FROM user_info WHERE uid = ? AND fail < 20 LIMIT 1";
		$find = $this->db->query($query, $uid);

		foreach ($find->result() as $row) {
			if(password_verify($pswd,  base64_decode($row->pswd))) {
				//fail count init
				$query = "UPDATE user_info SET fail = 0 WHERE uid = ?";
				$this->db->query($query, $uid);

				return $result = [
									'name' => $row->name,
									'score' => $row->score,
									'code' => $row->code,
									'atim' => $row->atim
								];
			} else {
				//fail count increase
				$query = "UPDATE user_info SET fail = fail + 1 WHERE uid = ?";
				$this->db->query($query, $uid);

				return false;
			}
		}

		return false;
	}

	public function adminCheck($data)
	{
		$uid = explode("@", $data['uid']);
		$pswd= $data['pswd'];

		$query = "SELECT * FROM user_admin WHERE uid = ? AND name = ? AND fail < 5 LIMIT 5";
		$find = $this->db->query($query, [$uid[0], $uid[1]]);

		foreach ($find->result() as $row) {
			if(password_verify($pswd, base64_decode($row->pswd))) {
				//fail count init
				$query = "UPDATE user_admin SET fail = 0 WHERE uid = ? AND name = ?";
				$this->db->query($query, [$uid[0], $uid[1]]);

				return $result = [
									'name' => $row->name
								];
			} else {
				//fail count increase
				$query = "UPDATE user_admin SET fail = fail + 1 WHERE uid = ? AND name = ?";
				$this->db->query($query, [$uid[0], $uid[1]]);

				return false;
			}
		}

		return false;
	}

	public function userMake($data)
	{
		$uid = $data['uid'];
		$name= $data['name'];
		$pswd= base64_encode(password_hash($data['pswd'], PASSWORD_DEFAULT, ['cost' => 12]));

		$query = "SELECT uid FROM user_info WHERE uid = ? LIMIT 1";
		$find = $this->db->query($query, $uid);

		if($find->num_rows() ===0) {
			// use user_info, user_config
			
			$query = "INSERT INTO user_info (uid, name, pswd) VALUES (?, ?, ?)";
			$this->db->query($query, [$uid, $name, $pswd]);

			$query = "INSERT INTO user_conf (uid) VALUES (?)";
			$this->db->query($query, $uid);

			return true;
		}
		
		return false;
	}

	public function sessionChk()
	{

	}

}
