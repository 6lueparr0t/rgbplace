<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->rgb->start(); $this->rgb->menu(); ?>
<p class="footer">Page rendered in <strong>{elapsed_time}</strong> seconds. <?php echo  (ENVIRONMENT === 'development') ?  'CodeIgniter Version <strong>' . CI_VERSION . '</strong>' : '' ?></p>
<?php $this->rgb->end($path); ?>
