<?php

global $db, $theme, $user, $log, $estate;
$theme->display('control-panel.tpl');
if (isset($_GET['c'])) {
    $content = $_GET['c'];
    switch ($content) {
        case 'realtors':
            $realtors = $user->selectRealtor();
            $theme->assign('realtors', $realtors);
            $theme->display('realtor-panel.tpl');
            break;
        case 'logs':
            $logs = $log->selectLogs();
            $theme->assign('logs', $logs);
            $theme->display('logs-panel.tpl');
            break;
        case 'statistic':
            if(isset($_GET['a'])) {
                $action = $_GET['a'];
                switch ($action) {
                    case 'sold-estates':
                        $current_date = $_GET['d'];
                        $sold_estates_by_date = $estate->getSoldEstatesStatisticsByMonth($current_date);
                        $theme->assign('current_date', $current_date);
                        $theme->assign('sold_estates_by_date', $sold_estates_by_date);
                        $theme->display('sold-estates.tpl');
                        break;
                }
            } else {
                $current_date = date('Y-m');
                $total_sold_estates = $estate->countTotalSoldEstates();
                $theme->assign('current_date', $current_date);
                $theme->assign('total_sold_estates', $total_sold_estates);
                $total_users = $user->countTotalUsers();
                $theme->assign('total_users', $total_users);
                $total_estates = $estate->countTotalEstates();
                $theme->assign('total_estates', $total_estates);
                $theme->display('statistic-panel.tpl');
            }
            break;

        default:
            die( 'Page not found');

    }
} else {
    $logs = $log->selectLogs();
    $theme->assign('logs', $logs);
    $theme->display('logs-panel.tpl');
}

echo '</div></div>';







