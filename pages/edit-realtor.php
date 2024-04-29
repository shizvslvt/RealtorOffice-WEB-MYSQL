<?php
global $theme, $db, $user;
$id = $_GET['id'];

if (isset($_POST['user_id']) && isset($_POST['percent']) && isset($_POST['exp'])) {
    $user_id = $_POST['user_id'];
    $percent = $_POST['percent'];
    $exp = $_POST['exp'];
    $user->editRealtor($id, $user_id, $percent, $exp);
}
$sql = "SELECT * FROM ro_realtors WHERE id = $id";
$result = $db->query($sql);
$realtor = $result->fetch_assoc();

$theme->assign('realtor', $realtor);
$theme->display('edit-realtor.tpl');

