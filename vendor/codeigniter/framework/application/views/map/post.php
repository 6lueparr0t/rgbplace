<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common();?>

<!-- map/post/<?=$map?>/<?=$type?>/<?=$num?> -->

<div id="notice">
</div>

<div id='post'>
<?
$this->map->post($map, $type, $num);
?>
</div>

<div id='reply'>
<?
//$this->map->reply($map, $type, $num);
?>
</div>

<div id='list'>
<?
$page = $this->input->get('page', TRUE);
$start = ($page>1)?$page-1:0;

$search = [
    'page' => $page
];

$this->map->list($map, $type, $start*LIST_ROWS_LIMIT, 0, $search);
?>
</div>

<?php $this->root->end($path); ?>
