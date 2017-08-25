<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Map_model extends CI_Model {

/*
 *    public function get_map($keyword)
 *    {
 *        $data = [];
 *
 *        $query = "SELECT * FROM map_code WHERE code like '%{$keyword}%' or country like '%{$keyword}%' or place like '%{$keyword}%' or keyword like '%{$keyword}%'";
 *        $find = $this->db->query($query);
 *
 *        foreach ($find->result() as $key => $row) {
 *            $data['country'][$key] = $row->country;
 *            $data['map'][$key]    = $row->code.$row->no;
 *            $data['place'][$key]   = $row->place;
 *        }
 *
 *        return $data;
 *    }
 *
 *    public function get_stage($uid)
 *    {
 *        $data = [];
 *
 *        $query = "SELECT map FROM user_info WHERE uid='{$uid}'";
 *        $find = $this->db->query($query);
 *
 *        if($find->num_rows() === 0 || $find->num_rows() > 1) {
 *            $data['map'] = 'sea';
 *
 *            return $data;
 *        }
 *
 *        foreach ($find->result() as $row) {
 *            $data['map'] = $row->map;
 *        }
 *
 *        return $data;
 *    }
 *
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
 *
 *    public function getInfo($uid)
 *    {
 *        $query = "SELECT * FROM user_info WHERE uid = ? LIMIT 1";
 *
 *        $find = $this->db->query($query, $uid);
 *
 *        if($find->num_rows() === 0 || $find->num_rows() > 1) {
 *            return false;
 *        }
 *
 *        foreach ($find->result() as $row) {
 *            $btim = $row->btim;
 *        }
 *
 *        if(date("Y-m-d H:i:s") > $btim && $btim) return false;
 *
 *        return true;
 *    }
 *
 *    public function getAdminApiKey($name)
 *    {
 *        $data = "";
 *
 *        $query = "SELECT no, apikey FROM admin_info WHERE name = '{$name}' and apikey is not null and exp > atim LIMIT 1";
 *        $find = $this->db->query($query);
 *
 *        if($find->num_rows() !== 1) {
 *            $apikey = $this->generateKey();
 *            $exp = date("Y-m-d H:i:s", time()+(12*60*60));
 *
 *            $this->db->query("UPDATE admin_info SET apikey='{$apikey}', exp='{$exp}' WHERE name = '{$name}'");
 *        }
 *
 *        foreach ($find->result() as $key => $row) {
 *            $data = $row->apikey;
 *        }
 *
 *        return $data;
 *    }
 *
 *    function generateKey($length = 20) {
 *        $characters = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ~`!@#$%^&*()_-+=[]{}|\:;\'\"<>?,.";
 *        $charactersLength = strlen($characters);
 *        $randomString = '';
 *        for ($i = 0; $i < $length; $i++) {
 *            $randomString .= $characters[rand(0, $charactersLength - 1)];
 *        }
 *
 *        return base64_encode(password_hash(time().$randomString, PASSWORD_DEFAULT));
 *    }
 */

	public function total_best_list($limit)
	{
		$data = [];

		$query = "SELECT * FROM map_total ORDER BY ctim desc LIMIT {$limit}";
		$find = $this->db->query($query);

		if($find->num_rows() === 0) {
			echo "<table class='no-results'><tr><td>No Results.</td></tr></table>";

			return true;
		}

		foreach ($find->result() as $key => $row) {
			echo "<table class='results'>"

			."<tr>"
			."<td>".date("Y-m-d", strtotime($row->ctim))."</td>"
			."<td><div><a href='/{$row->link}'>{$row->title}</a></div></td>"
			."<td>[<a href='/{$row->link}#reply'>{$row->reply}</a>]</div></td>"
			."</tr>"

			."</table>";

			//$data['title'][$key]   = $row->title;
			//$data['content'][$key] = $row->content;
			//$data['ctim'][$key]    = $row->ctim;
		}

		return true;
	}

	public function page_type_list($map, $type, $limit)
	{
		$data = [];

		$query = "SELECT * FROM map_{$map}_post where type='{$type}' ORDER BY no desc LIMIT {$limit}";
		$find = $this->db->query($query);

		if($find->num_rows() === 0) {
			echo "<table class='no-results'><tr><td>No Results.</td></tr></table>";

			return true;
		}

		foreach ($find->result() as $key => $row) {
			echo "<table class='results'>"

			."<tr>"
			."<td>".date("Y-m-d", strtotime($row->ctim))."</td>"
			."<td><div><a href='/{$map}/{$row->type}/{$row->no}'>{$row->title}</a></div></td>"
			."<td>[<a href='/{$map}/{$row->type}/{$row->no}#reply'>{$row->reply}</a>]</td>"
			."</tr>"

			."</table>";

			//$data['title'][$key]   = $row->title;
			//$data['content'][$key] = $row->content;
			//$data['ctim'][$key]    = $row->ctim;
		}

		return true;
	}
}