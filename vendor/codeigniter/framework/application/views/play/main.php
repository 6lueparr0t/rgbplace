<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$this->rgb->start();
?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>RGB place : playground</title>

<?php
$this->rgb->script();
?>
</head>
<body>
<div id="action"></div>
</body>
</html>

<?php
$this->rgb->end($path, $minify);
?>
