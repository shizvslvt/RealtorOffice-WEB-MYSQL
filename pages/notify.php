<?php

global $notify, $theme;

$message = $notify->getMessage();
if(isset($message)) {
    $theme->assign('message', $message);
    $notify->clear();
} else {
    $theme->assign('message', '');
}
$theme->display('notify.tpl');