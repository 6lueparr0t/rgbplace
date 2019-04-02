<?php

include_once("{$_SERVER[DOCUMENT_ROOT]}/system/core/database.php");
include_once("{$_SERVER[DOCUMENT_ROOT]}/model/board.php");

$db = new Model\Board();
$now = new DateTime();

$data['uid'] = $_POST['uid'];
$data['name'] = $_POST['name'];
$data['title'] = $_POST['title'];
$data['ctim'] = $now->format('Y-m-d H:i:s');
$data['content'] = $_POST['content'];

$result = $db->write($data);

echo $result;