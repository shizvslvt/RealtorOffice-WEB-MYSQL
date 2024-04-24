<?php
global $theme, $user, $db, $estate;


if (isset($_COOKIE['uid'])) {

    $uid = $_COOKIE['uid'];
    $estate->getSellersEstates($uid);
}

