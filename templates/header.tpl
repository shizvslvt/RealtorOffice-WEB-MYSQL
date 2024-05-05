<html lang="ru">
<link rel="stylesheet" href="../assets/style/style.css">
<link rel="stylesheet" href="../assets/style/header_style.css">

<div class="header">
    <div class="header-left">
        <a href="?p=home"><div class="header-item">Home</div></a>
        {if $admin} <a href="?p=control-panel"><div class="header-item">Control Panel</div></a> {/if}
        {if $uid && !$admin} <a href="?p=history-view"><div class="header-item">History View</div></a> {/if}
        {if $uid && !$admin} <a href="?p=chats"><div class="header-item">Chats</div></a> {/if}
    </div>

    <div class="header-middle">
        {if $uid && !$admin} <a href="?p=add-estate"><div class="header-item green"><h1>+</h1></div></a> {/if}
    </div>

    <div class="header-right">
        {if !$uid}
            <a href="?p=login"><div class="header-item">Login</div></a>
            <a href="?p=register"><div class="header-item">Register</div></a>
        {/if}
        {if $uid}
            <a href="?p=logout"><div class="header-item red">Logout</div></a>
            <a href="?p=profile"><div class="header-item">Profile <div class="header-item-small">{$uid} | {$balance} $</div></div></a>
        {/if}
    </div>
</div>






