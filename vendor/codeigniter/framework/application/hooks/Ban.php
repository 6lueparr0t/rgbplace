<?php
class Ban {
    function ipadCheck()
    {
        $CI =& get_instance();
        if(isset($CI->allow) && (is_array($CI->allow) === false OR in_array($CI->router->method, $CI->allow) === false)) {
			//input ipcheck code
			//echo ("<script>alert('test');</script>");
        }
    }
}
?>
