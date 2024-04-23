<?php
global $db;

$servername = "localhost";
$username = "admin";
$password = "admin";
$dbname = "realtor_office";
$db = mysqli_connect($servername, $username, $password, $dbname);

if(!$db){
    die("Connection Filed". mysqli_connect_error());
}
