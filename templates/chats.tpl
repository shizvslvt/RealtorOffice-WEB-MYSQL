<link rel="stylesheet" href="../assets/style/chats_style.css">
<div class="chats-and-messages">
    <div class="chats">
        <h1>Chats Page</h1>
        <div class="chats-items">
            {foreach $chats as $chat}
                <a href="?p=chats&id={$chat['id']}">
                    <div class="chats-item">
                        <div class="chats-item-text">Chat ID: {$chat['id']}</div>
                        <div class="chats-item-text">Estate ID: {$chat['estate_id']}</div>
                        <div class="chats-item-text">Buyer ID: {$chat['buyer_id']}</div>
                        <div class="chats-item-text">Seller ID: {$chat['seller_id']}</div>
                        <div class="chats-item-text">Realtor ID: {$chat['user_id']}</div>
                    </div>
                </a>
            {/foreach}
        </div>
    </div>