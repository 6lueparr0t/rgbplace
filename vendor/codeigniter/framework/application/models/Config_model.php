<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|
|	Used Table : user_conf
|
*/

class Config_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
    }

	public function stageSave($data)
	{
		$query = "UPDATE user_info SET map = ? WHERE uid = ?";
		$result = $this->db->query($query, array($data['map'], $data['uid']));

		/*
		if($this->db->affected_rows() > 0) {
			$result = false; 	
		} else {
			$result = false; 
		}
		*/

		return $result;
	}

	public function darkmodeOnOff($data)
	{
		$query = "UPDATE user_conf SET dark_sw = ? WHERE uid = ?";
		$result = $this->db->query($query, array($data['darkmode'], $data['uid']));

		return $result;
	}

}
