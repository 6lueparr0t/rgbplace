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

    <script src="/assets/js/common/react.min.js"></script>
    <script src="/assets/js/common/react-dom.min.js"></script>

	<style type="text/css">

	::selection { background-color: #E13300; color: white; }
	::-moz-selection { background-color: #E13300; color: white; }

	body {
		background-color: #fff;
		margin: 40px;
		font: 13px/20px normal Helvetica, Arial, sans-serif;
		color: #4F5155;
	}

	a {
		color: #003399;
		background-color: transparent;
		font-weight: normal;
	}

	h1 {
		color: #444;
		background-color: transparent;
		border-bottom: 1px solid #D0D0D0;
		font-size: 19px;
		font-weight: normal;
		margin: 0 0 14px 0;
		padding: 14px 15px 10px 15px;
	}

	code {
		font-family: Consolas, Monaco, Courier New, Courier, monospace;
		font-size: 12px;
		background-color: #f9f9f9;
		border: 1px solid #D0D0D0;
		color: #002166;
		display: block;
		margin: 14px 0 14px 0;
		padding: 12px 10px 12px 10px;
	}

	#body {
		margin: 0 15px 0 15px;
	}

	p.footer {
		text-align: right;
		font-size: 11px;
		border-top: 1px solid #D0D0D0;
		line-height: 32px;
		padding: 0 10px 0 10px;
		margin: 20px 0 0 0;
	}

	#container {
		margin: 10px;
		border: 1px solid #D0D0D0;
		box-shadow: 0 0 8px #D0D0D0;
	}
	</style>
</head>
<body>

<div id="container">
	<h1>Welcome to CodeIgniter!</h1>

	<div id="body">
		<p>The page you are looking at is being generated dynamically by CodeIgniter.</p>

		<p>If you would like to edit this page you'll find it located at:</p>
		<code>application/views/welcome_message.php</code>

		<p>The corresponding controller for this page is found at:</p>
		<code>application/controllers/Welcome.php</code>

		<p>If you are exploring CodeIgniter for the very first time, you should start by reading the <a href="/user_guide/index.html">User Guide</a>.</p>
	</div>

	<p class="footer">Page rendered in <strong>{elapsed_time}</strong> seconds. <?php echo  (ENVIRONMENT === 'development') ?  'CodeIgniter Version <strong>' . CI_VERSION . '</strong>' : '' ?></p>
</div>

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
