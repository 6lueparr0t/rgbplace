<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->rgb->start(); ?>

<div id="action"></div>

<?php
//------------------------
//output 'Admin' page list
if($minify !== "on") {
	$current_url = current_url();
	
	for($i=0; $i<count($adm_list); $i++) {
		echo "<a href='{$current_url}/{$adm_list[$i]}' style='display:block;'>{$adm_list[$i]}</a>";
	}

	echo br(1);

	for($i=0; $i<count($ex_list); $i++) {
		echo "<a href='{$current_url}/{$ex_list[$i]}' style='display:block;'>{$ex_list[$i]}</a>";
	}
}
//------------------------
?>

<?php $this->rgb->end($path, $minify); ?>
