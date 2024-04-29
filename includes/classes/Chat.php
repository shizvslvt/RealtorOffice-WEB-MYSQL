<?php

class Chat
{


    public function createChat($estate_id, $buyer_id)
    {
        global $db, $notify;
        $check_sql = "SELECT * FROM ro_chats WHERE estate_id = '$estate_id' AND buyer_id = '$buyer_id'";
        $check_result = $db->query($check_sql);

        if ($check_result->num_rows > 0) {
            $notify->setMessage("Chat already exists for this estate and buyer");
            header('Location: ?p=chats');
        } else {
            $insert_sql = "INSERT INTO ro_chats (estate_id, buyer_id, rieltor_id) VALUES ('$estate_id', '$buyer_id', NULL)";
            if ($db->query($insert_sql) === TRUE) {
                $notify->setMessage("Chat create successful");
                $chat_id = $db->insert_id;
                header('Location: ?p=chats&id='.$chat_id);
                exit();
            } else {
                $notify->setMessage("Error: " . $insert_sql . "<br>" . $db->error);
            }
        }
    }

}