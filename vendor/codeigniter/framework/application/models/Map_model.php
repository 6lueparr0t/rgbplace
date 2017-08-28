<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Map_model extends CI_Model {

	public function best_list($limit)
	{
		$data = [];

		$query = "SELECT * FROM map_total ORDER BY ctim desc LIMIT {$limit}";
		$find = $this->db->query($query);

		if($find->num_rows() === 0) {
			echo "<table class='no-results'><tr><td>No Results.</td></tr></table>";

			return true;
		}

		foreach ($find->result() as $key => $row) {
			echo "<table class='results'>"

			."<tr>"
			."<td>".date("Y-m-d", strtotime($row->ctim))."</td>"
			."<td><div><a href='/{$row->link}'>{$row->title}</a></div></td>"
			."<td>[<a href='/{$row->link}#reply'>{$row->reply}</a>]</div></td>"
			."</tr>"

			."</table>";

			//$data['title'][$key]   = $row->title;
			//$data['content'][$key] = $row->content;
			//$data['ctim'][$key]    = $row->ctim;
		}

		return true;
	}

	public function page_list($map, $type, $limit)
	{
		$data = [];

		$query = "SELECT * FROM map_{$map}_post where type='{$type}' ORDER BY no desc LIMIT {$limit}";
		$find = $this->db->query($query);

		if($find->num_rows() === 0) {
			echo "<table class='no-results'><tr><td>No Results.</td></tr></table>";

			return true;
		}

		foreach ($find->result() as $key => $row) {
			echo "<table class='results'>"

			."<tr>"
			."<td>".date("Y-m-d", strtotime($row->ctim))."</td>"
			."<td><div><a href='/{$map}/{$row->type}/{$row->no}'>{$row->title}</a></div></td>"
			."<td>[<a href='/{$map}/{$row->type}/{$row->no}#reply'>{$row->reply}</a>]</td>"
			."</tr>"

			."</table>";

			//$data['title'][$key]   = $row->title;
			//$data['content'][$key] = $row->content;
			//$data['ctim'][$key]    = $row->ctim;
		}

		return true;
	}
}
