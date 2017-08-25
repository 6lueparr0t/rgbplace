<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->rgb->start(); $this->rgb->common();?>

<!-- map/page/<?=$map?> -->
<div id="page">
  <div id="scene">
    <img src="/assets/img/placeholder.jpg" />
  </div>
  
  <div class='type'> <!-- type start -->
    <div class='type-row'>
  	  <div class='type-col'>
  	    <a href="/<?=$map?>/best/0"><span id='best'>BEST</span></a>
  	    <div class='type-list'>
<? $this->map->page_type_list($map, 'best', 9); ?>
        </div>
      </div>
  	  <div class='type-col'>
  	    <a href="/<?=$map?>/free/0"><span id='free'>FREE</span></a>
        <div class='type-list'>
<? $this->map->page_type_list($map, 'free', 9); ?>
        </div>
      </div>
  	  <div class='type-col'>
        <a href="/<?=$map?>/info/0"><span id='info'>INFO</span></a>
        <div class='type-list'>
<? $this->map->page_type_list($map, 'info', 9); ?>
        </div>
      </div>
    </div>
  
    <div class='type-row'>
  	  <div class='type-col'>
        <a href="/<?=$map?>/photo/0"><span id='photo'>PHOTO</span></a>
        <div class='type-list'>
<? $this->map->page_type_list($map, 'photo', 9); ?>
        </div>
      </div>
  	  <div class='type-col'>
        <a href="/<?=$map?>/news/0"><span id='news'>NEWS</span></a>
        <div class='type-list'>
<? $this->map->page_type_list($map, 'news', 9); ?>
        </div>
      </div>
  	  <div class='type-col'>
        <a href="/<?=$map?>/ad/0"><span id='ad'>AD</span></a>
        <div class='type-list'>
<? $this->map->page_type_list($map, 'ad', 9); ?>
        </div>
      </div>
	</div>

    <div class='type-row'>
  	  <div class='type-col'>
        <a href="/<?=$map?>/hobby/0"><span id='hobby'>HOBBY</span></a>
        <div class='type-list'>
<? $this->map->page_type_list($map, 'hobby', 9); ?>
        </div>
      </div>
  	  <div class='type-col'>
        <a href="/<?=$map?>/life/0"><span id='life'>LIFE</span></a>
        <div class='type-list'>
<? $this->map->page_type_list($map, 'life', 9); ?>
        </div>
      </div>
  	  <div class='type-col'>
        <a href="/<?=$map?>/work/0"><span id='work'>WORK</span></a>
        <div class='type-list'>
<? $this->map->page_type_list($map, 'work', 9); ?>
        </div>
      </div>
    </div>
  </div> <!-- type end -->

  <div class='tag'>
<!-- user customizing  -->
  </div>
</div>
<?php $this->rgb->end($path); ?>
