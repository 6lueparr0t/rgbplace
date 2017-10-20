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
			echo "<table class='no-page'><tr><td>No Results.</td></tr></table>";

			return false;
		}

		echo "<table class='page'>";
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
			$no = $row->no;

			$title = "<a href='/{$map}/{$row->type}/{$row->no}'>{$row->title}</a>";
			$date = ($row->utim <= $row->ctim)? date("Y-m-d", strtotime($row->ctim)) : date("Y-m-d", strtotime($row->utim));
			$time = ($row->utim <= $row->ctim)? date("H:i:s", strtotime($row->ctim)) : date("H:i:s", strtotime($row->utim));

			$reply = ($row->reply > 0)?"<a href='/{$map}/{$row->type}/{$row->no}'> <i class='fa fa-commenting-o' aria-hidden='true'></i> {$row->reply}</a>":"";

			$toggle = "<div class='toggle'><span class='toggle-name'>{$row->name}</span> <span class='toggle-date'>{$date} {$time}</span></div>";

			echo "<tr class='list-row'>"
				."<td class='no'>{$row->no}</td>"
				."<td class='title'>"
					."{$title} {$reply}"
					."{$toggle}"
				."</td>"
				."<td class='hit'>{$row->hit}</td>"
				."<td class='name'>{$row->name}</td>"
				."<td class='date' title='{$date} {$time}'>{$date}</td>"
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

		// ** button-group class start
		echo "<div class='button-group'>";
		echo "<a class='refresh' href='/{$map}/{$type}/list'><span>LIST</span></a>";


		echo "<div class='pagination'>";
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
		echo "</div>";

		// ****************
		// pagination end
		// ****************

		$activate = "disable";
		if($type != "best") $activate = "enable";
		echo "<a class='edit {$activate}' href='/{$map}/{$type}/0/edit'><span>EDIT</span></a>";

		// ** button-group class end
		echo "</div>";

		// ** search-group class start
		echo "<div class='search-group'>";

		echo "<span class='null'></span>";

		echo "<input type='text' class='search-input' value='' placeholder='Search Tag .. [ ex : #tag_name1 #tag_name2 ]'/>";
		echo "<div class='search-button'><i class='fa fa-search' aria-hidden='true'></i></div>";
		echo "<span class='null'></span>";

		
		// ** search-group class end
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
			echo "<div class='no-post'>Not Found <i class='fa fa-frown-o' aria-hidden='true'></i> </div>";

			return false;
		}

		echo "<div class='post'>";
		foreach ($find->result() as $key => $row) {
			$date = ($row->utim <= $row->ctim)? date("Y-m-d", strtotime($row->ctim)) : date("Y-m-d", strtotime($row->utim));
			$time = ($row->utim <= $row->ctim)? date("H:i:s", strtotime($row->ctim)) : date("H:i:s", strtotime($row->utim));
			$no = $row->no;
			$uid= $row->uid;

			echo "<div class='post-title'><a href='/{$map}/{$row->type}/{$no}'>{$row->title}</a></div>";
			echo "<div class='post-date' ><i class='fa fa-clock-o' aria-hidden='true'></i> {$date} {$time} </div>";

			//."<span class='vote'>{$row->vote}</span>"
			echo "<div class='post-info'>"
				."<span class='name' ><i class='fa fa-user' aria-hidden='true'></i> {$row->name} </span>"
				."<span class='hit'  ><i class='fa fa-eye' aria-hidden='true'></i> {$row->hit} </span>"
				."<span class='reply'><i class='fa fa-commenting-o' aria-hidden='true'></i> {$row->reply} </span>"
			."</div>"

			."<div id='post-conetent'>{$row->content}</div>";
		}
		echo "</div>";

		// permission check
		$activate = "disable";
		if ($this->session->userdata('uid') === $uid || $this->session->userdata('admin')) $activate = "enable";

		// modify + delete button
		echo "<div class='button-group'>"
			."<span class='null'></span>"
			."<a class='edit {$activate}' href='/{$map}/{$type}/{$no}/edit'><span>edit</span></a>"
			."<a class='delete {$activate}' href='/{$map}/{$type}/{$no}/delete'><span>delete</span></a>"
		."</div>";

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

		$query = "SELECT * FROM map_{$map}_reply where post={$num} order by if(isnull(follow), no, follow), depth1, depth2, depth3, depth4, depth5, depth6, depth7, depth8, depth9, depth10, ctim";
		$find = $this->db->query($query);

		if($find->num_rows() === 0) {
			echo "<div class='reply'>";
			$this->message();
			echo "</div>";
			return false;
		}

		echo "<div class='reply'>";
		echo "<ul>";

		$cnt = 0;
		foreach ($find->result() as $key => $row) {
			$cnt++;

			$date   = ($row->utim <= $row->ctim)? date("Y-m-d", strtotime($row->ctim)) : date("Y-m-d", strtotime($row->utim));
			$time   = ($row->utim <= $row->ctim)? date("H:i:s", strtotime($row->ctim)) : date("H:i:s", strtotime($row->utim));
			$no     = $row->no;
			$mention= ($row->mention)? "@".$row->mention:"";
			$follow = ($row->follow)?$row->follow:"0";

			$depth = [
				$row->depth1, $row->depth2, $row->depth3,
				$row->depth4, $row->depth5, $row->depth6,
				$row->depth7, $row->depth8, $row->depth9,
				$row->depth10
			];

			$depth_no = 0;
			for($i=0; $i<count($depth); $i++) {
				if($depth[$i]>0) $depth_no = $i;
			}

			echo "<li class='depth-{$depth_no}'>"
				."<span class='name'> {$row->name} </span>"
				."<span class='content'> <b class='mention'>{$mention}</b> {$row->content} </span>"
				."<span class='date'> {$date} {$time} </span>"
			."</li>";
		$this->message("hide", $no);

		}
		echo "</ul>";
		$this->message();
		echo "</div>";

		//."<li class='func'>  <i class='fa fa-ellipsis-v' aria-hidden='true'></i></li>"
		//."<li class='edit'>  <i class='fa fa-pencil'     aria-hidden='true'></i></li>"
		//."<li class='delete'><i class='fa fa-trash'      aria-hidden='true'></i></li>"
		//."<li class='report'><i class='fa fa-meh-o'      aria-hidden='true'></i></li>"
		//."<li class='add'>   <i class='fa fa-plus'       aria-hidden='true'></i></li>"
		//."<li class='name'>{$row->name}</li>"
		//."<li class='content'><div>{$row->content}</div></li>"
		//."<li class='date'>{$date}</li>"
		//."<li class='func'>"
		//."<i class='fa fa-pencil' aria-hidden='true'></i> <i class='fa fa-trash' aria-hidden='true'></i> <i class='fa fa-meh-o' aria-hidden='true'></i>"
		//."<li colspan='3' class='add'><div contentEditable='true'></div></li>"

		//input reply text box

		return true;
	}

	private function message($status = "block", $id = 0) {
		$to = ($id != 0)? "to":"";

		echo "<div class='message {$status}' id='message-{$id}' name='message-{$id}'>"
			."<input type='hidden' class='message-no' value='{$id}'>"
			."<textarea class='message-box' id='message-box-{$id}' placeholder='Leave a Message .. &#xf040;'></textarea>"
			."<div class='message-button-group'>"

			."<div class='message-button-send {$to}'>Send <i class='fa fa-keyboard-o' aria-hidden='true' style='position: absolute;margin: 0 .5rem;'></i> </div>"
			."<div class='message-button-send yes'>yes</div>"
			."<div class='message-button-send no'>no</div>"

			."<div class='message-button-reset'>reset ?</div>"
			."<div class='message-button-reset yes'>yes</div>"
			."<div class='message-button-reset no'>no</div>"
			."</div>"
			."</div>";
	}

}
