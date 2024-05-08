<?php
global $chat, $user, $notify, $log, $estate, $db;
$chat_id = $_GET['chat_id'];
$uid = $_COOKIE['uid'];


try {
    $db->begin_transaction();
    $estate_id = $chat->getEstateIdByChatId($chat_id);
    if($estate->getDealEstate($estate_id)==1) throw new Exception('Deal estate already exists');
    // Check buyer's balance
    $buyer_balance = $user->getBalance($uid);

    // Get total cost
    $total_cost = $chat->getCostEstateByChatId($chat_id);

    $user->setBalance($uid, $buyer_balance - $total_cost);
    // Log balance change
    $log->addLogs('Balance change from ' . $buyer_balance . ' to ' . ($buyer_balance - $total_cost), '?p=chats&id=' . $chat_id, 'Transaction', $uid, null);

    // Set status archived and deal
    $estate->setEstateArchived($estate_id);
    $estate->setEstateDeal($estate_id);
    // Update realtor's balance
    $realtor_id = $chat->getRealtorIdByChatId($chat_id);
    $user_id_realtor = $user->getIdByRealtorId($realtor_id);
    $estate_cost = $estate->getCostByEstateId($estate_id);
    $realtor_balance = $user->getBalance($realtor_id);
    $new_realtor_balance = $realtor_balance + $total_cost - $estate_cost;
    $seller_id = $estate->getUserIdByEstateId($estate_id);
    $seller_balance = $user->getBalance($seller_id);
    $new_seller_balance = $seller_balance + $estate_cost;
    // Log realtor balance change
    //$user->setBalance($realtor_id, $new_realtor_balance)
    $log->addLogs('Balance change from ' . $realtor_balance . ' to ' . $new_realtor_balance, '?p=chats&id=' . $chat_id, 'Transaction', $user_id_realtor, null);
    $user->setBalance($seller_id, $estate_cost);

    // Log seller balance change
    $log->addLogs('Balance change from ' . $seller_balance . ' to ' . $new_seller_balance, '?p=chats&id=' . $chat_id, 'Transaction', $seller_id, null);

    // Log about sold estate
    $log->addLogs('Sale of estate', '?p=chats&id=' . $chat_id, 'Sale', $uid, $estate_id);
    $notify->setMessage('Estate purchase successful');

    $db->commit();
} catch (Exception $e) {
    $db->rollback();
    $notify->setMessage('Transaction error: ' . $e->getMessage());
}

