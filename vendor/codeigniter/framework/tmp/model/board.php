<?php

namespace Model;
class board extends Database
{
    public function get_list($start = 0, $end = 0)
    {
        $result = $this->sql("select board.*, @ROWNUM := @ROWNUM -1 AS ROWNUM from board, (SELECT @ROWNUM := (select count(*) from board b)) R order by if(isnull(follow), no, follow) desc, depth1, depth2, depth3, depth4, depth5, ctim limit {$start}, {$end}");

        return $result;
    }

    public function get_max_page($range) {
        $result = $this->sql("select count(*) from board");

        foreach($result as $row) {
            $max = ceil($row[0] / $range);
            if ($max == 0) $max = 1;
        }

        return $max;
    }

    public function post($no)
    {
        $result = $this->sql("select * from board where no = {$no}");

        return $result;
    }

    public function pagination($current, $range)
    {
        $result = $this->sql("select count(*) from board");

        foreach($result as $row) {
            $max = ceil($row[0]/$range);
            if($max == 0) $max=1;
        }

        if($current>5) {
            $cur_page=$current-5;
        } else {
            $cur_page=1;
        }

        echo "<a href='/board/list.php?page=1'><li><i class='fa fa-step-backward' aria-hidden='true'></i></li></a>";
        for($count=0; $count<10; $count++) {
            $next = $cur_page;

            if($cur_page++>$max) {
                echo "<li class='page-item'></li>";
            } else {
                echo "<a class='page-link' href='/board/list.php?page={$next}'><li class='page-item'>{$next}</li></a>";
            }

        }
        echo "<a href='/board/list.php?page={$max}'><li><i class='fa fa-step-forward' aria-hidden='true'></i></li></a>";

        return true;
    }

    public function write($data)
    {
        $data['content'] = htmlspecialchars($data['content']);

        $result = $this->sql("insert into board (uid, name, title, content, ctim) "
            ."values('{$data['uid']}', '{$data['name']}', '{$data['title']}', '{$data['content']}', '{$data['ctim']}')");

        return $result;
    }

    public function follow($data)
    {

        $depth_no = $data['depth_no'];
        $depth = [0, 0, 0, 0, 0];
        $result = $this->sql("select depth1, depth2, depth3, depth4, depth5, follow from board where no={$data['no']} order by if(isnull(follow), no, follow) desc, depth1, depth2, depth3, depth4, depth5, ctim ");

        foreach ($result as $row) {
            for($i=0; $i<5; $i++) {
                $depth[$i] = $row[$i];
            }
            if ($data['follow'] == 0) {
                $follow = $row[6];
            } else {
                $follow = $data['follow'];
            }

        }

        $depth[$depth_no] = $depth[$depth_no]+1;

        $data['content'] = htmlspecialchars($data['content']);

        $result = $this->sql("insert into board (uid, name, title, content, ctim, follow, reference, depth1, depth2, depth3, depth4, depth5) "
            ."values('{$data['uid']}', '{$data['name']}', '{$data['title']}', '{$data['content']}', '{$data['ctim']}', '{$follow}', '{$data['no']}', {$depth[0]}, {$depth[1]}, {$depth[2]}, {$depth[3]}, {$depth[4]})");

        return $result;
    }

    public function modify($data)
    {
        $data['content'] = htmlspecialchars($data['content']);

        $result = $this->query("update board set title='{$data['title']}', content='{$data['content']}', utim='{$data['utim']}' where no={$data['no']}");

        return $result;
    }

    public function delete($data)
    {
        $result = $this->query("delete from board where no={$data['no']} or follow={$data['no']} or reference={$data['no']}");
        //$result = $this->query("update board set title='Removed', content='Content has beend Removed', utim={$data['utim']} where no={$data['no']}");

        return $result;
    }


}