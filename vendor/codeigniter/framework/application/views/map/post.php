<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->rgb->start(); $this->rgb->common();?>

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
$this->map->reply($map, $type, $num);
?>
</div>

<div id='list'>
<?
$this->map->list($map, $type, 0, LIST_ROWS_LIMIT);
?>
</div>

<?php $this->rgb->end($path); ?>
