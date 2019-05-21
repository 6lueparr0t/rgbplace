<?php

$iv = null;
$tag = null;

function aes_encrypt($data, $key) {
	global $iv, $tag;

	$padValue           = 16 - (strlen($data) % 16);
	$padding_length     = openssl_cipher_iv_length('aes-128-gcm');
	$iv                 = openssl_random_pseudo_bytes($padding_length);
	$data               = str_pad($data, intval(16 * (floor(strlen($data) / 16) + 1)), chr($padValue));
	$enc                = openssl_encrypt( $data, 'aes-128-gcm', $key, OPENSSL_RAW_DATA | OPENSSL_ZERO_PADDING, $iv, $tag);

	echo '$iv : '.bin2hex($iv).br(1);
	echo '$tag : '.bin2hex($tag).br(1);

	return strtoupper(bin2hex($enc));
}

function aes_decrypt($data, $key, $iv, $tag) {

	if ($data) {
		if(!function_exists('hex2bin')){
			function hex2bin($h)
			{
				if (!is_string($h)) return null;
				$r='';
				for ($a=0; $a<strlen($h); $a+=2) { $r.=chr(hexdec($h{$a}.$h{($a+1)})); }
				return $r;
			}
		}
		$data = @hex2bin($data);
		$data = openssl_decrypt( $data, 'aes-128-gcm', $key, OPENSSL_RAW_DATA | OPENSSL_ZERO_PADDING, hex2bin($iv), hex2bin($tag));
		return rtrim($data, "\x00..\x10");
	}
}

//echo aes_encrypt('password', 'key').br(1);
//echo aes_decrypt('384148D3...','key', 'iv', 'tag');
?>
