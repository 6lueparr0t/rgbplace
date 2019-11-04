<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|
|	Used Table : user_*
|
*/

class Sign_model extends CI_Model {

	protected $encryptMethod = 'AES-256-CBC';

    public function __construct()
    {
        parent::__construct();
	}

	/**
     * Get encrypt method length number (128, 192, 256).
     *
     * @return integer.
     */
    protected function encryptMethodLength()
    {
        $number = filter_var($this->encryptMethod, FILTER_SANITIZE_NUMBER_INT);
        return intval(abs($number));
	}// encryptMethodLength

    /**
     * Set encryption method.
     *
     * @link http://php.net/manual/en/function.openssl-get-cipher-methods.php Available methods.
     * @param string $cipherMethod
     */
    public function setCipherMethod($cipherMethod)
    {
        $this->encryptMethod = $cipherMethod;
    }// setCipherMethod
	
    /**
     * Decrypt string.
     *
     * @link https://stackoverflow.com/questions/41222162/encrypt-in-php-openssl-and-decrypt-in-javascript-cryptojs Reference.
     * @param string $encryptedString The encrypted string that is base64 encode.
     * @param string $key The key.
     * @return mixed Return original string value. Return null for failure get salt, iv.
     */
    public function decrypt($encryptedString, $key)
    {
        $json = json_decode(base64_decode($encryptedString), true);
        try {
            $salt = hex2bin($json["salt"]);
            $iv = hex2bin($json["iv"]);
        } catch (Exception $e) {
            return null;
        }
        $cipherText = base64_decode($json['ciphertext']);
        $iterations = intval(abs($json['iterations']));
        if ($iterations <= 0) {
            $iterations = 999;
        }
        $hashKey = hash_pbkdf2('sha512', $key, $salt, $iterations, ($this->encryptMethodLength() / 4));
        unset($iterations, $json, $salt);
        $decrypted= openssl_decrypt($cipherText , $this->encryptMethod, hex2bin($hashKey), OPENSSL_RAW_DATA, $iv);
        unset($cipherText, $hashKey, $iv);
		return $decrypted;
	}

	/**
	 * Encrypt string.
	 *
	 * @link https://stackoverflow.com/questions/41222162/encrypt-in-php-openssl-and-decrypt-in-javascript-cryptojs Reference.
	 * @param string $string The original string to be encrypt.
	 * @param string $key The key.
	 * @return string Return encrypted string.
	 */
	public function encrypt($string, $key)
	{
		$ivLength = openssl_cipher_iv_length($this->encryptMethod);
		$iv = openssl_random_pseudo_bytes($ivLength);

		$salt = openssl_random_pseudo_bytes(256);
		$iterations = 999;
		$hashKey = hash_pbkdf2('sha512', $key, $salt, $iterations, ($this->encryptMethodLength() / 4));
		$encryptedString = openssl_encrypt($string, $this->encryptMethod, hex2bin($hashKey), OPENSSL_RAW_DATA, $iv);
		$encryptedString = base64_encode($encryptedString);
		unset($hashKey);
		$output = ['ciphertext' => $encryptedString, 'iv' => bin2hex($iv), 'salt' => bin2hex($salt), 'iterations' => $iterations];
		unset($encryptedString, $iterations, $iv, $ivLength, $salt);
		return base64_encode(json_encode($output));
	}// encrypt

	public function userCheck($data)
	{
		$uid = $data['uid'];
		$pswd= $this->decrypt($data['pswd'], base64_encode(CIPHER_KEY));

		$query = "SELECT user.*, conf.* FROM user_info user INNER JOIN user_conf conf ON user.uid = conf.uid WHERE user.uid = ? AND user.fail < 20 LIMIT 1";
		$find = $this->db->query($query, $uid);

		if(password_verify($pswd,  @base64_decode($find->row()->pswd))) {
			//fail count init
			$atim = date("Y-m-d H:i:s");
			$query = "UPDATE user_info SET fail = 0, atim = ? WHERE uid = ?";
			$this->db->query($query, array($atim, $uid));

			return $result = [
				'sn'    => $find->row()->sn,
				'name'  => $find->row()->name,
				'level' => $find->row()->level,
				'score' => $find->row()->score,
				'map'   => $find->row()->map,
				'atim'  => $find->row()->atim,
				'dark_sw'  => ($find->row()->dark_sw)?'on':'off'
			];
		} else {
			//fail count increase
			$query = "UPDATE user_info SET fail = fail + 1, atim=now() WHERE uid = ?";
			$this->db->query($query, $uid);

			return false;
		}

		return false;
	}

	public function adminCheck($data)
	{
		$uid = explode("@", $data['uid']);
		$pswd= $this->decrypt($data['pswd'], base64_encode(CIPHER_KEY));

		$query = "SELECT * FROM admin_info WHERE uid = ? AND name = ? AND fail < 5 LIMIT 1";
		$find = $this->db->query($query, array($uid[0], $uid[1]));

		if($find->num_rows() === 0) return false;

		if(password_verify($pswd, @base64_decode($find->row()->pswd))) {
			//fail count init
			$atim = date("Y-m-d H:i:s");
			$query = "UPDATE admin_info SET fail = 0, atim='{$atim}' WHERE uid = ? AND name = ?";
			$this->db->query($query, array($uid[0], $uid[1]));

			return $result = [
				'sn'   => $find->row()->sn,
				'name' => $find->row()->name
			];
		} else {
			//fail count increase
			$atim = date("Y-m-d H:i:s");
			$query = "UPDATE admin_info SET fail = fail + 1, atim='{$atim}' WHERE uid = ? AND name = ?";
			$this->db->query($query, array($uid[0], $uid[1]));

			return false;
		}

		return false;
	}

	public function userMake($data)
	{
		$uid  = $data['uid'];
		$name = $data['name'];
		$mail = $data['mail'];
		$pswd = base64_encode(password_hash($data['pswd'], PASSWORD_DEFAULT, ['cost' => 12]));

		$query = "SELECT uid FROM user_info WHERE uid = ? LIMIT 1";
		$find = $this->db->query($query, $uid);

		if($find->num_rows() === 0) {
			// use user_info, user_config
			
			$query = "INSERT INTO user_info (uid, name, mail, pswd) VALUES (?, ?, ?, ?)";
			$this->db->query($query, array($uid, $name, $mail, $pswd));
			$sn = $this->db->insert_id();

			$query = "INSERT INTO user_conf (uid) VALUES (?)";
			$this->db->query($query, $uid);

			return $sn;
		}
		
		return false;
	}

	public function failCount($data)
	{
		$result = ['fail' => null, 'atim' => null];

		if(strpos($data['uid'], "@")) {
			$uid = explode("@", $data['uid']);
			$query = "SELECT * FROM admin_info WHERE uid = ? AND name = ? LIMIT 1";

			$find = $this->db->query($query, array($uid[0], $uid[1]));

		} else {
			$uid = $data['uid'];
			$query = "SELECT * FROM user_info WHERE uid = ? LIMIT 1";

			$find = $this->db->query($query, $uid);

		}

		if($find->num_rows() === 0 || $find->num_rows() > 1) {
			return false;
		}

		$result['fail'] = $find->row()->fail;
		$result['atim'] = $find->row()->atim;

		return $result;
	}

	public function uidValid($data)
	{
		$uid = $data['uid'];

		$query = "SELECT uid FROM user_info WHERE uid = ? LIMIT 1";
		$find = $this->db->query($query, $uid);

		if($find->num_rows() === 0) {
			return true;
		}
		
		return false;
	}

	public function mailValid($data)
	{
		$mail = $data['mail'];

		$query = "SELECT mail FROM user_info WHERE mail = ? LIMIT 1";
		$find = $this->db->query($query, $mail);

		if($find->num_rows() === 0) {
			return true;
		} else if($find->num_rows() === 1 && $data['find'] === true) {
			return true;
		}
		
		return false;
	}

	public function mailLog($data)
	{
		$query = "INSERT INTO mail_log (mail, code) VALUES (?, ?)";
		$this->db->query($query, array($data['mail'], $data['code']));

		return true;
	}

	public function mailCount()
	{
		$query = "SELECT count(mail) cnt from mail_log where DATE_FORMAT(ctim, '%Y%m') = DATE_FORMAT(now(), '%Y%m')";
		$find = $this->db->query($query);

		return $find->row()->cnt;
	}

	public function passwordChange($data)
	{
		$mail = $data['mail'];
		$pswd = base64_encode(password_hash($data['pswd'], PASSWORD_DEFAULT, ['cost' => 12]));

		$query = "SELECT sn, uid FROM user_info WHERE mail = ? LIMIT 1";
		$find = $this->db->query($query, $mail);

		if($find->num_rows() === 1) {
			// use user_info, user_config

			$query = "UPDATE user_info SET pswd = ? WHERE uid = ?";
			$this->db->query($query, array($pswd, $find->row()->uid));

			return $find->row()->sn;
		}
		
		return false;
	}

	public function sessionChk()
	{

	}

}
