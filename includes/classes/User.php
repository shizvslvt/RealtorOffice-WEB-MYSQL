<?php

class User
{

    public function editRealtor($id, $user_id, $percent, $exp)
    {
        global $db, $notify;

        $sql = "UPDATE ro_realtors SET user_id = '$user_id', percent = '$percent', experience = '$exp' WHERE id = '$id'";
        if ($db->query($sql)) {
            $notify->setMessage("Realtor updated successfully");
        } else {
            $notify->setMessage("Error updating realtor: " . $db->error);
        }
    }

    public function selectRealtor()
    {
        global $db;
        $query = "SELECT * FROM ro_realtors";
        $result = $db->query($query);
        $realtors = array();

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $realtors[] = $row;
            }
        }
        return $realtors;
    }



    public function setBalance( $uid, $param)
    {
        global $db;
        $sql = "UPDATE ro_users SET balance = '$param' WHERE id = '$uid'";
        return $db->query($sql);
    }

    public function getRealtorPercentByRealtorId(mixed $realtor_id)
    {
        global $db;
        $sql = "SELECT percent FROM ro_realtors WHERE id = '$realtor_id'";
        $result = $db->query($sql);
        $row = mysqli_fetch_assoc($result);
        return $row['percent'];
    }

    public function getBalance($id)
    {
        global $db;
        $sql = "SELECT balance FROM ro_users WHERE id = '$id'";
        $result = $db->query($sql);
        $row = mysqli_fetch_assoc($result);
        return $row['balance'];
    }

    public function getIdByRealtorId(mixed $realtor_id)
    {
        global $db;
        $sql = "SELECT user_id FROM ro_realtors WHERE id = '$realtor_id'";
        $result = $db->query($sql);
        $row = mysqli_fetch_assoc($result);
        return $row['user_id'];
    }
}