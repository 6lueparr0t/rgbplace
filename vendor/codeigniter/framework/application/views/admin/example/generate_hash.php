<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common();

$key="askljflwa;ejkfawicmaf;iwce";
$plaintext = "message to be encrypted";
$cipher = "aes-128-gcm";
$tag = "testsetsetsetset";
if (in_array($cipher, openssl_get_cipher_methods()))
{
	$ivlen = openssl_cipher_iv_length($cipher);
	$iv = openssl_random_pseudo_bytes($ivlen);
	$ciphertext = openssl_encrypt($plaintext, $cipher, $key, $options=0, $iv, $tag);
	echo $ciphertext."\n";
	//store $cipher, $iv, and $tag for decryption later
	//$iv = openssl_random_pseudo_bytes($ivlen);
	echo '<br/>'.base64_encode($tag).'<br/>';
	$original_plaintext = openssl_decrypt($ciphertext, $cipher, $key, $options=0, $iv, $tag);
	echo $original_plaintext."\n";
}

echo form_open('admin/generate_hash', ['class' => '', 'name' => 'admform', 'id' => 'admform'])
	.form_input('pswd', '', ['placeholder' => 'Password', 'required' => 'true'])
	.form_submit('proc', 'Process')
	.form_close();

echo "Your Password : {$pswd}".br(2);
echo "Hash Value : {$hash}";

$this->root->end($path); ?>
