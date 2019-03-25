<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common(); ?>

<div class='image'>
<?php

$start = ($start>0)?$start:0;
$end = ($end>0)?$end:10;

exec("ls -t ./upload", $output, $status);

echo count($output);

if(!$status) {
	foreach($output as $key => $file) {
		if($key >= $start && $key < $end) {
			echo "<img src='/upload/".$file."' width='200' height='200' />";
		}
	}
}

?>
</div>
<?php $this->root->end($path); ?>
