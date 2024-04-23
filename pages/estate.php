<?php
global $theme, $estate;
$id = $_GET['id'];
$estate->SelectedByID($id);

$theme->display('estate.tpl');
