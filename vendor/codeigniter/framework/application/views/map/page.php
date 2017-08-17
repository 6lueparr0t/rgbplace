<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->rgb->start(); $this->rgb->common();?>

<!-- map/page/<?=$map?>/<?=$type?>/<?=$num?> -->
<div id="page">
<div id="location">
  <?=$map?>
</div>

<div id="scene">
  <img src="/assets/img/placeholder.jpg" />
</div>

<div class='type'>
  <div class='type-row'>
	<div class='type-col'>
	  <span id='best'>BEST</span>
	  <div class='type-list'>
<?
if($map === "sea") {
	$this->map->total_best_list(6);
} else {
	$this->map->page_type_list($map, 'best', 6);
}
?>
      </div>
    </div>
	<div class='type-col'>
      <span id='free'>FREE</span>
      <div class='type-list'>
<? $this->map->page_type_list($map, 'free', 6); ?>
      </div>
    </div>
	<div class='type-col'>
      <span id='info'>INFO</span>
      <div class='type-list'>
	  <?// $this->map->page_list($map, 'best'); ?>
      </div>
    </div>
  </div>

  <div class='type-row'>
	<div class='type-col'>
      <span id='photo'>PHOTO</span>
      <div class='type-list'>
	  <?// $this->map->page_list($map, 'best'); ?>
      </div>
    </div>
	<div class='type-col'>
      <span id='news'>NEWS</span>
      <div class='type-list'>
	  <?// $this->map->page_list($map, 'best'); ?>
      </div>
    </div>
	<div class='type-col'>
      <span id='ad'>AD</span>
      <div class='type-list'>
	  <?// $this->map->page_list($map, 'best'); ?>
      </div>
    </div>
  </div>
</div>

</div>
<?php $this->rgb->end($path); ?>
