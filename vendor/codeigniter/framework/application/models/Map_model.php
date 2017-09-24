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
			echo "<table class='no-result'><tr><td>No Results.</td></tr></table>";

			return false;
		}

		echo "<table class='result'>";
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
	public function list ($map, $type, $start=0, $end=0, $search = null)
	{
		$search_list = ['page', 'method', 'keyword', 'date'];
		$data = [];

		if(isset($search)) {
			for($i=0; $i<count($search_list); $i++) {
				if(array_key_exists($search_list[$i], $search)) {
					$data[$search_list[$i]] = $search[$search_list[$i]];
				}
			}
		}
		
		$where = "type='{$type}'";
		$limit = ($end)?"{$start}, {$end}":"{$start}";

		$query = "SELECT * FROM map_{$map}_post where {$where} ORDER BY no desc LIMIT {$limit}";
		$find = $this->db->query($query);

		echo "<table class='list'>";

		echo "<tr class='list-head'>"
				."<th>No</th>"
				."<th>Title</th>"
				."<th>Hit</th>"
				."<th>Name</th>"
				."<th>Date</th>"
			."</tr>";

		if($find->num_rows() === 0) {
			echo "<tr><td class='no-list' colspan=5>No List</td></tr>";
		}

		// title list
		foreach ($find->result() as $key => $row) {
			$date = ($row->utim <= $row->ctim)? date("Y-m-d", strtotime($row->ctim)) : date("Y-m-d", strtotime($row->utim));

			echo "<tr class='list-row'>"
				."<td class='no'>{$row->no}</td>"
				."<td class='title'><a href='/{$map}/{$row->type}/{$row->no}'>{$row->title}</a>[<a href='/{$map}/{$row->type}/{$row->no}'>{$row->reply}</a>]</td>"
				."<td class='hit'>{$row->hit}</td>"
				."<td class='name'>{$row->name}</td>"
				."<td class='date'>".$date."</td>"
				."</tr>";
		}

		echo "</table>";

		// ****************
		// pagination start
		// ****************


		// get list count (new sql run)
		$where = "type='{$type}'";

		$query = "SELECT count(*) as list_count FROM map_{$map}_post where {$where}";
		$find = $this->db->query($query);

		// sql result only 1
		if($find->num_rows() != 1) {
			return false;
		}

		// all list count / 30 (default)
		foreach ($find->result() as $key => $row) {
			$max = ceil($row->list_count/$end);
			if($max == 0) $max=1;
		}

		$current = 1;

		// 'page' option check
		if(array_key_exists('page', $data)) {
			if($data['page'] <= $max) {
				$current = $data['page'];
			}
		}

		$range = 10;
		$min_page = ((int)$current-(int)$range>0)?(int)$current-(int)$range:1;
		$max_page = ((int)$current+(int)$range>$max)?$max:(int)$current+(int)$range;

		echo "<div class='button'>";
		echo "<span class='refresh'><a href='/{$map}/{$type}/list'>LIST</a></span>";


		echo "<span class='pagination'>";
		echo "<a href='/{$map}/{$type}/list?page={$min_page}'><i class='fa fa-step-backward' aria-hidden='true'></i></a>";
		for($i=(int)$min_page; $i < $current; $i++) {

			if($i == 0) continue;

			$next = $i;
			echo "<a href='/{$map}/{$type}/list?page={$next}'>{$next}</a>";
		}

		for($i=(int)$current; $i <= $max_page; $i++) {

			if($i == 0) continue;

			$next = $i;
			echo "<a href='/{$map}/{$type}/list?page={$next}'>{$next}</a>";
		}

		echo "<a href='/{$map}/{$type}/list?page={$max_page}'><i class='fa fa-step-forward' aria-hidden='true'></i></a>";
		echo "</span>";


		// ****************
		// pagination end
		// ****************

		if($type != "best") {
			echo "<span class='edit enable'><a href='/{$map}/{$type}/0/edit'>EDIT</a></span>";
		} else {
			echo "<span class='edit disable'><a href='/{$map}/{$type}/0/edit'>EDIT</a></span>";
		}

		// pagination + edit button end

		echo "</div>";


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

		echo "<table class='post'>";
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

		echo "<table class='result'>";
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
