<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use MatthiasMullie\Minify;

$path_js    = "/assets/js/{$path}.js";
$path_min   = "/assets/js/{$path}.min.js";

$minifier = new Minify\JS(".{$path_js}");
$minifier->minify(".{$path_min}");

?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Welcome to CodeIgniter</title>

    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="/assets/css/style.css">

    <script src="/assets/js/libs/react.min.js"></script>
    <script src="/assets/js/libs/react-dom.min.js"></script>
</head>

<div id="example"></div>
<div id="example2"></div>
<script>
<?php Babel\Transpiler::transformFile(".{$path_min}", [ 'blacklist' => [ 'useStrict' ] ]); ?>
</script>
</body>
</html>

<?php

echo dirname(__FILE__)."/".basename(__FILE__, '.php')."\n<br/>";
echo basename(dirname(__FILE__))."\n<br/>";
// 실제 경로 출력

$whoami = exec("whoami");
echo ($whoami);

/* ## Use Monolog  ## */
//use \Monolog\Logger as Logger;
//use Monolog\Handler\StreamHandler;
//  
//$log =  new Logger('name');
// 
//// log/your.log 파일에 로그 생성. 로그 레벨은 Info
//$log->pushHandler(new StreamHandler("log/{$whoami}.log", Logger::INFO));
// 
//// add records to the log
//$log->addInfo('Info log');
//
//// Debug 는 Info 레벨보다 낮으므로 아래 로그는 출력되지 않음
//$log->addDebug('Debug log');
//$log->addError('Error log');

$v8 = new V8Js();

/* basic.js */
$JS = <<< EOT
len = print('Hello' + ' ' + 'World!;' + "\\n");
print("<script>");
print('window.onbeforeunload = function(){ return 1; }');
print("</script>");
len;
EOT;

try {
  var_dump($v8->executeString($JS, 'basic.js'));
} catch (V8JsException $e) {
  var_dump($e);
}

/* ## Use php-babel-Transpiler ## */

//$transpiledCode = Babel\Transpiler::transform('class MyClass {  }');
//$otherTranspiledCode = Babel\Transpiler::transformFile('assets/script.js', [ 'blacklist' => [ 'useStrict' ] ]);
?>
