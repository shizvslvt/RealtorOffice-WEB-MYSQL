<?php
global $theme;

if (isset($_COOKIE['uid'])) {
    $uid = $_COOKIE['uid'];

    global $db;
    $sql = "SELECT name FROM ro_users WHERE id = '$uid'";
    $result = $db->query($sql);
    if ($result) {
        if ($result->num_rows > 0) {
            $res = $result->fetch_assoc()['name'];
            $theme->assign('name', $res);
        }
        $db->close();
    }
}

$theme->display('profile.tpl');
?>
