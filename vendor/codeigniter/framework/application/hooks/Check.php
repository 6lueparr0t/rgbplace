<?php
class Check {
    function info()
    {
        $this->CI =& get_instance();
        if(isset($this->CI->allow) && (is_array($this->CI->allow) === false OR in_array($this->CI->router->method, $this->CI->allow) === false)) {
			if( $this->CI->session->userdata('signed_in') && !strpos($this->CI->session->userdata('uid'), "@") ) {
				if( !$this->CI->hook->getInfo($this->CI->session->userdata('uid')) ) {
					$this->CI->session->unset_userdata(['admin', 'uid', 'name', 'signed_in']);
					echo ("<script>alert('존재하지 않거나 차단된 ID입니다.');</script>");
				}
			}
        }
    }
}
?>
