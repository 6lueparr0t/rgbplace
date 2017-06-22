<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Init_model extends CI_Model {

	public $title;
	public $content;
	public $date;

	public function get_last_ten_entries()
	{
		$query = $this->db->get('entries', 10);
		return $query->result();
	}

	public function insert_entry()
	{
		$this->title    = $_POST['title']; // please read the below note
		$this->content  = $_POST['content'];
		$this->date     = time();

		$this->db->insert('entries', $this);

/*
		if($query->num_rows()!=0) {
			foreach ($query->result() as $row) {
				return $row->table_name;
			}
		}

		if($query->num_rows()==0) return 0;

		return $query;
*/
	}

	public function update_entry()
	{
		$this->title    = $_POST['title'];
		$this->content  = $_POST['content'];
		$this->date     = time();

		$this->db->update('entries', $this, array('id' => $_POST['id']));
	}

}
