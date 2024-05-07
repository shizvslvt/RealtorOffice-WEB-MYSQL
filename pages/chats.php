<?php
global $db, $theme, $notify, $estate, $chat;


$uid = $_COOKIE["uid"];
$sql_chats = "SELECT ro_chats.id, ro_chats.estate_id, ro_chats.buyer_id, ro_estates.seller_id, ro_realtors.user_id
FROM ro_chats
INNER JOIN ro_estates ON ro_chats.estate_id = ro_estates.id
LEFT JOIN ro_realtors ON ro_chats.realtor_id = ro_realtors.id
WHERE ro_chats.buyer_id = $uid 
OR ro_estates.seller_id = $uid 
OR ro_realtors.user_id = $uid
";
$result_chats = $db->query($sql_chats);
$chats = array();
if ($result_chats->num_rows > 0) {
    while ($row = $result_chats->fetch_assoc()) {
        $chats[] = $row;
    }
}

$theme->assign('chats', $chats);
$theme->display("chats.tpl");
$access = false;
if (isset($_GET['id'])) {
    $chat_id = $_GET['id'];

    $sql_access = "SELECT ro_chats.id 
                FROM ro_chats 
                JOIN ro_estates ON ro_chats.estate_id = ro_estates.id 
                LEFT JOIN ro_realtors ON ro_chats.realtor_id = ro_realtors.id
                WHERE ro_chats.id = $chat_id 
                AND (
                    ro_estates.seller_id = $uid 
                    OR ro_chats.buyer_id = $uid 
                    OR ro_realtors.user_id = $uid
                )";

    $result_access = $db->query($sql_access);
    if ($result_access->num_rows > 0) $access = true;

    if ($access) {
        $buyer_id = null;
        $messages = array();
        $sql_messages = "SELECT
                        ro_messages.id, 
                        ro_messages.user_id, 
                        ro_messages.chat_id, 
                        ro_messages.text, 
                        ro_messages.date,
                        ro_chats.buyer_id,
                        ro_estates.seller_id 
                    FROM ro_messages
                    JOIN ro_chats ON ro_chats.id = ro_messages.chat_id
                    JOIN ro_estates ON ro_chats.estate_id = ro_estates.id
                    WHERE ro_chats.id = $chat_id";

        $result_messages = $db->query($sql_messages);
        if ($result_messages->num_rows > 0) {
            while ($row = $result_messages->fetch_assoc()) {
                $statusclass = ($row['user_id'] == $uid) ? 'right' : 'left';
                $row['statusclass'] = $statusclass;
                $messages[] = $row;

                $buyer_id = $row['buyer_id'];
            }
        }

        $sql_check_realtor = "SELECT realtor_id FROM ro_chats WHERE id = $chat_id";
        $result_check_realtor = $db->query($sql_check_realtor);
        if ($result_check_realtor) {
            $row = $result_check_realtor->fetch_assoc();
            $realtor_id = $row['realtor_id'];

            $realtor_added = !empty($realtor_id);
            $theme->assign('realtor_added', $realtor_added);

            $status_deal = $estate->checkDealByEstateId($chat->getEstateIdByChatId($chat_id));
            $theme->assign('status_deal', $status_deal);
        }
        $theme->assign('buyer_id', $buyer_id);
        $theme->assign('messages', $messages);
        $theme->assign('chat_id', $chat_id);
    }

    $theme->assign('uid', $uid);
    $theme->assign('access', $access);
    $theme->display('chat.tpl');
}


echo '</div>';