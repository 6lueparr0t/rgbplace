<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/* ######################



###################### */

class Api_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
    }

	public function googleSignUpAndLoginCheck ($data) {
		//$data['uid'];
		//$data['name'];
		//$data['mail'];

		$query = "SELECT user.*, conf.* FROM user_info user INNER JOIN user_conf conf ON user.uid = conf.uid WHERE user.uid = ? AND user.pswd = 'google' LIMIT 1";
		$find = $this->db->query($query, $data['mail']);

		if($find->num_rows() === 1) {

			$ret = array(
				'sn' => $find->row()->sn,
				'name' => $find->row()->name,
			);

			$atim = date("Y-m-d H:i:s");
            $query = "UPDATE user_info SET fail = 0, atim = ? WHERE sn = ?";
			$this->db->query($query, array($atim, $ret['sn']));

			return $ret;
		} else if($find->num_rows() === 0) {
			// use user_info, user_config
			
			$query = "INSERT INTO user_info (uid, name, mail, pswd) VALUES (?, ?, ?, ?)";
			$this->db->query($query, array($data['mail'], $data['name'], $data['mail'], 'google') );

			$ret = array(
				'sn' => $this->db->insert_id(),
				'name' => $data['name'],
			);

			$query = "INSERT INTO user_conf (uid) VALUES (?)";
			$this->db->query($query, $data['mail']);

			return $ret;
		} else {
			return false;
		}
	}

	public function signUpAndLoginCheck ($data, $oauth = '') {
		//$data['uid'];
		//$data['name'];
		//$data['mail'];

		$query = "SELECT user.*, conf.* FROM user_info user INNER JOIN user_conf conf ON user.uid = conf.uid WHERE user.uid = ? AND user.pswd = ? LIMIT 1";
		$find = $this->db->query($query, array($data['uid'], $oauth));

		if($find->num_rows() === 1) {

			$ret = array(
				'sn' => $find->row()->sn,
				'uid' => $data['uid'],
				'name' => $find->row()->name,
			);

			$atim = date("Y-m-d H:i:s");
            $query = "UPDATE user_info SET fail = 0, atim = ? WHERE sn = ?";
			$this->db->query($query, array($atim, $ret['sn']));

			return $ret;
		} else if($find->num_rows() === 0) {
			// use user_info, user_config
			
			$query = "INSERT INTO user_info (uid, name, pswd) VALUES (?, ?, ?)";
			$this->db->query($query, array($data['uid'], $data['name'], $oauth) );

			$ret = array(
				'sn' => $this->db->insert_id(),
				'uid' => $data['uid'],
				'name' => $data['name'],
			);

			$query = "INSERT INTO user_conf (uid) VALUES (?)";
			$this->db->query($query, $data['uid']);

			return $ret;
		} else {
			return false;
		}
	}

	public function searchUploadFile($file_name) {

		$query = "SELECT file_name FROM total_upload WHERE sn = ? AND file_name = ? LIMIT 1";
		$find = $this->db->query($query, array($this->session->userdata('sn'), $file_name) );

		if($find->num_rows() === 1) {
			$searchFileName = $find->row()->file_name;
		}

		return (isset($searchFileName))?$searchFileName:'';

	}

	public function deleteUploadFile($file_name) {

		if($this->session->userdata('admin') === true) {
			$query = "DELETE FROM total_upload WHERE file_name = ?";
			$result = $this->db->query($query, $file_name );
		} else {
			$query = "DELETE FROM total_upload WHERE sn = ? AND file_name = ?";
			$result = $this->db->query($query, array($this->session->userdata('sn'), $file_name) );
		}

		return $result;

	}

	public function postUploadInfoUpdate ($info)
	{
		$table = $this->db->escape_str("map_{$info[1]}_post");
		$type = $info[2];
		$no = $info[3];

		if($this->session->userdata('admin') === true) {
			$query = "update {$table}
				set
					upload = ?

				where
					type = ?
					and no = ?";

			$values = array(
				$this->session->userdata('upload'),

				$type,
				$no,
			);
		} else {
			$query = "update {$table}
				set
					upload = ?


				where
					type = ?
					and no = ?
					and sn = ?
					and uid = ?";

			$values = array(
				$this->session->userdata('upload'),

				$type,
				$no,
				$this->session->userdata('sn'),
				$this->session->userdata('uid')
			);
		}

		//echo $query;
		//print_r($values);
		//exit();

		if($this->db->query($query, $values)) {
			$ret = $no;
			$this->session->unset_userdata('upload');
		}

		return $ret;
	}
}
