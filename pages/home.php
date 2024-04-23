<?php
global $theme, $db, $user, $notify;
include_once USER_DATA . "/db.php";

// Выполнение запроса к базе данных
$sql = "SELECT * FROM ro_estates ORDER BY created DESC";
$result = $db->query($sql);

$list = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $entry = array(
            'id' => $row["id"],
            'seller_id' => $row["seller_id"],
            'title' => $row["title"],
            'cost' => $row["cost"],
            'type' => $row["type"],
            'locality' => $row["locality"],
            'city' => $row["city"],
            'area' => $row["area"],
            'bedrooms' => $row["bedrooms"],
            'floors' => $row["floors"],
            'created' => $row["created"],
            'viewed' => $row["viewed"],
            'deal' => $row["deal"],
            'archived' => $row["archived"]
        );
        $list[] = $entry;
    }
}
$db->close();
$theme->assign('list', $list);
$theme->display('home.tpl');

