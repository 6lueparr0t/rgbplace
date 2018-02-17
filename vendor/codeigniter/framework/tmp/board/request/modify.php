<?php

include_once("{$_SERVER[DOCUMENT_ROOT]}/system/core/database.php");
include_once("{$_SERVER[DOCUMENT_ROOT]}/model/board.php");

$db = new Model\Board();
$now = new DateTime();

$data['no'] = $_POST['no'];
$data['uid'] = $_POST['uid'];
$data['name'] = $_POST['name'];
$data['utim'] = $now->format('Y-m-d H:i:s');
$data['title'] = $_POST['title'];
$data['content'] = $_POST['content'];

$result=$db->modify($data);

echo $result;