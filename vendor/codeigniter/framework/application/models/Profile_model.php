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

	public function info() {
		if($this->session->userdata('admin') === true) {

			$name = $this->session->userdata('name');
			$query = "SELECT * FROM admin_info WHERE name = ? LIMIT 1";
			$find = $this->db->query($query, $name);

		} else {

			$uid = $this->session->userdata('uid');
			$query = "SELECT * FROM user_info WHERE uid = ? LIMIT 1";
			$find = $this->db->query($query, $uid);

		}

		return (array)$find->row();
	}

	public function update($data) {
		$uid = $this->session->userdata('uid');
		$admin = $this->session->userdata('admin');

		if ($admin === true) {

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
			if(!$data['name']) return false;

			//$query = "UPDATE user_info SET name = ?, email = ?, utim = now() WHERE uid = ? and DATE_FORMAT(utim , '%Y-%m-%d') < DATE_FORMAT(now(), '%Y-%m-%d')";

			$set = '';
			if(isset($data['name']) && $data['name'] != '') {
				$set .= "name = '".$this->db->escape_str($data['name'])."', ";
			}

			if(isset($data['email']) && $data['email'] != '') {
				$set .= "email = '".$this->db->escape_str($data['email'])."', ";
			}

			if(isset($data['pswd']) && $data['pswd'] != '') {
				$set .= "pswd = '".base64_encode(password_hash($this->db->escape_str($data['pswd']), PASSWORD_DEFAULT, ['cost' => 12]))."', ";
			}

			$query = "UPDATE user_info SET {$set} utim = now() WHERE uid = ?";
			$result = $this->db->query( $query, $uid );
		}

		$this->session->unset_userdata( array('name') );
		$this->session->set_userdata( array('name' => $data['name']) );

		return $result;
	}

	public function add_post($data) {
		$table = 'total_post';
		$this->setting($uid, $name);

		$query = $this->db->query("INSERT INTO {$table}
			(
				`uid`,
				`name`,
				`post`,
				`map`,
				`title`
			) VALUES (?, ?, ?, ?, ?);", array($uid, $name, $data['no'], $data['map'], $data['title']));

		return $query;
	}

	public function add_upload($data) {
		$table = 'total_upload';
		$this->setting($uid, $name);

		$query = $this->db->query("INSERT INTO {$table}
		(
			`uid`,
			`name`,
			`client_name`,
			`file_name`,
			`file_type`,
			`file_size`
		) VALUES (?, ?, ?, ?, ?, ?);", array($uid, $name, $data['client_name'], $data['file_name'], $data['file_type'], $data['file_size']) );

		return $query;
	}

	public function add_reply($data) {
		$table = 'total_reply';
		$this->setting($uid, $name);

		$query = $this->db->query("INSERT INTO {$table}
		(
			`uid`,
			`name`,
			`post`,
			`reply`,
			`map`,
			`content`
		) VALUES (?, ?, ?, ?, ?, ?);", array($uid, $name, $data['post'], $data['no'], $data['map'], $data['content']) );

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

	//public function select_info($field, $start=0, $rows=0, $search = array()) {
	public function select_info($data, $info) {

		$field = $data['field'];
		$search['page'] = isset($data['page'])?$data['page']:0;

		$table = $this->db->escape_str('total_'.$field);
		$this->setting($uid, $name);

		$start = (($data['page']>1)?$data['page']-1:0)*LIST_ROWS_LIMIT;
		$rows = LIST_ROWS_LIMIT;
		$limit = "{$start}, {$rows}";

		//####################################################################################################

		// paging
		$query = $this->db->query("SELECT COUNT(*) as list_count FROM {$table} WHERE uid = ? ", array($uid));

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

        // ** button-group class start
        $ret['page'] = "<div class='button-group'>";
        $ret['page'].= "<div class='pagination'>";

        $ret['page'].= "<a class='fas fa-step-backward' href='/profile?tab={$field}&page=1'></a>";
        $ret['page'].= "<a class='fas fa-backward' href='/profile?tab={$field}&page={$min_pagination}'></a>";

        for($count=0; $count<$range; $count++) {
            $next = $pagination_start;
            if($pagination_start <= $max && $pagination_start != 0) $ret['page'].= "<a href='/profile?tab={$field}&page={$next}'>{$next}</a>";
            $pagination_start++;
        }

        $ret['page'].= "<a class='fas fa-forward' href='/profile?tab={$field}&page={$max_pagination}'></a>";
		$ret['page'].= "<a class='fas fa-step-forward' href='/profile?tab={$field}&page={$max}'></a>";

        $ret['page'].="</div>";
		$ret['page'].="</div>";

		//####################################################################################################
		
		// list
		$idx_start = $MAX_LIST_COUNT - ((($data['page']>0?$data['page']:1)-1)*LIST_ROWS_LIMIT) + 1; 

		$ret['list'] = '';
		switch ($field) {
		case 'post' :
			$query = $this->db->query("SELECT @IDX := @IDX - 1 AS idx,
				uid, name, map, post, title, date FROM {$table}, (SELECT @IDX := {$idx_start} ) idx
				WHERE uid = ? ORDER BY no DESC LIMIT ".$this->db->escape_str($limit), array($uid));
			foreach ($query->result() as $key => $row) {
				$tmp  = "<div class='td center width-50'>{$row->idx}</div>";
				$tmp .= "<div class='td center width-50'>{$row->map}</div>";
				$tmp .= "<div class='td'>";
				$tmp .= "<a href='/{$row->map}/{$row->post}' target='_blank'>{$row->title}</a><br/>";
				$tmp .= "{$row->date}<br/>";
				$tmp .= "</div>";

				$ret['list'] .= $tmp;
			}
			break;
		case 'reply' : 
			$query = $this->db->query("SELECT @IDX := @IDX - 1 AS idx,
				uid, name, map, post, reply, content, date FROM {$table}, (SELECT @IDX := {$idx_start} ) idx
				WHERE uid = ? ORDER BY no DESC LIMIT ".$this->db->escape_str($limit), array($uid));
			foreach ($query->result() as $key => $row) {
				$tmp  = "<div class='td center width-50'>{$i}</div>";
				$tmp .= "<div class='td center width-50'>{$row->map}</div>";
				$tmp .= "<div class='td font-normal'>";
				$tmp .= "<a href='/{$row->map}/{$row->post}?no={$row->reply}' target='_blank'>{$row->content}</a><br/>";
				$tmp .= "{$row->date}<br/>";
				$tmp .= "</div>";

				$ret['list'] .= $tmp;
			}
			break;
		case 'upload' :
			$query = $this->db->query("SELECT @IDX := @IDX - 1 AS idx,
				uid, name, client_name, file_name, file_type, file_size, date FROM {$table}, (SELECT @IDX := {$idx_start} ) idx
			   	WHERE uid = ? ORDER BY no DESC LIMIT ".$this->db->escape_str($limit), array($uid));
			foreach ($query->result() as $key => $row) {
				$tmp  = "<div class='td center width-50'>{$row->idx}</div>";
				$tmp .= "<div class='td'>";
				$tmp .= "<a href='/upload/{$row->file_name}' target='_blank'>{$row->client_name}</a><br/>";
				$tmp .= "{$row->file_type}<br/>";
				$tmp .= "{$row->file_size} KB<br/>";
				$tmp .= "{$row->date}<br/>";
				$tmp .= "</div>";

				$ret['list'] .= $tmp;
			}
			break;
		}

		//####################################################################################################

		echo json_encode($ret);
	}


	public function update_info($field, $data) {
		$table = 'total_'.$field;
		$this->setting($uid, $name);

		if (isset($data['title'])) {
			$query = $this->db->query("UPDATE {$table}
				SET
					title = ?,
					date = ? where uid = ? and map = ? and post = ? ",
			array($data['title'], $data['date'], $uid, $data['map'], $data['no']) );
		}

		if (isset($data['content'])) {
			$query = $this->db->query("UPDATE {$table}
				SET
					content = ?,
					date = ? where uid = ? and map = ? and reply = ? ",
			array($data['content'], $data['date'], $uid, $data['map'], $data['no']) );
		}

		return $query;
	}

	public function remove_info($field, $data) {
		$table = 'total_'.$field;
		$this->setting($uid, $name);

		$query = $this->db->query("DELETE FROM {$table} where uid = ? and map = ? and {$field} = ? ", array($uid, $data['map'], $data['no']) );

		return $query;
	}

	function setting(&$uid, &$name) {
		$admin = $this->session->userdata('admin');

		if ($admin === true) {
			$info = explode('@', $this->session->userdata('uid'));
			$uid = $info[0];
			$name = $this->session->userdata('name');
		} else {
			$uid = $this->session->userdata('uid');
			$name = $this->session->userdata('name');
		}
	}

}
