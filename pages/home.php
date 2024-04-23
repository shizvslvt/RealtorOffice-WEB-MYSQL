<?php
global $theme, $db, $user, $notify, $estate;
include_once USER_DATA . "/db.php";

$list = $estate->getAllActiviesEstates();

$theme->assign('list', $list);
$theme->display('home.tpl');

