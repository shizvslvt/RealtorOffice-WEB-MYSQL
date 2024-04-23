<?php
global $theme, $auth;
include_once USER_DATA . "/db.php";

if (isset($_POST['mail']) && isset($_POST['password']) && isset($_POST['repeatpass'])) {
    $mail = $_POST['mail'];
    $password = $_POST['password'];
    $repeatpass = $_POST['repeatpass'];
    $auth->register($mail, $password, $repeatpass);
}


$theme->display('register.tpl');

