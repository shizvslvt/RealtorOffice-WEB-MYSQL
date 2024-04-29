<?php

global $notify, $theme;


if($notify->getMessage() !== null) {
    $message = $notify->getMessage();
    $theme->assign('message', $message);
    $notify->clear();
} else {
    $theme->assign('message', '');
}
$theme->display('notify.tpl');