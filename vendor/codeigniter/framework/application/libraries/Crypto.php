<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|
|	Used Table : None
|
|	Role : 
|
 */

class Crypto {

	protected $CI;

	public function __construct()
	{
		$this->CI =& get_instance();
	}

	public function Encrypt($message) {
	}

	public function Decrypt($message) {
	}

}
