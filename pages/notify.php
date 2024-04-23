<?php

global $notify, $theme;

$message = $notify->getMessage();
if(isset($message)) {
    $theme->assign('message', $message);
    $notify->clear();
} else {
    $theme->assign('message', ''); // Присваиваем пустую строку, если $message не определена
}
$theme->display('notify.tpl');
