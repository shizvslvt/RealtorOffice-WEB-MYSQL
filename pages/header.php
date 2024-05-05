<?php
global $theme, $user, $notify;
$uid = $_COOKIE['uid'] ?? null;

$admin = false;


if(isset($uid)){
    if($GLOBALS['admin_id']==$uid){
        $admin = true;
    }
    $balance = $user->getBalance($uid);
} else $balance = 0;

$theme->assign('admin', $admin);
$theme->assign('uid', $uid);
$theme->assign('balance', $balance);
$theme->display('header.tpl');




