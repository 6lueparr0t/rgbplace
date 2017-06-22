<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Base_model extends CI_Model {

	public function map($keyword)
	{
		$data = [];

		$query = "SELECT * FROM map_code WHERE place like '%{$keyword}%' or keyword like '%{$keyword}%'";
		$find = $this->db->query($query);

		foreach ($find->result() as $key => $row) {
			$data['country'][$key] = $row->country;
			$data['code'][$key] = $row->code.$row->no;
			$data['place'][$key] =$row->place;
		}

		return $data;
	}

	public function menu($type)
	{
		$data = [];

		$query = "SELECT * FROM common_menu WHERE type = ?";
		$find = $this->db->query($query, $type);

		if($find->num_rows() === 0) {
			return false;
		}

		foreach ($find->result() as $key => $row) {
			$data['name'][$key] = $row->name;
			$data['link'][$key] = $row->link;
		}

		return $data;
	}

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

	public function getAdminApiKey($name)
	{
		$data = "";

		$query = "SELECT no, apikey FROM admin_info WHERE name = '{$name}' and apikey is not null and exp > atim LIMIT 1";
		$find = $this->db->query($query);

		if($find->num_rows() !== 1) {
			$apikey = $this->generateKey();
			$exp = date("Y-m-d H:i:s", time()+(12*60*60));

			$this->db->query("UPDATE admin_info SET apikey='{$apikey}', exp='{$exp}' WHERE name = '{$name}'");
		}

		foreach ($find->result() as $key => $row) {
			$data = $row->apikey;
		}

		return $data;
	}

	function generateKey($length = 20) {
        $characters = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ~`!@#$%^&*()_-+=[]{}|\:;\'\"<>?,.";
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }

        return base64_encode(password_hash(time().$randomString, PASSWORD_DEFAULT));
    }
}
