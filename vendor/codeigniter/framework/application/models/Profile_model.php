<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|
|	Used Table : admin_*, user_*
|
*/

class Profile_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

	public function info() {
		if($this->session->userdata('admin') === true) {

			$name = $this->session->userdata('name');
			$query = "SELECT * FROM admin_info WHERE name = ? LIMIT 1";
			$find = $this->db->query($query, $name);

		} else {

			$uid = $this->session->userdata('uid');
			$query = "SELECT * FROM user_info WHERE uid = ? LIMIT 1";
			$find = $this->db->query($query, $uid);

		}

		return (array)$find->row();
	}

	public function update($data) {
		$uid = $this->session->userdata('uid');
		$admin = $this->session->userdata('admin');

		if ($admin === true) {

			$set = '';
			if(isset($data['name']) && $data['name'] != '') {
				$name = $this->session->userdata('name');
				$set .= "name = '".$this->db->escape_str($data['name'])."', ";
			}

			if(isset($data['pswd']) && $data['pswd'] != '') {
				$set .= "pswd = '".base64_encode(password_hash($this->db->escape_str($data['pswd']), PASSWORD_DEFAULT, ['cost' => 12]))."', ";
			}

			$query = "UPDATE admin_info SET {$set} atim = now() WHERE uid = 'admin' and name = ?";
			$result = $this->db->query( $query, $name );

		} else {
			if(!$data['name']) return false;

			//$query = "UPDATE user_info SET name = ?, email = ?, utim = now() WHERE uid = ? and DATE_FORMAT(utim , '%Y-%m-%d') < DATE_FORMAT(now(), '%Y-%m-%d')";

			$set = '';
			if(isset($data['name']) && $data['name'] != '') {
				$set .= "name = '".$this->db->escape_str($data['name'])."', ";
			}

			if(isset($data['email']) && $data['email'] != '') {
				$set .= "email = '".$this->db->escape_str($data['email'])."', ";
			}

			if(isset($data['pswd']) && $data['pswd'] != '') {
				$set .= "pswd = '".base64_encode(password_hash($this->db->escape_str($data['pswd']), PASSWORD_DEFAULT, ['cost' => 12]))."', ";
			}

			$query = "UPDATE user_info SET {$set} utim = now() WHERE uid = ?";
			$result = $this->db->query( $query, $uid );
		}

		$this->session->unset_userdata( array('name') );
		$this->session->set_userdata( array('name' => $data['name']) );

		return $result;
	}

	public function add_post($data) {
		$this->setting($table, $col, $uid);

		$json = "{\"no\":\"{$data['no']}\", \"map\":\"{$data['map']}\", \"title\":\"{$data['title']}\", \"date\":\"".date('Y-m-d H:i:s')."\"}";

		$update = $this->db->query("UPDATE {$table} SET post = JSON_MERGE(post, JSON_QUERY('{\"history\":[".$json."]}', '$')) where {$col} = ? ", $uid);

		return $update;
	}

	public function add_upload($data) {
		$this->setting($table, $col, $uid);

		$json = "{\"file_name\":\"{$data['file_name']}\", \"file_type\":\"{$data['file_type']}\", \"client_name\":\"{$data['client_name']}\", \"file_size\":\"{$data['file_size']}\", \"date\":\"".date('Y-m-d H:i:s')."\"}";

		//select json_merge('{"fileList": []}', JSON_QUERY('{"fileList":[{"date":"2018-09-03","text":"mmmmmmm"}]}', '$')) ;

		$update = $this->db->query("UPDATE {$table} SET upload = JSON_MERGE(upload, JSON_QUERY('{\"history\":[".$json."]}', '$')) where {$col} = ? ", $uid);

		return $update;
	}

	public function add_reply($data) {
		$this->setting($table, $col, $uid);

		$json = "{\"post\":\"{$data['post']}\", \"map\":\"{$data['map']}\", \"no\":\"{$data['no']}\", \"content\":\"{$data['content']}\", \"date\":\"".date('Y-m-d H:i:s')."\"}";

		$update = $this->db->query("UPDATE {$table} SET reply = JSON_MERGE(reply, JSON_QUERY('{\"history\":[".$json."]}', '$')) where {$col} = ? ", $uid);

		return $update;
	}
/*
	public function add_vote($data) {
		$this->setting($table, $col, $uid);

		$json = "{\"no\":\"{$data['no']}\", \"map\":\"{$data['map']}\", \"content\":\"{$data['content']}\", \"date\":\"".date('Y-m-d H:i:s')."\"}";

		$update = $this->db->query("UPDATE {$table} SET vote = JSON_MERGE(vote, JSON_QUERY('{\"history\":[".$json."]}', '$')) where {$col} = ? ", $uid);

		return $update;
	}
*/
	public function update_info($field, $data) {
		$this->setting($table, $col, $uid);

		$history = (array)json_decode($this->db->query("select {$field} from {$table} where {$col} = ? ", $uid)->row()->{$field})->history;

		for($i=count($history); $i>=0; $i--) {
			if($history[$i]->no == $data['no']) {
				$no = $i;
				break;
			}
		}

		if (isset($data['title'])) {
			$update = $this->db->query("UPDATE {$table} SET {$field} = JSON_REPLACE({$field}, '$.history[{$no}].title', '{$data['title']}', '$.history[{$no}].date', '{$data['date']}') where {$col} = ? ", $uid);
		}

		if (isset($data['content'])) {
			$update = $this->db->query("UPDATE {$table} SET {$field} = JSON_REPLACE({$field}, '$.history[{$no}].content', '{$data['content']}', '$.history[{$no}].date', '{$data['date']}') where {$col} = ? ", $uid);
		}

		return $update;
	}

	public function remove_info($field, $data) {
		$this->setting($table, $col, $uid);

		$history = (array)json_decode($this->db->query("select {$field} from {$table} where {$col} = ? ", $uid)->row()->{$field})->history;

		for($i=0; $i<count($history); $i++) {
			if($history[$i]->no == $data['no']) {
				$no = $i;
				break;
			}
		}

		$update = $this->db->query("UPDATE {$table} SET {$field} = JSON_REMOVE({$field}, '$.history[{$no}]') where {$col} = ? ", $uid);

		return $update;
	}

	function setting(&$table, &$col, &$uid) {
		$admin = $this->session->userdata('admin');

		if ($admin === true) {
			$table = 'admin_info';
			$col = 'name';
			$uid = explode('@', $this->session->userdata('uid'))[1];
		} else {
			$table = 'user_info';
			$col = 'uid';
			$uid = $this->session->userdata('uid');
		}
	}

}
