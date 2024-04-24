<?php
global $theme, $estate;


$id = $_GET['id'];
if(isset($_COOKIE['uid'])) {
    $uid = $_COOKIE["uid"];
    $estate->addToHistoryView($id, $uid);
}
$estate->SelectedByID($id);