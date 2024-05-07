<?php

class Logs
{
    public function addLogs($text, $link, $type, $id,$estate_id)
    {
        global $db, $notify;
        if($id == null){
            $sql = "INSERT INTO ro_logs (text, link, type, date, estate_id) VALUES ('$text', '$link', '$type', NOW(), '$estate_id')";
        }
        if ($estate_id == null) {
            $sql = "INSERT INTO ro_logs (text, link, type, date, user_id) VALUES ('$text', '$link', '$type', NOW(), '$id')";
        } else
        $sql = "INSERT INTO ro_logs (text, link, type, date, user_id, estate_id) VALUES ('$text', '$link', '$type', NOW(), '$id', '$estate_id')";

        if ($db->query($sql)) {
            $notify->setMessage("Log added successfully");
        } else {
            $notify->setMessage("Error adding log: " . $db->error);
        }

    }

    public function selectLogs()
    {
        global $db;
        $query = "SELECT * FROM ro_logs ORDER BY id DESC";
        $result = $db->query($query);
        $logs = array();

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $logs[] = $row;
            }
        }
        return $logs;
    }
}