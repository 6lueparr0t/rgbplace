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

		$table = $this->db->escape_str("map_{$map}_post");
		$where = "no='".$this->db->escape_str($num)."'";

		$query = "SELECT type FROM {$table} where {$where}";
		$find = $this->db->query($query);

		if($find->num_rows() === 0 || $find->num_rows() >= 2) {
			return null;
		}

		/* //2018/06/16 comment
		 *foreach ( as $key => $row) {
		 *    $data = $row->type;
		 *}
		 */

		$data = $find->row()->type;

		return $data;
	}

	/*
	 * ====================
	 * Usage : $this->map->navigation ( map code, post num )
	 * Desc : simple link. use for redirect "$this->map->post".
	 * ====================
	 */
	public function navigation () {

		$query = "SELECT * FROM map_code";
		$find = $this->db->query($query);

		$data = $find->result();

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
	public function page ($map, $type, $limit)
	{
		$data = [];

		$table = $this->db->escape_str("map_{$map}_post");

		$query = "SELECT * FROM {$table} where type='{$type}' ORDER BY no desc LIMIT ".$this->db->escape_str($limit);
		if($this->db->simple_query($query)) {
			$find = $this->db->query($query, $type);
		} else {
			redirect('/'.DEFAULT_MAP);
			exit();
		}

		if($find->num_rows() === 0) {
			echo "<table class='no-page'><tr><td>No Results.</td></tr></table>";

			return false;
		}

		echo "<table class='page'>";
		foreach ($find->result() as $key => $row) {
			$title = stripslashes(htmlspecialchars_decode($row->title));

			echo "<tr>"
				."<td class='date'>".date("Y-m-d", strtotime($row->ctim))."</td>"
				."<td class='title'><div><a href='/{$map}/{$row->type}/{$row->no}'>{$title}</a></div></td>"
				."<td class='reply count'>[<a href='/{$map}/{$row->type}/{$row->no}#reply'>{$row->reply}</a>]</td>"
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
	public function list ($map, $type, $start=0, $rows=0, $search = null)
	{
		if(!$rows) $rows = LIST_ROWS_LIMIT;

		if($search['reply']) {
			$table = $this->db->escape_str("map_{$map}_post post LEFT JOIN map_{$map}_reply reply ON post.no = reply.post");
		} else {
			$table = $this->db->escape_str("map_{$map}_post post");
		}

		$category = ['search', 'title', 'content', 'reply', 'name', 'keyword', 'ctim'];
		$search_list = [];

		$where = "post.type='".$this->db->escape_str($type)."'";

		for($i=0; $i<count($category); $i++) {
			if(array_key_exists($category[$i], $search) && $search[$category[$i]]) {
				$key = $category[$i];
				$value = $this->db->escape_like_str($search[$key]);

				if($key == 'search') {
					$search['search'] = $this->db->escape_like_str($search['search']);
					$search_param[] = "{$key}={$value}";
					continue;
				}

				switch($key) {
					case 'search' :
						$search_param[] = "{$key}={$value}";
						break;
					case 'reply' :
						$search_list[] = "reply.content like '%".$search['search']."%'";
						$search_param[] = "{$key}={$value}";
						$search_field[]  = "reply.no as reply_no, reply.content as reply_content";
						break;
					case 'ctim' :
						$date = explode(',', $search['search']);

						if(count($date) > 1) {
							$search_list[] = "post.{$key} BETWEEN '".$date[0]." 00:00:00' AND '".$date[1]." 23:59:59'";
							$search_param[] = "{$key}={$value}";
						} else {
							$search_list[] = "post.{$key} like '%".$search['search']."%'";
							$search_param[] = "{$key}={$value}";
						}
						break;
					default :
						$search_list[] = "post.{$key} like '%".$search['search']."%'";
						$search_param[] = "{$key}={$value}";
						break;
				}

			}
		}

		if (isset($search_param)) {
			$param = "?".implode('&', $search_param);
		} else {
			$param = '';
		}

		if (isset($search_field)) {
			$field = ",".implode(',', $search_field);
		} else {
			$field = '';
		}

		if($search_list) $where .= " and (".implode(' or ', $search_list).")";

		//$where .= " and title like '%{$search['title']}%' ";

		$limit = ($rows)?"{$start}, {$rows}":$start;

		$query = "SELECT post.* {$field} FROM {$table} where {$where} ORDER BY post.no desc LIMIT ".$this->db->escape_str($limit);
		//echo $query;
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

			$replyCount = ($row->reply > 0)?"<a href='/{$map}/{$row->type}/{$row->no}{$param}'> <i class='far fa-comment-dots'></i> {$row->reply}</a>":"";

			if(isset($row->reply_no) && isset($row->reply_content)) {
				$param2 = "&no={$row->reply_no}";
				$reply = "<a href='/{$map}/{$row->type}/{$row->no}{$param}{$param2}'>{$row->reply_content}</a>";
			} else {
				$reply = '';
			}

			$up = ($row->up>0)?(($row->up>10)?"<span class='up'>+ {$row->up}</span>":"+ {$row->up}"):"";

			$title = "<a href='/{$map}/{$row->type}/{$row->no}{$param}'>".stripslashes(htmlspecialchars_decode($row->title))."</a> {$replyCount} {$up}";
			$date = ($row->utim <= $row->ctim)? date("Y-m-d", strtotime($row->ctim)) : date("Y-m-d", strtotime($row->utim));
			$time = ($row->utim <= $row->ctim)? date("H:i:s", strtotime($row->ctim)) : date("H:i:s", strtotime($row->utim));

			$toggle = "<div class='toggle'><span class='toggle-name'>{$row->name}</span> <span class='toggle-date'>{$date} {$time}</span></div>";

			echo "<tr class='list-row'>"
				."<td class='no'>{$row->no}</td>"
				."<td class='title'>"
					."{$title}"
					."{$toggle}"
					."{$reply}"
				."</td>"
				."<td class='hit'>{$row->hit}</td>"
				."<td class='name'>{$row->name}</td>"
				."<td class='date' title='{$date} {$time}'>{$date}</td>"
				."</tr>";
		}


		// ****************
		// button group TOP
		// ****************

		echo "</table>";

		echo "<div class='button-group'>";
		echo "<a class='refresh' href='/{$map}/{$type}/list'><span>LIST</span></a>";

		echo "<span class='null'></span>";

		if(in_array($type, array("best","notice")) || !$this->session->userdata('signed_in')) {
			$activate = "disable";
		} else {
			$activate = "enable";
		}
		echo "<a class='edit {$activate}' href='/{$map}/{$type}/0/edit'><span>EDIT</span></a>";
		echo "</div>";
		// ****************
		// button group END
		// ****************

		// **************
		// pagination TOP
		// **************

		$this->list_pagination($map, $type, LIST_ROWS_LIMIT, $search);

		// **************
		// pagination END
		// **************

		// ** button-group class end
		echo "</div>";

		// ** search-group class start
		echo "<div class='search-group'>";

		echo "<span class='null'></span>";

		echo "<div class='search-select'>
			<label class='search-select-list' for='search-select-toggle'>
				<input type='checkbox' id='search-select-toggle' ".(($this->input->get('search'))?"checked":"")." />
				<i class='open fa fa-minus'></i>
				<i class='close fa fa-plus'></i>
				<ul>
					<li><label for='search-mode-title'  ><input type='checkbox' id='search-mode-title'   ".(($this->input->get('title'  ))?"checked":"")."/><span><i class='fas fa-heading'>		</i></span></label></li>
					<li><label for='search-mode-content'><input type='checkbox' id='search-mode-content' ".(($this->input->get('content'))?"checked":"")."/><span><i class='fas fa-file-alt'>		</i></span></label></li>
					<li><label for='search-mode-reply'  ><input type='checkbox' id='search-mode-reply'   ".(($this->input->get('reply'  ))?"checked":"")."/><span><i class='far fa-comment-dots'>	</i></span></label></li>
					<li><label for='search-mode-name'   ><input type='checkbox' id='search-mode-name'    ".(($this->input->get('name'   ))?"checked":"")."/><span><i class='fa fa-user'>			</i></span></label></li>
					<li><label for='search-mode-keyword'><input type='checkbox' id='search-mode-keyword' ".(($this->input->get('keyword'))?"checked":"")."/><span><i class='fa fa-hashtag'>		</i></span></label></li>
					<li><label for='search-mode-ctim'   ><input type='checkbox' id='search-mode-ctim'    ".(($this->input->get('ctim'   ))?"checked":"")."/><span><i class='fa fa-calendar'>		</i></span></label></li>
				</ul>
			</label>
		</div>";
		echo "<input type='search' id='search-input' value='".$this->input->get('search')."' placeholder='Search ..'/>";
		echo "<div id='search-button' class='fa fa-search'></div>";
		echo "<span class='null'></span>";

		
		// ** search-group class end
		echo "</div>";


		// count($find->result());

		return true;
	}

	/*
	 * ====================
	 * Usage : $this->list_pagination ( map code, all type, rows, search )
	 * Desc : get list pagination button.
	 * ====================
	 */
	public function list_pagination ($map, $type, $rows = REPLY_LIST_ROWS_LIMIT, $search = [])
	{

		if($search['reply']) {
			$table = $this->db->escape_str("map_{$map}_post post LEFT JOIN map_{$map}_reply reply ON post.no = reply.post");
		} else {
			$table = $this->db->escape_str("map_{$map}_post post");
		}

		// get list count (new sql run)
		$where = "post.type='".$this->db->escape_str($type)."'";

		$search_list = [];
		$search_param = [];

		foreach($search as $key => $value) {
			if ($key == 'page') continue;

			if($key == 'search') {
				$search_param[] = "{$key}={$value}";
				continue;
			}

			if($search['reply']) {
				if ($key == 'reply') {
					$search_list[] = "reply.content like '%{$search['search']}%'";
					$search_param[] = "{$key}={$value}";
					continue;
				}

				if ($value == 'y') {
					$search_list[] = "post.{$key} like '%{$search['search']}%'";
					$search_param[] = "{$key}={$value}";
				}
			} else {
				if ($value == 'y') {
					$search_list[] = "{$key} like '%{$search['search']}%'";
					$search_param[] = "{$key}={$value}";
				}
			}
		}

		if ($search_list) $where .= " and (".implode(' or ', $search_list).")";
		if ($search_param) {
			$param = "&".implode('&', $search_param);
		} else {
			$param = '';
		}

		$query = "SELECT count(*) as list_count FROM {$table} where {$where}";

		$find = $this->db->query($query);

		// all list count / 30 (default)
		foreach ($find->result() as $key => $row) {
			$max = ceil($row->list_count/$rows);
			if($max == 0) $max=1;
		}

		// 'page' option check
		$current = 1;
		if(array_key_exists('page', $search)) {
			if($search['page'] <= $max) {
				$current = $search['page'];
			}
		}

		$temp_start_page = $max - PAGINATION_COUNT + 2;
		if($current > floor(PAGINATION_COUNT/2) && $current <= $temp_start_page) {
			$pagination_start = $current - floor(PAGINATION_COUNT/2);
		} else if($current >= $temp_start_page && $temp_start_page > 0) {
			$pagination_start = $temp_start_page;
		} else {
			$pagination_start = 1;
		}

		$range = PAGINATION_COUNT;

		// first page
		$min_pagination = ((int)$current-(int)$range>0)?(int)$current-(int)$range:1;

		// end page
		$max_pagination = ((int)$current+(int)$range>$max)?$max:(int)$current+(int)$range;

		// ** button-group class start
		echo "<div class='button-group'>";
		echo "<div class='pagination'>";

		echo "<a href='/{$map}/{$type}/list?page=1{$param}'><i class='fas fa-step-backward'></i></a>";
		echo "<a href='/{$map}/{$type}/list?page={$min_pagination}{$param}'><i class='fas fa-backward'></i></a>";

		for($count=0; $count<$range; $count++) {
			$next = $pagination_start;
			if($pagination_start <= $max && $pagination_start != 0) echo "<a href='/{$map}/{$type}/list?page={$next}{$param}'>{$next}</a>";
			$pagination_start++;
		}

		echo "<a href='/{$map}/{$type}/list?page={$max_pagination}{$param}'><i class='fas fa-forward'></i></a>";
		echo "<a href='/{$map}/{$type}/list?page={$max}{$param}'><i class='fas fa-step-forward'></i></a>";
		echo "</div>";

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

		$info = [
			null,
			$map,
			$type,
			$num
		];

		$find = $this->post_select($data, $info);

		if($find->num_rows() === 0 || $find->num_rows() > 1) {
			//echo "<div class='no-post'>Not Found <i class='fa fa-frown-o'></i> </div>";
			return false;
		}

		if($find->row()->type != $type) {
			//echo "<div class='no-post'>Wrong Type <i class='fa fa-frown-o'></i> </div>";
			return false;
		}

		$vote = array(
			'up' => '',
			'down' => '',
		);

		// permission check
		$activate = "disable";
		if($user = $this->session->userdata('uid')) {
			$activate = "enable";
			$history_table = $this->db->escape_str("map_{$map}_history");
			$vote_result = $this->history_select($history_table, $user, 'post', $num);

			$result = $vote_result->result();
			if( $vote_result->num_rows() > 0 ) {
				$vote[$result[0]->act] = 'active';
			}
		}

		echo "<div class='post'>";
		foreach ($find->result() as $key => $row) {
			$date = ($row->utim <= $row->ctim)? date("Y-m-d", strtotime($row->ctim)) : date("Y-m-d", strtotime($row->utim));
			$time = ($row->utim <= $row->ctim)? date("H:i:s", strtotime($row->ctim)) : date("H:i:s", strtotime($row->utim));
			$no   = $row->no;
			$uid  = $row->uid;
			$title = xss_clean(htmlspecialchars_decode(stripslashes(preg_replace('/\\\n/','\n', $row->title))));
			$content = strip_tags(htmlspecialchars_decode(stripslashes(preg_replace('/\\\n/','<br/>',$row->content))), "<a><img><br><div><p><iframe>");

			echo "<div class='post-title'><a href='/{$map}/{$row->type}/{$no}'>{$title}</a></div>";
			echo "<div class='post-date' ><i class='fa fa-clock-o'></i> {$date} {$time} </div>";

			//."<span class='vote'>{$row->vote}</span>"
			echo "<div class='post-info'>"
				."<span class='name' ><i class='fa fa-user'></i> {$row->name} </span>"
				."<span class='hit'  ><i class='fa fa-eye'></i> {$row->hit} </span>"
				."<span class='reply'><i class='far fa-comment-dots'></i> {$row->reply} </span>"
				."<div class='link'><span id='link-copy'>".base_url()."{$map}/{$no}</span></div>"
			."</div>"
			."<div id='post-conetent'>{$content}</div>";

			echo "<div class='vote button-group'>"
				."<span class='null'></span>"
				."<div class='far fa-thumbs-up post-up {$activate} {$vote['up']}'> {$row->up} </div>"
				."<div class='far fa-thumbs-down post-down {$activate} {$vote['down']}'> {$row->down} </div>"
				."<span class='null'></span>"
				."</div>";
		}
		echo "</div>";

		// permission check
		$activate = "disable";
		if ( ($user === $uid && !in_array($find->row()->type, array('best', 'notice')) ) || $this->session->userdata('admin')) $activate = "enable";

		// modify + delete button
		echo "<div class='button-group'>"
			."<span class='null'></span>"
			."<a class='edit {$activate}' href='/{$map}/{$type}/{$no}/edit'><span>edit</span></a>"
			."<span class='delete {$activate}' >delete</span>"
		."</div>";

		return true;
	}

	/*
	 * ====================
	 * Usage : $this->map->post_hit (data [$map, $type, $num] array)
	 * Desc : up to 'post' hit (and insert history table)
	 * ====================
	 */
	public function post_hit($data) {
		$history_table = $this->db->escape_str("map_{$data['map']}_history");
		$no = $this->db->escape_str($data['num']);
		$uid = $this->session->userdata('uid');

		$query = "SELECT no FROM {$history_table} where uid=? and type='post' and relation=? and act='view' ";

		if($this->db->query($query, array($uid, $no))->num_rows() > 0) {
			$ret = true;
		} else {
			$insert = "INSERT INTO {$history_table}
				( uid, type, relation, act)
				VALUES
				( ?, 'post', ?, 'view')";
			if( $uid && $this->db->query($insert, array($uid, $no)) ) {
				$update_table = $this->db->escape_str("map_{$data['map']}_post");
				$update = "UPDATE {$update_table} SET hit = hit + 1  where no = ?";
				$ret = $this->db->query($update, $no);
			} else {
				$ret = false;
			}
		}

		return $ret;
	}



	/*
	 * ====================
	 * Usage : $this->map->post_select (data array, info [$map, $type, $num] array)
	 * Desc : select 'post'
	 * ====================
	 */
	public function post_select($data, $info, $option = null) {

		$table = $this->db->escape_str("map_{$info[1]}_post");
		$no = $this->db->escape_str($info[3]);

		if($option == 'vote') {
			$field = 'up, down, type';
		} else {
			$field = '*';
		}

		$query = "SELECT {$field} FROM {$table} where no='{$no}' and (dtim = 0 or dtim is null)";

        if($this->db->simple_query($query)) {
			$ret = $this->db->query($query);
		} else {
			redirect("/");
        }

		return $ret;
	}

	/*
	 * ====================
	 * Usage : $this->map->post_insert (data array, info [domain, map, type, num, act] array)
	 * Desc : insert 'post'
	 * ====================
	 */
	public function post_insert ($data, $info)
	{
		if( !in_array($info[2], array("best", "notice")) || $this->session->userdata('admin')) {
			$table = $this->db->escape_str("map_{$info[1]}_post");
			$type = $info[2];

			$title = htmlspecialchars($data['title']);
			$content = htmlspecialchars($data['content']);
			//$upload = strip_tags(base64_decode(substr($data['upload'],1)));

			preg_match_all("/\[(.*)\]/", strip_tags($data['title']), $tag);
			preg_match_all("/#(.[^\s#]*)/m", strip_tags($data['content']), $keyword);

			//$tag[0] => array : [tag], $tag[1] => array : tag 
			$tag = @($tag[1][0])?strtolower($tag[1][0]):"";

			//$keyworkd[0] => array : #keyword, $keyworkd[1] => array : keyword
			$keyword = implode('|',$keyword[1]);

			$query = "INSERT INTO {$table}
			(
				uid,
				name,
				title,
				content,
				type,
				tag,
				keyword
			)
			VALUES (
				?,
				?,
				?,
				?,
				?,
				?,
				?
			)";

			$values = array(
				$this->session->userdata('uid'),
				$this->session->userdata('name'),
				$title,
				$content,
				$type,
				$tag,
				$keyword
			);

			$this->db->query($query, $values);
			$ret = $this->db->insert_id();

			$data = array (
				'map' => $info[1],
				'no' => $ret,
				'title' => $title,
			);
			@$this->profile->add_post($data);
		} else {
			$ret = false;
		}

		return $ret;
	}

	/*
	 * ====================
	 * Usage : $this->map->post_update (data array, info [domain, map, type, num, act] array)
	 * Desc : update 'post'
	 * ====================
	 */
	public function post_update ($data, $info)
	{
		$table = $this->db->escape_str("map_{$info[1]}_post");
		$type = $info[2];
		$no = $info[3];

		$title = htmlspecialchars($data['title']);
		$content = htmlspecialchars($data['content']);
		//$upload = strip_tags(base64_decode(substr($data['upload'],1)));

		preg_match_all("/\[(.*)\]/", strip_tags($data['title']), $tag);
		preg_match_all("/#(.[^\s#]*)/m", strip_tags($data['content']), $keyword);

		//$tag[0] => array : [tag], $tag[1] => array : tag 
		$tag = @($tag[1][0])?strtolower($tag[1][0]):"";

		//$keyworkd[0] => array : #keyword, $keyworkd[1] => array : keyword
		$keyword = implode('|',$keyword[1]);

		if($this->session->userdata('admin') === true) {
			$query = "update {$table}
				set
					title = ?,
					content = ?,
					tag = ?,
					keyword = ?

				where
					type = ?
					and no = ?";

			$values = array(
				$title,
				$content,
				$tag,
				$keyword,

				$type,
				$no,
			);
		} else {
			$query = "update {$table}
				set
					title = ?,
					content = ?,
					tag = ?,
					keyword = ?

				where
					type = ?
					and no = ?
					and uid = ?
					and name = ?";

			$values = array(
				$title,
				$content,
				$tag,
				$keyword,

				$type,
				$no,
				$this->session->userdata('uid'),
				$this->session->userdata('name')
			);
		}

		if($this->db->query($query, $values)) {
			$ret = $no;	
		}

		if ($ret) {
			$data = array (
				'map' => $info[1],
				'no' => $no,
				'title' => $title,
				'date' => date('Y-m-d H:i:s')
			);
			@$this->profile->update_info('post', $data);
		}

		return $ret;
	}

	/*
	 * ====================
	 * Usage : $this->map->post_delete (data array, info [domain, map, type, num, act] array)
	 * Desc : delete 'post'
	 * ====================
	 */
	public function post_delete ($info)
	{
		$map = $this->db->escape_str($info[1]);
		$type = $this->db->escape_str($info[2]);
		$no = $this->db->escape_str($info[3]);

		$table_post        = "map_{$map}_post post";
		$table_reply       = "map_{$map}_reply reply";
		$table_total_reply = "total_reply total";

		if($this->session->userdata('admin') === true) {
			$query = "DELETE post.*, reply.*, total.* FROM {$table_post}
				INNER JOIN {$table_reply} ON reply.post = post.no
				INNER JOIN {$table_total_reply} ON total.post = post.no AND total.map = '{$map}'

				WHERE 
				post.type = ? AND
				post.no = ?";

			$values = array(
				$type,
				$no
			);
		} else {
			$query = "DELETE post.*, reply.*, total.* FROM {$table_post}
				INNER JOIN {$table_reply} ON reply.post = post.no
				INNER JOIN {$table_total_reply} ON total.post = post.no AND total.map = '{$map}'

				WHERE 
				post.type = ? AND
				post.no = ? AND
				post.uid = ? AND
				post.name = ? ";

			$values = array(
				$type,
				$no,
				$this->session->userdata('uid'),
				$this->session->userdata('name')
			);
		}

		$ret = $this->db->query($query, $values);

		if ($ret) {
			$data = array (
				'map' => $map,
				'no' => $no,
			);
			@$this->profile->remove_info('post', $data);
		}

		return $ret;
	}

	/*
	 * ====================
	 * Usage : $this->map->reply ( map code, post type, post number, (OPTION) limit(offset), (OPTION) search )
	 * Desc : show all reply in 'post'
	 * ====================
	 */
	public function reply ($map, $type, $num, $start = 0, $rows = 0, $data = null)
	{
		if(!$rows) $rows = REPLY_LIST_ROWS_LIMIT;

		$table = $this->db->escape_str("map_{$map}_reply");

		$search = [];
		$search_list = ['page', 'title', 'content', 'reply', 'name', 'tag', 'date'];

		if(isset($data)) {
			for($i=0; $i<count($search_list); $i++) {
				if(array_key_exists($search_list[$i], $data)) {
					$search[$search_list[$i]] = $data[$search_list[$i]];
				}
			}
		}

		if($start === "last") {
			$reply_count = $this->db->query("SELECT count(*) as list_count FROM {$table} where post={$num}");
			$start = ((ceil($reply_count->row()->list_count/$rows)-1)*REPLY_LIST_ROWS_LIMIT);
			$start = ($start<0)?0:$start;
		}

		$query = "SELECT @IDX := @IDX + 1 AS idx, reply.* FROM {$table} reply, (SELECT @IDX := 0 ) idx
			where post=?
			order by
				if(isnull(follow), no, follow),
				depth1,
				depth2,
				depth3,
				depth4,
				depth5,
				depth6,
				depth7,
				depth8,
				depth9,
				depth10,
				ctim

			LIMIT {$start}, {$rows} ";

		$find = $this->db->query($query, $num);

		if($find->num_rows() <= 0) {
			$reply_count = $this->db->query("SELECT count(*) as list_count FROM {$table} where post={$num}");
			$start = ((ceil($reply_count->row()->list_count/$rows)-1)*REPLY_LIST_ROWS_LIMIT);
			$start = ($start<0)?0:$start;
			$search['page'] = 'last';

			$query = "SELECT @IDX := @IDX + 1 AS idx, reply.* FROM {$table} reply, (SELECT @IDX := 0 ) idx
				where post=?
				order by
				if(isnull(follow), no, follow),
					depth1,
					depth2,
					depth3,
					depth4,
					depth5,
					depth6,
					depth7,
					depth8,
					depth9,
					depth10,
					ctim

					LIMIT {$start}, {$rows} ";

			$find = $this->db->query($query, $num);
		};

		$ret = '';

		if($find->num_rows() === 0) {
			$ret .= $this->replyBox();
			return $ret;
		}

		$ret .= "<ul id='reply-list'>";


		$cnt = 0;
		$uid   = $this->session->userdata('uid');
		$admin = $this->session->userdata('admin');

		$btn_perm = '';
		$reply_perm = '';

		if($uid || $admin) {
			$btn_perm = 'enable';
		} else {
			$btn_perm = 'disable';
		}

		foreach ($find->result() as $key => $row) {
			$cnt++;

			$date    = ($row->utim <= $row->ctim)? date("Y-m-d", strtotime($row->ctim)) : date("Y-m-d", strtotime($row->utim));
			$time    = ($row->utim <= $row->ctim)? date("H:i:s", strtotime($row->ctim)) : date("H:i:s", strtotime($row->utim));
			
			$no      = $row->no;
			$follow  = ($row->follow)?$row->follow:$no;

			$reply_uid = $row->uid;

			$name    = $row->name;
			$mention = ($row->mention)? "@".$row->mention:"";

			$content = stripslashes($row->content);

			$depth = [
				$row->depth1, $row->depth2, $row->depth3,
				$row->depth4, $row->depth5, $row->depth6,
				$row->depth7, $row->depth8, $row->depth9,
				$row->depth10
			];

			$up = $row->up;
			$down = $row->down;

			$depth_no = 0;
			for($i=0; $i<count($depth); $i++) {
				if($depth[$i]>0) $depth_no = $i;
			}

			$ret .= "<li class='depth-{$depth_no}' id='reply-{$no}'>";
			$ret .= "<ul>";

			$ret .= "<span class='no'>{$no}</span>";
			$ret .= "<div class='head'>{$name} <span class='date'>{$date} {$time}</span></div>";
			$ret .= "<li class='content'>";

			/* depth arrow output : top */
			$ret .= "<span name='space' id='space'>";
			for($i=0; $i<$depth_no; $i++) {
				$ret .= "<i class='fa fa-reply' style='transform: rotate3d(0, 0, -1, 180deg);'></i>";
			}
			$ret .= "</span>";
			/* depth arrow output : end */

			$ret .= "<b class='mention'>{$mention}</b> <span class='text'>{$content}</span></li>";

			// reply info start
			$ret .= "<div class='reply-info'>";
			$ret .= "<div class='depth'>{$depth_no}</div>";
			$ret .= "<div class='follow'>{$follow}</div>";

			// daihyun99 to do : button class setting color
			/* func : top */
			$ret .= "<div class='func'>";

				$ret .= "<button class='far fa-thumbs-up reply-up {$btn_perm}'> {$up} </button>";
				$ret .= "<button class='far fa-thumbs-down reply-down {$btn_perm}'> {$down} </button>";

				$ret .= "<button class='reply {$btn_perm}'><i class='fa fa-reply' style='transform: rotate3d(1, 0, 0, 180deg);'></i></button>";

				if($uid == $reply_uid || $admin ) {
					$reply_perm = "enable";
				} else {
					$reply_perm = "disable";
				}

				$ret .= "<button class='reply-modify {$reply_perm}'><i class='fa fa-pencil-alt'></i></button>";
				$ret .= "<button class='reply-delete {$reply_perm}'><i class='fa fa-trash'></i></button>";
				$ret .= "<button class='report {$btn_perm}' ><i class='far fa-paper-plane'></i></button>";

			$ret .= "</div>";
			/* func : end */
				
			$ret .= "</div>";
			// reply info finish

			$ret .= "</ul>";
			$ret .= "</li>";

		}
		$ret .= "</ul>";

		//reply Pagination add
		$ret .= $this->reply_pagination($map, $num, REPLY_LIST_ROWS_LIMIT, $search);

		//input reply text box
		$ret .= $this->replyBox();

		return $ret;
	}

	/*
	 * ====================
	 * Usage : $this->reply_pagination ( map code, post number, (OPTION) rows(row count), (OPTION) search )
	 * Desc : get pagination of some post in reply
	 * ====================
	 */
	public function reply_pagination ($map, $num, $rows = REPLY_LIST_ROWS_LIMIT, $search = []) {

		$table = $this->db->escape_str("map_{$map}_reply");
		$query = "SELECT count(*) as list_count FROM {$table} where post=?";
		$find = $this->db->query($query, $num);

		// all list count / 30 (default)
		$max = ceil($find->row()->list_count/$rows);
		if($max == 0) $max=1;

		// 'page' option check
		$current = 1;
		if(array_key_exists('page', $search)) {
			if($search['page'] <= $max) {
				$current = $search['page'];
				if($current === 'last') $current = $max;
			}
		}

		$temp_start_page = $max - REPLY_PAGINATION_COUNT + 2;
		if($current > floor(REPLY_PAGINATION_COUNT/2) && $current <= $temp_start_page) {
			$pagination_start = $current - floor(REPLY_PAGINATION_COUNT/2);
		} else if($current >= $temp_start_page && $temp_start_page > 0) {
			$pagination_start = $temp_start_page;
		} else {
			$pagination_start = 1;
		}

		$range = REPLY_PAGINATION_COUNT;

		// first page
		$min_pagination = ((int)$current-abs((int)$range)>0)?(int)$current-(int)$range:1;

		// end page
		$max_pagination = ((int)$current+(int)$range>$max)?$max:(int)$current+(int)$range;

		// ** button-group class start
		$ret = "<div class='reply-pagination'>";

		$ret .= "<span class='fas fa-step-backward' data='1'></span>";
		$ret .= "<span class='fas fa-backward' data='{$min_pagination}'></span>";

		for($count=0; $count<$range; $count++) {
			$next = $pagination_start;
			if($pagination_start <= $max && $pagination_start != 0) {
				$ret .= "<span class='".(($current==$next)?'active':'')."' data='{$next}'>".($next)."</span>";
			}
			$pagination_start++;
		}

		$ret .= "<span class='fas fa-forward' data='{$max_pagination}'></span>";
		$ret .= "<span class='fas fa-step-forward' data='{$max}'></span>";
		$ret .= "</div>";

		return $ret;
	}

	public function reply_count_update ($command='up', $info)
	{
		$table = $this->db->escape_str("map_{$info[1]}_post");
		$no = $info[3];

		switch($command) {
		case "up":
			$count = "reply + 1";
			break;
		case "down":
			$count = "reply - 1";
			break;
		default:
		}

		$update = $this->db->query("update {$table} set reply = {$count} where no = ?", $no);

		return $update;
	}

	public function reply_select ($table, $no) {
		//$this->monolog->debug('reply_select', print_r($data,1));
		$table = $this->db->escape_str($table);
		$select = $this->db->query("select * from {$table} where no = ?", $no);

		$result = $select->row();

		$depth = [
			$result->depth1, $result->depth2, $result->depth3,
			$result->depth4, $result->depth5, $result->depth6,
			$result->depth7, $result->depth8, $result->depth9,
			$result->depth10
		];

		$reply['depth'] = 0;
		for($i=0; $i<count($depth); $i++) {
			if($depth[$i]>0) $reply['depth'] = $i;
		}

		$reply['mention'] = $result->name;
		$reply['follow'] = ($result->follow)?$result->follow:$result->no;
		$reply['post'] = $result->post;

		$reply['uid'] = $result->uid;
		$reply['up'] = $result->up;
		$reply['down'] = $result->down;

		return $reply;
	}

	/*
	 * ====================
	 * Usage : $this->map->reply_insert ( [map code, post type, post number], link info )
	 * Desc : 
	 * ====================
	 */
	public function reply_insert ($data, $info) {
		//$this->monolog->debug('reply_insert', print_r($data,1));
		$table = $this->db->escape_str("map_{$info[1]}_reply");
		$post_no = $info[3];
		$no = $data['no'];

		$reply = [
			'depth' => 0,
			'mention' => '',
			'follow' => '',
		];

		if($no > 0) {
			$reply = $this->reply_select($table, $no);
			$reply['depth'] += 1;
		}

		$depth = ($reply['depth']<10)?$reply['depth']:9;
		$mention = $reply['mention'];

		$depth_array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

		//if($depth>0) {
			$follow = ($reply['follow'])?$this->db->escape_str($reply['follow']):"NULL";
			$query = "select ";

			for($i=0; $i<=$depth; $i++) {
				$query.= "depth".($i+1).",";
			}

			$query .= "	follow from {$table} ";
			$values = array ();

			if($depth==0) {
					$query .= "where post = ? order by depth".($depth+1)." desc LIMIT 1 ";
					$values[] = $post_no;

			} else {
					$query .= "where no = ? order by depth".($depth+1)." desc LIMIT 1 ";
					$values[] = $no;
			}

			//$this->monolog->debug('reply_insert', $query);
			//exit();

			$select = $this->db->query($query, $values);

			//$this->monolog->debug('reply_insert', print_r($select->result(),1));

			//exit();

			if($select->num_rows() != 0) {
				$row = $select->row();
				for($i=0; $i<count($depth_array); $i++) {
					$depth_array[$i] = (isset($row->{'depth'.($i+1)}))?$row->{'depth'.($i+1)}:0;
				}
			}
			//if($depth==1) $depth_array[$depth]++;
		//}

		$depth_array[$depth] = 
			$this->db->query("select count(no) cnt from {$table} where relation = ?", $no)->row()->cnt+1;

		$content = addslashes(htmlspecialchars($data['message']));

		$query= "insert into {$table} (uid, name,
			content, mention, post,
			follow, relation, depth1, depth2, depth3, depth4, depth5, depth6, depth7, depth8, depth9, depth10)

			values(?, ?,
				?, ?, ?,
				{$follow}, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		$values = array(
			$this->session->userdata('uid'),
			$this->session->userdata('name'),

			$content,
			$mention,
			$post_no,
			
			$no,
			$depth_array[0],
			$depth_array[1],
			$depth_array[2],
			$depth_array[3],
			$depth_array[4],
			$depth_array[5],
			$depth_array[6],
			$depth_array[7],
			$depth_array[8],
			$depth_array[9]
		);

		//$this->monolog->debug('reply_insert', $query);
		//exit();	
		$this->db->query($query, $values);
		$reply_no = $this->db->insert_id();
		$ret = $this->reply_getPageNum($table, $post_no, $reply_no);

		if ($ret) {
			$data = array (
				'post' => $post_no,
				'map' => $info[1],
				'no' => $reply_no,
				'content' => $content,
			);
			@$this->profile->add_reply($data);
		}

		//$this->monolog->debug('reply_insert', $result);

		return $ret;
	}

	public function reply_getPageNum($table, $post_no, $no) {
		$query = "select reply.idx
					from
						(
							SELECT @IDX := @IDX + 1 AS idx, r.no FROM {$table} r, (SELECT @IDX := 0 ) idx
							where post=?
							order by
								if(isnull(follow), no, follow),
								depth1,
								depth2,
								depth3,
								depth4,
								depth5,
								depth6,
								depth7,
								depth8,
								depth9,
								depth10,
								ctim
							) reply
					where
						reply.no=? ";

		return ceil($this->db->query($query, array($post_no, $no))->row()->idx/REPLY_LIST_ROWS_LIMIT);
	}

	/*
	 * ====================
	 * Usage : $this->map->reply_update ( [map code, post type, post number], link info )
	 * Desc : 
	 * ====================
	 */
	public function reply_update ($data, $info)
	{
		$table = $this->db->escape_str("map_{$info[1]}_reply");
		$content = addslashes(htmlspecialchars($data['message']));
		$no = $data['no'];

		$query = "update {$table}
			set
				content = ?
			where
				uid = ?
				and name = ?
				and no = ?";

		$values = array(
			$content,

			$this->session->userdata('uid'),
			$this->session->userdata('name'),
			$no
		);

		$back = $this->reply_getPageNum($table, $info[3], $no);
		if($this->db->query($query, $values)) {
			$ret = $back;
		} else {
			$ret = false;
		}

		if ($ret) {
			$data = array (
				'map' => $info[1],
				'no' => $no,
				'content' => $content,
				'date' => date('Y-m-d H:i:s')
			);
			@$this->profile->update_info('reply', $data);
		}

		return $ret;
	}

	/*
	 * ====================
	 * Usage : $this->map->reply_delete ( [map code, post type, post number], link info )
	 * Desc : 
	 * ====================
	 */
	public function reply_delete ($data, $info) {
		$table = $this->db->escape_str("map_{$info[1]}_reply");
		$no = $data['no'];

		$query = "delete from {$table}
				where
					uid = ?
					and name = ?
					and no = ?";

		$values = array(
			$this->session->userdata('uid'),
			$this->session->userdata('name'),
			$no
		);

		$back = $this->reply_getPageNum($table, $info[3], $no);
		if($this->db->query($query, $values)) {
			$ret = $back;
		} else {
			$ret = false;
		}

		if ($ret) {
            $data = array (
				'map' => $info[1],
                'no' => $no,
            );
            @$this->profile->remove_info('reply', $data);
        }

		return $ret;
	}

	/*
	 * ====================
	 * Usage : $this->map->history_select ($table, $uid, $type, $no)
	 * Desc : insert or update 'history' table, and increase up, down column to 'post' 'reply' table
	 * ====================
	 */
	public function history_select ($table, $uid, $type, $no, $act = null) {

		if($act) {
			// $query = "SELECT * FROM {$table} where uid=? and type=? and relation=? and act = ? ";
			$query = "SELECT a.*, count(distinct b.no) cnt
						FROM {$table} a
							left join {$table} b
							on b.relation = a.relation and b.act = ?
						where a.uid=?
							and a.relation=?
							and a.act = ?";
			
			$result = $this->db->query($query, array($act, $uid, $no, $act));
		} else {
			$query = "SELECT * FROM {$table} where uid=? and type=? and relation=? and act in ('up','down','n', 'report') ";
			$result = $this->db->query($query, array($uid, $type, $no));
		}

		return $result;
	}

	/*
	 * ====================
	 * Usage : $this->map->vote (data, info [domain, map, type, num] array)
	 * Desc : insert or update 'history' table, and increase up, down column to 'post' 'reply' table
	 * ====================
	 */
	public function vote ($data, $info) {
		$no = $this->db->escape_str($info[3]);
		$uid = $this->session->userdata('uid');
		$level = $this->session->userdata('level');
		$admin = $this->session->userdata('admin');

		$act = strtolower($this->db->escape_str($data['act']));
		$type = strtolower($this->db->escape_str($data['target']));

		$history_table = $this->db->escape_str("map_{$info[1]}_history");
		$update_table = $this->db->escape_str("map_{$info[1]}_{$type}");

		$result = $this->history_select($history_table, $uid, $type, $no);

		if( $level > 10 || $admin === true ) { 
			$point = 10;
		} else if( $level > 2 && $level < 10 ) {
			$point = 2;
		} else {
			$point = 1;
		}

		switch($type) {
		case 'post' :
			$vote_info = $this->post_select($data, $info);
			$post = null;
			$vote_uid = $vote_info->row()->uid;
			break;
		case 'reply' :
			$vote_info = $this->reply_select($update_table, $no);
			$post = $vote_info['post'];
			$vote_uid = $vote_info['uid'];
			break;
		}

		if($result->num_rows() > 0) {
			if (!is_null($result->row()->utim)) {
				$query = "UPDATE {$history_table} SET act=?, ctim=now(), utim=NULL where uid=? and type=? and relation=? and act='n'";
				if( $this->db->query($query, array($act, $uid, $type, $no)) ) {
					$query = "UPDATE {$update_table} SET {$act} = {$act} + {$point}  where no = ?";
					$ret = $this->db->query($query, $no);

					if($type != 'reply' || $uid != $vote_uid) {
						$query = "UPDATE user_info SET score = score + {$point} where uid = ?";
						$ret = $this->db->query($query, $vote_uid);
					}
				}
			} else {
				$act_check = $result->result();
				if($act == $act_check[0]->act && $act_check[0]->act != 'n') {
					$query = "UPDATE {$history_table} SET act='n', utim=now() where uid=? and type=? and relation=? and act=?";
					if( $this->db->query($query, array($uid, $type, $no, $act)) ) {
						$query = "UPDATE {$update_table} SET {$act} = {$act} - {$point}  where no = ?";
						$ret = $this->db->query($query, $no);

						if($type != 'reply' || $uid != $vote_uid ) {
							$query = "UPDATE user_info SET score = score - {$point} where uid = ?";
							$ret = $this->db->query($query,  $vote_uid);
						}
					}
				} else {
					$ret = 0;
				}
			}
		} else {
			$query = "INSERT INTO {$history_table}
				( uid, type, relation, post, act)
				VALUES
				( ?, ?, ?, ?, ?)";
			if( $this->db->query($query, array($uid, $type, $no, $post, $act)) ) {
				$query = "UPDATE {$update_table} SET {$act} = {$act} + {$point}  where no = ?";
				$ret = $this->db->query($query, $no);

				$query = "UPDATE user_info SET score = score + {$point} where uid = ?";
				$ret = $this->db->query($query,  $vote_uid);
			}
		}

		return $ret;
	}

	/*
	 * ====================
	 * Usage : $this->map->report (info [domain, map, type, num] array)
	 * Desc : insert or update 'history' table, and increase up, down column to 'post' 'reply' table
	 * ====================
	 */
	public function report ($data, $info) {
		$no = $this->db->escape_str($info[3]);
		$uid = $this->session->userdata('uid');

		$act = strtolower($this->db->escape_str($data['act']));
		$type = strtolower($this->db->escape_str($data['target']));

		$history_table = $this->db->escape_str("map_{$info[1]}_history");
		$reply_table = $this->db->escape_str("map_{$info[1]}_reply");
		$update_table = $this->db->escape_str("user_info");

		$result = $this->history_select($history_table, $uid, $type, $no, $act);

		$reply_info = $this->reply_select($reply_table, $no);
		if($uid == $reply_info['uid']) {
			return false;
		}

		$post = $reply_info['post'];

		if($result->row()->cnt == 0) {
			$query = "INSERT INTO {$history_table}
				( uid, type, relation, post, act)
				VALUES
				( ?, ?, ?, ?, ?)";

			if( $this->db->query($query, array($uid, $type, $no, $post, $act)) ) {
				$ret = true;
			}
		} else {
			$ret = false;
		}

		return $ret;
	}

	/*
	 * ====================
	 * Usage : $this->map->move_to_best (data, info [domain, map, type, num] array)
	 * Desc : type update to 'best'
	 * ====================
	 */
	public function move_to_best($data, $info) {
		$table = $this->db->escape_str("map_{$info[1]}_post");
		$type = $info[2];
		$no = $info[3];

		$query = "update {$table} set type = ? where no = ?";
		$values = array('best', $no);

		return $this->db->query($query, $values);
	}

	public function replyBox($status = "block", $id=0, $depth=0) {
		$ret = "<div class='reply-addon {$status}' id='reply-{$id}' name='reply-{$id}'>"
				."<input type='hidden' class='reply-no' value='{$id}'>"
				."<input type='hidden' class='reply-mode' value='POST'/>"
				."<textarea class='reply-box' id='reply-box-{$id}' placeholder='Leave a Message .. &#xf303;'></textarea>"
				."<div class='reply-button-group'>"
					."<div class='reply-button send'>Send Message &#xf11c; </div>"
					."<div class='reply-button yes'>yes</div>"
					."<div class='reply-button no'>no</div>"
				."</div>"
			."</div>";

		return $ret;
	}
}
