<?php

include_once("{$_SERVER[DOCUMENT_ROOT]}/system/core/database.php");
include_once("{$_SERVER[DOCUMENT_ROOT]}/model/board.php");

$db = new Model\Board();
$now = new DateTime();
$data['utim'] = $now->format('Y-m-d H:i:s');

$data['no'] = $_GET['no'];
$data['utim'] = $now->format('Y-m-d H:i:s');
//$data['uid'] = $_POST['uid'];
//$data['name'] = $_POST['name'];

$result = $db->delete($data);

if($result) {
    echo ("<script>location.replace('/');</script>");
}