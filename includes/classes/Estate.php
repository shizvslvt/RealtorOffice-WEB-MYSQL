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
        $sql = "SELECT e.*, t.name AS type_name, l.name AS locality_name, c.name AS city_name
            FROM ro_estates e
            LEFT JOIN list_types t ON e.type = t.id
            LEFT JOIN list_localities l ON e.locality = l.id
            LEFT JOIN list_cities c ON e.city = c.id
            WHERE e.id = $id";
        $result = $db->query($sql);
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $statusClass = ($row['archived'] == 1) ? 'archived' : 'active';
            $statusText = ($row['archived'] == 1) ? 'Archived' : 'Active';
            $theme->assign('estate', $row);
            $theme->assign('statusClass', $statusClass);
            $theme->assign('statusText', $statusText);
        }
        $theme->display('estate.tpl');
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