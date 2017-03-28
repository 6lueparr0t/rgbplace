<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Base_model extends CI_Model {

	public function getInfo($uid)
	{
		$query = "SELECT * FROM user_info WHERE uid = ? LIMIT 1";

		$find = $this->db->query($query, $uid);

		if($find->num_rows() === 0 || $find->num_rows() > 1) {
			return false;
		}

		foreach ($find->result() as $row) {
			$btim = $row->btim;
		}

		if(date("Y-m-d H:i:s") > $btim && $btim) return false;

		return true;
	}

	function getUserMenu($type)
	{
	}
	function getAdminMenu($type)
	{

		$data = [];

		$query = "SELECT * FROM admin_menu WHERE type = ?";
		$find = $this->db->query($query, $type);

		foreach ($find->result() as $key => $row) {
			$data[$key] = $row->name;
		}

		return $data;
	}

}
