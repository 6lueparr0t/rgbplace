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

		$query = "SELECT * FROM map_code ORDER BY no DESC LIMIT 20";
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

		$query = "SELECT * FROM {$table} where type='{$type}' and (uid not like 'admin@%' or keyword not like 'notice%') ORDER BY no desc LIMIT ".$this->db->escape_str($limit);
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
			$title = xss_clean(htmlspecialchars_decode(stripslashes($row->title)));

			echo "<tr>"
					."<td class='date'>".date("Y-m-d", strtotime($row->ctim))."</td>"
					."<td class='title'><div><a href='/{$map}/{$row->type}/{$row->no}'>{$title}</a></div></td>"
					."<td class='reply count'><a href='/{$map}/{$row->type}/{$row->no}#reply'>[{$row->reply}]</a></td>"
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

		$where = "post.type='".$this->db->escape_str($type)."' and (post.uid not like 'admin@%' or post.keyword not like 'notice%')";

		for($i=0; $i<count($category); $i++) {
			if(array_key_exists($category[$i], $search) && $search[$category[$i]]) {
				$key = $category[$i];
				$value = $this->db->escape_str($search[$key]);

				if($key == 'search') {
					$search['search'] = $this->db->escape_str($search['search']);
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

		if($search_list) {
			$where .= " and (".implode(' or ', $search_list).")";
		} else {
			$query_for_notice = "SELECT post.* FROM {$table} where type='".$this->db->escape_str($type)."' and uid like 'admin@%' and keyword like 'notice%' ORDER BY no desc";
			$notice = $this->db->query($query_for_notice);
		}

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

		// title list
		if(isset($notice)) {
			@$this->list_row ($notice, $map, $param, $param2, true);
		}

		// title list
		if($find->num_rows() === 0) {
			echo "<tr><td class='no-list' colspan=5>No List</td></tr>";
		} else {
			@$this->list_row ($find, $map, $param, $param2);
		}

		// ****************
		// button group TOP
		// ****************

		echo "</table>";

		echo "<div class='button-group'>";
		echo "<a class='refresh' href='/{$map}/{$type}/list'><span>LIST</span></a>";

		echo "<span class='null'></span>";

		$activate = ($this->session->userdata('signed_in'))?"enable":"disable";
		
		if( in_array($type, array("best","notice")) ) {
			if( $this->session->userdata('admin') ) {
				$activate = "enable";
			} else {
				$activate = "disable";
			}
		}
		
		echo "<a class='edit {$activate}' href='/{$map}/{$type}/0/edit'><span>write</span></a>";
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
		echo "<input type='search' id='search-input' value='".htmlspecialchars($this->input->get('search'), ENT_QUOTES | ENT_HTML5)."' placeholder='Search ..'/>";
		echo "<div id='search-button' class='fa fa-search'></div>";
		echo "<span class='null'></span>";

		
		// ** search-group class end
		echo "</div>";


		// count($find->result());

		return true;
	}

	private function list_row ($list, $map, $param, $param2='', $is_notice=false) {
		foreach ($list->result() as $key => $row) {
			$no = (($is_notice===true)?'NOTICE':$row->no);
			$sn = $row->sn;

			$replyCount = ($row->reply > 0)?"<a href='/{$map}/{$row->type}/{$row->no}{$param}'> <i class='far fa-comment-dots'></i> {$row->reply}</a>":"";

			if(isset($row->reply_no) && isset($row->reply_content)) {
				$param2 = "&no={$row->reply_no}";
				$reply = "<a href='/{$map}/{$row->type}/{$row->no}{$param}{$param2}'>{$row->reply_content}</a>";
			} else {
				$reply = '';
			}

			$up = ($row->up>0)?(($row->up>10)?"<span class='up'>+ {$row->up}</span>":"+ {$row->up}"):"";

			$title = "<a href='/{$map}/{$row->type}/{$row->no}{$param}'>".strip_tags(stripslashes(preg_replace('/\\\n/','<br/>',$row->title)) )."</a> {$replyCount} {$up}";
			$date = ($row->utim <= $row->ctim)? date("Y-m-d", strtotime($row->ctim)) : date("Y-m-d", strtotime($row->utim));
			$time = ($row->utim <= $row->ctim)? date("H:i:s", strtotime($row->ctim)) : date("H:i:s", strtotime($row->utim));

			$toggle = "<div class='toggle'><span class='toggle-name'>{$row->name}</span> <span class='toggle-date'>{$date} {$time}</span></div>";

			echo "<tr class='list-row".(($is_notice===true)?" notice":null).(($this->uri->segment(3, 0)==$no)?" active":null)."'>"
				."<td class='no'>{$no}</td>"
				."<td class='title'>"
				.xss_clean($title)
				.$toggle
				.$reply
				."</td>"
				."<td class='hit'>{$row->hit}</td>"
				."<td class='name'>".(($sn)?"<a class='name ".(($this->session->userdata('signed_in')===true)?"enable":"disable")."' href='/profile?tab=info&no=". (($this->session->userdata('signed_in')===true)?urlencode( base64_encode($sn) ):"") ."' > ".$row->name." </a>":$row->name)."</td>"
				."<td class='date' title='{$date} {$time}'>{$date}</td>"
				."</tr>";
		}
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
	public function post ($map, $type, $num, &$pageName, &$keyword)
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

		$sn = $this->session->userdata('sn');
		$user = $this->session->userdata('uid');

		if($sn && $user) {
			$activate = "enable";
			$history_table = $this->db->escape_str("map_{$map}_history");
			$vote_result = $this->history_select($history_table, $sn, $user, 'post', $num);

			$result = $vote_result->result();
			if( $vote_result->num_rows() > 0 ) {
				$vote[$result[0]->act] = 'active';
			}
		}

		$ret = '';
		$ret .= "<div class='post'>";

		$date = ($find->row()->utim <= $find->row()->ctim)? date("Y-m-d", strtotime($find->row()->ctim)) : date("Y-m-d", strtotime($find->row()->utim));
		$time = ($find->row()->utim <= $find->row()->ctim)? date("H:i:s", strtotime($find->row()->ctim)) : date("H:i:s", strtotime($find->row()->utim));
		$no   = $find->row()->no;
		$uid  = $find->row()->uid;
		$sn   = $find->row()->sn;

		$pageName = $title = xss_clean(htmlspecialchars_decode(stripslashes($find->row()->title)));
		$keyword = explode('|', $find->row()->keyword);

		/* $content grave .. */
		//$content = strip_tags(htmlspecialchars_decode(stripslashes(preg_replace('/\\\n/','<br/>',$find->row()->content))), "<a><img><br><div><p><iframe>");
		//$content = strip_tags(stripslashes(preg_replace('/\\\n/','<br/>',$find->row()->content)), "<a><img><video><audio><br><div><p><iframe>");
		/*$content = preg_replace('/(<br[\s]*\/?>)/', PHP_EOL, htmlspecialchars_decode($find->row()->content));*/
		//$content = $Parsedown->text(strip_tags(stripslashes($find->row()->content)));
		//$content = strip_tags(stripslashes($find->row()->content), "<a><img><video><audio><br><p><div><span><iframe><hr>");
		/*
		 *$content = preg_replace('/(<br[\s]*\/?>)/', PHP_EOL, $find->row()->content);
		 */
		//$content = stripslashes( preg_replace('/\n/i','<br/>', htmlspecialchars($find->row()->content) ) );

		//$content = strip_tags(stripslashes($find->row()->content), "<a><img><video><audio><br><p><div><span><iframe><hr>");       
		$stripslashes_content = stripslashes($find->row()->content);
		$remove_script_content = preg_replace('/<\s*script[^>]*>(.*?)<\s*\/\s*script>/', htmlspecialchars('$0'), $stripslashes_content);
		$content = preg_replace('/\bon\w+=\S+(?=.*>)("|\')/m', '', $remove_script_content);

		//$content = preg_replace('/\[(.*)\]\((.*)\)/', '<a href="$2" target="_blank">$1</a>', $content);
		//$content = preg_replace('/!\[(.*)\]\((.*)\)/', '<img src="$2" alt="$1" />', $content); // <div>![...](...)</div> => <div><img ~~ /></div>
		$content = preg_replace('/\n/i','<br/>', $content);
		$content = preg_replace('/(\r\n)?---\r\n/', '<hr>', $content); // --- => <hr>
		$content = preg_replace('/#([^\s#]{1,})/', '<code>#$1</code>', $content);

		$ret .= "<div class='post-title'><a href='/{$map}/{$find->row()->type}/{$no}'>{$title}</a></div>";
		$ret .= "<div class='post-date' ><i class='fa fa-clock-o'></i> {$date} {$time} </div>";

		//$content = strip_tags(stripslashes(preg_replace('/\\\n/','<br/>',$find->row()->content)), "<a><img><br><div><p><span><iframe>");

		//."<span class='vote'>{$find->row()->vote}</span>"
		$Parsedown = new Parsedown();
		$ret .= "<div class='post-info'>"
			."<span class='name' >"
			."<i class='fa fa-user'></i>".(($sn)?"<a class='name ".(($this->session->userdata('signed_in')===true)?"enable":"disable")."' href='/profile?tab=info&no=". (($this->session->userdata('signed_in')===true)?urlencode( base64_encode($sn) ):"") ."' > ".$find->row()->name." </a>":$find->row()->name)
			."</span>"
			."<span class='hit'  ><i class='fa fa-eye'></i> {$find->row()->hit} </span>"
			."<span class='reply'><i class='far fa-comment-dots'></i> {$find->row()->reply} </span>"
			."<div class='link'><span id='link-copy'>".base_url()."{$map}/{$no}</span><span class='tooltip post-link' style='display:none;'>copied</span></div>"
			."</div>"
			."<div id='post-content'>".$Parsedown->text($content)."</div>";

		if(in_array('no_vote', $keyword) === false) {
			$ret .= "<div class='vote button-group'>"
				."<span class='null'></span>"
				."<div class='far fa-thumbs-up post-up {$activate} {$vote['up']}'> {$find->row()->up} </div>"
				."<div class='far fa-thumbs-down post-down {$activate} {$vote['down']}'> {$find->row()->down} </div>"
				."<span class='null'></span>"
				."</div>";
		}
		$ret .= "</div>";

		// permission check
		$activate = "disable";
		if ( ($user === $uid && !in_array($find->row()->type, array('best', 'notice')) ) || $this->session->userdata('admin')) $activate = "enable";

		// modify + delete button
		$ret .= "<div class='button-group'>"
			."<span class='null'></span>"
			."<a class='edit {$activate}' href='/{$map}/{$type}/{$no}/edit'><span>edit</span></a>"
			."<span class='delete {$activate}' >delete</span>"
		."</div>";

		$this->session->set_userdata(array('post_uid' => $uid));

		return $ret;
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

		$sn = $this->session->userdata('sn');
		$uid = $this->session->userdata('uid');

		if( !@array_key_exists($data['map'].'_'.$no, $this->session->tempdata('view')) ) {
			$update_table = $this->db->escape_str("map_{$data['map']}_post");
			$update = "UPDATE {$update_table} SET hit = hit + 1  where no = ?";
			$ret = $this->db->query($update, $no);

			$view_array = $this->session->tempdata('view');

			$view_array[$data['map'].'_'.$no] = true;
			$this->session->set_tempdata('view', $view_array, 60*60*24);

		/*
		$query = "SELECT no FROM {$history_table} where uid=? and type='post' and relation=? and act='view' ";

		if($this->db->query($query, array($uid, $no))->num_rows() > 0) {
			$ret = true;
		} else {
			$insert = "INSERT INTO {$history_table}
				( sn, uid, type, relation, act)
				VALUES
				( ?, ?, 'post', ?, 'view')";
			if( $uid && $this->db->query($insert, array($sn, $uid, $no)) ) {
				$update_table = $this->db->escape_str("map_{$data['map']}_post");
				$update = "UPDATE {$update_table} SET hit = hit + 1  where no = ?";
				$ret = $this->db->query($update, $no);
			} else {
				$ret = false;
			}
		}
		 */
		}

		return (isset($ret)?$ret:false);
	}



	/*
	 * ====================
	 * Usage : $this->map->post_select (data array, info [$map, $type, $num] array)
	 * Desc : select 'post'
	 * ====================
	 */
	public function post_select($data, $info, $option = null) {

		$table = $this->db->escape_str("map_{$info[1]}_post post");
		$no = $this->db->escape_str($info[3]);

		if($option == 'vote') {
			$field = 'post.sn, post.up, post.down, post.type, user.sn';
		} else {
			$field = 'post.*';
		}

		$query = "SELECT {$field} FROM {$table} LEFT JOIN user_info user ON post.sn = user.sn and post.uid = user.uid where post.no='{$no}' and (post.dtim = 0 or post.dtim is null)";

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
		$title = htmlspecialchars($data['title']);
		$content = $data['content'];
		if(!$title || !$content) return false;

		if( !in_array($info[2], array("best", "notice")) || $this->session->userdata('admin')) {
			$table = $this->db->escape_str("map_{$info[1]}_post");
			$type = $info[2];

			//$upload = strip_tags(base64_decode(substr($data['upload'],1)));
			$content = str_replace('\n', PHP_EOL, $data['content']);

			preg_match_all("/\[(.*)\]/", strip_tags($data['title']), $tag);
			//$tag[0] => array : [tag], $tag[1] => array : tag 
			$tag = @($tag[1][0])?strtolower($tag[1][0]):"";

			preg_match_all("/#([^\s#\\x5c\/]{1,})/m", strip_tags($data['content']), $keyword);
			//$keyworkd[0] => array : #keyword, $keyworkd[1] => array : keyword
			$keyword[1] = array_diff($keyword[1], array(''));
			$keyword = implode('|',$keyword[1]);

			$query = "INSERT INTO {$table}
			(
				sn,	
				uid,
				name,
				title,
				content,
				type,
				tag,
				keyword,
				upload
			)
			VALUES (
				?,
				?,
				?,
				?,
				?,
				?,
				?,
				?,
				?
			)";

			$values = array(
				$this->session->userdata('sn'),
				$this->session->userdata('uid'),
				$this->session->userdata('name'),
				$title,
				$content,
				$type,
				$tag,
				$keyword,
				$this->session->userdata('upload')
			);

			$this->db->query($query, $values);
			$ret = $this->db->insert_id();
			if($ret) $this->session->unset_userdata('upload');

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
		//$content = htmlspecialchars($data['content']);
		$content = str_replace('\n', PHP_EOL, $data['content']);
		if(!$title || !$content) return false;

		//$upload = strip_tags(base64_decode(substr($data['upload'],1)));

		preg_match_all("/\[(.*)\]/", strip_tags($data['title']), $tag);
		//$tag[0] => array : [tag], $tag[1] => array : tag 
		$tag = @($tag[1][0])?strtolower($tag[1][0]):"";

		preg_match_all('/#([^\s#\\x5c\/]{1,})/m', strip_tags($data['content']), $keyword);
		//$keyworkd[0] => array : #keyword, $keyworkd[1] => array : keyword
		$keyword[1] = array_diff($keyword[1], array(''));
		$keyword = implode('|',$keyword[1]);

		$post_before_update = $this->post_select(null, $info)->row();
		if($this->session->userdata('admin') === true) {
			$query = "update {$table}
				set
					title = ?,
					content = ?,
					tag = ?,
					keyword = ?,
					upload = ?

				where
					type = ?
					and no = ?";

			$values = array(
				$title,
				$content,
				$tag,
				$keyword,
				$this->session->userdata('upload'),

				$type,
				$no,
			);
		} else {
			$query = "update {$table}
				set
					title = ?,
					content = ?,
					tag = ?,
					keyword = ?,
					upload = ?


				where
					type = ?
					and no = ?
					and sn = ?
					and uid = ?";

			$values = array(
				$title,
				$content,
				$tag,
				$keyword,
				$this->session->userdata('upload'),

				$type,
				$no,
				$this->session->userdata('sn'),
				$this->session->userdata('uid')
			);
		}

		if($this->db->query($query, $values)) {
			$ret = $no;
			$this->session->unset_userdata('upload');
		}

		if ($ret) {
			$data = array (
				'map' => $info[1],
				'no' => $no,
				'title' => $title,
				'date' => date('Y-m-d H:i:s'),
				'sn' => $post_before_update->sn,
				'uid' => $post_before_update->uid
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

		$post_before_remove = $this->post_select(null, $info)->row();
		if($this->session->userdata('admin') === true) {
			$query = "DELETE post.*, reply.*, total.* FROM {$table_post}
				LEFT JOIN {$table_reply} ON reply.post = post.no
				LEFT JOIN {$table_total_reply} ON total.post = post.no AND total.map = '{$map}'

				WHERE 
				post.type = ? AND
				post.no = ?";

			$values = array(
				$type,
				$no
			);
		} else {
			$query = "DELETE post.*, reply.*, total.* FROM {$table_post}
				LEFT JOIN {$table_reply} ON reply.post = post.no
				LEFT JOIN {$table_total_reply} ON total.post = post.no AND total.map = '{$map}'

				WHERE 
				post.type = ? AND
				post.no = ? AND
				post.sn = ? AND
				post.uid = ?";

			$values = array(
				$type,
				$no,
				$this->session->userdata('sn'),
				$this->session->userdata('uid')
			);
		}

		$ret = $this->db->query($query, $values);

		if ($ret) {
			$data = array (
				'map' => $map,
				'no' => $no,
				'sn' => $post_before_remove->sn,
				'uid' => $post_before_remove->uid
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

		$query = "SELECT @IDX := @IDX + 1 AS idx, reply.*, user.sn sn FROM {$table} reply LEFT JOIN user_info user ON reply.uid = user.uid, (SELECT @IDX := 0 ) idx
			where reply.post=?
			order by
				if(isnull(reply.follow), reply.no, reply.follow),
				reply.depth1,
				reply.depth2,
				reply.depth3,
				reply.depth4,
				reply.depth5,
				reply.depth6,
				reply.depth7,
				reply.depth8,
				reply.depth9,
				reply.depth10,
				reply.ctim,
				reply.dtim

			LIMIT {$start}, {$rows} ";

		$find = $this->db->query($query, $num);

		if($find->num_rows() <= 0) {
			$reply_count = $this->db->query("SELECT count(*) as list_count FROM {$table} where post={$num}");
			$start = ((ceil($reply_count->row()->list_count/$rows)-1)*REPLY_LIST_ROWS_LIMIT);
			$start = ($start<0)?0:$start;
			$search['page'] = 'last';

			$query = "SELECT @IDX := @IDX + 1 AS idx, reply.*, user.sn sn FROM {$table} reply LEFT JOIN user_info user ON reply.uid = user.uid, (SELECT @IDX := 0 ) idx
				where reply.post=?
				order by
				if(isnull(reply.follow), reply.no, reply.follow),
					reply.depth1,
					reply.depth2,
					reply.depth3,
					reply.depth4,
					reply.depth5,
					reply.depth6,
					reply.depth7,
					reply.depth8,
					reply.depth9,
					reply.depth10,
					reply.ctim,
					reply.dtim

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

		$post_uid = $this->session->userdata('post_uid');
		foreach ($find->result() as $key => $row) {
			$cnt++;

			$date    = ($row->utim <= $row->ctim)? date("Y-m-d", strtotime($row->ctim)) : date("Y-m-d", strtotime($row->utim));
			$time    = ($row->utim <= $row->ctim)? date("H:i:s", strtotime($row->ctim)) : date("H:i:s", strtotime($row->utim));
			
			$no      = $row->no;
			$follow  = ($row->follow)?$row->follow:$no;

			$reply_uid = $row->uid;

			$name    = ($row->dtim)?' [ X ] ':$row->name;
			$sn      = $row->sn;
			$mention = ($row->mention && !$row->dtim)? "<b class='mention'> @".$row->mention." </b>":"";

			//$row->content = preg_replace('/!\[(.*)\]\((.*)\)/', '<img src="$1" alt="$2" />', $row->content);
			//$row->content = preg_replace('/\[(.*)\]\((.*)\)/', '<a href="$2" target="_blank">$1</a>', $row->content);


			if($row->dtim) {
				$content = ' [ Removed ] ';
			} else {
				$row->content = preg_replace('/\\\n/', PHP_EOL, $row->content);
				$row->content = preg_replace('/(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})/', '<a href="$1" target="_blank">$1</a>', $row->content);
				$content = stripslashes($row->content);
			}
			//$content = ($row->dtim)?' [ Removed ] ':preg_replace('/\\\n/', PHP_EOL, $row->content);

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
			$ret .= "<div class='head ".(($post_uid==$reply_uid)?'owner':'')."'> "
				.(($sn)?"<a class='name ".(($this->session->userdata('signed_in')===true)?"enable":"disable")."' href='/profile?tab=info&no=". (($this->session->userdata('signed_in')===true)?urlencode( base64_encode($sn) ):"") ."' >".$name."</a>":$name)
				." <span class='date'>{$date} {$time}</span></div>";

			$ret .= "<li class='content ".(($post_uid==$reply_uid)?'owner':'')."'>";

			/* depth arrow output : top */
			$ret .= "<span name='space' id='space'>";
			for($i=0; $i<$depth_no; $i++) {
				$ret .= "<i class='fa fa-reply'></i>";
			}
			$ret .= "</span>";
			/* depth arrow output : end */

			$ret .= "{$mention}<span class='text'>{$content}</span></li>";

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

				if(($uid == $reply_uid || $admin) && !$row->dtim ) {
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

	public function reply_relation ($table, $no, $post_no = null) {
		//$this->monolog->debug('reply_select', print_r($data,1));
		$table = $this->db->escape_str($table);
		$select = $this->db->query("select count(*) as cnt from {$table} where relation = ? and post = ?", array($no, $post_no));

		if ($select->row()->cnt > 0) {
			$ret = true;
		} else {
			$ret = false;
		}

		return $ret;
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

		$reply['name'] = $result->name;
		$reply['follow'] = ($result->follow)?$result->follow:$result->no;
		$reply['post'] = $result->post;

		$reply['sn'] = $result->sn;
		$reply['uid'] = $result->uid;

		$reply['up'] = $result->up;
		$reply['down'] = $result->down;

		$reply['dtim'] = $result->dtim;

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
			'name' => '',
			'follow' => '',
		];

		if($no > 0) {
			$reply = $this->reply_select($table, $no);
			$reply['depth'] += 1;
		}

		$depth = ($reply['depth']<10)?$reply['depth']:9;
		$mention = $reply['name'];

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
			$this->db->query("select count(no) cnt from {$table} where post = ? ", $post_no)->row()->cnt+1;

		$content = $data['message'];

		$query= "insert into {$table} (sn, uid, name,
			content, mention, post,
			follow, relation, depth1, depth2, depth3, depth4, depth5, depth6, depth7, depth8, depth9, depth10)

			values(?, ?, ?,
				?, ?, ?,
				{$follow}, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		$values = array(
			$this->session->userdata('sn'),
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

			if(isset($reply['uid'])) {
				$data = array (
					'sn' => $reply['sn'],
					'uid' => $reply['uid'],
					'type' => 'reply',
					'map' => $info[1],
					'post' => $post_no,
					'reply' => $reply_no,
					'content' => $content
				);

				@$this->profile->message('add', $data, null);
			}
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

		$find = $this->db->query($query, array($post_no, $no));

		if($find->num_rows() === 0) {
			return false;
		} else {
			return ceil($find->row()->idx/REPLY_LIST_ROWS_LIMIT);
		}
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
		$content = $data['message'];
		$no = $data['no'];

		$reply_before_update = $this->reply_select($table, $no);
		if(!$reply_before_update['dtim']) {
			if($this->session->userdata('admin') === true) {
				$query = "update {$table}
					set
						content = ?
					where
						no = ?";
				$values = array(
					$content,

					$no
				);
			} else {
				$query = "update {$table}
					set
						content = ?
					where
						sn = ?
						and uid = ?
						and no = ?";
				$values = array(
					$content,

					$this->session->userdata('sn'),
					$this->session->userdata('uid'),
					$no
				);
			}

			$back = $this->reply_getPageNum($table, $info[3], $no);
			if($this->db->query($query, $values)) {
				$ret = $back;
			} else {
				$ret = false;
			}
		} else {
			$ret = false;
		}

		if ($ret) {
			$data = array (
				'map' => $info[1],
				'no' => $no,
                'sn' => $reply_before_update['sn'],
                'uid' => $reply_before_update['uid'],
				'content' => $content,
				'date' => date('Y-m-d H:i:s')
			);

			$this->profile->update_info('reply', $data);
		}

		return $ret;
	}

	/*
	 * ====================
	 * Usage : $this->map->reply_delete ( [ host($info[0]), map code($info[1]), post type($info[2]), post number($info[3]) ], link info )
	 * Desc : 
	 * ====================
	 */
	public function reply_delete ($data, $info) {
		$table = $this->db->escape_str("map_{$info[1]}_reply");

		$no = $data['no'];
		
		$reply_before_remove = $this->reply_select($table, $no);

		if($this->reply_relation($table, $no, $info[3])) {
			if($this->session->userdata('admin') === true) {
				$query = "UPDATE {$table}
						SET dtim = now()
						WHERE
						no = ?";

				$values = array($no);
			} else {
				$query = "UPDATE {$table}
						SET dtim = now()
						WHERE
							sn = ?
							and uid = ?
							and no = ?";

				$values = array(
					$this->session->userdata('sn'),
					$this->session->userdata('uid'),
					$no
				);
			}
		} else {
			if($this->session->userdata('admin') === true) {
				$query = "DELETE FROM {$table}
						WHERE
						no = ?";

				$values = array($no);
			} else {
				$query = "DELETE FROM {$table}
						WHERE
							sn = ?
							and uid = ?
							and no = ?";

				$values = array(
					$this->session->userdata('sn'),
					$this->session->userdata('uid'),
					$no
				);
			}
		}

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
                'sn' => $reply_before_remove['sn'],
                'uid' => $reply_before_remove['uid'],
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
	public function history_select ($table, $sn, $uid, $type, $no, $act = null) {

		if($act) {
			// $query = "SELECT * FROM {$table} where uid=? and type=? and relation=? and act = ? ";
			$query = "SELECT a.*, count(distinct b.no) cnt
						FROM {$table} a
							left join {$table} b
							on b.relation = a.relation and b.act = ?
						where a.sn=?
							and a.uid=?
							and a.relation=?
							and a.act = ?";
			
			$result = $this->db->query($query, array($act, $sn, $uid, $no, $act));
		} else {
			$query = "SELECT * FROM {$table} where sn=? and uid=? and type=? and relation=? and act in ('up', 'down', '-', 'report') ";
			$result = $this->db->query($query, array($sn, $uid, $type, $no));
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
		$sn = $this->session->userdata('sn');
		$uid = $this->session->userdata('uid');
		$level = $this->session->userdata('level');
		$admin = $this->session->userdata('admin');

		$act = strtolower($this->db->escape_str($data['act']));
		$type = strtolower($this->db->escape_str($data['target']));

		$history_table = $this->db->escape_str("map_{$info[1]}_history");
		$update_table = $this->db->escape_str("map_{$info[1]}_{$type}");

		$result = $this->history_select($history_table, $sn, $uid, $type, $no);

		if( $admin === true ) { 
			$point = 30;
		} else if( $level > 10 ) {
			$point = 10;
		} else if( $level > 2 ) {
			$point = 2;
		} else {
			$point = 1;
		}

		switch($type) {
		case 'post' :
			$vote_info = $this->post_select($data, $info);
			$post = $vote_info->row()->no;
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
				$query = "UPDATE {$history_table} SET act=?, ctim=now(), utim=NULL where uid=? and type=? and relation=? and act='-'";
				if( $this->db->query($query, array($act, $uid, $type, $no)) ) {
					$query = "UPDATE {$update_table} SET {$act} = {$act} + {$point}  where no = ?";
					$ret = $this->db->query($query, $no);

					if($type != 'reply' && $uid != $vote_uid) {
						$query = "UPDATE user_info SET score = score + {$point} where uid = ?";
						$ret = $this->db->query($query, $vote_uid);
					}
				}
			} else {
				$act_check = $result->result();
				if($act == $act_check[0]->act && $act_check[0]->act != '-') {
					$query = "UPDATE {$history_table} SET act='-', utim=now() where uid=? and type=? and relation=? and act=?";
					if( $this->db->query($query, array($uid, $type, $no, $act)) ) {
						$query = "UPDATE {$update_table} SET {$act} = {$act} - {$point}  where no = ?";
						$ret = $this->db->query($query, $no);

						if($type != 'reply' && $uid != $vote_uid ) {
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
				( sn, uid, type, relation, post, act)
				VALUES
				( ?, ?, ?, ?, ?, ?)";
			if( $this->db->query($query, array($sn, $uid, $type, $no, $post, $act)) ) {
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
		$sn = $this->session->userdata('sn');
		$uid = $this->session->userdata('uid');

		$act = strtolower($this->db->escape_str($data['act']));
		$type = strtolower($this->db->escape_str($data['target']));

		$history_table = $this->db->escape_str("map_{$info[1]}_history");
		$reply_table = $this->db->escape_str("map_{$info[1]}_reply");
		$update_table = $this->db->escape_str("user_info");

		$result = $this->history_select($history_table, $sn, $uid, $type, $no, $act);

		$reply_info = $this->reply_select($reply_table, $no);
		if($uid == $reply_info['uid']) {
			return false;
		}

		$post = $reply_info['post'];

		if($result->row()->cnt == 0) {
			$query = "INSERT INTO {$history_table}
				( sn, uid, type, relation, post, act)
				VALUES
				( ?, ?, ?, ?, ?, ?)";

			if( $this->db->query($query, array($sn, $uid, $type, $no, $post, $act)) ) {
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
				."<textarea class='reply-box' id='reply-box-{$id}' placeholder='Leave a Message ...'></textarea>"
				."<div class='reply-button-group'>"
					."<div class='reply-button send'>Send Message &#xf11c; </div>"
					."<div class='reply-button yes'>yes</div>"
					."<div class='reply-button no'>no</div>"
				."</div>"
			."</div>";

		return $ret;
	}
}
