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

		/* //2018/06/16 comment
		 *foreach ( as $key => $row) {
		 *    $data = $row->type;
		 *}
		 */

		$data = $find->result()[0]->type;

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
	public function list ($map, $type, $start=0, $rows=0, $data= null)
	{
		if(!$rows) $rows = LIST_ROWS_LIMIT;

		$search_list = ['page', 'title', 'content', 'reply', 'name', 'tag', 'date'];
		$search = [];

		$where = "type='{$type}'";

		if(isset($data)) {
			for($i=0; $i<count($search_list); $i++) {
				if(array_key_exists($search_list[$i], $data)) {
					$search[$search_list[$i]] = $data[$search_list[$i]];
				}
			}
		}

		//$where .= " and title like '%{$data['title']}%' ";

		$limit = ($rows)?"{$start}, {$rows}":$start;

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

			$reply = ($row->reply > 0)?"<a href='/{$map}/{$row->type}/{$row->no}'> <i class='far fa-comment-dots'></i> {$row->reply}</a>":"";

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


		// ****************
		// button group TOP
		// ****************

		echo "</table>";

		echo "<div class='button-group'>";
		echo "<a class='refresh' href='/{$map}/{$type}/list'><span>LIST</span></a>";

		echo "<span class='null'></span>";

		if($type == "best" || !$this->session->userdata('signed_in')) {
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
				<input type='checkbox' id='search-select-toggle' />
				<i class='open fa fa-minus'></i>
				<i class='close fa fa-plus'></i>
				<ul>
					<li><label for='search-mode-title'  ><input type='checkbox' id='search-mode-title'   checked/><span><i class='fas fa-heading'>			</i></span></label></li>
					<li><label for='search-mode-content'><input type='checkbox' id='search-mode-content' checked/><span><i class='fas fa-file-alt'>		</i></span></label></li>
					<li><label for='search-mode-reply'  ><input type='checkbox' id='search-mode-reply'          /><span><i class='far fa-comment-dots'>	</i></span></label></li>
					<li><label for='search-mode-name'   ><input type='checkbox' id='search-mode-name'           /><span><i class='fa fa-user'>			</i></span></label></li>
					<li><label for='search-mode-tag'    ><input type='checkbox' id='search-mode-tag'            /><span><i class='fa fa-hashtag'>			</i></span></label></li>
					<li><label for='search-mode-date'   ><input type='checkbox' id='search-mode-date'           /><span><i class='fa fa-calendar'>		</i></span></label></li>
				</ul>
			</label>
		</div>";
		echo "<input type='search' class='search-input' value='' placeholder='Search ..'/>";
		echo "<div class='search-button'><i class='fa fa-search'></i></div>";
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

		// get list count (new sql run)
		$where = "type='{$type}'";

		$query = "SELECT count(*) as list_count FROM map_{$map}_post where {$where}";
		$find = $this->db->query($query);

/*
 *
 *        $result = $this->sql("select count(*) from board");
 *
 *        foreach($result as $row) {
 *            $max = ceil($row[0]/$range);
 *            if($max == 0) $max=1;
 *        }
 *
 *        if($current>5) {
 *            $cur_page=$current-5;
 *        } else {
 *            $cur_page=1;
 *        }
 *
 *        echo "<a href='/board/list.php?page=1'><li><i class='fa fa-step-backward'></i></li></a>";
 *        for($count=0; $count<10; $count++) {
 *            $next = $cur_page;
 *
 *            if($cur_page++>$max) {
 *                echo "<li class='page-item'></li>";
 *            } else {
 *                echo "<a class='page-link' href='/board/list.php?page={$next}'><li class='page-item'>{$next}</li></a>";
 *            }
 *
 *        }
 *        echo "<a href='/board/list.php?page={$max}'><li><i class='fa fa-step-forward'></i></li></a>";
 *
 *        return true;
 *
 */


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

		echo "<a href='/{$map}/{$type}/list?page=1'><i class='fas fa-step-backward'></i></a>";
		echo "<a href='/{$map}/{$type}/list?page={$min_pagination}'><i class='fas fa-backward'></i></a>";

		for($count=0; $count<$range; $count++) {
			$next = $pagination_start;
			if($pagination_start <= $max && $pagination_start != 0) echo "<a href='/{$map}/{$type}/list?page=".($next)."'>".($next)."</a>";
			$pagination_start++;
		}

		echo "<a href='/{$map}/{$type}/list?page={$max_pagination}'><i class='fas fa-forward'></i></a>";
		echo "<a href='/{$map}/{$type}/list?page={$max}'><i class='fas fa-step-forward'></i></a>";
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
			$map,
			$type,
			$num
		];

		$find = $this->post_select($data, $info);

		if($find->num_rows() === 0 || $find->num_rows() > 1) {
			echo "<div class='no-post'>Not Found <i class='fa fa-frown-o'></i> </div>";

			return false;
		}

		echo "<div class='post'>";
		foreach ($find->result() as $key => $row) {
			$date = ($row->utim <= $row->ctim)? date("Y-m-d", strtotime($row->ctim)) : date("Y-m-d", strtotime($row->utim));
			$time = ($row->utim <= $row->ctim)? date("H:i:s", strtotime($row->ctim)) : date("H:i:s", strtotime($row->utim));
			$no   = $row->no;
			$uid  = $row->uid;
			$content = htmlspecialchars_decode($row->content);

			echo "<div class='post-title'><a href='/{$map}/{$row->type}/{$no}'>{$row->title}</a></div>";
			echo "<div class='post-date' ><i class='fa fa-clock-o'></i> {$date} {$time} </div>";

			//."<span class='vote'>{$row->vote}</span>"
			echo "<div class='post-info'>"
				."<span class='name' ><i class='fa fa-user'></i> {$row->name} </span>"
				."<span class='hit'  ><i class='fa fa-eye'></i> {$row->hit} </span>"
				."<span class='reply'><i class='far fa-comment-dots'></i> {$row->reply} </span>"
			."</div>"

			."<div id='post-conetent'>{$content}</div>";
		}
		echo "</div>";

		// permission check
		$activate = "disable";
		if ($this->session->userdata('uid') === $uid || $this->session->userdata('admin')) $activate = "enable";

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
	 * Usage : $this->map->post_select (data array, info [$map, $type, $num] array)
	 * Desc : select 'post'
	 * ====================
	 */
	public function post_select($data, $info) {
		$query = "SELECT * FROM map_{$info[0]}_post where no={$info[2]} and (dtim = 0 or dtim is null)";

		$ret = $this->db->query($query);

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
		$table = "map_{$info[1]}_post";
		$type = $info[2];

		$title = addslashes(htmlspecialchars($data['title']));
		$content = addslashes(htmlspecialchars($data['content']));

		preg_match_all("/\[(.*)\]/", strip_tags($data['title']), $tag);
		preg_match_all("/#(.[^\s#]*)/m", strip_tags($data['content']), $keyword);

		//$tag[0] => array : [tag], $tag[1] => array : tag 
		$tag = @($tag[1][0])?strtolower($tag[1][0]):"";

		//$keyworkd[0] => array : #keyword, $keyworkd[1] => array : keyword
		$keyword = implode('|',$keyword[1]);

		$query = "insert into {$table}
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
				'".$this->session->userdata('uid')."',
				'".$this->session->userdata('name')."',
				'{$title}',
				'{$content}',
				'{$type}',
				'{$tag}',
				'{$keyword}'
			)";

		$this->db->query($query);
		$ret = $this->db->insert_id(); 

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
		$table = "map_{$info[1]}_post";
		$type = $info[2];
		$no = $info[3];

		$title = addslashes(htmlspecialchars($data['title']));
		$content = addslashes(htmlspecialchars($data['content']));

		preg_match_all("/\[(.*)\]/", strip_tags($data['title']), $tag);
		preg_match_all("/#(.[^\s#]*)/m", strip_tags($data['content']), $keyword);

		//$tag[0] => array : [tag], $tag[1] => array : tag 
		$tag = @($tag[1][0])?strtolower($tag[1][0]):"";

		//$keyworkd[0] => array : #keyword, $keyworkd[1] => array : keyword
		$keyword = implode('|',$keyword[1]);

		$query = "update {$table}
			set
			title = '{$title}',
			content = '{$content}',
			tag = '{$tag}',
			keyword = '{$keyword}'

			where type = '{$type}' and no = '{$no}' ";

		if($this->db->query($query)) {
			$ret = $no;	
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
		$table = "map_{$info[1]}_post";
		$type = $info[2];
		$no = $info[3];

		$query = "delete from {$table} 
			where 
				type = '{$type}'
				and no = '{$no}'
				and uid = '".$this->session->userdata('uid')."'
				and name = '".$this->session->userdata('name')."' ";

		$ret = $this->db->query($query);

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

		$search = [];
		$search_list = ['page', 'title', 'content', 'reply', 'name', 'tag', 'date'];

		if(isset($data)) {
			for($i=0; $i<count($search_list); $i++) {
				if(array_key_exists($search_list[$i], $data)) {
					$search[$search_list[$i]] = $data[$search_list[$i]];
				}
			}
		}

		if(strcmp($start, "last") === 0) {
			$reply_count = $this->db->query("SELECT count(*) as list_count FROM map_{$map}_reply where post={$num}");
			$start = (floor($reply_count->result()[0]->list_count/$rows))*$rows;
		}

		$query = "SELECT * FROM map_{$map}_reply where post={$num} order by if(isnull(follow), no, follow), depth1, depth2, depth3, depth4, depth5, depth6, depth7, depth8, depth9, depth10, ctim LIMIT {$start}, {$rows}";
		$find = $this->db->query($query);

		$ret = null;

		if($find->num_rows() === 0) {
			$ret .= $this->replyBox();
			return false;
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

			$content = $row->content;

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

			$ret .= "<li class='depth-{$depth_no}'>";
			$ret .= "<ul>";

			$ret .= "<span class='no'>{$no}</span>";
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
			$ret .= "<div class='name'>{$name}</div>";
			$ret .= "<div class='depth'>{$depth_no}</div>";
			$ret .= "<div class='follow'>{$follow}</div>";
			$ret .= "<div class='date'> {$date} {$time} </div>";

			// daihyun99 to do : button class setting color
			/* func : top */
			$ret .= "<div class='func'>";

				$ret .= "<button class='up {$btn_perm}'><i class='far fa-thumbs-up'></i></button>";
				$ret .= "<button class='down {$btn_perm}'><i class='far fa-thumbs-down'></i></button>";

				$ret .= "<button class='reply {$btn_perm}'><i class='fa fa-reply' style='transform: rotate3d(1, 0, 0, 180deg);'></i></button>";

				if($uid == $reply_uid || $admin ) {
					$reply_perm = "enable";
				} else {
					$reply_perm = "disable";
				}

				$ret .= "<button class='modify {$reply_perm}'><i class='fa fa-pencil-alt'></i></button>";
				$ret .= "<button class='delete {$reply_perm}'><i class='fa fa-trash'></i></button>";
				$ret .= "<button class='report ' ><i class='far fa-paper-plane'></i></button>";

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

		$query = "SELECT count(*) as list_count FROM map_{$map}_reply where post={$num}";
		$find = $this->db->query($query);

		// all list count / 30 (default)
		$max = ceil($find->result()[0]->list_count/$rows);
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

		$ret .= "<span data='1'><i class='fas fa-step-backward'></i></span>";
		$ret .= "<span data='{$min_pagination}'><i class='fas fa-backward'></i></span>";

		for($count=0; $count<$range; $count++) {
			$next = $pagination_start;
			if($pagination_start <= $max && $pagination_start != 0) {
				$ret .= "<span class='".(($current==$next)?'active':'')."' data='{$next}'>".($next)."</span>";
			}
			$pagination_start++;
		}

		$ret .= "<span data='{$max_pagination}'><i class='fas fa-forward'></i></span>";
		$ret .= "<span data='{$max}'><i class='fas fa-step-forward'></i></span>";
		$ret .= "</div>";

		return $ret;
	}

	public function reply_count_update ($command='up', $info)
	{
		$table = $info[1];
		$no = $info[3];

		switch($command) {
		case "up":
			$update = $this->db->query("update map_{$table}_post set reply = reply + 1 where no = '{$no}'");
			break;
		case "down":
			$update = $this->db->query("update map_{$table}_post set reply = reply - 1 where no = '{$no}'");
			break;
		default:
		}

		return $update;
	}

	public function reply_select ($table, $no) {
		//$this->monolog->debug('reply_insert', print_r($data,1));
		$select = $this->db->query("select * from {$table} where no = '{$no}' ");

		$result = $select->result()[0];

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

		return $reply;
	}

	/*
	 * ====================
	 * Usage : $this->map->reply_insert ( [map code, post type, post number], link info )
	 * Desc : 
	 * ====================
	 */
	public function reply_insert ($data, $info)
	{
		//$this->monolog->debug('reply_insert', print_r($data,1));
		$table = "map_{$info[1]}_reply";
		$post_no = $info[3];

		$reply = [
			'depth' => 0,
			'mention' => '',
			'follow' => '',
		];

		if($data['no'] > 0) {
			$reply = $this->reply_select($table, $data['no']);
			$reply['depth'] += 1;
		}

		$depth = ($reply['depth']<10)?$reply['depth']:9;
		$mention = $reply['mention'];

		$depth_array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

		//if($depth>0) {
			$follow = ($reply['follow'])?$reply['follow']:"NULL";
			$query = "select ";

			for($i=0; $i<=$depth; $i++) {
				$query.= "depth".($i+1).",";
			}

			$query .= "	follow from {$table} ";

			if($depth==0) {
					$query .= "where post='{$post_no}' order by depth".($depth+1)." desc LIMIT 1 ";
			} else {
					$query .= "where no='{$data['no']}' order by depth".($depth+1)." desc LIMIT 1 ";
			}

			//$this->monolog->debug('reply_insert', $query);
			//exit();

			$select = $this->db->query($query);

			//$this->monolog->debug('reply_insert', print_r($select->result(),1));

			//exit();

			if($select->num_rows() != 0) {
				$row = $select->result()[0];
				for($i=0; $i<count($depth_array); $i++) {
					$depth_array[$i] = (isset($row->{'depth'.($i+1)}))?$row->{'depth'.($i+1)}:0;
				}
			}
			//if($depth==1) $depth_array[$depth]++;
		//}

		$depth_array[$depth] = $this->db->query("select count(no) cnt from {$table} where relation = {$data['no']}")->result()[0]->cnt+1;

		$data['message'] = htmlspecialchars($data['message']);

		$query= "insert into {$table} (uid, name,
			content, mention, post,
			follow, relation, depth1, depth2, depth3, depth4, depth5, depth6, depth7, depth8, depth9, depth10)

			values('".$this->session->userdata('uid')."', '".$this->session->userdata('name')."',
				'{$data['message']}', '{$mention}', '{$post_no}',
				{$follow}, {$data['no']}, {$depth_array[0]}, {$depth_array[1]}, {$depth_array[2]}, {$depth_array[3]}, {$depth_array[4]}, {$depth_array[5]}, {$depth_array[6]}, {$depth_array[7]}, {$depth_array[8]}, {$depth_array[9]})";

		$this->monolog->debug('reply_insert', $query);
		//exit();	
		$result = $this->db->query($query);

		$this->monolog->debug('reply_insert', $result);

		return $result;
	}

	/*
	 * ====================
	 * Usage : $this->map->reply_update ( [map code, post type, post number], link info )
	 * Desc : 
	 * ====================
	 */
	public function reply_update ()
	{
	}

	/*
	 * ====================
	 * Usage : $this->map->reply_delete ( [map code, post type, post number], link info )
	 * Desc : 
	 * ====================
	 */
	public function reply_delete ()
	{
	}

	public function replyBox($status = "block", $id=0, $depth=0) {
		$ret = "<div class='reply-addon {$status}' id='reply-{$id}' name='reply-{$id}'>"
				."<input type='hidden' class='reply-no' value='{$id}'>"
				."<div class='reply-box' id='reply-box-{$id}' placeholder='Leave a Message .. &#xf303;' contenteditable='true'></div>"
				."<div class='reply-button-group'>"
					."<div class='reply-button send'>Send Message &#xf11c; </div>"
					."<div class='reply-button yes'>yes</div>"
					."<div class='reply-button no'>no</div>"
				."</div>"
			."</div>";

		return $ret;
	}

}
