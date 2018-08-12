<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] = 'init';
$route['404_override'] = 'stage';
$route['translate_uri_dashes'] = FALSE;


/*
| RGB place
 */

$route['('.DEFAULT_MAP.')/(:num)'] = function ($map, $num) {
	return 'map/link/' . $map . '/' . $num;
};

$route['([a-zA-Z]{2}[0-9]+)/(:num)'] = function ($map, $num) {
	return 'map/link/' . $map . '/' . $num;
};

// ====================  ====================  ====================  ====================

$route['('.DEFAULT_MAP.')/([a-zA-Z]+)/list'] = function ($map, $type) {
	return 'map/list/' . $map . '/' . $type;
};

$route['('.DEFAULT_MAP.')/([a-zA-Z]+)/0'] = function ($map, $type) {
	return 'map/list/' . $map . '/' . $type;
};

$route['('.DEFAULT_MAP.')/([a-zA-Z]+)/(:num)'] = function ($map, $type, $num) {
	return 'map/post/' . $map . '/' . $type . '/' . $num;
};

$route['('.DEFAULT_MAP.')/([a-zA-Z]+)/0/edit'] = function ($map, $type) {
	return 'map/edit/' . $map . '/' . $type;
};

//post modify
$route['('.DEFAULT_MAP.')/([a-zA-Z]+)/(:num)/edit'] = function ($map, $type, $num) {
	return 'map/edit/' . $map . '/' . $type . '/' . $num;
};

$route['('.DEFAULT_MAP.')/([a-zA-Z]+)/(:num)/delete'] = function ($map, $type, $num) {
	return 'map/delete/' . $map . '/' . $type . '/' . $num;
};

$route['('.DEFAULT_MAP.')'] = function ($map) {
	return 'map/page/' . $map;
};

// ====================  ====================  ====================  ====================

$route['([a-zA-Z]{2}[0-9]+)/([a-zA-Z]+)/list'] = function ($map, $type) {
	return 'map/list/' . $map . '/' . $type;
};

$route['([a-zA-Z]{2}[0-9]+)/([a-zA-Z]+)/0'] = function ($map, $type) {
	return 'map/list/' . $map . '/' . $type;
};

$route['([a-zA-Z]{2}[0-9]+)/([a-zA-Z]+)/(:num)'] = function ($map, $type, $num) {
	return 'map/post/' . $map . '/' . $type . '/' . $num;
};

$route['([a-zA-Z]{2}[0-9]+)/([a-zA-Z]+)/0/edit'] = function ($map, $type) {
	return 'map/edit/' . $map . '/' . $type;
};

//post modify
$route['([a-zA-Z]{2}[0-9]+)/([a-zA-Z]+)/(:num)/edit'] = function ($map, $type, $num) {
	return 'map/edit/' . $map . '/' . $type . '/' . $num;
};

$route['([a-zA-Z]{2}[0-9]+)/([a-zA-Z]+)/(:num)/delete'] = function ($map, $type, $num) {
	return 'map/delete/' . $map . '/' . $type . '/' . $num;
};

$route['([a-zA-Z]{2}[0-9]+)'] = function ($map) {
	return 'map/page/' . $map;
};
