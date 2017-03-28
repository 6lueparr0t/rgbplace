<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|
|	Used Table : user_admin
|
*/

class Admin_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
    }

	public function user ($action = "")
	{

		switch($action) {
			case "select" :
				echo ("select:");
			break;
			case "insert" :
				echo ("insert:");
				break;
			case "update" :
				echo ("update:");
				break;
			case "delete" :
				echo ("delete:");
				break;
			default :
		}

	}

}
