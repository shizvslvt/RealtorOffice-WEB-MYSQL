<?php
global $db;

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "realtor_office";

$db = mysqli_connect($servername, $username, $password, $dbname);
if(!$db) die("Connection Filed". mysqli_connect_error());
$db->set_charset("utf8");
