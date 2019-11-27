<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common();?>

<!-- map/list/<?=$map?>/<?=$type?> -->

<div id="notice">
</div>

<div id="list">
<?php
$page    = $this->input->get('page', TRUE);
$search  = $this->input->get('search', TRUE);

$title   = $this->input->get('title', TRUE);
$content = $this->input->get('content', TRUE);
$name    = $this->input->get('name', TRUE);
$reply   = $this->input->get('reply', TRUE);
$keyword = $this->input->get('keyword', TRUE);
$ctim    = $this->input->get('ctim', TRUE);

$start = (($page>1)?$page-1:0)*LIST_ROWS_LIMIT;

$param = [
	'page'    => $page,
	'search'  => $search,

	'title'   => $title,
	'content' => $content,
	'name'    => $name,
	'reply'   => $reply,
	'keyword' => $keyword,
	'ctim'    => $ctim,
];

$this->map->list($map, $type, $start, 0, $param);
?>
</div>

<?php $this->root->end($path); ?>
