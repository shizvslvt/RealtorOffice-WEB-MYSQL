<?php
global $theme, $auth;
include_once USER_DATA . "/db.php";


if (isset($_POST['name']) && isset($_POST['mail']) && isset($_POST['password']) && isset($_POST['repeatpass']) && isset($_POST['birthday']) && isset($_POST['PID']) && isset($_POST['exp'])) {
    $name = $_POST['name'];
    $mail = $_POST['mail'];
    $password = $_POST['password'];
    $repeatpass = $_POST['repeatpass'];
    $birthday = $_POST['birthday'];
    $PID = $_POST['PID'];
    $created = date('Y-m-d H:i:s');
    $exp = $_POST['exp'];
    $auth->register_realtor($name, $mail, $password, $repeatpass, $birthday, $PID, $created, $exp);
}

$theme->display('register-realtor.tpl');

