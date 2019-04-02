<?php

include_once("{$_SERVER[DOCUMENT_ROOT]}/system/core/database.php");
include_once("{$_SERVER[DOCUMENT_ROOT]}/model/board.php");

$db = new Model\Board();

include_once("{$_SERVER[DOCUMENT_ROOT]}/view/common_top.php");

$current = $page = ($_GET['page'] > 0) ? $_GET['page'] - 1 : 0;
$range = 20;
$max = $db->get_max_page($range);