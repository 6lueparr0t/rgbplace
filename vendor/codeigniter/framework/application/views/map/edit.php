<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common();?>
<link rel='stylesheet' href='/assets/plugin/simplemde/simplemde.min.css'/>
<textarea id='editor'></textarea>

<!-- map/edit/<?=$map?>/<?=$type?>/<?=$num?> -->
<script src='/assets/plugin/simplemde/simplemde.min.js'></script>
<script>
var simplemde = new SimpleMDE({ element: document.getElementById("editor") });

simplemde.value("<?=$content?>");
</script>
<?php $this->root->end($path); ?>
