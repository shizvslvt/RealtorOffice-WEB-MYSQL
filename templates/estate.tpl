<link rel="stylesheet" href="../assets/style/estate_style.css">

<div class="estate-item">
    <a href="?p=estate&id={$estate['id']}">
        <div class="estate-title">{$estate['title']}</div>
        <div class="estate-attributes">
            <div class="estate-row">
                <div class="estate-attribute">ID:</div>
                <div class="estate-value">{$estate['id']}</div>
            </div>
            <div class="estate-row">
                <div class="estate-attribute">Seller ID:</div>
                <div class="estate-value">{$estate['seller_id']}</div>
            </div>
            <div class="estate-row">
                <div class="estate-attribute">Type:</div>
                <div class="estate-value">{$estate['type_name']}</div>
            </div>
            <div class="estate-row">
                <div class="estate-attribute">Locality:</div>
                <div class="estate-value">{$estate['locality_name']}</div>
            </div>
            <div class="estate-row">
                <div class="estate-attribute">City:</div>
                <div class="estate-value">{$estate['city_name']}</div>
            </div>
            <div class="estate-row">
                <div class="estate-attribute">Area:</div>
                <div class="estate-value">{$estate['area']}</div>
            </div>
            <div class="estate-row">
                <div class="estate-attribute">Bedrooms:</div>
                <div class="estate-value">{$estate['bedrooms']}</div>
            </div>
            <div class="estate-row">
                <div class="estate-attribute">Floors:</div>
                <div class="estate-value">{$estate['floors']}</div>
            </div>
            <div class="estate-row">
                <div class="estate-attribute">Created:</div>
                <div class="estate-value">{$estate['created']}</div>
            </div>
            <div class="estate-row">
                <div class="estate-attribute">Views:</div>
                <div class="estate-value">{$estate['views']}</div>
            </div>
            <div class="estate-row">
                <div class="estate-attribute">Deal:</div>
                <div class="estate-value">{$estate['deal']}</div>
            </div>

        </div>
    </a>
    <div class="estate-edit">
        <div class="estate-row">
            <div class="estate-archived status {$statusClass}">{$statusText}</div>
            <div class="estate-value">
                {if $uid == $estate['seller_id']}
                    <a href="?p=edit-estate&id={$estate['id']}">Edit</a>
                {else}
                    {if isset($chat) && $chat['estate_id']==$estate['id']}
                        <a href="?p=chat&id={$chat['id']}">Message</a>
                    {else}
                        <a href="?p=add-chat&estate_id={$estate['id']}">Create Chat</a>
                    {/if}
                {/if}
            </div>
        </div>
    </div>
</div>

