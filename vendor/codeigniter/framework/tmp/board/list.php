<?php include_once("{$_SERVER[DOCUMENT_ROOT]}/system/header.php"); ?>

    <div class="list">
        <ul class="list-row">
            <? $result = $db->get_list($page * $range, $range);

            // 0 : no
            // 2 : name
            // 3 : ctim
            // 4 : utim
            // 5 : title
            // 6 : content

            //$seq = $db->get_list_count($page * $range, $range);
            $page += 1;
            foreach ($result as $row) {

                $depth = [$row[8] , $row[9], $row[10], $row[11], $row[12]];

                $depth_no = 0;
                for($i=0; $i<count($depth); $i++) {
                    if($depth[$i]>0) {
                        $depth_no = $i;
                    }
                }

                echo "<li>"
                    . "<span class='seq'>{$row[14]}</span>"
                    . "<span class='no-{$depth_no}'>{$row[0]}</span><span class='name'>{$row[2]}</span>"
                    . "<span class='title'><a href='/board/post.php?no={$row[0]}&page={$page}'>"
                    . "{$row[5]}"
                    . "</a></span><span class='ctim'>{$row[3]}</span>/<span class='utim'>{$row[4]}</span>"
                    . "</li>";

            }

            ?>
        </ul>

        <div class="action">
            <a href="/board/list.php">List</a>
            <a href="/board/write.php">write</a>
        </div>

        <div class="pagination">
            <? $db->pagination($current, $range); ?>
        </div>
    </div>

<?php include_once("{$_SERVER[DOCUMENT_ROOT]}/system/footer.php") ?>