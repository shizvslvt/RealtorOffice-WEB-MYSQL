<?php

global $theme, $notify;

include_once PAGES_PATH . '/header.php';

echo '<div class="container">';
$page = $_GET['p'] ?? 'home';

switch ($page) {
    case 'home':
        $page = PAGES_PATH . "/home.php";
        break;
    case 'page1':
        $page = PAGES_PATH . "/page1.php";
        break;
    case 'login':
        $page = PAGES_PATH . "/login.php";
        break;
    case 'register':
        $page = PAGES_PATH . "/register.php";
        break;
    case 'logout':
        $page = PAGES_PATH . "/logout.php";
        break;
    case 'profile':
        $page = PAGES_PATH . "/profile.php";
        break;
    case 'estate':
        $page = PAGES_PATH . "/estate.php";
        break;
    case 'add-estate':
        $page = PAGES_PATH . "/add-estate.php";
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
