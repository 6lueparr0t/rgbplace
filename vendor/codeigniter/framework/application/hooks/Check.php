<?php
class Check {
    function info()
    {
        $this->CI =& get_instance();
        if(isset($this->CI->allow) && (is_array($this->CI->allow) === false OR in_array($this->CI->router->method, $this->CI->allow) === false)) {
			if( $this->CI->session->userdata('signed_in') && !strpos($this->CI->session->userdata('uid'), "@") ) {
				$btim = $this->CI->base->getBannedInfo($this->CI->session->userdata('uid'));
				if ( $btim ) {
					$this->CI->session->unset_userdata(['admin', 'uid', 'name', 'signed_in']);
					echo ("<script>alert('you banned {$btim}');</script>");
				}
			}
        }
    }
}
?>
