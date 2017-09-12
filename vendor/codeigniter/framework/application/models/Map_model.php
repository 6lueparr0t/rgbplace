<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Map_model extends CI_Model {

	/*
	 * ====================
	 * Usage : $this->map->link ( map code, post num )
	 * Desc : simple link. use for redirect "$this->map->post".
	 * ====================
	 */
	public function link ($map, $num) {
		$data = "";

		$where = "no={$num}";

		$query = "SELECT type FROM map_{$map}_post where {$where}";
		$find = $this->db->query($query);

		if($find->num_rows() === 0 || $find->num_rows() >= 2) {
			return null;
		}

		foreach ($find->result() as $key => $row) {
			$data = $row->type;
		}

		return $data;
	}

	/*
	 * ====================
	 * Usage : $this->map->page ( map code, all type, limit )
	 * Desc : get 'post' list. use only map/page.php
	 *
	 * Limit ?
	 * ex: select ~ from ~ where ~ LIMIT start, count
	 * ====================
	 */
	public function page($map, $type, $limit)
	{
		$data = [];

		$query = "SELECT * FROM map_{$map}_post where type='{$type}' ORDER BY no desc LIMIT {$limit}";
		$find = $this->db->query($query);

		if($find->num_rows() === 0) {
			echo "<table class='no-results'><tr><td>No Results.</td></tr></table>";

			return false;
		}

		echo "<table class='results'>";
		foreach ($find->result() as $key => $row) {
			echo "<tr>"
				."<td class='date'>".date("Y-m-d", strtotime($row->ctim))."</td>"
				."<td class='title'><div><a href='/{$map}/{$row->type}/{$row->no}'>{$row->title}</a></div></td>"
				."<td class='reply'>[<a href='/{$map}/{$row->type}/{$row->no}#reply'>{$row->reply}</a>]</td>"
			."</tr>";

			//$data['title'][$key]   = $row->title;
			//$data['content'][$key] = $row->content;
			//$data['ctim'][$key]    = $row->ctim;
		}
		echo "</table>";

		return true;
	}

	/*
	 * ====================
	 * Usage : $this->map->list ( map code, all type, limit )
	 * Desc : get classification list.
	 * ====================
	 */
	public function list ($map, $type, $limit, $search = null)
	{
		$data = [];

		//array_key_exists('', $search);
		
		$where = "type='{$type}'";
		//$limit = ($limit_end)?"{$limit_start}, {$limit_end}":"{$limit_start}";

		$query = "SELECT * FROM map_{$map}_post where {$where} ORDER BY no desc LIMIT {$limit}";
		$find = $this->db->query($query);

		if($find->num_rows() === 0) {
			echo "<div class='no-list'>No List.</div>";

			return false;
		}

		echo "<table class='results'>";
		foreach ($find->result() as $key => $row) {
			$date = ($row->utim <= $row->ctim)? date("Y-m-d", strtotime($row->ctim)) : date("Y-m-d", strtotime($row->utim));

			echo "<tr>"
				."<td class='no'>{$row->no}</td>"
				."<td class='title'><a href='/{$map}/{$row->type}/{$row->no}'>{$row->title}</a></td>"
				."<td class='reply'>{$row->reply}</td>"
				."<td class='hit'>{$row->hit}</td>"
				."<td class='name'>{$row->name}</td>"
				."<td class='date'>".$date."</td>"
			."</tr>";
		}
		echo "</table>";

		// pagination + edit button
		// count($find->result());

		return true;
	}

	/*
	 * ====================
	 * Usage : $this->map->post ( map code, post type, post number )
	 * Desc : get 'post'
	 * ====================
	 */
	public function post ($map, $type, $num)
	{
		$data = [];

		$query = "SELECT * FROM map_{$map}_post where no={$num} and dtim is null";
		$find = $this->db->query($query);

		if($find->num_rows() === 0 || $find->num_rows() >= 2) {
			echo "<div class='no-post'>No Post.</div>";

			return false;
		}

		echo "<table class='results'>";
		foreach ($find->result() as $key => $row) {
			$date = ($row->utim <= $row->ctim)? date("Y-m-d", strtotime($row->ctim)) : date("Y-m-d", strtotime($row->utim));

			echo "<tr>"
				."<td class='no' >{$row->no}</td>"
				."<td class='title'><a href='/{$map}/{$row->type}/{$row->no}'>{$row->title}</a></td>"
			."</tr>"

			."<tr>"
				."<td class='reply'>{$row->reply}</td>"
				."<td class='hit'>{$row->hit}</td>"
				."<td class='vote'>{$row->vote}</td>"
				."<td class='name'>{$row->name}</td>"
				."<td class='date'>".$date."</td>"
			."</tr>"

			."<tr>"
				."<td id='post-content'>{$row->content}</td>"
			."</tr>";
		}
		echo "</table>";

		// modify + delete button

		return true;
	}

	/*
	 * ====================
	 * Usage : $this->map->reply ( map code, post type, post number, (OPTION) search )
	 * Desc : show all reply in 'post'
	 * ====================
	 */
	public function reply ($map, $type, $num, $search = null)
	{
		$data = [];

		$query = "SELECT * FROM map_{$map}_reply where follow={$num} and dtim is null order by if(isnull(head), no, head), ctim";
		$find = $this->db->query($query);

		if($find->num_rows() === 0) {
			echo "<div class='no-replies'>No Replies.</div>";

			return false;
		}

		echo "<table class='results'>";
		foreach ($find->result() as $key => $row) {
			$date = ($row->utim <= $row->ctim)? date("Y-m-d", strtotime($row->ctim)) : date("Y-m-d", strtotime($row->utim));

			echo "<tr>"
				."<td class='name'>{$row->name}</td>"
				."<td class='content' style='width:200px;'>{$row->content}</td>"
				."<td class='date'>{$date}</td>"
				."<td class='func'>  <i class='fa fa-ellipsis-v' aria-hidden='true'></i></td>"
				."<td class='edit'>  <i class='fa fa-pencil'     aria-hidden='true'></i></td>"
				."<td class='delete'><i class='fa fa-trash'      aria-hidden='true'></i></td>"
				."<td class='report'><i class='fa fa-meh-o'      aria-hidden='true'></i></td>"
				."<td class='add'>   <i class='fa fa-plus'       aria-hidden='true'></i></td>"
			."</tr>";

			//echo "<tr>"
				//."<td class='name'>{$row->name}</td>"
				//."<td class='content'><div>{$row->content}</div></td>"
				//."<td class='date'>{$date}</td>"
				//."<td class='func'>"
					//."<i class='fa fa-pencil' aria-hidden='true'></i> <i class='fa fa-trash' aria-hidden='true'></i> <i class='fa fa-meh-o' aria-hidden='true'></i>"
				//."</td>"
			//."</tr>"
			//."<tr>"
				//."<td colspan='3' class='add'><div contentEditable='true'></div></td>"
			//."</tr>";
		}
		echo "</table>";

		//input reply text box

		return true;
	}
}
