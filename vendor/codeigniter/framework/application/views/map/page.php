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
	<div id='best'>BEST
<?


?>
    </div>
    <div id='free'>FREE
<?


?>
    </div>
    <div id='info'>INFO
<?


?>
    </div>
  </div>
  <div class='type-row'>
    <div id='photo'>PHOTO
<?


?>
    </div>
    <div id='news'>NEWS
<?


?>
    </div>
    <div id='ad'>AD
<?


?>
    </div>
  </div>
</div>

</div>
<?php $this->rgb->end($path); ?>
