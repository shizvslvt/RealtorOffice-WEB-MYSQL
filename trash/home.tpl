<link rel="stylesheet" href="../assets/style/estates_style.css">
    <div class="estate-grid">
        {foreach from=$list item=entry}
            <a href="?p=estate&id={$entry.id}">
                <div class="estate-item">
                    <div class="estate-title">{$entry.title}</div>
                    <div class="estate-id">{$entry.id}</div>
                    <div class="estate-seller">Seller ID: {$entry.seller_id}</div>
                </div>
            </a>
        {/foreach}
    </div>

