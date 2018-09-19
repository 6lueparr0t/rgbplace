<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Base_model extends CI_Model {

	public function get_map($keyword)
	{
		$data = [];

		$query = "SELECT * FROM map_code WHERE code like '%{$keyword}%' or country like '%{$keyword}%' or global like '%{$keyword}%' or native like '%{$keyword}%' or keyword like '%{$keyword}%'";
		$find = $this->db->query($query);

		foreach ($find->result() as $key => $row) {
			$data['country'][$key] = $row->country;
			$data['map'][$key]    = $row->code.$row->no;
			$data['global'][$key]   = $row->global;
			$data['native'][$key]   = $row->native;
		}

		return $data;
	}

	public function get_stage($uid)
	{
		$data = [];

		$query = "SELECT map FROM user_info WHERE uid='{$uid}'";
		$find = $this->db->query($query);

		if($find->num_rows() === 0 || $find->num_rows() > 1) {
			$data['map'] = DEFAULT_MAP;

			return $data;
		}

		foreach ($find->result() as $row) {
			$data['map'] = $row->map;
		}

		return $data;
	}
/*
 *    public function menu($type)
 *    {
 *        $data = [];
 *
 *        $query = "SELECT * FROM common_menu WHERE type = ?";
 *        $find = $this->db->query($query, $type);
 *
 *        if($find->num_rows() === 0) {
 *            return false;
 *        }
 *
 *        foreach ($find->result() as $key => $row) {
 *            $data['name'][$key] = $row->name;
 *            $data['link'][$key] = $row->link;
 *        }
 *
 *        return $data;
 *    }
 */

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

	public function setAdminApiKey($name)
	{
		$data = "";

		$query = "SELECT no, apikey FROM admin_info WHERE name = '{$name}' and apikey is not null and exp > atim LIMIT 1";
		$find = $this->db->query($query);

		if($find->num_rows() !== 1) {
			$apikey = $this->generateKey();
			$exp = date("Y-m-d H:i:s", time()+(12*60*60));
			$update = $this->db->query("UPDATE admin_info SET apikey='{$apikey}', exp='{$exp}' WHERE name = '{$name}'");
		}

		//echo $this->db->last_query();
		//echo $find->row()->apikey;
		//echo isset($update);

		return true;
	}

	public function setUploadList($data, $admin = 'FALSE')
	{
		if($admin) {
			$table = 'admin_info';
			$col = 'name';
			$uid = explode('@', $this->session->userdata('uid'))[1];
		} else {
			$table = 'user_info';
			$col = 'uid';
			$uid = $this->session->userdata('uid');
		}
		
		$json = "{\"file_name\":\"{$data['file_name']}\", \"file_type\":\"{$data['file_type']}\", \"client_name\":\"{$data['client_name']}\", \"file_size\":\"{$data['file_size']}\"}";

		//select json_merge('{"fileList": []}', JSON_QUERY('{"fileList":[{"date":"2018-09-03","text":"mmmmmmm"}]}', '$')) ;
		
		$update = $this->db->query("UPDATE {$table} SET upload = JSON_MERGE(upload, JSON_QUERY('{\"history\":[".$json."]}', '$')) where {$col} = ? ", $uid);

		return $update;
	}

	function generateKey($length = 20)
	{
        $characters = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ~`!@#$%^&*()_-+=[]{}|\:;\'\"<>?,.";
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }

        return base64_encode(password_hash(microtime().$randomString, PASSWORD_DEFAULT));
    }
}
