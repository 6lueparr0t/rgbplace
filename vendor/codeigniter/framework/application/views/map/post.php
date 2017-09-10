<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->rgb->start(); $this->rgb->common();?>

map/post/<?=$map?>/<?=$type?>/<?=$num?>

<?
$this->map->post($map, $type, $num);
$this->map->reply($map, $type, $num);
?>

<?
$this->map->list($map, $type, 30);
?>

<?php $this->rgb->end($path); ?>
