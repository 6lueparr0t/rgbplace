<?php include_once("{$_SERVER[DOCUMENT_ROOT]}/system/header.php"); ?>

<?php

$name = "guest";
$mode = "write";

if (isset($_GET['no']) && !isset($_GET['follow'])) {
    $mode = "modify";
    $result = $db->post($_GET['no']);

// 0 : no
// 1 : uid
// 2 : name
// 3 : ctim
// 5 : title
// 6 : content

    foreach ($result as $row) {
        $no = $row[0];
        $uid = $row[1];
        $name = $row[2];
        $title = $row[5];
        $content = $row[6];
    }

}

if (isset($_GET['follow'])) {
    $no = $_GET['no'];
    $mode = "follow";
    $follow = $_GET['follow'];
    $depth = $_GET['depth'];
}

?>

    <form class='<?= $mode ?>' id='<?= $mode ?>' name='<?= $mode ?>' method='post'
          action='/board/request/<?= $mode ?>.php'>
        <input type="hidden" id="no" name="no" value="<?= $no ?>"/>
        <input type="hidden" id="uid" name="uid" value="<?= $name ?>"/>
        <input type="hidden" id="follow_no" name="follow_no" value="<?= $follow ?>"/>
        <input type="hidden" id="depth_no" name="depth_no" value="<?= $depth ?>"/>

        <div class="">
            <input type="text" id="name" name="name" value="<?= $name ?>"/>
            <input type="text" id="title" name="title" value="<?= $title ?>"/>
        </div>

        <textarea id='content' name='content' form='<?= $mode ?>'><?= $content ?></textarea>

        <div class="write-button">
            <input type="submit" value="<?= $mode ?>"/>
            <input type="button" onclick="javascript:location.replace('/board/list.php')" value="Back">
        </div>
    </form>


<?php include_once("{$_SERVER[DOCUMENT_ROOT]}/system/footer.php") ?>