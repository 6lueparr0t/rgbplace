<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Info_model extends CI_Model {

	public function updateUploadList($data, $admin = 'FALSE')
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

	// need modify
	public function updatePostList($data, $admin = 'FALSE')
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
		
		$update = $this->db->query("UPDATE {$table} SET post = JSON_MERGE(post, JSON_QUERY('{\"history\":[".$json."]}', '$')) where {$col} = ? ", $uid);

		return $update;
	}

	// need modify
	public function updateReplyList($data, $admin = 'FALSE')
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
		
		$update = $this->db->query("UPDATE {$table} SET reply = JSON_MERGE(reply, JSON_QUERY('{\"history\":[".$json."]}', '$')) where {$col} = ? ", $uid);

		return $update;
	}

	// need modify
	public function updateVoteList($data, $admin = 'FALSE')
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
		
		$update = $this->db->query("UPDATE {$table} SET vote = JSON_MERGE(vote, JSON_QUERY('{\"history\":[".$json."]}', '$')) where {$col} = ? ", $uid);

		return $update;
	}

	// need modify
	public function updateReportList($data, $admin = 'FALSE')
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
		
		$update = $this->db->query("UPDATE {$table} SET report = JSON_MERGE(report, JSON_QUERY('{\"history\":[".$json."]}', '$')) where {$col} = ? ", $uid);

		return $update;
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
