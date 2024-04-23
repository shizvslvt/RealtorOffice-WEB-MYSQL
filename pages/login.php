<?php
global $theme, $auth, $notify;
include_once USER_DATA . "/db.php";


if (isset($_POST['mail']) && isset($_POST['password'])) {
    $mail = $_POST['mail'];
    $password = $_POST['password'];
    $auth->login($mail, $password);
}

$theme->display('login.tpl');
