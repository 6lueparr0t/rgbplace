<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common();?>

<!-- map/post/<?=$map?>/<?=$type?>/<?=$num?> -->

<div id="notice">
</div>

<div id='post'>
<?
if(!$this->map->post($map, $type, $num)) redirect("/{$map}/{$type}/list");
?>
</div>

<div id='reply'>
<div class='reply-root'>
<?
//$this->map->reply($map, $type, $num);
echo $this->map->replyBox();
?>
</div>
</div>

<div id='list'>
<?
$page = $this->input->get('page', TRUE);
$search  = $this->input->get('search', TRUE);

$title   = $this->input->get('title', TRUE);
$content = $this->input->get('content', TRUE);
$name    = $this->input->get('name', TRUE);
$reply   = $this->input->get('reply', TRUE);
$keyword = $this->input->get('keyword', TRUE);
$ctim    = $this->input->get('ctim', TRUE);

$start = ($page>1)?$page-1:0;

$search = [
	'page'    => $page,
	'search'  => $search,

    'title'   => $title,
    'content' => $content,
    'name'    => $name,
    'reply'   => $reply,
    'keyword' => $keyword,
    'ctim'    => $ctim,
];

$this->map->list($map, $type, $start*LIST_ROWS_LIMIT, 0, $search);
?>
</div>

<?php $this->root->end($path); ?>
