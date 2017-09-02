<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->rgb->start(); $this->rgb->common();?>

map/list/<?=$map?>/<?=$type?>

<?

$this->map->list($map, $type, 30, $search);

?>

<?php $this->rgb->end($path); ?>
