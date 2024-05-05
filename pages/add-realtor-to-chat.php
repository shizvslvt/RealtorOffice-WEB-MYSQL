<?php
global $db, $notify;


$chat_id = $_GET['chat_id'];
$realtor_id = 1;

$sql_update_chat = "UPDATE ro_chats SET realtor_id = $realtor_id WHERE id = $chat_id";
$result_update_chat = $db->query($sql_update_chat);

if ($result_update_chat) {
    $notify->setMessage("Realtor added to chat successfully");
    header("Location: ?p=chats&id=$chat_id");
    exit;
} else {
    $notify->setMessage("Error adding realtor to chat: " . $db->error);
}


