<?php

global $theme, $notify;

include_once PAGES_PATH . '/header.php';

echo '<div class="container">';
$page = $_GET['p'] ?? 'home';
$uid = $_COOKIE['uid'] ?? '';

switch ($page) {
    case 'home':
        $page = PAGES_PATH . "/home.php";
        break;
    case 'control-panel':
        if (!empty($uid) && ($uid == 1)) {
            $page = PAGES_PATH . "/control-panel.php";
        } else {
            $notify->setMessage("You are not allowed.");
            $page = PAGES_PATH . "/home.php";
        }
        break;
    case 'edit-realtor':
        if (!empty($uid) && ($uid == 1)) {
            $page = PAGES_PATH . "/edit-realtor.php";
        } else {
            $notify->setMessage("You are not allowed.");
            $page = PAGES_PATH . "/home.php";
        }
        break;

    case 'add-chat':
        if (empty($uid)) {
            $notify->setMessage("You are not logged in.");
            $page = PAGES_PATH . "/home.php";
        } else $page = PAGES_PATH . "/add-chat.php";
        break;

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
    case 'logout':
        if (empty($uid)) {
            $notify->setMessage("You are not logged in.");
            $page = PAGES_PATH . "/home.php";
        } else $page = PAGES_PATH . "/logout.php";
        break;
    case 'profile':
        $page = PAGES_PATH . "/profile.php";
        break;
    case 'estate':
        $page = PAGES_PATH . "/estate.php";
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
    case 'history-view':
        if (empty($uid)) {
            $notify->setMessage("You are not logged in.");
            $page = PAGES_PATH . "/home.php";
        } else $page = PAGES_PATH . "/history-view.php";
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
