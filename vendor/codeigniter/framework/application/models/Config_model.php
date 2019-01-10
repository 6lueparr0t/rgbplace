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

	public function darkmodeOnOff($data)
	{
		$query = "UPDATE user_conf SET dark_sw = ? WHERE uid = ?";
		$result = $this->db->query($query, array($data['darkmode'], $data['uid']));

		return $result;
	}

}
