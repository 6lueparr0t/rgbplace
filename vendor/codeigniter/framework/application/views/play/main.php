<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$this->hotpm->start();
?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Hot Place maker : playground</title>

<?php
$this->hotpm->script();
?>
</head>
<body>

<div id="action"></div>

</body>
</html>

<?php
$this->hotpm->end($path, $minify);
?>
