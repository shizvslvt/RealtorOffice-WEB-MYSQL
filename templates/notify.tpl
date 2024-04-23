<link rel="stylesheet" href="../assets/style/notification_style.css">
<div class="notification" {if !$message}style="display: none;"{/if}>
    {if $message}
        {$message}
    {/if}
</div>
