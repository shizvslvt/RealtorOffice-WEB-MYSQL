<?php

global$db, $theme, $user, $log;


$realtors = $user->selectRealtor();
$theme->assign('realtors', $realtors);
$theme->display('realtor-panel.tpl');

$logs = $log->selectLogs();
$theme->assign('logs', $logs);
$theme->display('logs-panel.tpl');


//$theme->display('static-panel.tpl');








