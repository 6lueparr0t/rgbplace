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

		$query = "SELECT user.*, conf.* FROM user_info user INNER JOIN user_conf conf ON user.uid = conf.uid WHERE user.mail = ? AND user.pswd = 'google' LIMIT 1";
		$find = $this->db->query($query, $data['mail']) ;

		if($find->num_rows() === 1) {
			return true;
		} else if($find->num_rows() === 0) {
			// use user_info, user_config
			
			$query = "INSERT INTO user_info (uid, name, mail, pswd) VALUES (?, ?, ?)";
			$this->db->query($query, array($data['uid'], $data['name'], $data['mail'], 'google') );

			$query = "INSERT INTO user_conf (uid) VALUES (?)";
			$this->db->query($query, $data['uid']);

			return true;
		} else {
			return false;
		}
	}
}
