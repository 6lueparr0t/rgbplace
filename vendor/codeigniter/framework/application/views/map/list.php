<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->rgb->start(); $this->rgb->common();?>

<!-- map/list/<?=$map?>/<?=$type?> -->

<div id="list">
<?
$this->map->list($map, $type, 0, 30, $search);
?>
</div>

<?php $this->rgb->end($path); ?>
