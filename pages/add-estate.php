<?php
global $db, $theme, $notify, $estate;


$locations = [
    'cities' => $estate->getData('list_cities'),
    'localities' => $estate->getData('list_localities'),
    'types' => $estate->getData('list_types')
];

$theme->assign('locations', $locations);

    if (isset($_POST['title']) && isset($_POST['cost']) && isset($_POST['type']) && isset($_POST['locality']) && isset($_POST['city']) && isset($_POST['area']) && isset($_POST['bedrooms']) && isset($_POST['floors'])) {
        $seller_id = $_COOKIE["uid"];
        $title = $_POST['title'];
        $cost = $_POST['cost'];
        $type = $_POST['type'];
        $locality = $_POST['locality'];
        $city = $_POST['city'];
        $area = $_POST['area'];
        $bedrooms = $_POST['bedrooms'];
        $floors = $_POST['floors'];
        $created = date('Y.m.d');

        $estate->WriteToDB($seller_id, $title, $cost, $type, $locality, $city, $area, $bedrooms, $floors, $created);
    }

$theme->display('add-estate.tpl');
