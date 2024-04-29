<?php

class User {

    public function editRealtor($id, $user_id, $percent, $exp) {
        global $db, $notify;

//        // Защита от SQL-инъекций
//        $id = $db->real_escape_string($id);
//        $user_id = $db->real_escape_string($user_id);
//        $percent = $db->real_escape_string($percent);
//        $exp = $db->real_escape_string($exp);

        $sql = "UPDATE ro_realtors SET user_id = '$user_id', percent = '$percent', experience = '$exp' WHERE id = '$id'";
        if ($db->query($sql)) {
            $notify->setMessage("Realtor updated successfully");
        } else {
            $notify->setMessage("Error updating realtor: " . $db->error);
        }
    }

    public function selectRealtor()
    {
        global $theme, $db;
        $query = "SELECT * FROM ro_realtors";
        $result = $db->query($query);
        $realtors = array();

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $realtors[] = $row;
            }
        }

        $theme->assign('realtors', $realtors);
    }

}