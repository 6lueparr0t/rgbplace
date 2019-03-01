<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|
|	Used Table : admin_*, user_*
|
*/

class Profile_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

	public function info($no = null) {

		if($no) {

			$query = "SELECT * FROM user_info WHERE sn = ? LIMIT 1";
			$find = $this->db->query($query, $no);

		} else {

			if($this->session->userdata('admin') === true) {
				$name = $this->session->userdata('name');
				$query = "SELECT * FROM admin_info WHERE name = ? LIMIT 1";
				$find = $this->db->query($query, $name);
			} else {
				$sn = $this->session->userdata('sn');
				$query = "SELECT * FROM user_info WHERE sn = ? LIMIT 1";
				$find = $this->db->query($query, $sn);
			}	

		} 

		return (array)$find->row();
	}

	public function update($data) {
		$uid = $this->session->userdata('uid');
		$admin = $this->session->userdata('admin');

		$where_field = isset($data['no'])?'sn':'uid';
		$where_value = isset($data['no'])?$data['no']:$uid;

		if ($admin === true) {

			if($where_field == 'uid') {
				$set = '';
				if(isset($data['name']) && $data['name'] != '') {
					$name = $this->session->userdata('name');
					$set .= "name = '".$this->db->escape_str($data['name'])."', ";
				}

				if(isset($data['pswd']) && $data['pswd'] != '') {
					$set .= "pswd = '".base64_encode(password_hash($this->db->escape_str($data['pswd']), PASSWORD_DEFAULT, ['cost' => 12]))."', ";
				}

				$query = "UPDATE admin_info SET {$set} atim = now() WHERE uid = 'admin' and name = ?";
				$result = $this->db->query( $query, $name );
			} else {
				$set = '';
				if(isset($data['name']) && $data['name'] != '') {
					$set .= "name = '".$this->db->escape_str($data['name'])."', ";
				}

				if(isset($data['mail']) && $data['mail'] != '') {
					$set .= "mail = '".$this->db->escape_str($data['mail'])."', ";
				}

				if(isset($data['pswd']) && $data['pswd'] != '') {
					$set .= "pswd = '".base64_encode(password_hash($this->db->escape_str($data['pswd']), PASSWORD_DEFAULT, ['cost' => 12]))."', ";
				}

				$query = "UPDATE user_info SET {$set} utim = now() WHERE {$where_field} = ?";
				$result = $this->db->query( $query, $where_value);
			}

		} else {
			if(!$data['name']) return false;

			//$query = "UPDATE user_info SET name = ?, mail = ?, utim = now() WHERE uid = ? and DATE_FORMAT(utim , '%Y-%m-%d') < DATE_FORMAT(now(), '%Y-%m-%d')";

			$set = '';
			if(isset($data['name']) && $data['name'] != '') {
				$set .= "name = '".$this->db->escape_str($data['name'])."', ";
			}

			if(isset($data['mail']) && $data['mail'] != '') {
				$set .= "mail = '".$this->db->escape_str($data['mail'])."', ";
			}

			if(isset($data['pswd']) && $data['pswd'] != '') {
				$set .= "pswd = '".base64_encode(password_hash($this->db->escape_str($data['pswd']), PASSWORD_DEFAULT, ['cost' => 12]))."', ";
			}

			$query = "UPDATE user_info SET {$set} utim = now() WHERE uid = ?";
			$result = $this->db->query( $query, $uid );
		}

		if($result) {
			$this->session->unset_userdata( array('name') );
			$this->session->set_userdata( array('name' => $data['name']) );
		}

		return $result;
	}

	public function delete($data) {
		$uid = $this->session->userdata('uid');
		$admin = $this->session->userdata('admin');

		$where_field = isset($data['no'])?'sn':'uid';
		$where_value = isset($data['no'])?base64_decode( urldecode($data['no']) ):$uid;

		if ($admin === true) {

			if($where_field == 'uid') {
				$name = $this->session->userdata('name');

				$query = "DELETE FROM admin_info WHERE uid = 'admin' and name = ?";
				$result = $this->db->query( $query, $name );
			} else {
				$query = "DELETE user.*, conf.* FROM user_info user LEFT JOIN user_conf conf ON user.uid = conf.uid WHERE user.{$where_field}= ?";
				$result = $this->db->query( $query, $where_value );
			}

		} else {
			$query = "DELETE user.*, conf.* FROM user_info user LEFT JOIN user_conf conf ON user.uid = conf.uid WHERE user.uid = ?";
			$result = $this->db->query( $query, $uid );

			$config = ['admin', 'uid', 'name', 'signed_in'];
			$this->session->unset_userdata($config);
		}

		return $result;
	}

	public function add_post($data) {
		$table = 'total_post';
		$this->setting($uid, $name, $sn);

		$query = $this->db->query("INSERT INTO {$table}
			(
				`sn`,
				`uid`,
				`name`,
				`post`,
				`map`,
				`title`
			) VALUES (?, ?, ?, ?, ?, ?);", array($sn, $uid, $name, $data['no'], $data['map'], $data['title']));

		return $query;
	}

	public function add_upload($data) {
		$table = 'total_upload';
		$this->setting($uid, $name, $sn);

		$query = $this->db->query("INSERT INTO {$table}
		(
			`sn`,
			`uid`,
			`name`,
			`client_name`,
			`file_name`,
			`file_type`,
			`file_size`
		) VALUES (?, ?, ?, ?, ?, ?, ?);", array($sn, $uid, $name, $data['client_name'], $data['file_name'], $data['file_type'], $data['file_size']) );

		return $query;
	}

	public function add_reply($data) {
		$table = 'total_reply';
		$this->setting($uid, $name, $sn);

		$query = $this->db->query("INSERT INTO {$table}
		(
			`sn`,
			`uid`,
			`name`,
			`post`,
			`reply`,
			`map`,
			`content`
		) VALUES (?, ?, ?, ?, ?, ?, ?);", array($sn, $uid, $name, $data['post'], $data['no'], $data['map'], $data['content']) );

		return $query;
	}
/*
	public function add_vote($data) {
		$this->setting($table, $col, $uid);

		$json = "{\"no\":\"{$data['no']}\", \"map\":\"{$data['map']}\", \"content\":\"{$data['content']}\", \"date\":\"".date('Y-m-d H:i:s')."\"}";

		$query = $this->db->query("UPDATE {$table} SET vote = JSON_MERGE(vote, JSON_QUERY('{\"history\":[".$json."]}', '$')) where {$col} = ? ", $uid);

		return $query;
	}
 */

	public function select_info($data, $info) {

		$field = $data['tab'];
		$search['no'] = isset($data['no'])?base64_decode( urldecode($data['no'])):0;
		$search['page'] = isset($data['page'])?$data['page']:0;

		if(!$search['no'] && $this->session->userdata('admin') == true) {
			$table = $this->db->escape_str('total_'.$field.' total INNER JOIN admin_info user ON user.name = total.name and user.sn = total.sn');
		} else {
			$table = $this->db->escape_str('total_'.$field.' total INNER JOIN user_info user ON user.uid = total.uid and user.sn = total.sn');
		}

		$this->setting($uid, $name, $sn);

		$where_field = ($search['no'])?'sn':(($this->session->userdata('admin'))?'name':'uid');
		$where_value = ($search['no'])?$search['no']:(($this->session->userdata('admin'))?$name:$uid);

		$start = (($search['page']>1)?$search['page']-1:0)*LIST_ROWS_LIMIT;
		$rows = LIST_ROWS_LIMIT;
		$limit = "{$start}, {$rows}";

		//####################################################################################################

		// paging
			$query = $this->db->query("SELECT COUNT(*) as list_count FROM {$table} WHERE user.{$where_field} = ? ", $where_value);

		// all list count / 30 (default)
		$MAX_LIST_COUNT = $query->row()->list_count;
		$max = ceil($MAX_LIST_COUNT/$rows);
		if($max == 0) $max=1;

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

		// NEED pushstate adaptive
        // ** button-group class start
        $ret['page'] = "<div class='profile-pagination'>";

		$no = ($search['no'])?$search['no']:'';
        $ret['page'].= "<span class='fas fa-step-backward' data-tab='{$field}' data-no='{$no}' data-page='1'></span>";
        $ret['page'].= "<span class='fas fa-backward' data-tab='{$field}' data-page='{$min_pagination}' data-no='{$no}'></span>";

        for($count=0; $count<$range; $count++) {
            $next = $pagination_start;
			if($pagination_start <= $max && $pagination_start != 0) {
				$ret['page'].= "<span class='".(($next == $search['page'] || ($next == 1 && $search['page'] == 0))?'active':'')."' data-tab='{$field}' data-page='{$next}' data-no='{$no}'>{$next}</span>";
			}
            $pagination_start++;
        }

        $ret['page'].= "<span class='fas fa-forward' data-tab='{$field}' data-page='{$max_pagination}' data-no='{$no}'></span>";
		$ret['page'].= "<span class='fas fa-step-forward' data-tab='{$field}' data-page='{$max}' data-no='{$no}'></span>";

		$ret['page'].="</div>";

		//####################################################################################################
		
		// list
		$ret['list'] = '';

		switch ($field) {
		case 'post' :
			$query = $this->db->query("SELECT @IDX := @IDX + 1 AS idx,
				total.uid, total.name, total.map, total.post, total.title, total.date
				FROM {$table}, (SELECT @IDX := 0 ) idx
				WHERE user.{$where_field} = ? ORDER BY idx DESC, total.no DESC LIMIT ".$this->db->escape_str($limit), $where_value);

			foreach ($query->result() as $key => $row) {
				$tmp  = "<div class='tr'>";
				$tmp .= "<div class='td center width-50'>{$row->idx}</div>";
				$tmp .= "<div class='td center width-50'>{$row->map}</div>";
				$tmp .= "<div class='td'>";
				$tmp .= "<a href='/{$row->map}/{$row->post}' target='_blank'>{$row->title}</a><br/>";
				$tmp .= "{$row->date}<br/>";
				$tmp .= "</div>";
				$tmp .= "</div>";

				$ret['list'] .= $tmp;
			}
			break;
		case 'reply' : 
			$query = $this->db->query("SELECT @IDX := @IDX + 1 AS idx,
				total.uid, total.name, total.map, total.post, total.reply, total.content, total.date
				FROM {$table}, (SELECT @IDX := 0 ) idx
				WHERE user.{$where_field} = ? ORDER BY idx DESC, total.no DESC LIMIT ".$this->db->escape_str($limit), $where_value);

			foreach ($query->result() as $key => $row) {
				$tmp  = "<div class='tr'>";
				$tmp .= "<div class='td center width-50'>{$row->idx}</div>";
				$tmp .= "<div class='td center width-50'>{$row->map}</div>";
				$tmp .= "<div class='td font-normal'>";

				$content = stripslashes( preg_replace('/\\\n/i','<br/>', htmlspecialchars($row->content)) );
				$tmp .= "<a href='/{$row->map}/{$row->post}?no={$row->reply}' target='_blank'>{$content}</a><br/>";
				$tmp .= "{$row->date}<br/>";
				$tmp .= "</div>";
				$tmp .= "</div>";

				$ret['list'] .= $tmp;
			}
			break;
		case 'upload' :
			$query = $this->db->query("SELECT @IDX := @IDX + 1 AS idx,
				total.uid, total.name, total.client_name, total.file_name, total.file_type, total.file_size, total.date
				FROM {$table}, (SELECT @IDX := 0 ) idx
				WHERE user.{$where_field} = ? ORDER BY  idx DESC, total.no DESC LIMIT ".$this->db->escape_str($limit), $where_value);

			foreach ($query->result() as $key => $row) {
				$tmp  = "<div class='tr'>";
				$tmp .= "<div class='td center width-50'>{$row->idx}</div>";
				$tmp .= "<div class='td'>";
				$tmp .= "<div class='img'>";
				$tmp .= "<img src='/upload/{$row->file_name}' alt='{$row->client_name}' onclick='popup(\"/upload/{$row->file_name}\", \"{$row->client_name}\")' /><br/>";
				$tmp .= "<i class='copy fas fa-code'>
					<input style='display:none;' value='&lt;img src=\"/upload/{$row->file_name}\" alt=\"{$row->client_name}\" /&gt;' />
					<span class='tooltip'>copied!</span>
					</i>";
				$tmp .= "<i class='copy fas fa-link'>
					<input style='display:none;' value='![img][/upload/{$row->file_name}]' />
					<span class='tooltip'>copied!</span>
					</i>";
				$tmp .= "</div>";
				$tmp .= "<a href='/upload/{$row->file_name}' target='_blank'>{$row->client_name}</a><br/>";
				$tmp .= "{$row->file_type}<br/>";
				$tmp .= "{$row->file_size} KB<br/>";
				$tmp .= "{$row->date}<br/>";
				$tmp .= "</div>";
				$tmp .= "</div>";

				$ret['list'] .= $tmp;
			}
			break;
		}

		//echo $this->db->last_query();
		//####################################################################################################

		return json_encode($ret);
	}


	public function update_info($field, $data) {
		$table = 'total_'.$field;

		if(strpos($data['uid'], '@') !== false) {
			$info = explode('@', $data['uid']);
			$uid_name = 'name';
			$name = $info[1];
		} else {
			$uid_name = 'uid';
			$uid = $data['uid'];
		}

		if (isset($data['title'])) {
			$query = $this->db->query("UPDATE {$table}
				SET
					title = ?,
					date = ? where sn = ? and {$uid_name} = ? and map = ? and post = ? ",
			array($data['title'], $data['date'], $data['sn'], ${$uid_name}, $data['map'], $data['no']) );
		}

		if (isset($data['content'])) {
			$query = $this->db->query("UPDATE {$table}
				SET
					content = ?,
					date = ? where sn = ? and {$uid_name} = ? and map = ? and reply = ? ",
			array($data['content'], $data['date'], $data['sn'], ${$uid_name}, $data['map'], $data['no']) );
		}

		return $query;
	}

	public function remove_info($field, $data) {
		$table = 'total_'.$field;

		if(strpos($data['uid'], '@') !== false) {
			$info = explode('@', $data['uid']);
			$uid_name = 'name';
			$name = $info[1];
		} else {
			$uid_name = 'uid';
			$uid = $data['uid'];
		}

		$query = $this->db->query("DELETE FROM {$table} where sn = ? and {$uid_name} = ? and map = ? and {$field} = ? ", array($data['sn'], ${$uid_name}, $data['map'], $data['no']) );

		return $query;
	}

	public function message($type, $data = array('uid' => ''), $idx = null) {
		switch($type) {
		case 'add' :
			if(strpos($data['uid'], '@') !== false) {
				$info = explode('@', $data['uid']);
				$table = 'admin_info';
				$field = 'name';
				$name = $info[1];
			} else {
				$table = 'user_info';
				$field = 'uid';
				$uid = $data['uid'];
			}

			// Insert
			$msg = (array)json_decode($this->db->query("select msg from {$table} where sn = ? and {$field} = ? ", array($data['sn'], ${$field}))->row()->msg)->total;

			// 100건 넘으면 앞에서 부터 삭제
			if(count($msg) > 100) {
				$update = $this->db->query("UPDATE {$table} SET msg = ifnull(JSON_REMOVE(msg, '$.total[0]'), '{\"total\":[]}') where sn = ? and {$field} = ? ", array($data['sn'], ${$field}));
			}

			$json = "{\"type\":\"{$data['type']}\", \"map\":\"{$data['map']}\", \"post\":\"{$data['post']}\", \"reply\":\"{$data['reply']}\", \"content\":\"{$data['content']}\", \"date\":\"".date('Y-m-d H:i:s')."\"}";

			$ret = $this->db->query("UPDATE {$table} SET msg = ifnull(JSON_MERGE(msg, JSON_QUERY('{\"total\":[".$json."]}', '$')), '{\"total\":[]}') where sn = ? and {$field} = ? ", array($data['sn'], ${$field}));
			break;

		case 'remove' :
			$this->setting($uid, $name, $sn);

			if($this->session->userdata('admin')) {
				$table = 'admin_info';
				$field = 'name';
			} else {
				$table = 'user_info';
				$field = 'uid';
			}

			// Delete
			$ret = $this->db->query("UPDATE {$table} SET msg = ifnull(JSON_REMOVE(msg, '$.total[{$idx}]'), '{\"total\":[]}') where sn = ? and {$field} = ? ", array($sn, ${$field}));
			break;

		case 'show' :
			$this->setting($uid, $name, $sn);

			if($this->session->userdata('admin')) {
				$table = 'admin_info';
				$field = 'name';
			} else {
				$table = 'user_info';
				$field = 'uid';
			}

			// Select
			$msg = (array)json_decode($this->db->query("select msg from {$table} where sn = ? and {$field} = ? ", array($sn, ${$field}))->row()->msg)->total;

			$ret['list'] = '';
			for ( $i = count($msg)-1; $i >= 0; $i--) {
				if(!isset($msg[$i]->date)) {
					$msg[$i]->date = '';
				}

				$tmp = "<div class='tr'>";
				$tmp.= "<div class='td center width-50'>".($i+1)."</div>";
				$tmp.= "<div class='td center width-50'>{$msg[$i]->map}</div>";
				$tmp.= "<div class='td font-normal'>";

				$content = stripslashes( preg_replace('/\\\n/i','<br/>', htmlspecialchars($msg[$i]->content)) );
				$tmp.= "<a href='/{$msg[$i]->map}/{$msg[$i]->post}?no={$msg[$i]->reply}' target='_blank'>{$content}</a>";
				$tmp.= "<div class='delete-message fas fa-times' data-idx='{$i}' ></div><br/>";
				$tmp.= "{$msg[$i]->date}<br/>";
				$tmp.= "</div>";
				$tmp.= "</div>";

				$ret['list'] .= $tmp;
			}
			break;

		}

		return json_encode($ret);
	}

	function setting(&$uid, &$name, &$sn = null) {
		$admin = $this->session->userdata('admin');

		if ($admin === true) {
			$info = explode('@', $this->session->userdata('uid'));
			$uid = $info[0];
			$name = $this->session->userdata('name');
		} else {
			$uid = $this->session->userdata('uid');
			$name = $this->session->userdata('name');
		}

		$sn = $this->session->userdata('sn');
	}

}
