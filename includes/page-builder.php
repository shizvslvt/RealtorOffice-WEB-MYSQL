<?php

global $theme, $notify;

include_once PAGES_PATH . '/header.php';

echo '<div class="container">';
$page = $_GET['p'] ?? 'home';
$uid = $_COOKIE['uid'] ?? '';

switch ($page) {
//default pages
    case 'home':
        $page = PAGES_PATH . "/home.php";
        break;
        case 'estate':
    $page = PAGES_PATH . "/estate.php";
    break;
    case 'profile':
        $page = PAGES_PATH . "/profile.php";
        break;


//admin pages
    case 'control-panel':
        if ($uid == $GLOBALS["admin_id"]) {
            $page = PAGES_PATH . "/control-panel.php";
        } else {
            $notify->setMessage("You are not allowed.");
            $page = PAGES_PATH . "/home.php"; }
        break;
    case 'edit-realtor':
        if ($uid == $GLOBALS["admin_id"]) {
            $page = PAGES_PATH . "/edit-realtor.php";
        } else {
            $notify->setMessage("You are not allowed.");
            $page = PAGES_PATH . "/home.php"; }
        break;
//realtor pages
    case 'add-chat':
        if (empty($uid)) {
            $notify->setMessage("You are not logged in.");
            $page = PAGES_PATH . "/home.php";
        } else $page = PAGES_PATH . "/add-chat.php";
        break;
    case 'add-estate':
        if (empty($uid)) {
            $notify->setMessage("You are not logged in.");
            $page = PAGES_PATH . "/home.php";
        } else $page = PAGES_PATH . "/add-estate.php";
        break;
    case 'edit-estate':
        if (empty($uid)) {
            $notify->setMessage("You are not logged in.");
            $page = PAGES_PATH . "/home.php";
        } else $page = PAGES_PATH . "/edit-estate.php";
        break;
//authorised pages
    case 'chats':
        if (empty($uid)) {
            $notify->setMessage("You are not logged in.");
            $page = PAGES_PATH . "/home.php";
        } else $page = PAGES_PATH . "/chats.php";
        break;
    case 'send-message':
        if (empty($uid)) {
            $notify->setMessage("You are not logged in.");
            $page = PAGES_PATH . "/home.php";
        } else $page = PAGES_PATH . "/send-message.php";
        break;
    case 'add-realtor-to-chat':
        if (empty($uid)) {
            $notify->setMessage("You are not logged in.");
            $page = PAGES_PATH . "/home.php";
        } else $page = PAGES_PATH . "/add-realtor-to-chat.php";
        break;
    case 'buy-estate':
        if (empty($uid)) {
            $notify->setMessage("You are not logged in.");
            $page = PAGES_PATH . "/home.php";
        } else $page = PAGES_PATH . "/buy-estate.php";
        break;
    case 'buy-estate-process':
        if (empty($uid)) {
            $notify->setMessage("You are not logged in.");
            $page = PAGES_PATH . "/home.php";
        } else $page = PAGES_PATH . "/buy-estate-process.php";
        break;
    case 'logout':
        if (empty($uid)) {
            $notify->setMessage("You are not logged in.");
            $page = PAGES_PATH . "/home.php";
        } else $page = PAGES_PATH . "/logout.php";
        break;
    case 'history-view':
        if (empty($uid)) {
            $notify->setMessage("You are not logged in.");
            $page = PAGES_PATH . "/home.php";
        } else $page = PAGES_PATH . "/history-view.php";
        break;
//not authorised pages
    case 'login':
        if (!empty($uid)) {
            $notify->setMessage("You are already logged in.");
            $page = PAGES_PATH . "/home.php";
        } else $page = PAGES_PATH . "/login.php";
        break;
    case 'register':
        if (!empty($uid)) {
            $notify->setMessage("You are already registered and logged in.");
            $page = PAGES_PATH . "/home.php";
        } else $page = PAGES_PATH . "/register.php";
        break;
    case 'register-realtor':
        if (!empty($uid)) {
            $notify->setMessage("You are already registered and logged in.");
            $page = PAGES_PATH . "/home.php";
        } else $page = PAGES_PATH . "/register-realtor.php";
        break;

    default:
        $notify->setMessage("Page not found");
        break;
}


if(!empty($page)) {
    include_once $page;
}
echo '</div>';

include_once PAGES_PATH . '/notify.php';