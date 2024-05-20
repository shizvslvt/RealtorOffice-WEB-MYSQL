<?php

class Estate
{

    public function WriteToDB($seller_id, $title, $cost, $type, $locality, $city, $area, $bedrooms, $floors, $created)
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

    public function getData($table)
    {
        global $db;
        $data = [];
        $result = $db->query("SELECT * FROM $table");
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
        return $data;
    }

    function SelectedByID($id)
    {
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
            $statusArchivedClass = ($row['archived'] == 1) ? 'not-active' : 'active';
            $statusArchivedText = ($row['archived'] == 1) ? 'Archived' : 'Active';

            $statusDealClass = ($row['sold'] == 1) ? 'active' : false;
            $statusDealText = ($row['sold'] == 1) ? 'Deal' : 'Not deal';

            $theme->assign('estate', $row);
            $theme->assign('statusArchivedClass', $statusArchivedClass);
            $theme->assign('statusArchivedText', $statusArchivedText);
            $theme->assign('statusDealClass', $statusDealClass);
            $theme->assign('statusDealText', $statusDealText);

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


    public static function incrementEstateViews($id)
    {
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
        $result = $db->query($sql);
        if ($result->num_rows > 0) {
            $notify->setMessage("Already exists in the history of views");
        } else {
            $created = date('Y-m-d H:i:s');
            $sql_insert = "INSERT INTO ro_history_view (user_id, estate_id, created) VALUES ('$uid', '$id', '$created')";
            if ($db->query($sql_insert)) {
                self::incrementEstateViews($id);
                $notify->SetMessage("Successful added to history of views");
            } else $notify->SetMessage("Error while added to history of views");
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

    public function getAllActiveEstates()
    {
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

    public function getSellersEstates($uid)
    {
        global $db;
        echo '<div class="estate-grid">';
        $sql = "SELECT id FROM ro_estates WHERE seller_id = $uid ORDER BY created DESC";
        $result = $db->query($sql);
        while ($row = $result->fetch_assoc()) {
            self::SelectedByID($row['id']);
        }
    }
    public function getEstateByCityId($id)
    {
        global $db;
        echo '<div class="estate-grid">';
        $sql = "SELECT * FROM ro_estates WHERE city = $id ORDER BY created DESC";
        $result = $db->query($sql);
        while ($row = $result->fetch_assoc()) {
            self::SelectedByID($row['id']);
        }
    }

    public function editEstate($id, $title, $cost, $type, $locality, $city, $area, $bedrooms, $floors, $archived)
    {
        global $db, $notify;


        $sql = "UPDATE ro_estates SET title = '$title', cost = '$cost', type = '$type', locality = '$locality', city = '$city', area = '$area', bedrooms = '$bedrooms', floors = '$floors', archived = '$archived' WHERE id = '$id'";
        if ($db->query($sql)) {
            $notify->setMessage("Estate updated successfully");
        } else {
            $notify->setMessage("Error updating estate: " . $db->error);
        }
    }

    public function setEstateArchived($id)
    {
        global $db, $notify;
        $sql = "UPDATE ro_estates SET archived = 1 WHERE id = $id";
        if ($db->query($sql) === TRUE) {
            $notify->setMessage("Estate archived successfully");
            return true;
        }
        return false;
    }

    public function setEstateDeal($estate_id)
    {
        global $db, $notify;
        $sql = "UPDATE ro_estates SET sold = 1 WHERE id = $estate_id";
        if ($db->query($sql) === TRUE) {
            $notify->setMessage("Estate deal set successfully");
            return true;
        }
        return false;
    }

    public function getCostByEstateId($estate_id)
    {
        global $db;
        $sql = "SELECT cost FROM ro_estates WHERE id = $estate_id";
        $result = $db->query($sql);
        $row = $result->fetch_assoc();
        return $row['cost'];
    }

    public function getArchivedEstate($id)
    {
        global $db;
        $sql = "SELECT archived FROM ro_estates WHERE id = $id";
        $result = $db->query($sql);
        $row = $result->fetch_assoc();
        return $row['archived'];
    }

    public function getDealEstate($id)
    {
        global $db;
        $sql = "SELECT sold FROM ro_estates WHERE id = $id";
        $result = $db->query($sql);
        $row = $result->fetch_assoc();
        return $row['sold'];
    }

    public function getUserIdByEstateId($estate_id)
    {
        global $db;
        $sql = "SELECT seller_id FROM ro_estates WHERE id = $estate_id";
        $result = $db->query($sql);
        $row = $result->fetch_assoc();
        return $row['seller_id'];
    }

    public function countTotalEstates()
    {
        global $db;
        $sql = "SELECT COUNT(*) FROM ro_estates";
        $result = $db->query($sql);
        $row = $result->fetch_assoc();
        return $row['COUNT(*)'];
    }

    public function countTotalSoldEstates()
    {
        global $db;
        $sql = "SELECT COUNT(*) FROM ro_estates WHERE sold = 1";
        $result = $db->query($sql);
        $row = $result->fetch_assoc();
        return $row['COUNT(*)'];
    }

    public function checkDealByEstateId($getEstateIdByChatId)
    {
        global $db;
        $sql = "SELECT sold FROM ro_estates WHERE id = $getEstateIdByChatId";
        $result = $db->query($sql);
        $row = $result->fetch_assoc();
        return $row['sold'];
    }

    public function getListCityIdAndName()
    {
        global $db;
        $sql = "SELECT id, name FROM list_cities";
        $result = $db->query($sql);
        $list = [];
        while ($row = $result->fetch_assoc()) {
            $list[] = $row;
        }
        return $list;
    }

    public function TotalEstatesByCityId($current_city_id)
    {
        global $db;
        $sql = "SELECT COUNT(*) FROM ro_estates WHERE city = $current_city_id";
        $result = $db->query($sql);
        $row = $result->fetch_assoc();
        return $row['COUNT(*)'];
    }


    public function getCreatedEstatesByYear($year, $months) {
        global $db;
        $monthlyData = [];

        $sql = "SELECT MONTH(created) AS month, COUNT(*) AS count_sold 
            FROM ro_estates 
            WHERE YEAR(created) = $year
            GROUP BY MONTH(created)";
        $result = $db->query($sql);
        foreach ($months as $month) {
            $monthlyData[$month] = 0;
        }
        while ($row = $result->fetch_assoc()) {
            $monthIndex = $row['month'] - 1;
            $monthLabel = $months[$monthIndex];
            $monthlyData[$monthLabel] = $row['count_sold'];
        }

        $labels = array_keys($monthlyData);
        $datasetValues = array_values($monthlyData);
        $datasetLabel = 'Totals added estates in ' . $year;
        return array($labels, $datasetValues, $datasetLabel);
    }

    public function getSoldEstatesByYear($year, $months) {
        global $db;
        $monthlyData = [];

        $sql = "SELECT MONTH(date) AS month, COUNT(*) AS count_sold 
            FROM ro_logs 
            WHERE type = 'Sale' AND YEAR(date) = $year 
            GROUP BY MONTH(date)";
        $result = $db->query($sql);
        foreach ($months as $month) {
            $monthlyData[$month] = 0;
        }
        while ($row = $result->fetch_assoc()) {
            $monthIndex = $row['month'] - 1;
            $monthLabel = $months[$monthIndex];
            $monthlyData[$monthLabel] = $row['count_sold'];
        }
        $labels = array_keys($monthlyData);
        $datasetValues = array_values($monthlyData);
        $datasetLabel = 'Totals sold estates in ' . $year;

        return array($labels, $datasetValues, $datasetLabel);
    }

    public function CountSoldEstatesByCityAndYear($current_year)
    {
        global $db;
        $sql = "SELECT
        list_cities.name AS city,
        COUNT(ro_estates.id) AS sold_count
        FROM
        ro_logs, ro_estates, list_cities
        WHERE ro_logs.estate_id = ro_estates.id AND
        list_cities.id = ro_estates.city AND 
        ro_logs.date LIKE '$current_year%'
        GROUP BY
        list_cities.name";

        $result = $db->query($sql);
        $circleData = array();

        while ($row = $result->fetch_assoc()) {
            $circleData[] = array('label' => $row['city'], 'value' => (int)$row['sold_count']);
        }
        return $circleData;
    }


}
