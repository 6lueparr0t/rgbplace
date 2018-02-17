<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->rgb->start(); $this->rgb->common();?>

<!-- map/list/<?=$map?>/<?=$type?> -->

<div id="notice">
</div>

<div id="list">
<?
$this->map->list($map, $type, 0, LIST_ROWS_LIMIT, $search);
?>
</div>

<?php $this->rgb->end($path); ?>
