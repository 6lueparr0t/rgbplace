<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|
|	Used Table : None
|
|	Role : Websocket Library
|
 */

class Websocket {

	protected $CI;

	public function __construct()
	{
		$this->CI =& get_instance();
		$this->CI->allow=array('');
	}

	public function send($msg, $mode = 'SEND_ONLY') {

		$protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
        $host = $_SERVER['HTTP_HOST'];
        $port = ':1323';
        $path = '/push';

		$sp = $this->websocket_open($protocol.$host.$port.$path);
		$this->websocket_write($sp, $msg);

		if($mode != 'SEND_ONLY') {
			$ret = websocket_read($sp,true);
			echo json_encode($ret);
		}

	}

	// Reference : https://github.com/paragi/PHP-websocket-client/blob/master/websocket_client.php
	function websocket_open($url){
		$key=base64_encode(uniqid());
		$query=parse_url($url);
		$header="GET {$query['path']} HTTP/1.1\r\n"
			."pragma: no-cache\r\n"
			."cache-control: no-cache\r\n"
			."Upgrade: WebSocket\r\n"
			."Connection: Upgrade\r\n"
			."Host: {$query['host']}:{$query['port']}\r\n"
			."Sec-WebSocket-Key: $key\r\n"
			."Sec-WebSocket-Version: 13\r\n"
			."\r\n";
		$sp=fsockopen($query['host'],$query['port'], $errno, $errstr,1);
		if(!$sp) die("Unable to connect to server ".$url);
		// Ask for connection upgrade to websocket
		fwrite($sp,$header);
		stream_set_timeout($sp,5);
		$reaponse_header=fread($sp, 1024);
		if(!strpos($reaponse_header," 101 ")
			|| !strpos($reaponse_header,'Sec-WebSocket-Accept: ')){
			die("Server did not accept to upgrade connection to websocket"
				.$reaponse_header);
		}
		return $sp;
	}

	function websocket_write($sp, $data,$final=true){
		// Assamble header: FINal 0x80 | Opcode 0x02
		$header=chr(($final?0x80:0) | 0x02); // 0x02 binary

		// Mask 0x80 | payload length (0-125)
		if(strlen($data)<126) $header.=chr(0x80 | strlen($data));
		elseif (strlen($data)<0xFFFF) $header.=chr(0x80 | 126) . pack("n",strlen($data));
		elseif(PHP_INT_SIZE>4) // 64 bit
			$header.=chr(0x80 | 127) . pack("Q",strlen($data));
		else  // 32 bit (pack Q dosen't work)
			$header.=chr(0x80 | 127) . pack("N",0) . pack("N",strlen($data));

		// Add mask
		$mask=pack("N",rand(1,0x7FFFFFFF));
		$header.=$mask;

		// Mask application data.
		for($i = 0; $i < strlen($data); $i++)
			$data[$i]=chr(ord($data[$i]) ^ ord($mask[$i % 4]));

		return fwrite($sp,$header.$data);
	}

	/*============================================================================*\
	Read from websocket
	string websocket_read(resource $handle [,string &error_string])

	read a chunk of data from the server, using hybi10 frame encoding

	handle
		the resource handle returned by websocket_open, if successful
	error_string (optional)
		A referenced variable to store error messages, i any
	Read

	Note:
		- This implementation waits for the final chunk of data, before returning.
		- Reading data while handling/ignoring other kind of packages
	\*============================================================================*/
	function websocket_read($sp,&$error_string=NULL) {
		$data="";
		do{
			// Read header
			$header=fread($sp,2);
			if(!$header){
				$error_string = "Reading header from websocket failed.";
				return false;
			}
			$opcode = ord($header[0]) & 0x0F;
			$final = ord($header[0]) & 0x80;
			$masked = ord($header[1]) & 0x80;
			$payload_len = ord($header[1]) & 0x7F;

			// Get payload length extensions
			$ext_len = 0;
			if($payload_len >= 0x7E){
				$ext_len = 2;
				if($payload_len == 0x7F) $ext_len = 8;
				$header=fread($sp,$ext_len);
				if(!$header){
					$error_string = "Reading header extension from websocket failed.";
					return false;
				}

				// Set extented paylod length
				$payload_len= 0;
				for($i=0;$i<$ext_len;$i++)
					$payload_len += ord($header[$i]) << ($ext_len-$i-1)*8;
			}

			// Get Mask key
			if($masked){
				$mask=fread($sp,4);
				if(!$mask){
					$error_string = "Reading header mask from websocket failed.";
					return false;
				}
			}

			// Get payload
			$frame_data='';
			do{
				$frame= fread($sp,$payload_len);
				if(!$frame){
					$error_string = "Reading from websocket failed.";
					return false;
				}
				$payload_len -= strlen($frame);
				$frame_data.=$frame;
			}while($payload_len>0);
			// Handle ping requests (sort of) send pong and continue to read
			if($opcode == 9){
				// Assamble header: FINal 0x80 | Opcode 0x0A + Mask on 0x80 with zero payload
				fwrite($sp,chr(0x8A) . chr(0x80) . pack("N", rand(1,0x7FFFFFFF)));
				continue;

				// Close
			} elseif($opcode == 8){
				fclose($sp);

				// 0 = continuation frame, 1 = text frame, 2 = binary frame
			}elseif($opcode < 3){
				// Unmask data
				$data_len=strlen($frame_data);
				if($masked)
					for ($i = 0; $i < $data_len; $i++)
						$data.= $frame_data[$i] ^ $mask[$i % 4];
				else
					$data.= $frame_data;
			}else
				continue;
		}while(!$final);

		return $data;
	}
}
