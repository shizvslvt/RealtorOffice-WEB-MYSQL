<link rel="stylesheet" href="../assets/style/message_style.css">
<script>
    window.onload = function() {
        var messagesDiv = document.querySelector('.messages');
        messagesDiv.scrollTop = messagesDiv.scrollHeight;
    }
</script>
{if $access}
    <div class="chat-main">
        <div class="chat-header">
            <h2>Messages for Chat ID: {$chat_id}</h2>
            {if $realtor_added}
                {if $buyer_id == $uid}
                    <a href="?p=buy-estate&chat_id={$chat_id}" class="chat-link">Buy</a>
                {/if}
            {else}
                <a href="?p=add-realtor-to-chat&chat_id={$chat_id}" class="chat-link">Add Realtor</a>
            {/if}



        </div>
        <div class="messages">
            {if !empty($messages)}
                {foreach $messages as $message}
                    <div class="message {$message['statusclass']}">
                        <div class="message-item id">User ID: {$message['user_id']}</div>
                        <div class="message-item text">{$message['text']}</div>
                        <div class="message-item date">Date: {$message['date']}</div>
                    </div>
                {/foreach}
            {/if}
        </div>
        <div class="chat-footer">
            <form action="?p=send-message" method="post" class="dark-form">
                <input type="text" name="text" placeholder="Type your message..." class="dark-input">
                <input type="hidden" name="uid" value="{$uid}">
                <input type="hidden" name="chat_id" value="{$chat_id}">
                <button type="submit" class="dark-button">Send</button>
            </form>

        </div>

    </div>
{else}
    <div class="chat-main">
        <div class="chat-header">
            <h2>you dont have access</h2>
        </div>
    </div>
{/if}

