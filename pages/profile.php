<?php
global $theme, $user, $db, $estate;

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    $estate->getSellersEstates($id);
}

