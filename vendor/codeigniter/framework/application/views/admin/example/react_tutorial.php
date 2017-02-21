<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>React - TicTacToe practice</title>

	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
	<link rel="stylesheet" href="/assets/css/style.css">
	
	<script src="/assets/js/libs/react.min.js"></script>
	<script src="/assets/js/libs/react-dom.min.js"></script>

	<style type="text/css">
body {
  font: 14px "Century Gothic", Futura, sans-serif;
  margin: 20px;
}

ol, ul {
  padding-left: 30px;
}

.board-row:after {
  clear: both;
  content: "";
  display: table;
}

.status {
  margin-bottom: 10px;
}

.square {
  background: #fff;
  border: 1px solid #999;
  float: left;
  font-size: 24px;
  font-weight: bold;
  line-height: 34px;
  height: 34px;
  margin-right: -1px;
  margin-top: -1px;
  padding: 0;
  text-align: center;
  width: 34px;
}

.square:focus {
  outline: none;
}

.kbd-navigation .square:focus {
  background: #ddd;
}

.game {
  display: flex;
  flex-direction: row;
}

.game-info {
  margin-left: 20px;
}
	</style>
</head>
<body>
<div id="errors" style="
  background: #c00;
  color: #fff;
  display: none;
  margin: -20px -20px 20px;
  padding: 20px;
  white-space: pre-wrap;
"></div>
<div id="container"></div>
<script>
window.addEventListener('mousedown', function(e) {
  document.body.classList.add('mouse-navigation');
  document.body.classList.remove('kbd-navigation');
});
window.addEventListener('keydown', function(e) {
  if (e.keyCode === 9) {
    document.body.classList.add('kbd-navigation');
  }
});
window.addEventListener('click', function(e) {
  if (e.target.tagName === 'A' && e.target.getAttribute('href') === '#') {
    e.preventDefault();
  }
});
window.onerror = function(message, source, line, col, error) {
  var text = error ? error.stack || error : message + ' (at ' + source + ':' + line + ':' + col + ')';
  errors.textContent += text + '\n';
  errors.style.display = '';
};
console.error = (function(old) {
  return function error() {
    errors.textContent += Array.prototype.slice.call(arguments).join(' ') + '\n';
    errors.style.display = '';
    old.apply(this, arguments);
  }
})(console.error);
</script>
<script>
<?php Babel\Transpiler::transformFile("./assets/js/{$path}.js", [ 'blacklist' => [ 'useStrict' ] ]); ?>
</script>

</body>
</html>
