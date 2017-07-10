<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->rgb->start(); $this->rgb->common(); ?>

<style>
#drop_zone {
  border         : 4px dashed gray;
  width          : 200px;
  height         : 100px;
  text-align     : center;
  display        : table-cell;
  vertical-align : middle;
}
</style>

<div id="drop_zone">
  <strong>Drag N Drop here</strong>
</div>

<?php $this->rgb->end($path); ?>
