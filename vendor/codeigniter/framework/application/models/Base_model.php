<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Base_model extends CI_Model {

	public function getMainPost($map) {
		
		$query = "SELECT * FROM map_{$map}_post WHERE type = 'best' ORDER BY no desc LIMIT 1";


		if($this->db->simple_query($query)) {

			$find = $this->db->query($query);
			if ($find->num_rows() === 0) {
				$result = array();
			} else {
				$result = $find->result()[0];
			}

		} else {

			redirect("/");

		}

		return $result;
	}

	public function getMap($keyword)
	{
		$data = [];

		$query = "SELECT * FROM map_code WHERE code like '%{$keyword}%' or country like '%{$keyword}%' or global like '%{$keyword}%' or native like '%{$keyword}%' or keyword like '%{$keyword}%'";
		$find = $this->db->query($query);

		foreach ($find->result() as $key => $row) {
			$data['country'][$key] = $row->country;
			$data['map'][$key]    = $row->name;
			$data['global'][$key]   = $row->global;
			$data['native'][$key]   = $row->native;
		}

		return $data;
	}

	public function getMapTItle($name) {
		$data = [];

		$query = "SELECT native, global FROM map_code WHERE name = ?";
		$find = $this->db->query($query, array($name));

		foreach ($find->result() as $key => $row) {
			$data['global'][$key]   = $row->global;
			$data['native'][$key]   = $row->native;
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

	public function getBannedInfo($uid)
	{
		$query = "SELECT * FROM user_info WHERE uid = ? LIMIT 1";

		$find = $this->db->query($query, $uid);

		if($find->num_rows() === 0 || $find->num_rows() > 1) {
			return false;
		}

		foreach ($find->result() as $row) {
			$btim = $row->btim;
		}

		if(date("Y-m-d H:i:s") < $btim && $btim) return $btim;

		return 0;
	}

	public function setAdminApiKey($name)
	{
		$data = "";

		$query = "SELECT sn, apikey FROM admin_info WHERE name = '{$name}' and apikey is not null and exp > atim LIMIT 1";
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

	public function createMap($data)
	{
		//$result = $this->db->query("
			//SET @p0='South Korea';
			//SET @p1='kr';
			//SET @p2='".json_encode($data[0], JSON_UNESCAPED_UNICODE)."';
			//SET @p3='".json_encode($data[1])."';
			//CALL `create_map`(@p0, @p1, @p2, @p3); 
		//");
		
		if(!$data['country'] || !$data['code'] || !isset($data['address'][0]) || !isset($data['address'][1]) ) return false;

		$this->db->trans_start();
		$this->db->query("SET @p0='".implode('|',$data['country'])."'");
		$this->db->query("SET @p1='".strtolower($data['code'])."'");
		$this->db->query("SET @p2='".json_encode($data['address'][0], JSON_UNESCAPED_UNICODE)."'");
		$this->db->query("SET @p3='".json_encode($data['address'][1])."'");
		$this->db->query("SET @p4='".$data['description']."'");
		$this->db->query("SET @p5='".$data['keyword']."'");
		$this->db->query("SET @p6='".$data['latitude']."'");
		$this->db->query("SET @p7='".$data['longitude']."'");
		$this->db->query("CALL `createMap`(@p0, @p1, @p2, @p3, @p4, @p5, @p6, @p7);");
		$this->db->trans_complete();

		return true;
	}

	public function destroyMap($data)
	{
		if(!$data['code'] || !$data['num']) return false;

		$this->db->trans_start();
		$this->db->query("SET @p0='".$data['code']."';");
		$this->db->query("SET @p1='".$data['num']."';");
		$this->db->query("CALL `destroyMap`(@p0, @p1);");
		$this->db->trans_complete();

		return true;
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
