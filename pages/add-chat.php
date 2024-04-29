<?php
global $chat;
$estate_id = $_GET['estate_id'];
$buyer_id = $_GET['buyer_id'];

$chat->createChat($estate_id, $buyer_id);
