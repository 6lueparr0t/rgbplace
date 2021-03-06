<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|--------------------------------------------------------------------------
| Display Debug backtrace
|--------------------------------------------------------------------------
|
| If set to TRUE, a backtrace will be displayed along with php errors. If
| error_reporting is disabled, the backtrace will not display, regardless
| of this setting
|
*/
defined('SHOW_DEBUG_BACKTRACE') OR define('SHOW_DEBUG_BACKTRACE', TRUE);

/*
|--------------------------------------------------------------------------
| File and Directory Modes
|--------------------------------------------------------------------------
|
| These prefs are used when checking and setting modes when working
| with the file system.  The defaults are fine on servers with proper
| security, but you may wish (or even need) to change the values in
| certain environments (Apache running a separate process for each
| user, PHP under CGI with Apache suEXEC, etc.).  Octal values should
| always be used to set the mode correctly.
|
*/
defined('FILE_READ_MODE')  OR define('FILE_READ_MODE', 0644);
defined('FILE_WRITE_MODE') OR define('FILE_WRITE_MODE', 0666);
defined('DIR_READ_MODE')   OR define('DIR_READ_MODE', 0755);
defined('DIR_WRITE_MODE')  OR define('DIR_WRITE_MODE', 0755);

/*
|--------------------------------------------------------------------------
| File Stream Modes
|--------------------------------------------------------------------------
|
| These modes are used when working with fopen()/popen()
|
*/
defined('FOPEN_READ')                           OR define('FOPEN_READ', 'rb');
defined('FOPEN_READ_WRITE')                     OR define('FOPEN_READ_WRITE', 'r+b');
defined('FOPEN_WRITE_CREATE_DESTRUCTIVE')       OR define('FOPEN_WRITE_CREATE_DESTRUCTIVE', 'wb'); // truncates existing file data, use with care
defined('FOPEN_READ_WRITE_CREATE_DESTRUCTIVE')  OR define('FOPEN_READ_WRITE_CREATE_DESTRUCTIVE', 'w+b'); // truncates existing file data, use with care
defined('FOPEN_WRITE_CREATE')                   OR define('FOPEN_WRITE_CREATE', 'ab');
defined('FOPEN_READ_WRITE_CREATE')              OR define('FOPEN_READ_WRITE_CREATE', 'a+b');
defined('FOPEN_WRITE_CREATE_STRICT')            OR define('FOPEN_WRITE_CREATE_STRICT', 'xb');
defined('FOPEN_READ_WRITE_CREATE_STRICT')       OR define('FOPEN_READ_WRITE_CREATE_STRICT', 'x+b');

/*
|--------------------------------------------------------------------------
| Exit Status Codes
|--------------------------------------------------------------------------
|
| Used to indicate the conditions under which the script is exit()ing.
| While there is no universal standard for error codes, there are some
| broad conventions.  Three such conventions are mentioned below, for
| those who wish to make use of them.  The CodeIgniter defaults were
| chosen for the least overlap with these conventions, while still
| leaving room for others to be defined in future versions and user
| applications.
|
| The three main conventions used for determining exit status codes
| are as follows:
|
|    Standard C/C++ Library (stdlibc):
|       http://www.gnu.org/software/libc/manual/html_node/Exit-Status.html
|       (This link also contains other GNU-specific conventions)
|    BSD sysexits.h:
|       http://www.gsp.com/cgi-bin/man.cgi?section=3&topic=sysexits
|    Bash scripting:
|       http://tldp.org/LDP/abs/html/exitcodes.html
|
*/
defined('EXIT_SUCCESS')        OR define('EXIT_SUCCESS', 0); // no errors
defined('EXIT_ERROR')          OR define('EXIT_ERROR', 1); // generic error
defined('EXIT_CONFIG')         OR define('EXIT_CONFIG', 3); // configuration error
defined('EXIT_UNKNOWN_FILE')   OR define('EXIT_UNKNOWN_FILE', 4); // file not found
defined('EXIT_UNKNOWN_CLASS')  OR define('EXIT_UNKNOWN_CLASS', 5); // unknown class
defined('EXIT_UNKNOWN_METHOD') OR define('EXIT_UNKNOWN_METHOD', 6); // unknown class member
defined('EXIT_USER_INPUT')     OR define('EXIT_USER_INPUT', 7); // invalid user input
defined('EXIT_DATABASE')       OR define('EXIT_DATABASE', 8); // database error
defined('EXIT__AUTO_MIN')      OR define('EXIT__AUTO_MIN', 9); // lowest automatically-assigned error code
defined('EXIT__AUTO_MAX')      OR define('EXIT__AUTO_MAX', 125); // highest automatically-assigned error code

#PasswordHash.php constant
//define('PBKDF2_HASH_ALGORITHM', 'sha256');
//define('PBKDF2_ITERATIONS', 10000);
//define('PBKDF2_SALT_BYTE_SIZE', 24);
//define('PBKDF2_HASH_BYTE_SIZE', 24);

//define('HASH_SECTIONS', 4);
//define('HASH_ALGORITHM_INDEX', 0);
//define('HASH_ITERATION_INDEX', 1);
//define('HASH_SALT_INDEX', 2);
//define('HASH_PBKDF2_INDEX', 3);

define('UPLOAD_PATH', '/upload/');

define('DEFAULT_MAP', 'space');

/*##### POST  : pagination ##############*/

//PAGINATION_COUNT => MINIMUM VALUE : 3, DEFAULT : 5
define('PAGINATION_COUNT', 5);

//LIST_ROWS_LIMIT => MINIMUM VALUE : 1, DEFAULT : 20
define('LIST_ROWS_LIMIT', 20);

/*##### REPLY : pagination ##############*/

//PAGINATION_COUNT => MINIMUM VALUE : 3
define('REPLY_PAGINATION_COUNT', 9);

//LIST_ROWS_LIMIT => MINIMUM VALUE : 1
define('REPLY_LIST_ROWS_LIMIT', 40);
/* !!!!! if you modify, codeigniter/framework/assets/js/comm/src/0.js check !!!!! */

//['best', 'free', 'info', 'photo', 'food', 'life', 'news', 'dev', 'public'];
// modify controllers/Api.php , assets/js/src/map/post.js
define('TYPE_LIST', ['#', 'notice', 'event', 'best', 'trip', 'food', 'daily', 'play', 'news', 'dev', 'free']);

define(
	'LEVEL_BOUND'  ,
	[ '0'  => -20  ,
	  '1'  =>  20  ,
	  '2'  =>  40  ,
	  '3'  =>  60  ,
	  '4'  =>  100 ,
	  '5'  =>  140 ,
	  '6'  =>  220 ,
	  '7'  =>  300 ,
	  '8'  =>  460 ,
	  '9'  =>  620 ,
	  '10' =>  800 ,
	  '11' => 1000  ]
);

define('WS_KEY', '$GLY%P!DEyRa*fajGwS?<l3%|Il.1IlfQW');

define('CIPHER_METHOD', 'aes-128-gcm');
define('CIPHER_KEY', 'Have a nice Day!');

define('GOOGLE_API_KEY', 'AIzaSyCLfqh2kzDo3DzclIyQ5IWF8GUjGwOyjnc');
define('RECAPTCHA_SECRET', '6LftwYcUAAAAAKvG_NpHlJlfETPH8a7mPT1vrivf');

define('SMTP_HOST', 'smtp.mailgun.org');
define('SMTP_PORT', '2525');
define('SMTP_USER', 'postmaster@rgbplace.com');
define('SMTP_PASS', '6lueparr0t@gmail.com');

define('OAUTH_LIST', ['google', 'kakao', 'naver']);

//DB PASSWORD
define('DB_PASSWORD', hex2bin('99C93BAB786DDA9D2764D50FF06C7DE5A4215BB460ED592C04247ECB741BAB8A'));
define('DB_METHOD', 'aes-128-gcm');
define('DB_KEY', hex2bin('9671bd33cccfcf99726a0179725dcee6'));
define('DB_IV', hex2bin('e164a5428083bc338ee3fe9c'));
define('DB_TAG', hex2bin('0325f182361626a93361d5d77f1c1de5'));
