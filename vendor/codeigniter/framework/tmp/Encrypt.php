<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|
|	Used Table : None
|
|	Role : 
|
 */

class Secret{

	protected $CI;
	protected $cipher;
	protected $key;


	public function __construct()
	{
		$this->CI =& get_instance();
		$cipher = CIPHER_METHOD;
		$key = CIPHER_KEY;
	}

	public function Encrypt($message) {

	}

	public function Decrypt($message) {
	}

}
