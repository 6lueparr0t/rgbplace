<?php

/**
 * @Entity @Table(name="user_info")
 **/

class User_info {

	/** @Id @Column(type="integer") @GeneratedValue **/
    private $sn;

	/** @Column(type="string") **/
	private $msg;

	public function getMsg()
	{
		return $this->msg;
	}

	public function getMsgCount()
	{
		return count((array)json_decode($this->msg)->total);
	}

}
