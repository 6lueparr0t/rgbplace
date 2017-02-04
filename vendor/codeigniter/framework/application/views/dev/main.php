<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->rgb->start(); ?>

<style>
a {
	display: block;
}
</style>

<div id="action"></div>

<?php
/*
----
output 'Dev' page list
----
*/
$current_url = current_url();

for($i=0; $i<count($dev_list); $i++) {
	echo "<a href='{$current_url}/{$dev_list[$i]}'>{$dev_list[$i]}</a>";
}

?>

<?php $this->rgb->end($path, $minify); ?>
