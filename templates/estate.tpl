<link rel="stylesheet" href="../assets/style/estate_style.css">
{if isset($estate)}
        <div class="estate-item">
        <div class="estate-title">{$estate['title']}</div>
            <div class="estate-attributes">
            <div class="estate-row">
                <div class="estate-attribute">ID:</div><div class="estate-value">{$estate['id']}</div></div>
            <div class="estate-row">
                <div class="estate-attribute">Seller ID:</div><div class="estate-value">{$estate['seller_id']}</div></div>
            <div class="estate-row">
                <div class="estate-attribute">Type:</div><div class="estate-value">{$estate['type_name']}</div></div>
            <div class="estate-row">
                <div class="estate-attribute">Locality:</div><div class="estate-value">{$estate['locality_name']}</div></div>
            <div class="estate-row">
                <div class="estate-attribute">City:</div><div class="estate-value">{$estate['city_name']}</div></div>
            <div class="estate-row">
                <div class="estate-attribute">Area:</div><div class="estate-value">{$estate['area']}</div></div>
            <div class="estate-row">
                <div class="estate-attribute">Bedrooms:</div><div class="estate-value">{$estate['bedrooms']}</div></div>
            <div class="estate-row">
                <div class="estate-attribute">Floors:</div><div class="estate-value">{$estate['floors']}</div></div>
            <div class="estate-row">
                <div class="estate-attribute">Created:</div><div class="estate-value">{$estate['created']}</div></div>
            <div class="estate-row">
                <div class="estate-attribute">Viewed:</div><div class="estate-value">{$estate['viewed']}</div></div>
            <div class="estate-row">
                <div class="estate-attribute">Deal:</div><div class="estate-value">{$estate['deal']}</div></div>
            <div class="estate-row">
                <div class="estate-attribute">Status:</div><div class="estate-archived status {$statusClass}">{$statusText}</div></div>
            </div>
        </div>
{/if}
