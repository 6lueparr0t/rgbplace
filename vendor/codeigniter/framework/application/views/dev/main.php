<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$this->rgb->start();
?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Hot Place maker : playground</title>

<?php
$this->rgb->script();
?>

<style>

a {
display: block;
}

</style>

</head>
<body>

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

</body>
</html>

<?php
$this->rgb->end($path, $minify);
?>
