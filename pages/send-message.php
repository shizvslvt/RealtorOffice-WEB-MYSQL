<?php
global $db, $notify;
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $uid = $_POST['uid'];
    $chat_id = $_POST['chat_id'];
    $text = $_POST['text'];
    $date = date("Y-m-d H:i:s");
    $db->query("INSERT INTO ro_messages (user_id, chat_id, text, date) VALUES ('$uid','$chat_id','$text','$date')");
    $notify->setMessage('Successful sent message');
    header('Location: ?p=chats&id='.$chat_id);
}
