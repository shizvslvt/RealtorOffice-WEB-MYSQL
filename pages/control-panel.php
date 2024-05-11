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
            echo '<div style="padding: 10px">';
            if (isset($_GET['a'])) {
                $action = $_GET['a'];

                switch ($action) {
                    case 'estates-by-city':
                        $list_city = $estate->getListCityIdAndName();
                        $theme->assign('list_city', $list_city);
                        $current_city_id = $_GET['id'] ?? null;
                        $list_city = $estate->getListCityIdAndName();
                        foreach ($list_city as &$city) {
                            $city['total_estates'] = $estate->TotalEstatesByCityId($city['id']);
                        }
                        $theme->assign('list_city', $list_city);
                        $theme->assign('current_city_id', $current_city_id);
                        $theme->display('estates-by-city.tpl');
                        if ($current_city_id !== null) {
                            $estate->getEstateByCityId($current_city_id);
                        }
                        break;

                    case 'users':
                        $list_id_users = $user->getListUsersId();
                        $theme->assign('list_users', $list_id_users);
                        $current_user_id = $_GET['id'] ?? null;
                        $theme->assign('current_user_id', $current_user_id);
                        $theme->display('users.tpl');
                        if ($current_user_id !== null) {
                            $estate->getSellersEstates($current_user_id);
                        }
                        break;

                    case 'total-estates':
                        $theme->display('select-year.tpl');
                        if (!empty($_GET['d'])) $current_year = $_GET['d'];
                        else $current_year = date('Y');
                        $months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
                        list($labels_created, $datasetValues_created, $datasetLabel_created) = $estate->getCreatedEstatesByYear($current_year,$months);
                        list($labels_sold, $datasetValues_sold, $datasetLabel_sold) = $estate->getSoldEstatesByYear($current_year, $months);
                        $combined_data = [
                            'created' => [
                                'labels' => $labels_created,
                                'datasetValues' => $datasetValues_created,
                                'datasetLabel' => $datasetLabel_created
                            ],
                            'sold' => [
                                'labels' => $labels_sold,
                                'datasetValues' => $datasetValues_sold,
                                'datasetLabel' => $datasetLabel_sold
                            ]
                        ];
                        $theme->assign('combined_data', $combined_data);
                        $theme->display('estates-dates.tpl');

                        $circleData = $estate->CountSoldEstatesByCityAndYear($current_year);
                        $theme->assign('current_year', $current_year);
                        $theme->assign('circleData', $circleData);
                        $theme->display('circle_diagram.tpl');

                        break;

                    default:
                        die('Action not found');
                }
            } else {
                $current_user_id = $_COOKIE['uid'];
                $current_date = date('Y-m');
                $current_city_id = 1;
                $total_sold_estates = $estate->countTotalSoldEstates();
                $theme->assign('current_date', $current_date);
                $theme->assign('current_user_id', $current_user_id);
                $theme->assign('total_sold_estates', $total_sold_estates);
                $total_users = $user->countTotalUsers();
                $theme->assign('total_users', $total_users);
                $total_estates = $estate->countTotalEstates();
                $theme->assign('total_estates', $total_estates);
                $theme->assign('current_city_id', $current_city_id);
                $theme->display('statistic-panel.tpl');
            }
            break;
        default:
            die('Page not found');

    }
    echo '</div>';
} else {
    $logs = $log->selectLogs();
    $theme->assign('logs', $logs);
    $theme->display('logs-panel.tpl');
}

echo '</div></div>';
