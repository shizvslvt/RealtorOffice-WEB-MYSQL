<?php
global $theme, $user, $db, $estate;

echo '<div class="estate-grid">';
if (isset($_COOKIE['uid'])) {
    $uid = $_COOKIE['uid'];
    $theme->assign('name', $user->getUsername($uid));

    $query = "SELECT id FROM ro_estates WHERE seller_id = $uid";
    $result = $db->query($query);

    while ($row = $result->fetch_assoc()) {
     $estate->SelectedByID($row['id']);
    }
}
echo '</div>';
$theme->display('profile.tpl');

