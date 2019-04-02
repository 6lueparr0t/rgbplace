<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|
|	Used Table : None
|
|	Role : 
|
 */
use \Monolog\Logger;
use \Monolog\Formatter\LineFormatter;
use \Monolog\Handler\StreamHandler;

class Monolog {

	protected $CI;

	public function __construct()
	{
		$this->CI =& get_instance();
	}

	public function _monolog() {
		// Common logger
		$log = new Logger('files');

		// Line formatter without empty brackets in the end
		$formatter = new LineFormatter(null, null, false, true);

		// Debug level handler
		$debugHandler = new StreamHandler('./log/debug.log', Logger::DEBUG);
		$debugHandler->setFormatter($formatter);

		// Error level handler
		$errorHandler = new StreamHandler('./log/error.log', Logger::ERROR);
		$errorHandler->setFormatter($formatter);

		// This will have both DEBUG and ERROR messages
		$log->pushHandler($debugHandler);

		// This will have only ERROR messages
		$log->pushHandler($errorHandler);

		// The actual logging
		$log->debug('I am debug');
		$log->error('I am error', array('productId' => 123));
	}

	public function debug($title, $message) {
		// Common logger
		$log = new Logger($title);

		// Line formatter without empty brackets in the end
		$formatter = new LineFormatter(null, null, false, true);

		// Debug level handler
		$debugHandler = new StreamHandler('./log/debug.log', Logger::DEBUG);
		$debugHandler->setFormatter($formatter);

		// This will have both DEBUG and ERROR messages
		$log->pushHandler($debugHandler);

		// The actual logging
		$log->debug($message);
	}

}
