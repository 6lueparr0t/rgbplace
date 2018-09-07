<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common(); ?>

<button id="requestGet">Request Get</button>
<button id="requestPost">Request Post</button>
<button id="requestPut">Request Put</button>
<button id="requestDelete">Request Delete</button>

<div id="result">Test</div>

<?php $this->root->end($path); ?>