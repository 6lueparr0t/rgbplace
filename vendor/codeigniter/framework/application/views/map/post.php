<?php defined('BASEPATH') OR exit('No direct script access allowed'); $content = $this->map->post($map, $type, $num, $pageName, $keyword); $this->root->start($pageName); $this->root->common(); ?>

<!-- map/post/<?=$map?>/<?=$type?>/<?=$num?> -->

<div id="notice">
</div>

<div id='post'>
<?
if(!$content) {
	redirect("/{$map}/{$type}/list");
} else {
	echo $content;
}
?>
</div>

<div id='reply' class='<?php echo ((in_array('no_reply',$keyword))?'no_reply':null); ?>'>
<div class='reply-root'>
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

$this->map->list($map, $type, $start*LIST_ROWS_LIMIT, 0, $param);
?>
</div>

<?php $this->root->end($path); ?>
