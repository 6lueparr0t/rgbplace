<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$string = urldecode($string);

$hash = password_hash("{$string}", PASSWORD_DEFAULT, ['cost'=>12]);
echo "<p>{$string}</p>";
echo "<p>{$hash}</p>";
echo "check : ".password_verify($string, $hash);
