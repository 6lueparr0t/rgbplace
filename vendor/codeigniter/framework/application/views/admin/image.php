<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common(); ?>
<?

$dir = opendir("./upload");

while(($file = readdir($dir)) !== false) {
    if ($file == '.' || $file == '..') continue;

    echo "<img src='/upload/".$file."' />";
}

closedir($dir);
?>
<?php $this->root->end($path); ?>
