<?php
global $chat, $user, $notify, $log, $estate, $db;
$chat_id = $_GET['chat_id'];
$uid = $_COOKIE['uid'];

try {
    $db->begin_transaction();

    $estate_id = $chat->getEstateIdByChatId($chat_id);
    $access = $estate->getArchivedEstate($estate_id);
    $access2 = $estate->getDealEstate($estate_id);

    // Check if both accesses are true
    if ($access == 0 && $access2 == 0) {
        // Check buyer's balance
        $buyer_balance = $user->getBalance($uid);

        // Get total cost
        $total_cost = $chat->getCostEstateByChatId($chat_id);

        // Subtract balance
        if ($buyer_balance && $total_cost && $buyer_balance >= $total_cost) {
            if ($user->setBalance($uid, $buyer_balance - $total_cost)) {
                // Log balance change
                $log->addLogs('Balance change from ' . $buyer_balance . ' to ' . ($buyer_balance - $total_cost), '?p=chats&id=' . $chat_id, 'info',$uid);
            } else {
                throw new Exception('Failed to update buyer balance');
            }

            // Set status archived and deal
            if ($estate->setEstateArchived($estate_id) && $estate->setEstateDeal($estate_id)) {
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
                if ($user->setBalance($realtor_id, $new_realtor_balance)) {
                    $log->addLogs('Balance change from ' . $realtor_balance . ' to ' . $new_realtor_balance, '?p=chats&id=' . $chat_id, 'info',$user_id_realtor);
                    if($user->setBalance($seller_id, $estate_cost)) {

                        // Log seller balance change
                        $log->addLogs('Balance change from ' . $seller_balance . ' to ' . $new_seller_balance, '?p=chats&id=' . $chat_id, 'info',$seller_id);

                        // Log about sold estate
                        $log->addLogs('Sale of estate ' . $estate_id . ' to user ' . $uid, '?p=chats&id=' . $chat_id, 'info', $uid);
                        $notify->setMessage('Estate purchase successful');
                    } else {
                        throw new Exception('Failed to update seller balance');
                    }
                } else {
                    throw new Exception('Failed to update realtor balance');
                }
            } else {
                throw new Exception('Failed to update estate status');
            }
        } else {
            throw new Exception('Insufficient balance for buyer');
        }
    } else {
        throw new Exception('Cannot sell the property: Access conditions not met');
    }
    $db->commit();
} catch (Exception $e) {
    $db->rollback();
    $log->addLogs('Transaction error: ' . $e->getMessage(), '?p=chats&id=' . $chat_id, 'error', null);
    $notify->setMessage('Transaction error: ' . $e->getMessage());
}

