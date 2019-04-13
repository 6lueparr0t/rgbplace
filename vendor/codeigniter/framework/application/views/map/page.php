<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common();?>

<!-- map/page/<?=$map?> -->

<div id="notice">
</div>

<div id="page">
  <div id="scene">
	  <a href="<?php echo $url; ?>">
	  <div class='title <?php echo ($title)?'':'no-title'; ?>'>
        <?php echo ($title)?$title:'&nbsp;'; ?></div>
	  </a>
	  <div class='main' style="background-image:url('<?php echo $scene?>');"></div>
  </div>

  <div class='notice'>
<?php
	echo "<a href='{$map}/notice/list'><span id='notice'>".strtoupper('notice')."</span></a>";

	echo "<div class='type-list'>";
    $this->map->page($map, 'notice', 5);
    echo "</div>";
?>
  </div>
  
  <div class='type'> <!-- type start -->
<?

$type = TYPE_LIST;

echo "<div class='type-row'>";
for($i=1; $i<count($type); $i++) {
	if($type[$i] == 'notice') continue;
	if(($i-2)%3 == 0) {
		echo "</div>";
		echo "<div class='type-row'>";
	}

	echo ("
	 <div class='type-col'>
		<a href='{$map}/{$type[$i]}/list'><span id='{$type[$i]}'>".strtoupper($type[$i])."</span></a>
		<div class='type-list'>
	");

	$this->map->page($map, $type[$i], 9);

	echo ("
	    </div>
	  </div>
	");
}
echo "</div>";

?>
  </div> <!-- type end -->

  <div class='tag'>
<!-- user customizing  -->
  </div>
</div>
<?php $this->root->end($path); ?>
