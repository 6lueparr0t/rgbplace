<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Map_model extends CI_Model {

	public function total_best($limit)
	{
		$data = [];

		$query = "SELECT * FROM map_total ORDER BY ctim desc LIMIT {$limit}";
		$find = $this->db->query($query);

		if($find->num_rows() === 0) {
			echo "<table class='no-results'><tr><td>No Results.</td></tr></table>";

			return false;
		}

		foreach ($find->result() as $key => $row) {
			echo "<table class='results'>"

			."<tr>"
			."<td>".date("Y-m-d", strtotime($row->ctim))."</td>"
			."<td><div><a href='/{$row->link}'>{$row->title}</a></div></td>"
			."<td>[<a href='/{$row->link}#reply'>{$row->reply}</a>]</div></td>"
			."</tr>"

			."</table>";
		}

		return true;
	}

	public function list ($map, $type, $limit, $search = null)
	{
		$data = [];

		//array_key_exists('', $search);
		$where = "type='{$type}'";

		$query = "SELECT * FROM map_{$map}_post where {$where} ORDER BY no desc LIMIT {$limit}";
		$find = $this->db->query($query);

		if($find->num_rows() === 0) {
			echo "<table class='no-results'><tr><td>No Results.</td></tr></table>";

			return false;
		}

		foreach ($find->result() as $key => $row) {

			$date = ($row->utim <= $row->ctim)? date("Y-m-d", strtotime($row->ctim)) : date("Y-m-d", strtotime($row->utim));

			echo "<table class='results'>"

			."<tr>"
			."<td>{$row->no}</td>"
			."<td><div><a href='/{$map}/{$row->type}/{$row->no}'>{$row->title}</a></div></td>"
			."<td>{$row->reply}</td>"
			."<td>{$row->hits}</td>"
			."<td>{$row->name}</td>"
			."<td>".$date."</td>"
			."</tr>"

			."</table>";

		}

		return true;
	}

	public function page($map, $type, $limit)
	{
		$data = [];

		$query = "SELECT * FROM map_{$map}_post where type='{$type}' ORDER BY no desc LIMIT {$limit}";
		$find = $this->db->query($query);

		if($find->num_rows() === 0) {
			echo "<table class='no-results'><tr><td>No Results.</td></tr></table>";

			return false;
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

	public function post ($map, $type, $num, $search = null)
	{
		$data = [];

		$query = "SELECT * FROM map_{$map}_post where no={$num}";
		$find = $this->db->query($query);

		if($find->num_rows() === 0 && $find->num_rows() >= 2) {
			redirect($this->input->server('http_referer'));

			return false;
		}

		foreach ($find->result() as $key => $row) {

			$date = ($row->utim <= $row->ctim)? date("Y-m-d", strtotime($row->ctim)) : date("Y-m-d", strtotime($row->utim));

			echo "<table class='results'>"

			."<tr>"
			."<td>{$row->no}</td>"
			."<td colspan='4'><div><a href='/{$map}/{$row->type}/{$row->no}'>{$row->title}</a></div></td>"
			."</tr>"

			."<tr>"
			."<td>{$row->reply}</td>"
			."<td>{$row->hits}</td>"
			."<td>{$row->vote}</td>"
			."<td>{$row->name}</td>"
			."<td>".$date."</td>"
			."</tr>"

			."<tr>"
			."<td>{$row->content}</td>"
			."</tr>"

			."</table>";

		}

		return true;
	}
}
