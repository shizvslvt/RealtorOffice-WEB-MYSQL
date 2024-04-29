<?php

class Estate
{

    public function WriteToDB(mixed $seller_id, mixed $title, mixed $cost, mixed $type, mixed $locality, mixed $city, mixed $area, mixed $bedrooms, mixed $floors, string $created)
    {
        global $db, $notify;
        $sql = "INSERT INTO ro_estates (seller_id, title, cost, type, locality, city, area, bedrooms, floors, created)
        VALUES ('$seller_id','$title', '$cost', '$type', '$locality', '$city', '$area', '$bedrooms', '$floors', '$created')";
        if ($db->query($sql) === TRUE) {
            $notify->setMessage("New record created successfully");
        } else {
            $notify->setMessage("Error: " . $sql . "<br>" . $db->error);
        }
    }

    public function getData($table) {
        global $db;
        $data = [];
        $result = $db->query("SELECT * FROM $table");
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
        return $data;
    }

    function SelectedByID($id) {
        global $db, $theme;

        $sql = "SELECT estate.*, types.name AS type_name, localities.name AS locality_name, cities.name AS city_name
            FROM ro_estates estate
             JOIN list_types types ON estate.type = types.id
             JOIN list_localities localities ON estate.locality = localities.id
             JOIN list_cities cities ON estate.city = cities.id
            WHERE estate.id = $id";
        $result = $db->query($sql);
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $statusClass = ($row['archived'] == 1) ? 'archived' : 'active';
            $statusText = ($row['archived'] == 1) ? 'Archived' : 'Active';
            $theme->assign('estate', $row);
            $theme->assign('statusClass', $statusClass);
            $theme->assign('statusText', $statusText);

            if (isset($_COOKIE["uid"])) {
                $uid = $_COOKIE["uid"];
                $theme->assign('uid', $uid);

                $sql_getChatId = "SELECT id,estate_id FROM ro_chats WHERE estate_id = $id AND buyer_id = $uid";
                $res = $db->query($sql_getChatId);
                if ($res->num_rows > 0) {
                    $row_chat = $res->fetch_assoc();
                    $theme->assign('chat', $row_chat);
                }
            }

        }
        $theme->display('estate.tpl');
    }


    public static function incrementEstateViews($id) {
        global $db, $notify;
        $sql = "UPDATE ro_estates SET views = views + 1 WHERE id = $id";
        $result = $db->query($sql);

        if (!$result) {
            $error = $db->error;
            $notify->setMessage("Error executing query: $error");
            return;
        }

        if ($db->affected_rows > 0) {
            $notify->setMessage("Estate views incremented");
        } else {
            $notify->setMessage("No rows were affected by the query");
        }
    }


    public static function addToHistoryView($id, $uid)
    {
        global $db, $notify;

        $sql = "SELECT 1 FROM ro_history_view WHERE user_id = $uid AND estate_id = $id LIMIT 1";
        $result= $db->query($sql);
        if ($result->num_rows > 0) {
            $notify->setMessage("Already exists in the history of views");
        } else {
            $created = date('Y-m-d H:i:s');
            $sql_insert = "INSERT INTO ro_history_view (user_id, estate_id, created) VALUES ('$uid', '$id', '$created')";
            if($db->query($sql_insert)) {
                self::incrementEstateViews($id);
                $notify->SetMessage("Successful added to history of views");
            }
            else $notify->SetMessage("Error while added to history of views");
        }
    }

    public function getHistoryView($uid)
    {
        global $db;
        echo '<div class="estate-grid">';
        $sql = "SELECT estate_id FROM ro_history_view WHERE user_id = $uid ORDER BY created DESC";
        $result = $db->query($sql);
        while ($row = $result->fetch_assoc()) {
            self::SelectedByID($row['estate_id']);
        }
    }

    public function getAllActiveEstates() {
        global $db, $estate;
        $sql = "SELECT id FROM ro_estates WHERE archived = 0 ORDER BY created DESC";
        $result = $db->query($sql);
        echo '<div class="estate-grid">';
        while ($row = $result->fetch_assoc()) {
            $id = $row['id'];
            $estate->SelectedByID($id);
        }
        echo '</div>';
    }

    public function getSellersEstates(mixed $uid) {
        global $db;
        echo '<div class="estate-grid">';
        $sql = "SELECT id FROM ro_estates WHERE seller_id = $uid ORDER BY created DESC";
        $result = $db->query($sql);
        while ($row = $result->fetch_assoc()) {
            self::SelectedByID($row['id']);
        }
    }

    public function editEstate($id, $title, $cost, $type, $locality, $city, $area, $bedrooms, $floors, $archived) {
        global $db, $notify;


        $sql = "UPDATE ro_estates SET title = '$title', cost = '$cost', type = '$type', locality = '$locality', city = '$city', area = '$area', bedrooms = '$bedrooms', floors = '$floors', archived = '$archived' WHERE id = '$id'";
        if ($db->query($sql)) {
            $notify->setMessage("Estate updated successfully");
        } else {
            $notify->setMessage("Error updating estate: " . $db->error);
        }
    }


    public static function getAllActiviesEstates() {
        global $db;

        $sql = "SELECT * FROM ro_estates WHERE archived = 0 ORDER BY created DESC";
        $result = $db->query($sql);

        $list = array();
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $entry = array(
                    'id' => $row["id"],
                    'seller_id' => $row["seller_id"],
                    'title' => $row["title"],
                    'cost' => $row["cost"],
                    'type' => $row["type"],
                    'locality' => $row["locality"],
                    'city' => $row["city"],
                    'area' => $row["area"],
                    'bedrooms' => $row["bedrooms"],
                    'floors' => $row["floors"],
                    'created' => $row["created"],
                    'viewed' => $row["viewed"],
                    'deal' => $row["deal"],
                    'archived' => $row["archived"]
                );
                $list[] = $entry;
            }
        }
        return $list;
    }



}