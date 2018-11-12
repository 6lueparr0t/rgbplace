<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|
|	Used Table : admin_*, user_*
|
*/

class Profile_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
    }

	public function info()
	{
		if($this->session->userdata('admin') === true) {

			$name = $this->session->userdata('name');
			$query = "SELECT * FROM admin_info WHERE name = ? LIMIT 1";
			$find = $this->db->query($query, $name);

		} else {

			$uid = $this->session->userdata('uid');
			$query = "SELECT * FROM user_info WHERE uid = ? LIMIT 1";
			$find = $this->db->query($query, $uid);

		}

		return (array)$find->result()[0];
	}

	public function update($data)
	{
		$uid = $this->session->userdata('uid');

		if(!$data['name']) return false;

		//$query = "UPDATE user_info SET name = ?, email = ?, utim = now() WHERE uid = ? and DATE_FORMAT(utim , '%Y-%m-%d') < DATE_FORMAT(now(), '%Y-%m-%d')";
		
		$set = '';
		if(isset($data['name'])) {
			$set .= "name = '".$this->db->escape_str($data['name'])."', ";
		}

		if(isset($data['email'])) {
			$set .= "email = '".$this->db->escape_str($data['email'])."', ";
		}

		$query = "UPDATE user_info SET {$set} utim = now() WHERE uid = ?";
		$result = $this->db->query( $query, $uid );

		$this->session->unset_userdata( array('name') );
		$this->session->set_userdata( array('name' => $data['name']) );

		return $result;
	}

}
