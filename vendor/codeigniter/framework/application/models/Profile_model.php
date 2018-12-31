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
		$table = 'total_post';
		$this->setting($uid, $name);

		$query = $this->db->query("INSERT INTO {$table}
			(
				`uid`,
				`name`,
				`post`,
				`map`,
				`title`
			) VALUES (?, ?, ?, ?, ?);", array($uid, $name, $data['no'], $data['map'], $data['title']));

		return $query;
	}

	public function add_upload($data) {
		$table = 'total_upload';
		$this->setting($uid, $name);

		$query = $this->db->query("INSERT INTO {$table}
		(
			`uid`,
			`name`,
			`client_name`,
			`file_name`,
			`file_type`,
			`file_size`
		) VALUES (?, ?, ?, ?, ?, ?);", array($uid, $name, $data['client_name'], $data['file_name'], $data['file_type'], $data['file_size']) );

		return $query;
	}

	public function add_reply($data) {
		$table = 'total_reply';
		$this->setting($uid, $name);

		$query = $this->db->query("INSERT INTO {$table}
		(
			`uid`,
			`name`,
			`post`,
			`reply`,
			`map`,
			`content`
		) VALUES (?, ?, ?, ?, ?, ?);", array($uid, $name, $data['post'], $data['no'], $data['map'], $data['content']) );

		return $query;
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
		$table = 'total_'.$field;
		$this->setting($uid, $name);

		if (isset($data['title'])) {
			$update = $this->db->query("UPDATE {$table}
				SET
					title = ?,
					date = ? where uid = ? and map = ? and post = ? ",
			array($data['title'], $data['date'], $uid, $data['map'], $data['no']) );
		}

		if (isset($data['content'])) {
			$update = $this->db->query("UPDATE {$table}
				SET
					content = ?,
					date = ? where uid = ? and map = ? and reply = ? ",
			array($data['content'], $data['date'], $uid, $data['map'], $data['no']) );
		}

		return $update;
	}

	public function remove_info($field, $data) {
		$table = 'total_'.$field;
		$this->setting($uid, $name);

		$update = $this->db->query("DELETE FROM {$table} where uid = ? and map = ? and {$field} = ? ", array($uid, $data['map'], $data['no']) );

		return $update;
	}

	function setting(&$uid, &$name) {
		$admin = $this->session->userdata('admin');

		if ($admin === true) {
			$info = explode('@', $this->session->userdata('uid'));
			$uid = $info[0];
			$name = $this->session->userdata('name');
		} else {
			$uid = $this->session->userdata('uid');
			$name = $this->session->userdata('name');
		}
	}

}
