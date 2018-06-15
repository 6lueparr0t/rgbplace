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
	public function list ($map, $type, $start=0, $end=0, $search = null)
	{
		$search_list = ['title', 'content', 'reply', 'name', 'tag', 'date'];
		$data = [];

		$where = "type='{$type}'";

		if(isset($search)) {
			for($i=0; $i<count($search_list); $i++) {
				if(array_key_exists($search_list[$i], $search)) {
					$data[$search_list[$i]] = $search[$search_list[$i]];
				}
			}
		}

		//$where .= " and title like '%{$data['title']}%' ";

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
			$max = ceil($row->list_count/$end);
			if($max == 0) $max=1;
		}

		// 'page' option check
		$current = 1;
		if(array_key_exists('page', $data)) {
			if($data['page'] <= $max) {
				$current = $data['page'];
			}
		}

		if($current > 5) {
			$cur_page = $current - 5;
		} else {
			$cur_page = 1;
		}

		$range = PAGINATION_COUNT;

		// first page
		$min_page = ((int)$current-(int)$range>0)?(int)$current-(int)$range:1;

		// end page
		$max_page = ((int)$current+(int)$range>$max)?$max:(int)$current+(int)$range;

		// ** button-group class start
		echo "<div class='button-group'>";
		echo "<a class='refresh' href='/{$map}/{$type}/list'><span>LIST</span></a>";

		echo "<div class='pagination'>";
		echo "<a href='/{$map}/{$type}/list?page={$min_page}'><i class='fa fa-step-backward'></i></a>";

		for($count=0; $count<10; $count++) {
			$next = $cur_page;

			if($cur_page++>$max) {
			} else {
				echo "<a href='/{$map}/{$type}/list?page={$next}'>{$next}</a>";
			}

		}

		echo "<a href='/{$map}/{$type}/list?page={$max_page}'><i class='fa fa-step-forward'></i></a>";
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
			echo "<div class='no-post'>Not Found <i class='fa fa-frown-o'></i> </div>";

			return false;
		}

		echo "<div class='post'>";
		foreach ($find->result() as $key => $row) {
			$date = ($row->utim <= $row->ctim)? date("Y-m-d", strtotime($row->ctim)) : date("Y-m-d", strtotime($row->utim));
			$time = ($row->utim <= $row->ctim)? date("H:i:s", strtotime($row->ctim)) : date("H:i:s", strtotime($row->utim));
			$no = $row->no;
			$uid= $row->uid;

			echo "<div class='post-title'><a href='/{$map}/{$row->type}/{$no}'>{$row->title}</a></div>";
			echo "<div class='post-date' ><i class='fa fa-clock-o'></i> {$date} {$time} </div>";

			//."<span class='vote'>{$row->vote}</span>"
			echo "<div class='post-info'>"
				."<span class='name' ><i class='fa fa-user'></i> {$row->name} </span>"
				."<span class='hit'  ><i class='fa fa-eye'></i> {$row->hit} </span>"
				."<span class='reply'><i class='far fa-comment-dots'></i> {$row->reply} </span>"
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
			echo "<div class='reply-root'>";
			$this->replyBox();
			echo "</div>";
			return false;
		}

		echo "<div class='reply-root'>";
		echo "<ul id='reply-list'>";


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

			echo "<li class='depth-{$depth_no}'>";
			echo "<ul>";

			echo "<span class='no'>{$no}</span>";
			echo "<li class='content'>";

			/* depth arrow output : top */
			echo "<span name='space' id='space'>";
			for($i=0; $i<$depth_no; $i++) {
				echo "<i class='fa fa-reply' style='transform: rotate3d(0, 0, -1, 180deg);'></i>";
			}
			echo "</span>";
			/* depth arrow output : end */

			echo "<b class='mention'>{$mention}</b> {$content}</li>";

			// reply info start
			echo "<div class='reply-info'>";
			echo "<div class='name'>{$name}</div>";
			echo "<div class='depth'>{$depth_no}</div>";
			echo "<div class='follow'>{$follow}</div>";
			echo "<div class='date'> {$date} {$time} </div>";

			// daihyun99 to do : button class setting color
			/* func : top */
			echo "<div class='func'>";

				echo "<button class='up {$btn_perm}'><i class='far fa-thumbs-up'></i></button>";
				echo "<button class='down {$btn_perm}'><i class='far fa-thumbs-down'></i></button>";

				echo "<button class='reply {$btn_perm}'><i class='fa fa-reply' style='transform: rotate3d(1, 0, 0, 180deg);'></i></button>";

				if($uid == $reply_uid || $admin ) {
					$reply_perm = "enable";
				} else {
					$reply_perm = "disable";
				}

				echo "<button class='modify {$reply_perm}'><i class='fa fa-pencil-alt'></i></button>";
				echo "<button class='delete {$reply_perm}'><i class='fa fa-trash'></i></button>";
				echo "<button class='report ' ><i class='far fa-paper-plane'></i></button>";

			echo "</div>";
			/* func : end */
				
			echo "</div>";
			// reply info finish

			echo "</ul>";
			echo "</li>";

		}
		echo "</ul>";
		$this->replyBox();
		echo "</div>";

		//input reply text box
		return true;
	}

	/*
	 * ====================
	 * Usage : $this->map->reply_insert ( [map code, post type, post number], data )
	 * Desc : 
	 * ====================
	 */
	public function reply_insert ($data, $info)
	{
		//$this->monolog->debug('reply_insert', print_r($data,1));
		//$this->monolog->debug('reply_insert', print_r($info,1));
/*
 *        $table = "map_{$info[1]}_reply";
 *        $post_no = $info[3];
 *
 *        $depth = $data['depth'];
 *        $mention = $data['mention'];
 *
 *        $depth_array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
 *
 *
 *        $follow = "NULL";
 *
 *        if($depth>0) {
 *            $follow = $data['follow'];
 *            $query = "select ";
 *
 *            for($i=0; $i<count($depth_array); $i++) {
 *
 *                if($i==$depth) {
 *                    $query.= "max(depth".($i+1).") depth".($i+1).",";
 *                } else {
 *                    $query.= "depth".($i+1).",";
 *                }
 *            }
 *
 *            if($depth==1) {
 *                $query .= "	follow
 *                    from {$table}
 *                    where no='{$follow}'";
 *            } else {
 *                $query .= "	follow
 *                    from {$table}
 *                    where follow='{$follow}'";
 *            }
 *
 *            $this->monolog->debug('reply_insert', $query);
 *            //exit();
 *
 *            $select = $this->db->query($query);
 *
 *            //$this->monolog->debug('reply_insert', print_r($select->result(),1));
 *
 *            $row = $select->result()[0];
 *
 *            //exit();
 *            for($i=0; $i<count($depth_array); $i++) {
 *                $depth_array[$i] = $row->{'depth'.($i+1)};
 *            }
 *            //if($depth==1) $depth_array[$depth]++;
 *        }
 *
 *        $depth_array[$depth] = $depth_array[$depth]+1;
 *
 *        $data['message'] = htmlspecialchars($data['message']);
 *
 *        $query= "insert into {$table} (uid, name,
 *            content, mention, post,
 *            follow, depth1, depth2, depth3, depth4, depth5, depth6, depth7, depth8, depth9, depth10)
 *
 *            values('".$this->session->userdata('uid')."', '".$this->session->userdata('name')."',
 *                '{$data['message']}', '{$mention}', '{$post_no}',
 *                {$follow}, {$depth_array[0]}, {$depth_array[1]}, {$depth_array[2]}, {$depth_array[3]}, {$depth_array[4]}, {$depth_array[5]}, {$depth_array[6]}, {$depth_array[7]}, {$depth_array[8]}, {$depth_array[9]})";
 *
 *        $this->monolog->debug('reply_insert', $query);
 *        
 *        $result = $this->db->query($query);
 *
 *        $this->monolog->debug('reply_insert', $result);
 *
 *        return $result;
 */
	}

	/*
	 * ====================
	 * Usage : $this->map->reply_modify ( [map code, post type, post number], data )
	 * Desc : 
	 * ====================
	 */
	public function reply_modify ()
	{
	}

	/*
	 * ====================
	 * Usage : $this->map->reply_delete ( [map code, post type, post number], data )
	 * Desc : 
	 * ====================
	 */
	public function reply_delete ()
	{
	}

	private function replyBox($status = "block", $id=0, $depth=0) {
		echo "<div class='reply {$status}' id='reply-{$id}' name='reply-{$id}'>"
				."<input type='hidden' class='reply-no' value='{$id}'>"
				."<input type='hidden' class='reply-depth' value='{$depth}'>"
				."<input type='hidden' class='reply-follow' value=''>"
				."<input type='hidden' class='reply-name' value=''>"
				."<textarea class='reply-box' id='reply-box-{$id}' placeholder='Leave a Message .. &#xf303;'></textarea>"
				."<div class='reply-button-group'>"
					."<div class='reply-button send'>Send Message &#xf11c; </div>"
					."<div class='reply-button yes'>yes</div>"
					."<div class='reply-button no'>no</div>"
				."</div>"
			."</div>";
	}

}
