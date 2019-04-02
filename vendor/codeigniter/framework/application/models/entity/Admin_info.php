<?php

/**
 * @Entity @Table(name="admin_info")
 **/

class Admin_info {

	/** @Id @Column(type="integer") @GeneratedValue **/
    protected $sn;

	/** @Column(type="string") **/
	protected $name;

	public function getName()
	{
		return $this->name;
	}

}
