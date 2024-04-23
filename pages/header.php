<?php
global $theme, $auth;
$uid = $_COOKIE['uid'] ?? '';




$theme->assign('uid', $uid);
$theme->display('header.tpl');




