<?php
global $db, $estate, $theme, $notify, $chat;
$chat_id = $_GET['chat_id'];

echo '<div class="estate-grid">';

$estate_id = $chat->getEstateIdByChatId($chat_id);

$access_archived = $estate->getArchivedEstate($estate_id);
if ($access_archived == 0) {
    $access_deal = $estate->getDealEstate($estate_id);
    if ($access_deal == 0) {
        $realtor_id = $chat->getRealtorIdByChatId($chat_id);
        if ($realtor_id) {
            $total_cost = $chat->getCostEstateByChatId($chat_id);

            $estate->SelectedByID($estate_id);
            $theme->assign('total_cost', $total_cost);
            $theme->assign('chat_id', $chat_id);
            $theme->display("buy-estate.tpl");
        } else {
            $notify->setMessage('To purchase the property, estates need a realtor.');
            echo '</div>';
        }
    } else {
        $notify->setMessage('The deal for this property is already completed.');
        echo '</div>';
    }
} else {
    $notify->setMessage('The property is archived.');
    echo '</div>';
}
