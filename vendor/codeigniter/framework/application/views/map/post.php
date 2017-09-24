<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->rgb->start(); $this->rgb->common();?>

<!-- map/post/<?=$map?>/<?=$type?>/<?=$num?> -->

<?
$this->map->post($map, $type, $num);
$this->map->reply($map, $type, $num);
?>

<div id='list'>
<?
$this->map->list($map, $type, 0, 30);
?>
</div>

<?php $this->rgb->end($path); ?>
