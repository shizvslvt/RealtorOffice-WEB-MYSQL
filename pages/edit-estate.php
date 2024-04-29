<?php
global $theme, $db, $estate;
$id = $_GET['id'];

$locations = [
    'cities' => $estate->getData('list_cities'),
    'localities' => $estate->getData('list_localities'),
    'types' => $estate->getData('list_types')
];

$theme->assign('locations', $locations);

if (isset($_POST['title']) && isset($_POST['cost']) && isset($_POST['type']) && isset($_POST['locality']) && isset($_POST['city']) && isset($_POST['area']) && isset($_POST['bedrooms']) && isset($_POST['floors']) && isset($_POST['archived'])) {

    $title = $_POST['title'];
    $cost = $_POST['cost'];
    $type = $_POST['type'];
    $locality = $_POST['locality'];
    $city = $_POST['city'];
    $area = $_POST['area'];
    $bedrooms = $_POST['bedrooms'];
    $floors = $_POST['floors'];
    $archived = $_POST['archived'];


    $estate->editEstate($id,$title, $cost, $type, $locality, $city, $area, $bedrooms, $floors, $archived);
}

$sql = "SELECT * FROM ro_estates WHERE id = $id";
$result = $db->query($sql);
$estate_data = $result->fetch_assoc(); // Получаем данные о недвижимости

$theme->assign('estate', $estate_data); // Передаем данные о недвижимости в шаблон
$theme->display('edit-estate.tpl');
